package com.getjar.sdk.rewards;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
/* loaded from: classes.dex */
public class GetJarReceiver extends BroadcastReceiver {
    @Override // android.content.BroadcastReceiver
    public void onReceive(Context context, Intent intent) {
        try {
            String action = intent.getAction();
            Logger.d(Area.TRANSACTION.value() | Area.OS_ENTRY_POINT.value(), "GooglePlayBillingReceiver onReceive -- action " + action);
            if ("com.android.vending.billing.PURCHASE_STATE_CHANGED".equals(action)) {
                String signedData = intent.getStringExtra("inapp_signed_data");
                String signature = intent.getStringExtra("inapp_signature");
                purchaseStateChanged(context, signedData, signature);
            } else if ("com.android.vending.billing.IN_APP_NOTIFY".equals(action)) {
                String notifyId = intent.getStringExtra("notification_id");
                notify(context, notifyId);
            } else if ("com.android.vending.billing.RESPONSE_CODE".equals(action)) {
                long requestId = intent.getLongExtra("request_id", -1L);
                int responseCodeIndex = intent.getIntExtra("response_code", Constants.ResponseCode.RESULT_ERROR.ordinal());
                checkResponseCode(context, requestId, responseCodeIndex);
            } else {
                Logger.w(Area.TRANSACTION.value() | Area.OS_ENTRY_POINT.value(), "unexpected action: " + action);
            }
        } catch (Exception e) {
            Logger.e(Area.TRANSACTION.value() | Area.OS_ENTRY_POINT.value(), "GetJarReceiver: onReceive() failed", e);
        }
    }

    private void purchaseStateChanged(Context context, String signedData, String signature) {
        Intent intent = new Intent("com.android.vending.billing.PURCHASE_STATE_CHANGED");
        intent.setClass(context, GetJarService.class);
        intent.putExtra("inapp_signed_data", signedData);
        intent.putExtra("inapp_signature", signature);
        context.startService(intent);
    }

    private void notify(Context context, String notifyId) {
        Intent intent = new Intent(Constants.ACTION_GET_PURCHASE_INFORMATION);
        intent.setClass(context, GetJarService.class);
        intent.putExtra("notification_id", notifyId);
        context.startService(intent);
    }

    private void checkResponseCode(Context context, long requestId, int responseCodeIndex) {
        Intent intent = new Intent("com.android.vending.billing.RESPONSE_CODE");
        intent.setClass(context, GetJarService.class);
        intent.putExtra("request_id", requestId);
        intent.putExtra("response_code", responseCodeIndex);
        context.startService(intent);
    }
}
