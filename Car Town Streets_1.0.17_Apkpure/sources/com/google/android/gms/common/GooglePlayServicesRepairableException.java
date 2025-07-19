package com.google.android.gms.common;

import android.content.Intent;
/* loaded from: classes.dex */
public class GooglePlayServicesRepairableException extends UserRecoverableException {
    private final int kf;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GooglePlayServicesRepairableException(int connectionStatusCode, String msg, Intent intent) {
        super(msg, intent);
        this.kf = connectionStatusCode;
    }

    public int getConnectionStatusCode() {
        return this.kf;
    }
}
