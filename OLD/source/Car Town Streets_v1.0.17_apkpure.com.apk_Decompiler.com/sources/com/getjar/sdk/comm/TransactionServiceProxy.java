package com.getjar.sdk.comm;

import com.getjar.sdk.License;
import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.data.LicenseInternal;
import com.getjar.sdk.exceptions.CommunicationException;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import org.json.JSONException;

public class TransactionServiceProxy extends ServiceProxyBase {
    private static final String _CONTRACT_VERSION = "20130625";
    private static volatile TransactionServiceProxy _Instance = null;
    private static final String _URL_TEMPLATE_BUY_CURRENCY = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/buy_currency?version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_CANCEL_TRANSACTION = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/cancel?client_transaction_token=%2$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_CONFIRM_AND_LICENSE = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/confirm_and_acquire_license?signature=%2$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_CONFIRM_MANAGED_OFFER = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/confirm?version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_CONFIRM_UNMANAGED_OFFER = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/confirm?client_transaction_token=%2$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_EARN = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/earn?item_id=%2$s&client_transaction_token=%3$s&version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_RESERVE_MANAGED_OFFER = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/reserve?version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_RESERVE_UNMANAGED_OFFER = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$stransaction/transactions/reserve?developer_product_id=%2$s&developer_product_name=%3$s&developer_product_description=%4$s&amount=%5$s&client_transaction_token=%6$s&version=", _CONTRACT_VERSION});

    private TransactionServiceProxy() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (TransactionServiceProxy.class) {
            if (_Instance == null) {
                _Instance = new TransactionServiceProxy();
            }
        }
    }

    public static TransactionServiceProxy getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    /* access modifiers changed from: protected */
    public Request.ServiceName getServiceName() {
        return Request.ServiceName.TRANSACTION;
    }

    public Operation reserveManagedOffer(CommContext commContext, String offerId, String clientTransactionId, HashMap<String, String> purchaseMetadata, HashMap<String, String> trackingMetadata, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(offerId)) {
            throw new IllegalArgumentException("The required parameter 'offerId' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        } else if (purchaseMetadata == null || purchaseMetadata.size() <= 0) {
            throw new IllegalArgumentException("The required parameter 'purchaseMetadata' cannot be NULL or empty");
        } else if (trackingMetadata == null || trackingMetadata.size() <= 0) {
            throw new IllegalArgumentException("The required parameter 'trackingMetadata' cannot be NULL or empty");
        } else {
            HashMap<String, String> postData = new HashMap<>(4);
            postData.put("offer_id", offerId);
            postData.put("client_transaction_token", clientTransactionId);
            postData.put("purchase_metadata", Utility.mapToJsonString(purchaseMetadata));
            postData.put("tracking_metadata", Utility.mapToJsonString(trackingMetadata));
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("reserveManagedOffer", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_RESERVE_MANAGED_OFFER, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT)}), postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, true, true);
        }
    }

    public Operation confirmManagedOffer(CommContext commContext, String clientTransactionId, HashMap<String, String> purchaseMetadata, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'clientTransactionId' was not provided");
        } else if (purchaseMetadata == null || purchaseMetadata.size() <= 0) {
            throw new IllegalArgumentException("The required parameter 'purchaseMetadata' cannot be NULL or empty");
        } else {
            HashMap<String, String> postData = new HashMap<>(4);
            postData.put("client_transaction_token", clientTransactionId);
            postData.put("purchase_metadata", Utility.mapToJsonString(purchaseMetadata));
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("confirmManagedOffer", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_CONFIRM_MANAGED_OFFER, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT)}), postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, true, true);
        }
    }

    /* access modifiers changed from: protected */
    public Operation reserveUnmanagedPurchase(CommContext commContext, String productId, String productName, String productDescription, Integer amount, String developerPayload, String clientTransactionId, HashMap<String, String> trackingMetadata, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(productId)) {
            throw new IllegalArgumentException("The required parameter 'productId' was not provided");
        } else if (StringUtility.isNullOrEmpty(productName)) {
            throw new IllegalArgumentException("The required parameter 'productName' was not provided");
        } else if (StringUtility.isNullOrEmpty(productDescription)) {
            throw new IllegalArgumentException("The required parameter 'productDescription' was not provided");
        } else if (amount == null) {
            throw new IllegalArgumentException("The required parameter 'amount' was not provided");
        } else if (amount.intValue() < 0) {
            throw new IllegalArgumentException("The parameter 'amount' can not have a negative value");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        } else if (trackingMetadata == null) {
            throw new IllegalArgumentException("The required parameter 'trackingData' was not provided");
        } else if (trackingMetadata.size() <= 0) {
            throw new IllegalArgumentException("The required parameter 'trackingData' contains no data");
        } else {
            HashMap<String, String> postData = new HashMap<>(1);
            postData.put("tracking_metadata", Utility.mapToJsonString(trackingMetadata));
            postData.put("developer_payload", developerPayload);
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("reserveUnmanagedPurchase", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_RESERVE_UNMANAGED_OFFER, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT), URLEncoder.encode(productId, "UTF-8"), URLEncoder.encode(productName, "UTF-8"), URLEncoder.encode(productDescription, "UTF-8"), Integer.toString(amount.intValue()), URLEncoder.encode(clientTransactionId, "UTF-8")}), postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, false, true);
        }
    }

    /* access modifiers changed from: protected */
    public Operation confirmUnmanagedPurchase(CommContext commContext, String clientTransactionId, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        } else {
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("confirmUnmanagedPurchase", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_CONFIRM_UNMANAGED_OFFER, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT), URLEncoder.encode(clientTransactionId, "UTF-8")}), (Map<String, String>) null, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, false, true);
        }
    }

    /* access modifiers changed from: protected */
    public Operation confirmAndLicense(CommContext commContext, String clientTransactionId, String itemId, License.LicenseScope licenseScope, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'clientTransactionId' was not provided");
        } else if (licenseScope == null) {
            throw new IllegalArgumentException("The required parameter 'licenseScope' was not provided");
        } else if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("'itemId' cannot be null");
        } else {
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            String authToken = AuthManager.getInstance().getAuthToken();
            String nonce = LicenseServiceProxy.generateNonce();
            String signature = LicenseServiceProxy.generateSignatureForAcquire(AuthManager.getInstance().getUserDeviceId(), itemId, licenseScope, nonce, authToken, commContext.getAppEncryptionKeyIndex(), commContext.getAppEncryptionPublicKey());
            String signatureKey = itemId + licenseScope.name();
            commContext.putSignature(signatureKey, signature.substring(4));
            commContext.putNonce(signatureKey, nonce);
            String url = String.format(Locale.US, _URL_TEMPLATE_CONFIRM_AND_LICENSE, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT), URLEncoder.encode(signature, "UTF-8")});
            HashMap<String, String> postData = new HashMap<>(4);
            postData.put("license_scope", licenseScope.name());
            postData.put("license_type", LicenseInternal.LicenseType.UNMANAGED.name());
            postData.put("nonce", nonce);
            postData.put("client_transaction_token", clientTransactionId);
            return makeAsyncPOSTRequestForJson("confirmAndLicense", Operation.Priority.HIGH, commContext, url, postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, true, true);
        }
    }

    public Operation buyCurrency(CommContext commContext, String clientTransactionId, String productId, HashMap<String, String> itemMetadata, HashMap<String, String> trackingMetadata, boolean suppressInternalCallbacks) {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'clientTransactionId' was not provided");
        } else if (StringUtility.isNullOrEmpty(productId)) {
            throw new IllegalArgumentException("The required parameter 'itemId' was not provided");
        } else if (itemMetadata == null) {
            throw new IllegalArgumentException("The required parameter 'itemMetadata' was not provided");
        } else if (trackingMetadata == null) {
            throw new IllegalArgumentException("The required parameter 'trackingMetadata' was not provided");
        } else {
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            String url = String.format(Locale.US, _URL_TEMPLATE_BUY_CURRENCY, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT)});
            HashMap<String, String> postData = new HashMap<>(5);
            postData.put(Constants.MARKETPLACE, "marketplace.google_play");
            postData.put(Constants.BUY_CURRENCY_MARKETPLACE_ITEM_ID, productId);
            try {
                postData.put("item_metadata", Utility.mapToJsonString(itemMetadata));
                try {
                    postData.put("tracking_metadata", Utility.mapToJsonString(trackingMetadata));
                    postData.put("client_transaction_token", clientTransactionId);
                    return makeAsyncPOSTRequestForJson("buyCurrency", Operation.Priority.HIGH, commContext, url, postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, true, true);
                } catch (JSONException e) {
                    throw new CommunicationException("Invalid tracking_metadata");
                }
            } catch (JSONException e2) {
                throw new CommunicationException("Invalid item_metadata");
            }
        }
    }

    /* access modifiers changed from: protected */
    public Operation cancelTransaction(CommContext commContext, String clientTransactionId, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        } else {
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("cancelTransaction", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_CANCEL_TRANSACTION, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT), URLEncoder.encode(clientTransactionId, "UTF-8")}), (Map<String, String>) null, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, false, true);
        }
    }

    /* access modifiers changed from: protected */
    public Operation earn(CommContext commContext, String itemId, String packageName, String clientTransactionId, HashMap<String, String> itemMetadata, HashMap<String, String> trackingMetadata, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(itemId)) {
            throw new IllegalArgumentException("The required parameter 'item_id' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        } else if (itemMetadata == null) {
            throw new IllegalArgumentException("The required parameter 'item_metadata' was not provided");
        } else if (trackingMetadata == null) {
            throw new IllegalArgumentException("The required parameter 'tracking_metadata' was not provided");
        } else if (trackingMetadata.size() <= 0) {
            throw new IllegalArgumentException("The required parameter 'tracking_metadata' contains no data");
        } else {
            HashMap<String, String> postData = new HashMap<>(2);
            postData.put("item_metadata", Utility.mapToJsonString(itemMetadata));
            postData.put("tracking_metadata", Utility.mapToJsonString(trackingMetadata));
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("earn", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_EARN, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_TRANSACTION_SERVICE_ENDPOINT), URLEncoder.encode(itemId, "UTF-8"), URLEncoder.encode(clientTransactionId, "UTF-8")}), postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, false, true);
        }
    }
}
