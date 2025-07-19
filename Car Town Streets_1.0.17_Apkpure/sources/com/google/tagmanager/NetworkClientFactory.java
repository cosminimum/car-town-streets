package com.google.tagmanager;

import android.os.Build;
import com.google.android.gms.common.util.VisibleForTesting;
/* loaded from: classes.dex */
class NetworkClientFactory {
    public NetworkClient createNetworkClient() {
        return getSdkVersion() < 8 ? new HttpNetworkClient() : new HttpUrlConnectionNetworkClient();
    }

    @VisibleForTesting
    int getSdkVersion() {
        return Build.VERSION.SDK_INT;
    }
}
