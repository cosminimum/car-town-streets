package com.getjar.sdk.comm;

import com.getjar.sdk.comm.Operation;
import com.getjar.sdk.comm.Request;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.utilities.StringUtility;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

public class VoucherServiceProxy extends ServiceProxyBase {
    private static final String _CONTRACT_VERSION = "20130625";
    private static volatile VoucherServiceProxy _Instance = null;
    private static final String _URL_TEMPLATE_GET_VOUCHER = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$svoucher/vouchers/%2$s?version=", _CONTRACT_VERSION});
    private static final String _URL_TEMPLATE_REDEEM_VOUCHER = String.format(Locale.US, "%1$s%2$s", new Object[]{"%1$svoucher/vouchers/%2$s/redeem?version=", _CONTRACT_VERSION});

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

    /* access modifiers changed from: protected */
    public Request.ServiceName getServiceName() {
        return Request.ServiceName.VOUCHER;
    }

    public Operation getVoucher(CommContext commContext, String voucherToken, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("The required parameter 'voucherToken' was not provided");
        } else {
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncGETRequestForJson("getVoucher", Operation.Priority.MEDIUM, commContext, String.format(Locale.US, _URL_TEMPLATE_GET_VOUCHER, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_VOUCHER_SERVICE_ENDPOINT), URLEncoder.encode(voucherToken, "UTF-8")}), (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, true, true);
        }
    }

    public Operation redeemVoucher(CommContext commContext, String voucherToken, String developerPayload, String clientTransactionId, boolean suppressInternalCallbacks) throws Exception {
        if (commContext == null) {
            throw new IllegalArgumentException("The required parameter 'commContext' was not provided");
        } else if (StringUtility.isNullOrEmpty(voucherToken)) {
            throw new IllegalArgumentException("The required parameter 'voucherToken' was not provided");
        } else if (StringUtility.isNullOrEmpty(clientTransactionId)) {
            throw new IllegalArgumentException("The required parameter 'client_transaction_id' was not provided");
        } else {
            HashMap<String, String> postData = new HashMap<>(2);
            postData.put("client_transaction_token", clientTransactionId);
            postData.put("developer_payload", developerPayload);
            AuthManager.initialize(commContext.getApplicationContext());
            AuthManager.getInstance().waitOnAuth();
            return makeAsyncPOSTRequestForJson("redeemVoucher", Operation.Priority.HIGH, commContext, String.format(Locale.US, _URL_TEMPLATE_REDEEM_VOUCHER, new Object[]{GetJarConfig.getInstance(commContext, true).getDirectiveValue(GetJarConfig.KEY_VOUCHER_SERVICE_ENDPOINT), URLEncoder.encode(voucherToken, "UTF-8")}), postData, (Map<String, String>) null, (CallbackInterface) null, suppressInternalCallbacks, true, true);
        }
    }
}
