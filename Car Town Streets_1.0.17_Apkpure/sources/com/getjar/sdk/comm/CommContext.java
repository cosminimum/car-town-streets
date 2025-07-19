package com.getjar.sdk.comm;

import android.content.Context;
import android.os.Bundle;
import android.os.ResultReceiver;
import com.getjar.sdk.data.DeviceMetadata;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.exceptions.SigningException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.response.BlacklistedResponse;
import com.getjar.sdk.response.CloseResponse;
import com.getjar.sdk.response.DeviceUnsupportedResponse;
import com.getjar.sdk.response.PurchaseSucceededResponse;
import com.getjar.sdk.response.Response;
import com.getjar.sdk.utilities.Base64;
import com.getjar.sdk.utilities.Security;
import com.getjar.sdk.utilities.StringUtility;
import java.io.IOException;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentLinkedQueue;
import org.json.JSONException;
/* loaded from: classes.dex */
public class CommContext {
    private static final Map<Class<? extends Response>, Integer> _ResponseOrderOfPrecedence = new HashMap<Class<? extends Response>, Integer>() { // from class: com.getjar.sdk.comm.CommContext.1
        {
            put(PurchaseSucceededResponse.class, 1);
            put(DeviceUnsupportedResponse.class, 2);
            put(BlacklistedResponse.class, 3);
            put(CloseResponse.class, 4);
        }
    };
    private String _appEncryptionKeyIndex;
    private PublicKey _appEncryptionPublicKey;
    private final Context _applicationContext;
    private final String _applicationKey;
    private final String _commContextId;
    private ConcurrentLinkedQueue<CommFailureCallbackInterface> _commFailureCallbackInterfaceList;
    private final ResultReceiver _developerResultReceiver;
    private final DeviceMetadata _deviceMetadata;
    private ConcurrentHashMap<Long, Throwable> _epochToException;
    private ResultReceiver _internalResultReceiver;
    private volatile long _lastUpdated;
    private Response _pulledResponse;
    private volatile Object _pulledResponseLock;
    private final Object _reAuthLock;
    private final String _sdkUserAgent;
    private String _webKitUserAgent;
    private HashMap<String, String> nonces;
    private HashMap<String, String> signatures;

    public String removeNonce(String hashKey) {
        if (StringUtility.isNullOrEmpty(hashKey)) {
            throw new IllegalArgumentException("hashKey cannot be null");
        }
        String nonce = this.nonces.get(hashKey);
        this.nonces.remove(hashKey);
        return nonce;
    }

    public void putNonce(String hashKey, String nonce) {
        if (StringUtility.isNullOrEmpty(hashKey)) {
            throw new IllegalArgumentException("hashKey cannot be null");
        }
        if (StringUtility.isNullOrEmpty(nonce)) {
            throw new IllegalArgumentException("nonce cannot be null");
        }
        this.nonces.put(hashKey, nonce);
    }

    public void putSignature(String hashKey, String signature) {
        if (StringUtility.isNullOrEmpty(hashKey)) {
            throw new IllegalArgumentException("hashKey cannot be null");
        }
        if (StringUtility.isNullOrEmpty(signature)) {
            throw new IllegalArgumentException("signature cannot be null");
        }
        this.signatures.put(hashKey, signature);
    }

    public String removeSignature(String hashKey) {
        if (StringUtility.isNullOrEmpty(hashKey)) {
            throw new IllegalArgumentException("hashKey cannot be null");
        }
        String signature = this.signatures.get(hashKey);
        this.signatures.remove(hashKey);
        return signature;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CommContext(String applicationKey, Context context, ResultReceiver resultReceiver) {
        this._epochToException = new ConcurrentHashMap<>();
        this._pulledResponseLock = new Object();
        this._pulledResponse = null;
        this.nonces = new HashMap<>();
        this.signatures = new HashMap<>();
        this._reAuthLock = new Object();
        this._commFailureCallbackInterfaceList = new ConcurrentLinkedQueue<>();
        if (StringUtility.isNullOrEmpty(applicationKey)) {
            throw new IllegalArgumentException("'applicationKey' can not be NULL or empty");
        }
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be NULL");
        }
        this._developerResultReceiver = resultReceiver;
        this._applicationKey = applicationKey;
        this._commContextId = UUID.randomUUID().toString();
        Logger.v(Area.COMM.value(), "CommContext: creating DeviceMetadata instance");
        this._deviceMetadata = new DeviceMetadata(context);
        this._applicationContext = context.getApplicationContext();
        Logger.v(Area.COMM.value(), "CommContext: calling UserAgentValuesManager.getSdkUserAgent()");
        this._sdkUserAgent = UserAgentValuesManager.getInstance().getSdkUserAgent(context, applicationKey);
        updateLastUpdated();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public CommContext(String applicationKey, String appEncryptionPublicKey, Context context, ResultReceiver resultReceiver) {
        this(applicationKey, context, resultReceiver);
        if (StringUtility.isNullOrEmpty(appEncryptionPublicKey)) {
            throw new IllegalArgumentException("appEncryptionPublicKey cannot be null");
        }
        if (appEncryptionPublicKey.length() < 5) {
            throw new IllegalArgumentException("Invalid 'appEncryptionPublicKey'");
        }
        this._appEncryptionKeyIndex = appEncryptionPublicKey.substring(0, 4);
        try {
            this._appEncryptionPublicKey = Security.generatePublicKey(Base64.decode(appEncryptionPublicKey.substring(4)));
        } catch (IOException e) {
            throw new SigningException("Invalid appEncryptionPublicKey");
        }
    }

    public String getAppEncryptionKeyIndex() {
        return this._appEncryptionKeyIndex;
    }

    public PublicKey getAppEncryptionPublicKey() {
        return this._appEncryptionPublicKey;
    }

    public Object getReAuthLock() {
        return this._reAuthLock;
    }

    public DeviceMetadata getDeviceMetadata() {
        return this._deviceMetadata;
    }

    public Map<String, String> getDeviceMetadataValues() {
        return this._deviceMetadata.getMetadata();
    }

    protected long getLastUpdated() {
        return this._lastUpdated;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getApplicationKey() {
        return this._applicationKey;
    }

    public String getSdkUserAgent() {
        return this._sdkUserAgent;
    }

    public String getWebKitUserAgent() {
        if (StringUtility.isNullOrEmpty(this._webKitUserAgent)) {
            this._webKitUserAgent = UserAgentValuesManager.getInstance().getWebKitUserAgent(this._applicationContext);
        }
        return this._webKitUserAgent;
    }

    protected String getDeviceMetadataJson() {
        try {
            return this._deviceMetadata.toJsonString();
        } catch (JSONException e) {
            throw new CommunicationException(e);
        }
    }

    protected String getDeviceMetadataJsonWithReliabilities() {
        try {
            return this._deviceMetadata.toJsonStringWithReliabilities();
        } catch (JSONException e) {
            throw new CommunicationException(e);
        }
    }

    public String getCommContextId() {
        return this._commContextId;
    }

    public Context getApplicationContext() {
        return this._applicationContext;
    }

    public Map<Long, Throwable> getExceptions() {
        return Collections.unmodifiableMap(this._epochToException);
    }

    public Response getResponse() {
        return this._pulledResponse;
    }

    public void setInternalResultReceiver(ResultReceiver internalResultReceiver) {
        this._internalResultReceiver = internalResultReceiver;
    }

    private void setResponse(Response response) {
        if (response == null) {
            throw new IllegalArgumentException("'response' can not be NULL");
        }
        synchronized (this._pulledResponseLock) {
            if (this._pulledResponse == null) {
                this._pulledResponse = response;
                Logger.v(Area.COMM.value(), String.format(Locale.US, "Current response updated to %1$s", this._pulledResponse.getClass().getName()));
            } else {
                int currentResponseRank = _ResponseOrderOfPrecedence.get(this._pulledResponse.getClass()).intValue();
                int newResponseRank = _ResponseOrderOfPrecedence.get(response.getClass()).intValue();
                Logger.v(Area.COMM.value(), String.format(Locale.US, "setResponse() called [currentResponse:%1$d:%2$s] [newResponse:%3$d:%4$s]", Integer.valueOf(currentResponseRank), this._pulledResponse.getClass().getName(), Integer.valueOf(newResponseRank), response.getClass().getName()));
                if (newResponseRank < currentResponseRank) {
                    this._pulledResponse = response;
                    Logger.v(Area.COMM.value(), String.format(Locale.US, "Current response updated to %1$s", this._pulledResponse.getClass().getName()));
                }
            }
        }
    }

    public void registerFailureCallback(CommFailureCallbackInterface callbackInterface) {
        if (!this._commFailureCallbackInterfaceList.contains(callbackInterface)) {
            this._commFailureCallbackInterfaceList.add(callbackInterface);
        }
    }

    public void makeServiceFailureCallbacks(Result result) {
        Logger.d(Area.COMM.value(), String.format(Locale.US, "makeServiceFailureCallbacks() with %1$d call-back interfaces registered [from %2$s]", Integer.valueOf(this._commFailureCallbackInterfaceList.size()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        Iterator i$ = this._commFailureCallbackInterfaceList.iterator();
        while (i$.hasNext()) {
            CommFailureCallbackInterface callback = i$.next();
            try {
                callback.serviceFailure(result);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void makeNetworkFailureCallbacks() {
        Logger.d(Area.COMM.value(), String.format(Locale.US, "makeNetworkFailureCallbacks() with %1$d call-back interfaces registered [from %2$s]", Integer.valueOf(this._commFailureCallbackInterfaceList.size()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        Iterator i$ = this._commFailureCallbackInterfaceList.iterator();
        while (i$.hasNext()) {
            CommFailureCallbackInterface callback = i$.next();
            try {
                callback.networkFailure();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public void makeAuthorizationFailureCallbacks(String subcode) {
        Logger.d(Area.AUTH.value(), String.format(Locale.US, "makeAuthorizationFailureCallbacks() with %1$d call-back interfaces registered [from %2$s]", Integer.valueOf(this._commFailureCallbackInterfaceList.size()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        Iterator i$ = this._commFailureCallbackInterfaceList.iterator();
        while (i$.hasNext()) {
            CommFailureCallbackInterface callback = i$.next();
            try {
                callback.authorizationFailure(subcode);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void clearExceptions() {
        this._epochToException.clear();
    }

    public void clearResponse() {
        synchronized (this._pulledResponseLock) {
            this._pulledResponse = null;
        }
        Logger.v(Area.COMM.value(), "Current response cleared");
    }

    public void postResponse(Response response) {
        setResponse(response);
        if (this._developerResultReceiver != null || this._internalResultReceiver != null) {
            Bundle serializedResponse = new Bundle();
            serializedResponse.putParcelable("response", response);
            if (this._developerResultReceiver != null) {
                this._developerResultReceiver.send(0, serializedResponse);
            }
            if (this._internalResultReceiver != null) {
                this._internalResultReceiver.send(0, serializedResponse);
            }
        }
    }

    public Throwable getMostRecentException() {
        if (getExceptions().size() > 0) {
            List<Long> sortedKeys = asSortedList(getExceptions().keySet());
            return getExceptions().get(sortedKeys.get(0));
        }
        return null;
    }

    private static <T extends Comparable<? super T>> List<T> asSortedList(Collection<T> c) {
        List<T> list = new ArrayList<>(c);
        Collections.sort(list);
        return list;
    }

    public void addException(Throwable exc) {
        this._epochToException.put(Long.valueOf(System.currentTimeMillis()), exc);
    }

    protected void updateLastUpdated() {
        this._lastUpdated = System.currentTimeMillis();
    }
}
