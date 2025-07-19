package com.getjar.sdk.comm;

import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
/* loaded from: classes.dex */
public class VoucherServiceProxy extends ServiceProxyBase {
    private static volatile VoucherServiceProxy _Instance = null;
    private static final String _CONTRACT_VERSION = "20130625";
    private static final String _URL_TEMPLATE_GET_VOUCHER = String.format(Locale.US, "%1$s%2$s", "%1$svoucher/vouchers/%2$s?version=", _CONTRACT_VERSION);
    private static final String _URL_TEMPLATE_REDEEM_VOUCHER = String.format(Locale.US, "%1$s%2$s", "%1$svoucher/vouchers/%2$s/redeem?version=", _CONTRACT_VERSION);

    private VoucherServiceProxy() {
    }

    private static synchronized void makeTheInstance() {
        synchronized (VoucherServiceProxy.class) {
            if (_Instance == null) {
                _Instance = new VoucherServiceProxy();
            }
        }
    }

    public static VoucherServiceProxy getInstance() {
        if (_Instance == null) {
            makeTheInstance();
        }
        return _Instance;
    }

    @Override // com.getjar.sdk.comm.ServiceProxyBase
    protected Request.ServiceName getServiceName() {
        return Request.ServiceName.VOUCHER;
    }

    public Operation getVoucher(CommContext commContext, String voucherToken, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("The required parameter 'voucherToken' was not provided");
        }
        AuthManager.initialize(commContext.getApplicationContext());
        AuthManager.getInstance().waitOnAuth();
        String url = String.format(Locale.US, _URL_TEMPLATE_GET_VOUCHER, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_VOUCHER_SERVICE_ENDPOINT), URLEncoder.encode(voucherToken, "UTF-8"));
        return makeAsyncGETRequestForJson("getVoucher", Operation.Priority.MEDIUM, commContext, url, null, null, suppressInternalCallbacks, true, true);
    }

    public Operation redeemVoucher(CommContext commContext, String voucherToken, String developerPayload, String clientTransactionId, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        }
        if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("The required parameter 'voucherToken' was not provided");
        }
        if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        }
        HashMap<String, String> postData = new HashMap<>(2);
        postData.put("client_transaction_token", clientTransactionId);
        postData.put("developer_payload", developerPayload);
        AuthManager.initialize(commContext.getApplicationContext());
        AuthManager.getInstance().waitOnAuth();
        String url = String.format(Locale.US, _URL_TEMPLATE_REDEEM_VOUCHER, GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_VOUCHER_SERVICE_ENDPOINT), URLEncoder.encode(voucherToken, "UTF-8"));
        return makeAsyncPOSTRequestForJson("redeemVoucher", Operation.Priority.HIGH, commContext, url, postData, null, null, suppressInternalCallbacks, true, true);
    }
}
