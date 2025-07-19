package com.google.analytics.tracking.android;
/* loaded from: classes.dex */
public abstract class ServiceManager {
    @Deprecated
    public abstract void dispatchLocalHits();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void onRadioPowered();

    @Deprecated
    public abstract void setForceLocalDispatch();

    @Deprecated
    public abstract void setLocalDispatchPeriod(int i);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void updateConnectivityStatus(boolean z);
}
