package com.google.tagmanager;
/* loaded from: classes.dex */
abstract class ServiceManager {
    abstract void dispatch();

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void onRadioPowered();

    abstract void setDispatchPeriod(int i);

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void updateConnectivityStatus(boolean z);
}
