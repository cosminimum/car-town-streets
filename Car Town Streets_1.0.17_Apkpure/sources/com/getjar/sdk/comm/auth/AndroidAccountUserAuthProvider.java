package com.getjar.sdk.comm.auth;

import android.accounts.Account;
import android.accounts.AccountManager;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import com.getjar.sdk.comm.AuthorizationServiceProxy;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.RequestUtilities;
import com.getjar.sdk.comm.Result;
import com.getjar.sdk.comm.auth.AuthResult;
import com.getjar.sdk.data.CacheEntry;
import com.getjar.sdk.data.CachingManager;
import com.getjar.sdk.data.LicenseEngine;
import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.exceptions.CachingException;
import com.getjar.sdk.exceptions.ServiceException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.CryptoUtility;
import com.getjar.sdk.utilities.ScreenUtility;
import com.getjar.sdk.utilities.StringUtility;
import com.google.android.gms.auth.GoogleAuthUtil;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ExecutionException;
/* loaded from: classes.dex */
public class AndroidAccountUserAuthProvider implements UserAuthProvider {
    public static final String KeyProviderHintUsernameDataHash = "android_account.username_data_hash";
    public static final String KeySkipCacheFlag = "provider.skip_cache";
    private static final String _CacheName = "androidAccountUserAuthCache";
    private static final String _KeyProviderDataName = "android.account.name";
    private static final String _KeyProviderDataType = "android.account.type";
    private static final String _KeyUserAuthProviderAndData = "userAuthProviderAndData";
    private final AndroidAccountResolver _accountResolver = new AndroidAccountResolver();

    public static String getAccountNameFromHash(Context context, String accountNameHash) {
        Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() START");
        if (context == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(accountNameHash)) {
            Logger.w(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() null or empty 'accountNameHash' provided");
            return null;
        }
        String accountName = null;
        try {
            try {
                AccountManager accountManager = AccountManager.get(context);
                Account[] accounts = accountManager.getAccountsByType(GoogleAuthUtil.GOOGLE_ACCOUNT_TYPE);
                if (accounts != null) {
                    int i = 0;
                    while (true) {
                        if (i >= accounts.length) {
                            break;
                        }
                        if (accounts[i] != null && !StringUtility.isNullOrEmpty(accounts[i].name)) {
                            String accNameStr = accounts[i].name.toLowerCase(Locale.US);
                            if (CryptoUtility.getSHA256(accNameStr).equalsIgnoreCase(accountNameHash)) {
                                accountName = accNameStr;
                                break;
                            }
                        }
                        i++;
                    }
                }
                Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FINISHED Returning %1$s", accountName));
                return accountName;
            } catch (Exception e) {
                Logger.e(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FAILED", e);
                Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FINISHED Returning %1$s", null));
                return null;
            }
        } catch (Throwable th) {
            Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: getAccountNameFromHash() FINISHED Returning %1$s", null));
            throw th;
        }
    }

    @Override // com.getjar.sdk.comm.auth.AuthProvider
    public String getProviderFilter() {
        return "android_account";
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public Map<String, String> getProxiableAuthData(Context context) {
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        String cachedAccountName = this._accountResolver.getCachedAccountName(context);
        if (StringUtility.isNullOrEmpty(cachedAccountName)) {
            throw new IllegalStateException("The provider does not currently have the data needed");
        }
        Map<String, String> resultMap = new HashMap<>(2);
        resultMap.put("provider_filter", getProviderFilter());
        try {
            resultMap.put("android_account.username_data_hash", CryptoUtility.getSHA256(cachedAccountName.toLowerCase(Locale.US)));
            return resultMap;
        } catch (UnsupportedEncodingException e) {
            throw new AuthException(e);
        } catch (NoSuchAlgorithmException e2) {
            throw new AuthException(e2);
        }
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public UserAuthResult ensureUser(String currentAuthToken, CommContext commContext, String authFlowId, AuthUIParentInterface uiParent, ProviderHint providerHint) {
        if (StringUtility.isNullOrEmpty(currentAuthToken)) {
            throw new IllegalArgumentException("'currentAuthToken' cannot be NULL or empty");
        }
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        if (StringUtility.isNullOrEmpty(authFlowId)) {
            throw new IllegalArgumentException("'authFlowId' cannot be NULL or empty");
        }
        Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() START");
        try {
            try {
                Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() Calling userAccessEnsure()");
                Operation operation = AuthorizationServiceProxy.getInstance().userAccessEnsure(commContext, authFlowId, currentAuthToken, getProviderData(commContext, uiParent, providerHint), getProviderFilter());
                try {
                    Result result = operation.mo38get();
                    if (result == null) {
                        Logger.e(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() failed to get results");
                        return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                    } else if (!result.isSuccessfulResponse()) {
                        Logger.w(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() got failure results");
                        ServiceException servicesException = RequestUtilities.getServicesException(result);
                        if (servicesException != null) {
                            commContext.addException(servicesException);
                        }
                        if (!result.checkForBlacklistedOrUnsupported(commContext)) {
                            return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                        }
                        Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported");
                        return new UserAuthResult(getProviderFilter(), AuthResult.State.UNSUPPORTED);
                    } else {
                        Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() got successful results");
                        Map<String, String> claims = AuthUtilities.getClaimsFromResult(result);
                        Map<String, SettingsValue> settings = AuthUtilities.getSettingsFromResult(result);
                        String newAuthToken = AuthUtilities.getAuthTokenFromHeaders(result);
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
                            String accountName = this._accountResolver.getCachedAccountName(commContext.getApplicationContext());
                            AccountHistoryManager.initialize(commContext.getApplicationContext());
                            AccountHistoryManager.getInstance().ensureAccountEntry(userAccessId, userDeviceId, accountName, getProviderFilter());
                            if (result.isSuccessfulCreationResponse()) {
                                AccountHistoryManager.getInstance().addEvent(userAccessId, AccountEventType.AUTH_FIRST_TIME);
                            } else {
                                AccountHistoryManager.getInstance().addEvent(userAccessId, AccountEventType.AUTH);
                            }
                        } catch (Exception e) {
                            Logger.e(Area.AUTH.value(), "AccountHistoryManager work failed", e);
                        }
                        UserAuthResult authResult = new UserAuthResult(getProviderFilter(), userAccessId, userDeviceId, result.isSuccessfulCreationResponse(), newAuthToken, claims, settings, ttl);
                        Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]", authResult.getUserAccessId(), authResult.getUserDeviceId(), authResult.getAuthToken(), Integer.valueOf(authResult.getClaims().size()), Long.valueOf(authResult.getTTL())));
                        return authResult;
                    }
                } catch (InterruptedException e2) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() operation.get() failed", e2);
                    return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                } catch (ExecutionException e3) {
                    Logger.e(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() operation.get() failed", e3);
                    return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
                }
            } catch (Exception e4) {
                Logger.e(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() failed", e4);
                Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE");
                return new UserAuthResult(getProviderFilter(), AuthResult.State.UNKNOWN_FAILURE);
            }
        } finally {
            Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: ensureUser() DONE");
        }
    }

    @Override // com.getjar.sdk.comm.auth.UserAuthProvider
    public boolean isUINeeded(CommContext commContext, String authFlowId, ProviderHint providerHint) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        validateProviderHint(providerHint);
        CharSequence[] accountNames = getAndroidAccountNames(commContext.getApplicationContext());
        if (accountNames == null || accountNames.length <= 0) {
            return true;
        }
        String androidAccountName = null;
        UserAuthProviderAndDataCacheEntry providerAndData = getUserAuthProviderAndData(commContext.getApplicationContext());
        if (validateUserAuthProviderAndDataCacheEntry(providerAndData)) {
            String androidAccountName2 = providerAndData.getCachedProviderData().get(_KeyProviderDataName);
            androidAccountName = androidAccountName2;
        }
        if (!StringUtility.isNullOrEmpty(androidAccountName)) {
            for (CharSequence name : accountNames) {
                if (androidAccountName.equals(name)) {
                    return false;
                }
            }
        }
        if (accountNames.length == 1 && this._accountResolver.validateAccountAgainstCache(commContext, accountNames[0])) {
            return false;
        }
        return !isProviderHintForMe(providerHint) || StringUtility.isNullOrEmpty(this._accountResolver.getAndroidAccountNameViaHint(commContext, providerHint));
    }

    public String getCachedAccountName(Context context) {
        if (this._accountResolver == null) {
            return null;
        }
        return this._accountResolver.getCachedAccountName(context);
    }

    private Map<String, MetadataValue> getProviderData(CommContext commContext, AuthUIParentInterface uiParent, ProviderHint providerHint) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        validateProviderHint(providerHint);
        Map<? extends String, ? extends MetadataValue> deviceMetadata = commContext.getDeviceMetadata().getMetadataWithReliability();
        if (deviceMetadata == null || deviceMetadata.size() <= 0) {
            Logger.w(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() failed to get device metadata");
            return null;
        }
        Map<String, MetadataValue> providerData = new HashMap<>();
        providerData.putAll(deviceMetadata);
        String androidAccountName = null;
        if (providerHint == null || (isProviderHintForMe(providerHint) && !providerHint.getData().containsKey(KeySkipCacheFlag))) {
            UserAuthProviderAndDataCacheEntry providerAndData = getUserAuthProviderAndData(commContext.getApplicationContext());
            if (validateUserAuthProviderAndDataCacheEntry(providerAndData)) {
                androidAccountName = providerAndData.getCachedProviderData().get(_KeyProviderDataName);
            }
        }
        Account androidAccount = null;
        if (!StringUtility.isNullOrEmpty(androidAccountName) && (androidAccount = this._accountResolver.getAndroidAccountFromName(androidAccountName, commContext)) != null) {
            Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() [account:'%1$s'] [source:cache]", androidAccountName));
        }
        if (androidAccount == null) {
            if (isProviderHintForMe(providerHint)) {
                String androidAccountName2 = this._accountResolver.getAndroidAccountNameViaHint(commContext, providerHint);
                if (!StringUtility.isNullOrEmpty(androidAccountName2) && (androidAccount = this._accountResolver.getAndroidAccountFromName(androidAccountName2, commContext)) != null) {
                    Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() [account:'%1$s'] [source:hint]", androidAccountName2));
                    setUserAuthProviderAndData(commContext, androidAccountName2);
                }
            }
            if (androidAccount == null) {
                String androidAccountName3 = this._accountResolver.getAndroidAccountNameViaUI(commContext, uiParent);
                if (!StringUtility.isNullOrEmpty(androidAccountName3) && (androidAccount = this._accountResolver.getAndroidAccountFromName(androidAccountName3, commContext)) != null) {
                    Logger.d(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() [account:'%1$s'] [source:ui]", androidAccountName3));
                    setUserAuthProviderAndData(commContext, androidAccountName3);
                }
            }
            if (androidAccount == null) {
                setUserAuthProviderAndData(commContext, null);
                Logger.w(Area.AUTH.value(), "AuthFlow: AndroidAccountUserAuthProvider: getProviderData() failed to get android account name");
                return null;
            }
        }
        if (StringUtility.isNullOrEmpty(androidAccount.name)) {
            providerData.put(_KeyProviderDataName, new MetadataValue(androidAccount.name, MetadataValue.MetadataReliability.NOT_AVAILABLE));
        } else {
            providerData.put(_KeyProviderDataName, new MetadataValue(androidAccount.name, MetadataValue.MetadataReliability.AVAILABLE));
        }
        if (StringUtility.isNullOrEmpty(androidAccount.type)) {
            providerData.put(_KeyProviderDataType, new MetadataValue(androidAccount.type, MetadataValue.MetadataReliability.NOT_AVAILABLE));
        } else {
            providerData.put(_KeyProviderDataType, new MetadataValue(androidAccount.type, MetadataValue.MetadataReliability.AVAILABLE));
        }
        providerData.putAll(ScreenUtility.getDisplayDetails(commContext.getApplicationContext()));
        AuthMetadataUtility.addSDKMetadataValues(providerData);
        return providerData;
    }

    private boolean validateUserAuthProviderAndDataCacheEntry(UserAuthProviderAndDataCacheEntry providerAndData) {
        if (providerAndData == null) {
            Logger.v(Area.AUTH.value() | Area.STORAGE.value(), "AuthFlow: AndroidAccountUserAuthProvider: validateUserAuthProviderAndDataCacheEntry(): No cached provider data found");
            return false;
        } else if (!providerAndData.getUserAuthProviderType().isInstance(this)) {
            Logger.v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: validateUserAuthProviderAndDataCacheEntry(): Cached provider data is for '%1$s' and is not usable by '%2$s'", providerAndData.getUserAuthProviderType().getName(), getClass().getName()));
            return false;
        } else if (providerAndData.getCachedProviderData() != null && providerAndData.getCachedProviderData().size() > 0 && providerAndData.getCachedProviderData().containsKey(_KeyProviderDataName) && !StringUtility.isNullOrEmpty(providerAndData.getCachedProviderData().get(_KeyProviderDataName))) {
            return true;
        } else {
            Logger.v(Area.AUTH.value() | Area.STORAGE.value(), "AuthFlow: AndroidAccountUserAuthProvider: validateUserAuthProviderAndDataCacheEntry(): Cached provider data found without required content");
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public UserAuthProviderAndDataCacheEntry getUserAuthProviderAndData(Context context) {
        CachingManager cachingManager = new CachingManager(context.getApplicationContext(), _CacheName);
        CacheEntry entry = cachingManager.getCacheEntry(_KeyUserAuthProviderAndData);
        if (entry == null) {
            return null;
        }
        String entryValue = entry.getValue();
        if (StringUtility.isNullOrEmpty(entryValue)) {
            return null;
        }
        UserAuthProviderAndDataCacheEntry retObj = null;
        try {
            retObj = (UserAuthProviderAndDataCacheEntry) Base64.decodeToObject(entryValue);
            Logger.d(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: Using cached UserAuthProviderAndDataCacheEntry [%1$s]", retObj.getUserAuthProviderType().getName()));
            return retObj;
        } catch (Exception e) {
            Logger.e(Area.AUTH.value() | Area.STORAGE.value(), "AuthFlow: AndroidAccountUserAuthProvider: Deserialization of UserAuthProviderAndDataCacheEntry failed", e);
            return retObj;
        }
    }

    private void setUserAuthProviderAndData(CommContext commContext, String accountName) {
        Logger.v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: AndroidAccountUserAuthProvider: Updating cached UserAuthProviderAndDataCacheEntry [type:%1$s data:%2$s]", AndroidAccountUserAuthProvider.class.getName(), accountName));
        HashMap<String, String> providerDataToCache = new HashMap<>(1);
        providerDataToCache.put(_KeyProviderDataName, accountName);
        UserAuthProviderAndDataCacheEntry providerAndData = new UserAuthProviderAndDataCacheEntry(AndroidAccountUserAuthProvider.class, providerDataToCache);
        try {
            String serializedObject = Base64.encodeObject(providerAndData);
            CachingManager cachingManager = new CachingManager(commContext.getApplicationContext(), _CacheName);
            cachingManager.updateCache(_KeyUserAuthProviderAndData, serializedObject, Long.MAX_VALUE, null, null);
        } catch (IOException e) {
            throw new CachingException(e);
        }
    }

    private void validateProviderHint(ProviderHint providerHint) {
        if (isProviderHintForMe(providerHint)) {
            if (!providerHint.getData().containsKey("android_account.username_data_hash") || StringUtility.isNullOrEmpty(providerHint.getData().get("android_account.username_data_hash"))) {
                throw new IllegalArgumentException("'providerHint' does not contain required data");
            }
        }
    }

    private boolean isProviderHintForMe(ProviderHint providerHint) {
        return providerHint != null && providerHint.getFilter().equals(getProviderFilter());
    }

    public static Account[] getAndroidAccounts(Context context) {
        AccountManager accountManager = AccountManager.get(context);
        Account[] accounts = accountManager.getAccountsByType(GoogleAuthUtil.GOOGLE_ACCOUNT_TYPE);
        return accounts;
    }

    public static CharSequence[] getAndroidAccountNames(Context context) {
        Account[] accounts = getAndroidAccounts(context);
        CharSequence[] selectionItems = null;
        if (accounts != null) {
            selectionItems = new CharSequence[accounts.length];
            for (int i = 0; i < accounts.length; i++) {
                if (accounts[i] != null && !StringUtility.isNullOrEmpty(accounts[i].name)) {
                    selectionItems[i] = accounts[i].name;
                }
            }
        }
        return selectionItems;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class AndroidAccountResolver {
        private String _accountNameFromUI;
        private volatile Object _asyncAccountResolutionMonitorObject;
        private volatile boolean _asyncAccountResolutionWasSignalled;
        private volatile Object _asyncDialogCreationMonitorObject;
        private volatile boolean _asyncDialogCreationWasSignalled;
        private AlertDialog _createdDialog;

        private AndroidAccountResolver() {
            this._accountNameFromUI = null;
            this._asyncAccountResolutionWasSignalled = false;
            this._asyncAccountResolutionMonitorObject = new Object();
            this._createdDialog = null;
            this._asyncDialogCreationWasSignalled = false;
            this._asyncDialogCreationMonitorObject = new Object();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Account getAndroidAccountFromName(String accountName, CommContext commContext) {
            Account[] arr$ = AndroidAccountUserAuthProvider.getAndroidAccounts(commContext.getApplicationContext());
            for (Account account : arr$) {
                if (account.name.equals(accountName)) {
                    return account;
                }
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getCachedAccountName(Context context) {
            UserAuthProviderAndDataCacheEntry cachedAccountData = AndroidAccountUserAuthProvider.this.getUserAuthProviderAndData(context);
            if (cachedAccountData != null && cachedAccountData.getCachedProviderData() != null) {
                String cachedAccountName = cachedAccountData.getCachedProviderData().get(AndroidAccountUserAuthProvider._KeyProviderDataName);
                if (!StringUtility.isNullOrEmpty(cachedAccountName)) {
                    return cachedAccountName;
                }
            }
            return null;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public boolean validateAccountAgainstCache(CommContext commContext, CharSequence accountName) {
            String cachedAccountName = getCachedAccountName(commContext.getApplicationContext());
            if (StringUtility.isNullOrEmpty(cachedAccountName) || cachedAccountName.equals(accountName.toString())) {
                return true;
            }
            Logger.v(Area.AUTH.value() | Area.STORAGE.value(), String.format(Locale.US, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() cached account and available account do not match [cache:%1$s available:%2$s]", cachedAccountName, accountName));
            return false;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getAndroidAccountNameViaHint(CommContext commContext, ProviderHint providerHint) {
            Logger.d(Area.AUTH.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaHint() START");
            if (commContext == null) {
                throw new IllegalArgumentException("'commContext' cannot be NULL");
            }
            if (providerHint != null) {
                return AndroidAccountUserAuthProvider.getAccountNameFromHash(commContext.getApplicationContext(), providerHint.getData().get("android_account.username_data_hash"));
            }
            throw new IllegalArgumentException("'providerHint' cannot be NULL");
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getAndroidAccountNameViaUI(CommContext commContext, AuthUIParentInterface uiParent) {
            Logger.d(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() START");
            CharSequence[] accountNames = AndroidAccountUserAuthProvider.getAndroidAccountNames(commContext.getApplicationContext());
            if (accountNames.length == 1 && validateAccountAgainstCache(commContext, accountNames[0])) {
                accountResolved(commContext, accountNames[0]);
                return this._accountNameFromUI;
            } else if (uiParent != null) {
                this._accountNameFromUI = null;
                final AlertDialog dialog = getAndroidAccountUI(commContext, uiParent);
                if (dialog != null) {
                    List<Dialog> dlgList = new ArrayList<>(1);
                    dlgList.add(dialog);
                    uiParent.takeoverUI(dlgList);
                }
                if (dialog != null) {
                    try {
                        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.1
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    try {
                                        Logger.d(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Showing dialog");
                                        dialog.show();
                                        Logger.d(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Done showing dialog");
                                    } catch (Exception e) {
                                        Logger.e(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() dialog.show() failed", e);
                                        AndroidAccountResolver.this.asyncAccountResolutionNotify();
                                        Logger.d(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Done showing dialog");
                                    }
                                } catch (Throwable th) {
                                    Logger.d(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() Done showing dialog");
                                    throw th;
                                }
                            }
                        });
                    } finally {
                        if (dialog != null) {
                            uiParent.relinquishUI();
                        }
                    }
                }
                try {
                    asyncAccountResolutionWait();
                    Logger.d(Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() FINISHED Returning %1$s", this._accountNameFromUI));
                    return this._accountNameFromUI;
                } catch (InterruptedException e) {
                    throw new AuthException(e);
                }
            } else {
                Logger.d(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() FINISHED Returning NULL");
                return null;
            }
        }

        private AlertDialog getAndroidAccountUI(final CommContext commContext, final AuthUIParentInterface uiParent) {
            Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountUI() starting");
            AlertDialog resultDialog = null;
            final CharSequence[] selectionItems = AndroidAccountUserAuthProvider.getAndroidAccountNames(commContext.getApplicationContext());
            if (selectionItems == null || selectionItems.length <= 0) {
                AlertDialog.Builder builder = new AlertDialog.Builder(uiParent.getParentActivity());
                builder.setMessage("You must create or sign in to a GMail account in order to use Getjar.");
                builder.setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.2
                    @Override // android.content.DialogInterface.OnCancelListener
                    public void onCancel(DialogInterface dialog) {
                        try {
                            AndroidAccountResolver.this.accountResolved(commContext, null);
                            uiParent.getParentActivity().finish();
                        } catch (Exception e) {
                            Logger.e(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: AlertDialog onClick() failed", e);
                        }
                    }
                });
                builder.setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.3
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int id) {
                        try {
                            AndroidAccountResolver.this.accountResolved(commContext, null);
                            uiParent.getParentActivity().finish();
                            Intent accountCreationIntent = new Intent("android.settings.ADD_ACCOUNT_SETTINGS");
                            commContext.getApplicationContext().startActivity(accountCreationIntent);
                        } catch (Exception e) {
                            Logger.e(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: AlertDialog onClick() failed", e);
                        }
                    }
                });
                resultDialog = getDialogInstance(builder);
            } else if (selectionItems.length == 1 && validateAccountAgainstCache(commContext, selectionItems[0])) {
                accountResolved(commContext, selectionItems[0]);
            } else {
                String dialogTitle = uiParent.getTheTitle();
                if (selectionItems.length == 1 && !validateAccountAgainstCache(commContext, selectionItems[0])) {
                    dialogTitle = "Account missing. Restore or pick new account.";
                }
                AlertDialog.Builder builder2 = new AlertDialog.Builder(uiParent.getParentActivity());
                builder2.setTitle(dialogTitle);
                builder2.setItems(selectionItems, new DialogInterface.OnClickListener() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.4
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int item) {
                        try {
                            AndroidAccountResolver.this.accountSelected(selectionItems[item], commContext);
                        } catch (Exception e) {
                            Logger.e(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: AlertDialog onClick() failed", e);
                        }
                    }
                });
                builder2.setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.5
                    @Override // android.content.DialogInterface.OnCancelListener
                    public void onCancel(DialogInterface dialog) {
                        try {
                            AndroidAccountResolver.this.accountResolved(commContext, null);
                            uiParent.getParentActivity().finish();
                        } catch (Exception e) {
                            Logger.e(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: AlertDialog onCancel() failed", e);
                        }
                    }
                });
                resultDialog = getDialogInstance(builder2);
            }
            if (resultDialog != null) {
                Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountUI() returning an AlertDialog instance");
            } else {
                Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getAndroidAccountUI() returning null");
            }
            return resultDialog;
        }

        private synchronized AlertDialog getDialogInstance(final AlertDialog.Builder builder) {
            Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() START");
            this._createdDialog = null;
            new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.6
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        try {
                            Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() Creating a dialog instance on the UI thread");
                            AndroidAccountResolver.this._createdDialog = builder.create();
                            AndroidAccountResolver.this.asyncDialogCreationNotify();
                            Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() Done creating a dialog instance on the UI thread");
                        } catch (Exception e) {
                            Logger.e(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() failed", e);
                            AndroidAccountResolver.this.asyncDialogCreationNotify();
                            Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() Done creating a dialog instance on the UI thread");
                        }
                    } catch (Throwable th) {
                        Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() Done creating a dialog instance on the UI thread");
                        throw th;
                    }
                }
            });
            try {
                asyncDialogCreationWait();
                Logger.v(Area.AUTH.value() | Area.UI.value(), "AuthFlow: AndroidAccountResolver: getDialogInstance() FINISHED");
            } catch (InterruptedException e) {
                throw new AuthException(e);
            }
            return this._createdDialog;
        }

        private void asyncDialogCreationWait() throws InterruptedException {
            synchronized (this._asyncDialogCreationMonitorObject) {
                while (!this._asyncDialogCreationWasSignalled) {
                    try {
                        this._asyncDialogCreationMonitorObject.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                this._asyncDialogCreationWasSignalled = false;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void asyncDialogCreationNotify() {
            synchronized (this._asyncDialogCreationMonitorObject) {
                this._asyncDialogCreationWasSignalled = true;
                this._asyncDialogCreationMonitorObject.notify();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void accountSelected(CharSequence accountName, final CommContext commContext) {
            accountResolved(commContext, accountName);
            new Thread(new Runnable() { // from class: com.getjar.sdk.comm.auth.AndroidAccountUserAuthProvider.AndroidAccountResolver.7
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        SharedPreferences.Editor edit = commContext.getApplicationContext().getSharedPreferences("GetJarClientPrefs", 0).edit();
                        edit.remove(LicenseEngine.PREFS_LICENSE_CHECK_TIMESTAMP).commit();
                        edit.commit();
                        LicenseEngine licenseEngine = new LicenseEngine(commContext);
                        licenseEngine.retrieveServerProductLicenses(true);
                        Logger.i(Area.AUTH.value() | Area.UI.value() | Area.LICENSING.value(), "AuthFlow: AndroidAccountResolver: accountSelected(): Updating License cache success");
                    } catch (Exception e) {
                        Logger.e(Area.AUTH.value() | Area.UI.value() | Area.LICENSING.value(), "AuthFlow: AndroidAccountResolver: accountSelected(): Updating License cache failed", e);
                    }
                }
            }, "Refresh License Cache Thread").start();
        }

        /* JADX INFO: Access modifiers changed from: private */
        public synchronized void accountResolved(CommContext commContext, CharSequence accountName) {
            if (accountName != null) {
                this._accountNameFromUI = accountName.toString();
                Logger.i(Area.AUTH.value(), String.format(Locale.US, "AuthFlow: AndroidAccountResolver: accountResolved(): '%1$s'", this._accountNameFromUI));
                asyncAccountResolutionNotify();
            } else {
                this._accountNameFromUI = null;
                Logger.i(Area.AUTH.value(), "AuthFlow: AndroidAccountResolver: accountResolved(): No account was resolved for use");
                asyncAccountResolutionNotify();
            }
        }

        private void asyncAccountResolutionWait() throws InterruptedException {
            synchronized (this._asyncAccountResolutionMonitorObject) {
                while (!this._asyncAccountResolutionWasSignalled) {
                    try {
                        this._asyncAccountResolutionMonitorObject.wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
                this._asyncAccountResolutionWasSignalled = false;
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void asyncAccountResolutionNotify() {
            synchronized (this._asyncAccountResolutionMonitorObject) {
                this._asyncAccountResolutionWasSignalled = true;
                this._asyncAccountResolutionMonitorObject.notify();
            }
        }
    }
}
