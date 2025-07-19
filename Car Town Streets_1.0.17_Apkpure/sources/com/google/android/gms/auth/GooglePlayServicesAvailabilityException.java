package com.google.android.gms.auth;

import android.content.Intent;
/* loaded from: classes.dex */
public class GooglePlayServicesAvailabilityException extends UserRecoverableAuthException {
    private final int kf;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GooglePlayServicesAvailabilityException(int connectionStatusCode, String msg, Intent intent) {
        super(msg, intent);
        this.kf = connectionStatusCode;
    }

    public int getConnectionStatusCode() {
        return this.kf;
    }
}
