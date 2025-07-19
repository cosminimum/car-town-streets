package com.getjar.sdk;

import android.content.Context;
import android.content.Intent;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.data.RedemptionEngine;
import com.getjar.sdk.listener.GetJarListener;
import com.getjar.sdk.listener.VoucherRedemptionListener;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class GetJarManager {
    public static final String GetjarIntentKey = "getjar";

    private GetJarManager() {
    }

    public static GetJarContext createContext(String applicationToken, Context context, ResultReceiver resultReceiver) throws InterruptedException {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
        } else if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else {
            CommManager.validateManifestFile(context, true);
            return new GetJarContext(CommManager.createContext(applicationToken, context, resultReceiver, CommManager.LaunchWork.ALL));
        }
    }

    @Deprecated
    public static GetJarContext createContext(String applicationToken, String encryptionKey, Context context, ResultReceiver resultReceiver) throws InterruptedException {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(encryptionKey)) {
            throw new IllegalArgumentException("'encryptionKey' cannot be null");
        } else if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else {
            CommManager.validateManifestFile(context, true);
            return new GetJarContext(CommManager.createContext(applicationToken, encryptionKey, context, resultReceiver, CommManager.LaunchWork.ALL));
        }
    }

    public static void handleIntent(String applicationToken, Context context, Intent getjarIntent, String developerPayload, GetJarListener... callbacks) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
        } else if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        } else if (getjarIntent == null) {
            throw new IllegalArgumentException("'getjarIntent' cannot be NULL");
        } else if (callbacks == null || callbacks.length <= 0) {
            throw new IllegalArgumentException("'callbacks' cannot be NULL or empty");
        } else {
            CommManager.validateManifestFile(context, false);
            if (getjarIntent.getBooleanExtra(GetjarIntentKey, false) && RedemptionEngine.IntentTypeDealRedemption.equals(getjarIntent.getStringExtra(RedemptionEngine.IntentTypeKey))) {
                Logger.m640d(Area.DEVELOPER_API.value() | Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "handleIntent() handling an Intent of type '%1$s'", new Object[]{RedemptionEngine.IntentTypeDealRedemption}));
                List<VoucherRedemptionListener> voucherRedemptionListeners = new ArrayList<>();
                for (GetJarListener listener : callbacks) {
                    if (VoucherRedemptionListener.class.isAssignableFrom(listener.getClass())) {
                        voucherRedemptionListeners.add((VoucherRedemptionListener) listener);
                    }
                }
                if (voucherRedemptionListeners.size() > 0) {
                    if (voucherRedemptionListeners.size() > 1) {
                        Logger.m648w(Area.DEVELOPER_API.value() | Area.REDEEM.value() | Area.OFFER.value(), String.format("%1$d VoucherRedemptionListener instances where passed to handleIntent(), was this intentional?", new Object[]{Integer.valueOf(voucherRedemptionListeners.size())}));
                    }
                    new RedemptionEngine(applicationToken, context).redeemVoucherFromIntent(developerPayload, getjarIntent, voucherRedemptionListeners);
                }
            }
        }
    }

    public static GetJarContext retrieveContext(String contextId) {
        return new GetJarContext(CommManager.retrieveContext(contextId));
    }
}
