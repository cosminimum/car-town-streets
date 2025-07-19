package com.getjar.sdk.comm;

import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.License;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.LicenseInternal;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.utilities.Security;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.PublicKey;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;
import org.json.JSONException;

public class LicenseServiceProxy extends ServiceProxyBase {
    private static final String _CONTRACT_VERSION = "20120831";
    private static volatile LicenseServiceProxy _Instance = null;
    private static final String _URL_TEMPLATE_ACQUIRE_LICENSE = String.format(Locale.US, "%1$s%2$s%3$s", new Object[]{"%1$slicense/licenses/acquire?version=", _CONTRACT_VERSION, "&signature=%2$s"});
    private static final String _URL_TEMPLATE_GET_LICENSES = String.format(Locale.US, "%1$s%2$s%3$s", new Object[]{"%1$slicense/licenses?version=", _CONTRACT_VERSION, "&user_lookup_id=%2$s&user_device_id=%3$s&scope=%4$s&state=%5$s&ct=%6$s&l=%7$s&nonce=%8$s&type=%9$s&signature=%10$s"});

    private LicenseServiceProxy() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (LicenseServiceProxy.class) {
            if (_Instance == null) {
                _Instance = new LicenseServiceProxy();
            }
        }
    }

    public static LicenseServiceProxy getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    /* access modifiers changed from: protected */
    public Request.ServiceName getServiceName() {
        return Request.ServiceName.LICENSE;
    }

    public Operation acquireUnmanagedProductLicense(CommContext commContext, String itemId, License.LicenseScope licenseScope, HashMap<String, String> trackingMetadata) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be empty or null");
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        } else if (trackingMetadata == null) {
            throw new IllegalArgumentException("trackingMetadata cannot be null");
        } else {
            String nonce = generateNonce();
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            HashMap<String, String> postData = new HashMap<>(6);
            postData.put("item_id", itemId);
            postData.put("scope", licenseScope.toString());
            postData.put("user_lookup_id", AuthManager.getInstance().getUserAccessId());
            postData.put("user_device_id", AuthManager.getInstance().getUserDeviceId());
            try {
                postData.put("tracking_metadata", Utility.mapToJsonString(trackingMetadata));
                postData.put(ServerProtocol.DIALOG_PARAM_TYPE, LicenseInternal.LicenseType.UNMANAGED.name());
                postData.put("nonce", nonce);
                String signature = generateSignatureForAcquire(AuthManager.getInstance().getUserDeviceId(), itemId, licenseScope, nonce, AuthManager.getInstance().getAuthToken(), commContext.getAppEncryptionKeyIndex(), commContext.getAppEncryptionPublicKey());
                String signatureKey = itemId + licenseScope.name();
                commContext.putSignature(signatureKey, signature.substring(4));
                commContext.putNonce(signatureKey, nonce);
                try {
                    return makeAsyncPOSTRequestForJson("acquireUnmanagedProductLicense", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_ACQUIRE_LICENSE, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_LICENSE_SERVICE_ENDPOINT), URLEncoder.encode(signature, "UTF-8")}), postData, (Map<String, String>) null, (CallbackInterface) null, true, true, true);
                } catch (UnsupportedEncodingException e) {
                    throw new CommunicationException((Throwable) e);
                }
            } catch (JSONException e2) {
                throw new CommunicationException((Throwable) e2);
            }
        }
    }

    public Operation getUnmanagedProductLicenses(CommContext commContext, License.LicenseScope licenseScope, LicenseInternal.ExternalLicenseState licenseState, String continuationToken, int limit, String eTag) {
        String str;
        String str2;
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(continuationToken)) {
            continuationToken = "";
        }
        if (limit < 1) {
            throw new IllegalArgumentException("limit must be greater than 0");
        }
        AuthManager.initialize(commContext.getApplicationContext());
        AuthManager.getInstance().waitOnAuth();
        String nonce = generateNonce();
        String signature = generateSignatureForGet(AuthManager.getInstance().getUserDeviceId(), nonce, AuthManager.getInstance().getAuthToken(), commContext.getAppEncryptionKeyIndex(), commContext.getAppEncryptionPublicKey());
        commContext.putSignature(nonce, signature.substring(4));
        try {
            Locale locale = Locale.US;
            String str3 = _URL_TEMPLATE_GET_LICENSES;
            Object[] objArr = new Object[10];
            objArr[0] = GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_LICENSE_SERVICE_ENDPOINT);
            objArr[1] = URLEncoder.encode(AuthManager.getInstance().getUserAccessId(), "UTF-8");
            objArr[2] = URLEncoder.encode(AuthManager.getInstance().getUserDeviceId(), "UTF-8");
            if (licenseScope != null) {
                str = licenseScope.toString();
            } else {
                str = "";
            }
            objArr[3] = URLEncoder.encode(str, "UTF-8");
            if (licenseState != null) {
                str2 = licenseState.toString();
            } else {
                str2 = "";
            }
            objArr[4] = URLEncoder.encode(str2, "UTF-8");
            objArr[5] = URLEncoder.encode(continuationToken, "UTF-8");
            objArr[6] = URLEncoder.encode(String.valueOf(limit), "UTF-8");
            objArr[7] = URLEncoder.encode(nonce, "UTF-8");
            objArr[8] = URLEncoder.encode(LicenseInternal.LicenseType.UNMANAGED.name(), "UTF-8");
            objArr[9] = URLEncoder.encode(signature, "UTF-8");
            String url = String.format(locale, str3, objArr);
            Map<String, String> requestHeaders = null;
            if (eTag != null) {
                requestHeaders = new HashMap<>();
                requestHeaders.put("If-None-Match", eTag);
            }
            return makeAsyncGETRequestForJson("getUnmanagedProductLicenses", Operation.Priority.HIGH, commContext, url, requestHeaders, (CallbackInterface) null, true, true, true);
        } catch (UnsupportedEncodingException e) {
            throw new CommunicationException((Throwable) e);
        }
    }

    public static String generateNonce() {
        return UUID.randomUUID().toString();
    }

    public static String generateSignDataForAcquire(String userDeviceId, String itemId, License.LicenseScope licenseScope, String nonce, String authHeader) {
        if (StringUtility.isNullOrEmpty(userDeviceId)) {
            throw new IllegalArgumentException("userDeviceId cannot be null");
        } else if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be null");
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        } else if (StringUtility.isNullOrEmpty(nonce)) {
            throw new IllegalArgumentException("nonce cannot be null");
        } else if (StringUtility.isNullOrEmpty(authHeader)) {
            throw new IllegalArgumentException("authHeader cannot be null");
        } else {
            return String.format(Locale.US, "%s%s%s%s%s", new Object[]{userDeviceId, itemId, licenseScope.name(), nonce, authHeader});
        }
    }

    public static String generateSignDataForGet(String userDeviceId, String nonce, String authHeader) {
        if (StringUtility.isNullOrEmpty(userDeviceId)) {
            throw new IllegalArgumentException("userDeviceId cannot be null");
        } else if (StringUtility.isNullOrEmpty(nonce)) {
            throw new IllegalArgumentException("nonce cannot be null");
        } else if (StringUtility.isNullOrEmpty(authHeader)) {
            throw new IllegalArgumentException("authHeader cannot be null");
        } else {
            return String.format(Locale.US, "%s%s%s", new Object[]{userDeviceId, nonce, authHeader});
        }
    }

    public static String generateSignatureForAcquire(String userDeviceId, String itemId, License.LicenseScope licenseScope, String nonce, String authHeader, String keyIndex, PublicKey publicKey) {
        if (StringUtility.isNullOrEmpty(userDeviceId)) {
            throw new IllegalArgumentException("userDeviceId cannot be null");
        } else if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("itemId cannot be null");
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("licenseScope cannot be null");
        } else if (StringUtility.isNullOrEmpty(nonce)) {
            throw new IllegalArgumentException("nonce cannot be null");
        } else if (StringUtility.isNullOrEmpty(authHeader)) {
            throw new IllegalArgumentException("authHeader cannot be null");
        } else if (StringUtility.isNullOrEmpty(keyIndex)) {
            throw new IllegalArgumentException("keyIndex cannot be null");
        } else if (publicKey != null) {
            return generateSignature(keyIndex, publicKey, generateSignDataForAcquire(userDeviceId, itemId, licenseScope, nonce, authHeader));
        } else {
            throw new IllegalArgumentException("publicKey cannot be null");
        }
    }

    public static String generateSignatureForGet(String userDeviceId, String nonce, String authHeader, String keyIndex, PublicKey publicKey) {
        if (StringUtility.isNullOrEmpty(userDeviceId)) {
            throw new IllegalArgumentException("userDeviceId cannot be null");
        } else if (StringUtility.isNullOrEmpty(nonce)) {
            throw new IllegalArgumentException("nonce cannot be null");
        } else if (StringUtility.isNullOrEmpty(authHeader)) {
            throw new IllegalArgumentException("authHeader cannot be null");
        } else if (StringUtility.isNullOrEmpty(keyIndex)) {
            throw new IllegalArgumentException("keyIndex cannot be null");
        } else if (publicKey != null) {
            return generateSignature(keyIndex, publicKey, generateSignDataForGet(userDeviceId, nonce, authHeader));
        } else {
            throw new IllegalArgumentException("publicKey cannot be null");
        }
    }

    public static String generateSignature(String keyIndex, PublicKey publicKey, String data) {
        if (StringUtility.isNullOrEmpty(keyIndex)) {
            throw new IllegalArgumentException("keyIndex cannot be null");
        } else if (publicKey == null) {
            throw new IllegalArgumentException("publicKey cannot be null");
        } else if (StringUtility.isNullOrEmpty(data)) {
            throw new IllegalArgumentException("data cannot be null");
        } else {
            return String.format(Locale.US, "%s%s", new Object[]{keyIndex, Security.generateSignature(publicKey, data)});
        }
    }
}
