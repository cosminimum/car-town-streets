package com.getjar.sdk.comm.auth;

import android.content.Context;
import android.content.Intent;
import com.getjar.sdk.comm.AuthorizationServiceProxy;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.auth.AuthResult;
import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.exceptions.CachingException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarActivity;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.ManualResetEvent;
import com.getjar.sdk.utilities.RewardUtility;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import org.json.JSONException;
/* loaded from: classes.dex */
public class AuthManager {
    public static final String AUTHORIZATION_HEADER = "Authorization";
    public static final String AUTHORIZATION_HEADER_LOWER = "authorization";
    public static final String AUTHORIZATION_HEADER_UPPER = "AUTHORIZATION";
    private static final long PROVIDER_FILTER_FAILSAFE_TTL = 86400000;
    private long _authTTL;
    private long _authTimestamp;
    private String _authToken;
    private final CommContext _commContext;
    private String _userAccessId;
    private String _userAuthProviderFilter;
    private String _userDeviceId;
    private static volatile AuthManager _Instance = null;
    private static ExecutorService _ExecutorService = getExecutorServiceInstance();
    private static final ConcurrentLinkedQueue<String> _ObservedAuthWithUiIds = new ConcurrentLinkedQueue<>();
    private boolean _isNewUser = false;
    private final Object _authFlowLock = new Object();
    private ManualResetEvent _authFlowEvent = new ManualResetEvent(false);
    private volatile AuthFlowState _authFlowState = AuthFlowState.UNKNOWN;
    private final AuthCachingManager _authCachingManager = new AuthCachingManager();

    private AuthManager(Context androidContext) {
        this._userAuthProviderFilter = null;
        this._authToken = null;
        this._userAccessId = null;
        this._userDeviceId = null;
        this._authTTL = 0L;
        this._authTimestamp = 0L;
        this._commContext = CommManager.createContextForAuth(androidContext);
        this._userAuthProviderFilter = this._authCachingManager.getUserAuthProviderFilter();
        this._authToken = this._authCachingManager.getAuthToken();
        this._userAccessId = this._authCachingManager.getUserAccessId();
        this._userDeviceId = this._authCachingManager.getUserDeviceId();
        Long ttl = this._authCachingManager.getAuthTTL();
        if (ttl != null) {
            this._authTTL = ttl.longValue();
        }
        Long timestamp = this._authCachingManager.getAuthTimestamp();
        if (timestamp != null) {
            this._authTimestamp = timestamp.longValue();
        }
        Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthManager initialized [userAuthProviderFilter:%1$s authToken:%2$s userAccessId:%3$s userDeviceId:%4$s authTTL:%5$d authTimestamp:%6$d]", this._userAuthProviderFilter, this._authToken, this._userAccessId, this._userDeviceId, Long.valueOf(this._authTTL), Long.valueOf(this._authTimestamp)));
    }

    public static synchronized void initialize(Context androidContext) {
        synchronized (AuthManager.class) {
            if (_Instance == null) {
                _Instance = new AuthManager(androidContext);
            }
        }
    }

    public static AuthManager getInstance() {
        if (_Instance == null) {
            throw new IllegalStateException("AuthManager.initialize() must be called first");
        }
        return _Instance;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public enum AuthFlowState {
        UNKNOWN,
        STARTING,
        STARTED,
        DATA_CHECKING,
        EXPIRY_CHECKING,
        VALIDATING,
        APP_AUTHING,
        USER_AUTHING,
        AUTHED,
        FAILED;

        /* JADX INFO: Access modifiers changed from: private */
        public boolean isAuthed() {
            AuthFlowState currentValue = values()[ordinal()];
            switch (currentValue) {
                case AUTHED:
                    return true;
                default:
                    return false;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean isAuthing() {
            AuthFlowState currentValue = values()[ordinal()];
            switch (currentValue) {
                case STARTING:
                case STARTED:
                case DATA_CHECKING:
                case EXPIRY_CHECKING:
                case VALIDATING:
                case APP_AUTHING:
                case USER_AUTHING:
                    return true;
                default:
                    return false;
            }
        }
    }

    private static ExecutorService getExecutorServiceInstance() {
        return Executors.newSingleThreadExecutor();
    }

    public String getUserAuthProviderFilter() {
        return this._userAuthProviderFilter;
    }

    public void fixUpgradedMissingUserAuthProviderFilter(String providerFilter) {
        if (StringUtility.isNullOrEmpty(providerFilter)) {
            throw new IllegalArgumentException("'providerFilter' cannot be null or empty");
        }
        this._authCachingManager.setUserAuthProviderFilter(providerFilter, 86400000L);
    }

    public String getAuthToken() {
        return this._authToken;
    }

    public String getUserDeviceId() {
        return this._userDeviceId;
    }

    public String getUserAccessId() {
        return this._userAccessId;
    }

    public boolean isNewUser() {
        return this._isNewUser;
    }

    public boolean isAuthed() {
        return this._authFlowState.isAuthed();
    }

    private void resetCurrentAuthFlow() {
        if (this._authFlowState.isAuthing()) {
            Logger.w(Area.AUTH.value(), String.format("resetCurrentAuthFlow(): Starting reset of auth from a state of '%1$s'", this._authFlowState.name()));
            try {
                _ExecutorService.shutdownNow();
                _ExecutorService = getExecutorServiceInstance();
                this._authCachingManager.clearCache();
                this._userAuthProviderFilter = null;
                this._authToken = null;
                this._userAccessId = null;
                this._userDeviceId = null;
                this._isNewUser = false;
                this._authTTL = 0L;
                this._authTimestamp = 0L;
                this._authFlowState = AuthFlowState.UNKNOWN;
                this._authFlowEvent.open();
                Logger.w(Area.AUTH.value(), String.format("resetCurrentAuthFlow(): Finished reset of auth to a state of '%1$s'", this._authFlowState.name()));
            } catch (Throwable th) {
                Logger.w(Area.AUTH.value(), String.format("resetCurrentAuthFlow(): Finished reset of auth to a state of '%1$s'", this._authFlowState.name()));
                throw th;
            }
        }
    }

    public boolean ensureAuth() {
        return ensureAuthInternal(null, null, false);
    }

    public boolean ensureAuthWithUI(AuthUIParentInterface uiParent) {
        if (uiParent == null) {
            throw new IllegalArgumentException("'uiParent' cannot be NULL");
        }
        return ensureAuthInternal(uiParent, null, false);
    }

    public boolean ensureAuthResetCurrent(ProviderHint providerHint, boolean forceAuth) {
        if (providerHint == null) {
            throw new IllegalArgumentException("'providerHint' cannot be NULL");
        }
        resetCurrentAuthFlow();
        return ensureAuthInternal(null, providerHint, forceAuth);
    }

    private boolean ensureAuthInternal(AuthUIParentInterface uiParent, ProviderHint providerHint, boolean reAuth) {
        boolean authStarted;
        Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() START [state:%1$s]", this._authFlowState.name()));
        String authFlowId = UUID.randomUUID().toString();
        synchronized (this._authFlowLock) {
            if (!reAuth) {
                if (AuthFlowState.AUTHED.equals(this._authFlowState) && !this._authCachingManager.isAuthExpired()) {
                    Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() finishing with state:%1$s", this._authFlowState.name()));
                    authStarted = true;
                }
            }
            authStarted = false;
            if (!this._authFlowState.isAuthing()) {
                this._authFlowEvent.close();
                this._authFlowState = AuthFlowState.STARTING;
                long value = Area.AUTH.value();
                Locale locale = Locale.US;
                Object[] objArr = new Object[5];
                objArr[0] = uiParent == null ? "null" : "not null";
                objArr[1] = authFlowId;
                objArr[2] = Boolean.valueOf(reAuth);
                objArr[3] = Logger.getShortStack();
                objArr[4] = this._authFlowState.name();
                Logger.d(value, String.format(locale, "AuthFlow: ensureAuthInternal() uiParent is %1$s, authFlowId: %2$s, reAuth: %3$s, called from [%4$s], %5$s", objArr));
                ProvidersBucket providers = resolveProviders(providerHint);
                if (reAuth || (providers.getUserProvider() instanceof ProxyAccountUserAuthProvider) || (providers.getUserProvider() instanceof EnforcedAccountUserAuthProvider)) {
                    this._authCachingManager.clearCache();
                    this._userAuthProviderFilter = null;
                    this._authToken = null;
                    this._userAccessId = null;
                    this._userDeviceId = null;
                    this._isNewUser = false;
                    this._authTTL = 0L;
                    this._authTimestamp = 0L;
                }
                if (providers.getAppProvider() == null) {
                    Logger.e(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() Failed to resolved an AppAuthProvider to use %1$s", this._authFlowState.name()));
                } else if (providers.getUserProvider() == null) {
                    Logger.e(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() Failed to resolved a UserAuthProvider to use, state:%1$s", this._authFlowState.name()));
                } else if (providers.getUserProvider().isUINeeded(this._commContext, authFlowId, providerHint) && uiParent == null) {
                    Logger.w(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() 'uiParent' is NULL and %1$s currently requires UI, state:%2$s", providers.getUserProvider().getClass().getName(), this._authFlowState.name()));
                    Logger.i(Area.AUTH.value(), "AuthFlow: ensureAuthInternal() [unable to auth]");
                } else {
                    Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() state:%1$s", this._authFlowState.name()));
                    Logger.i(Area.AUTH.value(), "AuthFlow: ensureAuthInternal() [running auth-flow]");
                    this._authFlowState = AuthFlowState.STARTED;
                    _ExecutorService.execute(new AuthFlow(this._commContext, this._authToken, this._userAccessId, this._userDeviceId, this._authTTL, this._authTimestamp, providers.getAppProvider(), providers.getUserProvider(), authFlowId, uiParent, providerHint));
                    authStarted = true;
                }
                if (!authStarted) {
                    this._authFlowState = AuthFlowState.FAILED;
                    this._authFlowEvent.open();
                }
                Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: ensureAuthInternal() finishing with state:%1$s", this._authFlowState.name()));
            } else {
                authStarted = true;
            }
        }
        return authStarted;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void notifyAuthCompleted(UserAuthResult authResult) {
        boolean authSucceeded = false;
        try {
            Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: notifyAuthCompleted() START [state:%1$s]", this._authFlowState.name()));
            if (authResult == null) {
                authSucceeded = true;
            } else if (authResult.getState().succeeded()) {
                if (StringUtility.isNullOrEmpty(authResult.getProviderFilter())) {
                    throw new IllegalStateException("UserAuthResult succeeded with NULL or empty provider filter");
                }
                if (StringUtility.isNullOrEmpty(authResult.getAuthToken())) {
                    throw new IllegalStateException("UserAuthResult succeeded with NULL or empty auth token");
                }
                if (StringUtility.isNullOrEmpty(authResult.getUserAccessId())) {
                    throw new IllegalStateException("UserAuthResult succeeded with NULL or empty user access ID");
                }
                if (StringUtility.isNullOrEmpty(authResult.getUserDeviceId())) {
                    throw new IllegalStateException("UserAuthResult succeeded with NULL or empty user device ID");
                }
                if (authResult.getTTL() < 0) {
                    throw new IllegalStateException("UserAuthResult succeeded with a TTL less than zero");
                }
                this._authCachingManager.setUserAuthProviderFilter(authResult.getProviderFilter(), Long.valueOf(authResult.getTTL()));
                this._authCachingManager.setAuthToken(authResult.getAuthToken(), Long.valueOf(authResult.getTTL()));
                this._authCachingManager.setUserAccessId(authResult.getUserAccessId(), authResult.getTTL());
                this._authCachingManager.setUserDeviceId(authResult.getUserDeviceId());
                this._authCachingManager.setClaims(authResult.getClaims(), authResult.getTTL());
                this._authCachingManager.setSettings(authResult.getSettings(), authResult.getTTL());
                updateSettingsDependentState();
                this._userAuthProviderFilter = authResult.getProviderFilter();
                this._authToken = authResult.getAuthToken();
                this._userAccessId = authResult.getUserAccessId();
                this._userDeviceId = authResult.getUserDeviceId();
                this._isNewUser = authResult.isNewUser();
                this._authTTL = authResult.getTTL();
                this._authTimestamp = this._authCachingManager.getAuthTimestamp().longValue();
                authSucceeded = true;
            }
            synchronized (this._authFlowLock) {
                if (authSucceeded) {
                    this._authFlowState = AuthFlowState.AUTHED;
                } else {
                    this._authFlowState = AuthFlowState.FAILED;
                }
                this._authFlowEvent.open();
            }
            Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: notifyAuthCompleted() DONE [state:%1$s]", this._authFlowState.name()));
        } catch (Throwable th) {
            synchronized (this._authFlowLock) {
                if (0 != 0) {
                    this._authFlowState = AuthFlowState.AUTHED;
                } else {
                    this._authFlowState = AuthFlowState.FAILED;
                }
                this._authFlowEvent.open();
                Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: notifyAuthCompleted() DONE [state:%1$s]", this._authFlowState.name()));
            }
        }
    }

    private void updateSettingsDependentState() {
        try {
            Logger.getInstance().configureAppenders(this._commContext.getApplicationContext());
        } catch (Exception e) {
            Logger.e(Area.AUTH.value() | Area.CONFIG.value(), "updateSettingsDependentState() failed", e);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class AuthFlow implements Runnable {
        private final AppAuthProvider _appProvider;
        private final String _authFlowId;
        private final long _authTTL;
        private final long _authTimestamp;
        private final String _authToken;
        private final CommContext _commContext;
        private final ProviderHint _providerHint;
        private final AuthUIParentInterface _uiParent;
        private final String _userAccessId;
        private final String _userDeviceId;
        private final UserAuthProvider _userProvider;

        private AuthFlow(CommContext commContext, String authToken, String userAccessId, String userDeviceId, long authTTL, long authTimestamp, AppAuthProvider appProvider, UserAuthProvider userProvider, String authFlowId, AuthUIParentInterface uiParent, ProviderHint providerHint) {
            if (commContext == null) {
                throw new IllegalArgumentException("'commContext' cannot be NULL");
            }
            if (appProvider == null) {
                throw new IllegalArgumentException("'appProvider' cannot be NULL");
            }
            if (userProvider == null) {
                throw new IllegalArgumentException("'userProvider' cannot be NULL");
            }
            if (StringUtility.isNullOrEmpty(authFlowId)) {
                throw new IllegalArgumentException("'authFlowId' cannot be NULL or empty");
            }
            this._commContext = commContext;
            this._authFlowId = authFlowId;
            this._authToken = authToken;
            this._userAccessId = userAccessId;
            this._userDeviceId = userDeviceId;
            this._authTTL = authTTL;
            this._authTimestamp = authTimestamp;
            this._appProvider = appProvider;
            this._userProvider = userProvider;
            this._uiParent = uiParent;
            this._providerHint = providerHint;
        }

        @Override // java.lang.Runnable
        public void run() {
            Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.run() START [state:%1$s]", AuthManager.this._authFlowState.name()));
            UserAuthResult authResult = null;
            try {
                AuthManager.this._authFlowState = AuthFlowState.DATA_CHECKING;
                Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.run() %1$s", AuthManager.this._authFlowState.name()));
                if (hasAuthData()) {
                    AuthManager.this._authFlowState = AuthFlowState.EXPIRY_CHECKING;
                    Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.run() %1$s", AuthManager.this._authFlowState.name()));
                    boolean isUINeeded = new AndroidAccountUserAuthProvider().isUINeeded(this._commContext, null, this._providerHint);
                    if (isAuthExpired() || isUINeeded) {
                        if (!isUINeeded) {
                            authResult = validateAuth(this._commContext, this._authFlowId, this._authToken);
                        }
                        if (isUINeeded || !authResult.getState().succeeded()) {
                            authResult = performAuth(this._commContext, this._authFlowId, this._uiParent, this._providerHint);
                        } else {
                            Logger.d(Area.AUTH.value(), "AuthFlow: AuthFlow.run() Auth is current and succeeded");
                        }
                    } else {
                        Logger.d(Area.AUTH.value(), "AuthFlow: AuthFlow.run() Auth is current and valid");
                    }
                } else {
                    authResult = performAuth(this._commContext, this._authFlowId, this._uiParent, this._providerHint);
                }
                Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.run() DONE %1$s", AuthManager.this._authFlowState.name()));
                AuthManager.this.notifyAuthCompleted(authResult);
            } catch (Throwable t) {
                try {
                    Logger.d(Area.AUTH.value(), "AuthFlow: AuthFlow.run() failed", t);
                    UserAuthResult authResult2 = new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.run() DONE %1$s", AuthManager.this._authFlowState.name()));
                    AuthManager.this.notifyAuthCompleted(authResult2);
                } catch (Throwable th) {
                    Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.run() DONE %1$s", AuthManager.this._authFlowState.name()));
                    AuthManager.this.notifyAuthCompleted(null);
                    throw th;
                }
            }
        }

        private UserAuthResult performAuth(CommContext commContext, String authFlowId, AuthUIParentInterface uiParent, ProviderHint providerHint) {
            AuthManager.this._authFlowState = AuthFlowState.APP_AUTHING;
            Logger.v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: AuthFlow.performAuth() %1$s", AuthManager.this._authFlowState.name()));
            AuthResult appResult = this._appProvider.authorizeApplication(commContext, authFlowId);
            if (appResult == null || !appResult.getState().succeeded()) {
                Logger.v(Area.AUTH.value(), "AuthFlow: AuthFlow.performAuth() AppAuthProvider.authorizeApplication() failed");
                UserAuthResult userResult = new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                return userResult;
            }
            if (appResult.getSettings() != null) {
                AuthManager.this._authCachingManager.setSettings(appResult.getSettings(), appResult.getTTL());
            }
            AuthManager.this._authFlowState = AuthFlowState.USER_AUTHING;
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.performAuth() %1$s", AuthManager.this._authFlowState.name()));
            UserAuthResult userResult2 = this._userProvider.ensureUser(appResult.getAuthToken(), commContext, authFlowId, uiParent, providerHint);
            return userResult2;
        }

        private UserAuthResult validateAuth(CommContext commContext, String authFlowId, String authTokenToValidate) {
            Logger.d(Area.AUTH.value(), "AuthFlow: validateAuth() START");
            try {
                try {
                    AuthManager.this._authFlowState = AuthFlowState.VALIDATING;
                    Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AuthFlow.validateAuth() %1$s", AuthManager.this._authFlowState.name()));
                    Operation operation = AuthorizationServiceProxy.getInstance().validateAuth(commContext, authFlowId, authTokenToValidate);
                    try {
                        Result result = operation.mo38get();
                        if (result == null) {
                            Logger.d(Area.AUTH.value(), "AuthFlow: validateAuth() Failed to get results, returning NULL");
                            return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        } else if (!result.isSuccessfulResponse()) {
                            try {
                                boolean isBlacklistedOrUnsupported = result.checkForBlacklistedOrUnsupported(commContext);
                                if (!isBlacklistedOrUnsupported) {
                                    return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                                }
                                Logger.d(Area.AUTH.value(), "AuthFlow: validateAuth() We are blacklisted or unsupported");
                                return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNSUPPORTED);
                            } catch (JSONException e) {
                                Logger.e(Area.AUTH.value(), "AuthFlow: validateAuth() result.checkForBlacklistedOrUnsupported() failed", e);
                                return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                            }
                        } else {
                            Map<String, String> claims = AuthUtilities.getClaimsFromResult(result);
                            Map<String, SettingsValue> settings = AuthUtilities.getSettingsFromResult(result);
                            String authTokenReturned = AuthUtilities.getAuthTokenFromHeaders(result);
                            long ttl = AuthUtilities.getTTLFromClaims(claims, 172800000L);
                            String userAccessId = null;
                            String userDeviceId = null;
                            if (claims != null) {
                                String userAccessId2 = claims.get(ClaimsManager.KeyClaimsUserAccessID);
                                userAccessId = userAccessId2;
                                String userDeviceId2 = claims.get(ClaimsManager.KeyClaimsUserDeviceID);
                                userDeviceId = userDeviceId2;
                            }
                            try {
                                AccountHistoryManager.getInstance().addEvent(userAccessId, AccountEventType.AUTH_VALIDATED);
                            } catch (Exception e2) {
                                Logger.e(Area.AUTH.value(), "AccountHistoryManager work failed", e2);
                            }
                            UserAuthResult authResult = new UserAuthResult(this._userProvider.getProviderFilter(), userAccessId, userDeviceId, false, authTokenReturned, claims, settings, ttl);
                            Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: validateAuth() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]", authResult.getUserAccessId(), authResult.getUserDeviceId(), authResult.getAuthToken(), Integer.valueOf(authResult.getClaims().size()), Long.valueOf(authResult.getTTL())));
                            return authResult;
                        }
                    } catch (InterruptedException e3) {
                        Logger.e(Area.AUTH.value(), "AuthFlow: validateAuth() opBaseAuth.get() failed", e3);
                        return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    } catch (ExecutionException e4) {
                        Logger.e(Area.AUTH.value(), "AuthFlow: validateAuth() opBaseAuth.get() failed", e4);
                        return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    }
                } finally {
                    Logger.d(Area.AUTH.value(), "AuthFlow: validateAuth() DONE");
                }
            } catch (Exception e5) {
                Logger.e(Area.AUTH.value(), "AuthFlow: validateAuth() failed", e5);
                Logger.d(Area.AUTH.value(), "AuthFlow: validateAuth() DONE");
                return new UserAuthResult(this._userProvider.getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            }
        }

        private boolean hasAuthData() {
            return (this._userAccessId == null || this._userDeviceId == null || this._authToken == null) ? false : true;
        }

        private boolean isAuthExpired() {
            long now = System.currentTimeMillis();
            long expiresOn = (this._authTimestamp + this._authTTL) - 3600000;
            return expiresOn < now;
        }
    }

    public void waitOnAuth() {
        Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: waitOnAuth() START [stack:%1$s]", Logger.getShortStack()));
        try {
            try {
                this._authFlowEvent.waitForOpen();
            } catch (InterruptedException e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: waitOnAuth() waitForOpen() failed", e);
                e.printStackTrace();
            }
            if (this._authFlowState == AuthFlowState.FAILED) {
                throw new AuthException("AuthFlowState = FAILED after _authFlowEvent.waitForOpen()");
            }
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: waitOnAuth() FINISHED [stack:%1$s]", Logger.getShortStack()));
        } catch (Throwable th) {
            Logger.v(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: waitOnAuth() FINISHED [stack:%1$s]", Logger.getShortStack()));
            throw th;
        }
    }

    public void waitOnAuthWithUI(String theTitle) {
        Logger.v(Area.AUTH.value() | Area.UI.value(), "UserAuth: waitOnAuthWithUI() START");
        try {
            try {
                waitOnAuth();
                Logger.v(Area.AUTH.value() | Area.UI.value(), "UserAuth: waitOnAuthWithUI() FINISHED");
            } catch (AuthException e) {
                Logger.w(Area.AUTH.value() | Area.UI.value(), "UserAuth: waitOnAuthWithUI() waitOnAuth() failed");
                String authWithUiId = UUID.randomUUID().toString();
                Intent intent = new Intent(this._commContext.getApplicationContext(), GetJarActivity.class);
                intent.addFlags(276824064);
                intent.putExtra(Constants.EXTRA_TITLE, theTitle);
                intent.putExtra(Constants.GETJAR_CONTEXT_ID_KEY, this._commContext.getCommContextId());
                intent.putExtra(Constants.EXTRA_USER_AUTH, true);
                intent.putExtra(Constants.EXTRA_AUTH_WITH_UI_ID, authWithUiId);
                this._commContext.getApplicationContext().startActivity(intent);
                Logger.v(Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "UserAuth: waitOnAuthWithUI() waiting on authWithUiId: '%1$s'", authWithUiId));
                long start = System.currentTimeMillis();
                while (!_ObservedAuthWithUiIds.contains(authWithUiId) && System.currentTimeMillis() - start < 10000) {
                    try {
                        Thread.sleep(250L);
                    } catch (InterruptedException e2) {
                        throw new AuthException(e2);
                    }
                }
                _ObservedAuthWithUiIds.remove(authWithUiId);
                Logger.v(Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "UserAuth: waitOnAuthWithUI() finished waiting on authWithUiId: '%1$s'", authWithUiId));
                getInstance().waitOnAuth();
                Logger.v(Area.AUTH.value() | Area.UI.value(), "UserAuth: waitOnAuthWithUI() FINISHED");
            }
        } catch (Throwable th) {
            Logger.v(Area.AUTH.value() | Area.UI.value(), "UserAuth: waitOnAuthWithUI() FINISHED");
            throw th;
        }
    }

    public void observeAuthWithUiId(String authWithUiId) {
        if (StringUtility.isNullOrEmpty(authWithUiId)) {
            throw new IllegalArgumentException("'authWithUiId' cannot be NULL or empty");
        }
        Logger.v(Area.AUTH.value(), String.format(Locale.US, "UserAuth: observeAuthWithUiId() observing authWithUiId: '%1$s'", authWithUiId));
        if (!_ObservedAuthWithUiIds.contains(authWithUiId)) {
            _ObservedAuthWithUiIds.add(authWithUiId);
        }
    }

    private ProvidersBucket resolveProviders(ProviderHint providerHint) {
        UserAuthProvider userAuthProvider;
        AppAuthProvider appAuthorizer = new AppAuthProvider();
        boolean useEnforcedAuth = false;
        if (providerHint != null && providerHint.getData() != null) {
            if (providerHint.getData().containsKey(EnforcedAccountUserAuthProvider.KeySourceAccountNameHash)) {
                useEnforcedAuth = true;
            } else if (providerHint.getData().containsKey(EnforcedAccountUserAuthProvider.KeySourceAppToken) && providerHint.getData().containsKey(EnforcedAccountUserAuthProvider.KeySourceUserAccessId) && providerHint.getData().containsKey(EnforcedAccountUserAuthProvider.KeySourceUserDeviceId)) {
                useEnforcedAuth = true;
            }
        }
        if (useEnforcedAuth) {
            userAuthProvider = new EnforcedAccountUserAuthProvider();
        } else if (!RewardUtility.checkPermission(this._commContext.getApplicationContext(), "android.permission.GET_ACCOUNTS")) {
            userAuthProvider = new ProxyAccountUserAuthProvider();
        } else {
            userAuthProvider = new AndroidAccountUserAuthProvider();
        }
        return new ProvidersBucket(appAuthorizer, userAuthProvider);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class ProvidersBucket {
        private final AppAuthProvider _appProvider;
        private final UserAuthProvider _userProvider;

        protected ProvidersBucket(AppAuthProvider appProvider, UserAuthProvider userProvider) {
            this._appProvider = appProvider;
            this._userProvider = userProvider;
        }

        protected AppAuthProvider getAppProvider() {
            return this._appProvider;
        }

        protected UserAuthProvider getUserProvider() {
            return this._userProvider;
        }
    }

    public void reAuthWithUI(AuthUIParentInterface uiParent) throws Exception {
        if (uiParent == null) {
            throw new IllegalArgumentException("'uiParent' cannot be NULL");
        }
        reAuthInternal(uiParent);
    }

    public void reAuth() {
        reAuthInternal(null);
    }

    private void reAuthInternal(AuthUIParentInterface uiParent) {
        Logger.i(Area.AUTH.value(), String.format(Locale.US, "%1$s REAUTHORIZING", getLoggingPrefix()));
        try {
            ensureAuthInternal(uiParent, null, true);
            Logger.i(Area.AUTH.value(), String.format(Locale.US, "%1$s REAUTHORIZATION FINISHED", getLoggingPrefix()));
        } catch (Throwable th) {
            Logger.i(Area.AUTH.value(), String.format(Locale.US, "%1$s REAUTHORIZATION FINISHED", getLoggingPrefix()));
            throw th;
        }
    }

    public ClaimsManager getClaimsManager(Context context) {
        ClaimsManager.initialize(context);
        return ClaimsManager.getInstance();
    }

    private static final String getLoggingPrefix() {
        String methodName = "";
        StackTraceElement[] stackTrace = Thread.currentThread().getStackTrace();
        if (stackTrace != null && stackTrace.length >= 3) {
            methodName = stackTrace[3].getMethodName();
        }
        return String.format(Locale.US, "AuthFlow: %1$s() [thread:%2$d]", methodName, Long.valueOf(Thread.currentThread().getId()));
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class AuthCachingManager {
        private static final String _KeyAuthenticationToken = "authenticationToken";
        private static final String _KeyUserAccessID = "userAccessId";
        private static final String _KeyUserAuthProviderFilter = "userAuthProviderFilter";
        private static final String _KeyUserDeviceID = "userDeviceId";
        private final CachingManager _authCachingManager;
        private final CachingManager _claimsAndCapsCachingManager;
        private final CachingManager _settingsCachingManager;

        private AuthCachingManager() {
            this._authCachingManager = new CachingManager(AuthManager.this._commContext.getApplicationContext(), "authCache");
            this._claimsAndCapsCachingManager = new CachingManager(AuthManager.this._commContext.getApplicationContext(), "claimsAndCapsCache");
            this._settingsCachingManager = new CachingManager(AuthManager.this._commContext.getApplicationContext(), "settings");
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getAuthToken() {
            CacheEntry entry = this._authCachingManager.getCacheEntry(_KeyAuthenticationToken);
            if (entry == null) {
                return null;
            }
            String entryValue = entry.getValue();
            if (StringUtility.isNullOrEmpty(entryValue)) {
                return null;
            }
            Logger.d(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: Found cached authentication token value [%1$s]", entryValue));
            return entryValue;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Long getAuthTTL() {
            CacheEntry entry = this._authCachingManager.getCacheEntry(_KeyAuthenticationToken);
            if (entry != null) {
                return entry.getTtl();
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Long getAuthTimestamp() {
            CacheEntry entry = this._authCachingManager.getCacheEntry(_KeyAuthenticationToken);
            if (entry != null) {
                return entry.getLastUpdated();
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean isAuthExpired() {
            Long authTTL = getAuthTTL();
            Long authTimestamp = getAuthTimestamp();
            if (authTTL == null || authTimestamp == null) {
                return true;
            }
            long now = System.currentTimeMillis();
            long expiresOn = (authTimestamp.longValue() + authTTL.longValue()) - 3600000;
            return expiresOn < now;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setAuthToken(String authToken, Long ttl) {
            this._authCachingManager.updateCache(_KeyAuthenticationToken, authToken, ttl, null, null);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getUserAuthProviderFilter() {
            CacheEntry entry = this._authCachingManager.getCacheEntry(_KeyUserAuthProviderFilter);
            if (entry == null) {
                return null;
            }
            String entryValue = entry.getValue();
            if (StringUtility.isNullOrEmpty(entryValue)) {
                return null;
            }
            Logger.d(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: Found cached user auth provider filter value [%1$s]", entryValue));
            return entryValue;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setUserAuthProviderFilter(String userAuthProviderFilter, Long ttl) {
            this._authCachingManager.updateCache(_KeyUserAuthProviderFilter, userAuthProviderFilter, ttl, null, null);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getUserAccessId() {
            CacheEntry entry = this._authCachingManager.getCacheEntry(_KeyUserAccessID);
            if (entry == null) {
                return null;
            }
            String entryValue = entry.getValue();
            if (StringUtility.isNullOrEmpty(entryValue)) {
                return null;
            }
            Logger.d(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: Found cached user access ID value [%1$s]", entryValue));
            return entryValue;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setUserAccessId(String userAccessId, long ttl) {
            this._authCachingManager.updateCache(_KeyUserAccessID, userAccessId, Long.valueOf(ttl), null, null);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getUserDeviceId() {
            CacheEntry entry = this._authCachingManager.getCacheEntry(_KeyUserDeviceID);
            if (entry == null) {
                return null;
            }
            String entryValue = entry.getValue();
            if (StringUtility.isNullOrEmpty(entryValue)) {
                return null;
            }
            Logger.d(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: Found cached user device ID value [%1$s]", entryValue));
            return entryValue;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void setUserDeviceId(String userDeviceId) {
            this._authCachingManager.updateCache(_KeyUserDeviceID, userDeviceId, Long.MAX_VALUE, null, null);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void clearCache() {
            this._authCachingManager.removeCacheEntry(_KeyUserAuthProviderFilter);
            this._authCachingManager.removeCacheEntry(_KeyAuthenticationToken);
            this._authCachingManager.removeCacheEntry(_KeyUserAccessID);
            this._authCachingManager.removeCacheEntry(_KeyUserDeviceID);
        }

        public void setClaims(Map<String, String> claims, long ttl) {
            if (claims == null) {
                throw new IllegalArgumentException("'claims' cannot be NULL");
            }
            if (ttl < 0) {
                throw new IllegalArgumentException("'ttl' cannot be less than zero");
            }
            this._claimsAndCapsCachingManager.removeCacheEntries();
            for (String key : claims.keySet()) {
                String value = claims.get(key);
                if (!StringUtility.isNullOrEmpty(key) && !StringUtility.isNullOrEmpty(value)) {
                    this._claimsAndCapsCachingManager.updateCache(key, value, Long.valueOf(ttl), null, null);
                    Logger.v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: claim added to cache [key:%1$s  value:%2$s  ttl:%3$d]", key, value, Long.valueOf(ttl)));
                }
            }
        }

        public void setSettings(Map<String, SettingsValue> settingsMap, long ttl) {
            if (settingsMap == null) {
                throw new IllegalArgumentException("'settingsMap' cannot be NULL");
            }
            if (ttl < 0) {
                throw new IllegalArgumentException("'ttl' cannot be less than zero");
            }
            if (!settingsMap.isEmpty()) {
                this._settingsCachingManager.removeCacheEntries();
                for (String key : settingsMap.keySet()) {
                    SettingsValue value = settingsMap.get(key);
                    if (!StringUtility.isNullOrEmpty(key)) {
                        try {
                            this._settingsCachingManager.updateCache(key, Base64.encodeObject(value), Long.valueOf(ttl), null, null);
                        } catch (IOException e) {
                            Logger.w(Area.AUTH.value() | Area.STORAGE.value(), "Error adding setting to cache", e);
                        }
                        Logger.v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: setting added to cache [key:%1$s  value:%2$s  ttl:%3$d]", key, value, Long.valueOf(ttl)));
                    }
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Map<String, String> getCapabilities() {
            HashMap<String, String> resultMap = new HashMap<>();
            try {
                List<CacheEntry> entries = this._claimsAndCapsCachingManager.getAllCacheEntries();
                for (CacheEntry entry : entries) {
                    if (entry.getName().startsWith("capabilities.")) {
                        resultMap.put(entry.getName().substring("capabilities.".length()), entry.getValue());
                    }
                }
                return Collections.unmodifiableMap(resultMap);
            } catch (URISyntaxException e) {
                throw new CachingException(e);
            }
        }

        private Map<String, String> getClaims() {
            HashMap<String, String> resultMap = new HashMap<>();
            try {
                List<CacheEntry> entries = this._claimsAndCapsCachingManager.getAllCacheEntries();
                for (CacheEntry entry : entries) {
                    if (entry.getName().startsWith("claims.")) {
                        resultMap.put(entry.getName().substring("claims.".length()), entry.getValue());
                    }
                }
                return Collections.unmodifiableMap(resultMap);
            } catch (URISyntaxException e) {
                throw new CachingException(e);
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Map<String, SettingsValue> getSettings() {
            HashMap<String, SettingsValue> resultMap = new HashMap<>();
            try {
                List<CacheEntry> entries = this._settingsCachingManager.getAllCacheEntries();
                for (CacheEntry entry : entries) {
                    try {
                        resultMap.put(entry.getName(), (SettingsValue) Base64.decodeToObject(entry.getValue()));
                    } catch (IOException e) {
                        Logger.w(Area.AUTH.value() | Area.STORAGE.value() | Area.CONFIG.value(), "AuthFlow: getSettings() failed", e);
                    } catch (ClassNotFoundException e2) {
                        Logger.w(Area.AUTH.value() | Area.STORAGE.value() | Area.CONFIG.value(), "AuthFlow: getSettings() failed", e2);
                    }
                }
                return Collections.unmodifiableMap(resultMap);
            } catch (URISyntaxException e3) {
                throw new CachingException(e3);
            }
        }
    }

    public Map<String, String> getCapabilities() {
        return this._authCachingManager.getCapabilities();
    }

    public Map<String, SettingsValue> getSettings() {
        return this._authCachingManager.getSettings();
    }
}
