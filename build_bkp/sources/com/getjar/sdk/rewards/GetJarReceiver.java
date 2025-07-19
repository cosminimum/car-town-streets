package com.getjar.sdk.rewards;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;

public class GetJarReceiver extends BroadcastReceiver {
    public void onReceive(Context context, Intent intent) {
        try {
            String action = intent.getAction();
            Logger.m640d(Area.TRANSACTION.value() | Area.OS_ENTRY_POINT.value(), "GooglePlayBillingReceiver onReceive -- action " + action);
            if ("com.android.vending.billing.PURCHASE_STATE_CHANGED".equals(action)) {
                purchaseStateChanged(context, intent.getStringExtra("inapp_signed_data"), intent.getStringExtra("inapp_signature"));
            } else if ("com.android.vending.billing.IN_APP_NOTIFY".equals(action)) {
                notify(context, intent.getStringExtra("notification_id"));
            } else if ("com.android.vending.billing.RESPONSE_CODE".equals(action)) {
                checkResponseCode(context, intent.getLongExtra("request_id", -1), intent.getIntExtra("response_code", Constants.ResponseCode.RESULT_ERROR.ordinal()));
            } else {
                Logger.m648w(Area.TRANSACTION.value() | Area.OS_ENTRY_POINT.value(), "unexpected action: " + action);
            }
        } catch (Exception e) {
            Logger.m643e(Area.TRANSACTION.value() | Area.OS_ENTRY_POINT.value(), "GetJarReceiver: onReceive() failed", e);
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
