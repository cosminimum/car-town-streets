package com.getjar.sdk;

import android.content.Context;
import android.content.Intent;
import android.os.ResultReceiver;
import com.getjar.sdk.comm.CommContext;
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
/* loaded from: classes.dex */
public class GetJarManager {
    public static final String GetjarIntentKey = "getjar";

    private GetJarManager() {
    }

    public static GetJarContext createContext(String applicationToken, Context context, ResultReceiver resultReceiver) throws InterruptedException {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
        }
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        CommManager.validateManifestFile(context, true);
        CommContext commContext = CommManager.createContext(applicationToken, context, resultReceiver, CommManager.LaunchWork.ALL);
        return new GetJarContext(commContext);
    }

    @Deprecated
    public static GetJarContext createContext(String applicationToken, String encryptionKey, Context context, ResultReceiver resultReceiver) throws InterruptedException {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
        }
        if (StringUtility.isNullOrEmpty(encryptionKey)) {
            throw new IllegalArgumentException("'encryptionKey' cannot be null");
        }
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        CommManager.validateManifestFile(context, true);
        CommContext commContext = CommManager.createContext(applicationToken, encryptionKey, context, resultReceiver, CommManager.LaunchWork.ALL);
        return new GetJarContext(commContext);
    }

    public static void handleIntent(String applicationToken, Context context, Intent getjarIntent, String developerPayload, GetJarListener... callbacks) {
        if (StringUtility.isNullOrEmpty(applicationToken)) {
            throw new IllegalArgumentException("'applicationToken' cannot be NULL or empty");
        }
        if (context == null) {
            throw new IllegalArgumentException("'context' cannot be NULL");
        }
        if (getjarIntent == null) {
            throw new IllegalArgumentException("'getjarIntent' cannot be NULL");
        }
        if (callbacks == null || callbacks.length <= 0) {
            throw new IllegalArgumentException("'callbacks' cannot be NULL or empty");
        }
        CommManager.validateManifestFile(context, false);
        if (getjarIntent.getBooleanExtra(GetjarIntentKey, false) && RedemptionEngine.IntentTypeDealRedemption.equals(getjarIntent.getStringExtra(RedemptionEngine.IntentTypeKey))) {
            Logger.d(Area.DEVELOPER_API.value() | Area.REDEEM.value() | Area.OFFER.value(), String.format(Locale.US, "handleIntent() handling an Intent of type '%1$s'", RedemptionEngine.IntentTypeDealRedemption));
            List<VoucherRedemptionListener> voucherRedemptionListeners = new ArrayList<>();
            for (GetJarListener listener : callbacks) {
                if (VoucherRedemptionListener.class.isAssignableFrom(listener.getClass())) {
                    voucherRedemptionListeners.add((VoucherRedemptionListener) listener);
                }
            }
            if (voucherRedemptionListeners.size() > 0) {
                if (voucherRedemptionListeners.size() > 1) {
                    Logger.w(Area.DEVELOPER_API.value() | Area.REDEEM.value() | Area.OFFER.value(), String.format("%1$d VoucherRedemptionListener instances where passed to handleIntent(), was this intentional?", Integer.valueOf(voucherRedemptionListeners.size())));
                }
                new RedemptionEngine(applicationToken, context).redeemVoucherFromIntent(developerPayload, getjarIntent, voucherRedemptionListeners);
            }
        }
    }

    public static GetJarContext retrieveContext(String contextId) {
        return new GetJarContext(CommManager.retrieveContext(contextId));
    }
}
