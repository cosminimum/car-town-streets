package com.getjar.sdk.comm.auth;
/* loaded from: classes.dex */
public enum AccountEventType {
    AUTH_FIRST_TIME,
    AUTH,
    AUTH_VALIDATED,
    USER_SWITCHED,
    USER_SWITCHED_UI_COMPLETED;

    public boolean isAuthEvent() {
        AccountEventType currentValue = values()[ordinal()];
        switch (currentValue) {
            case AUTH_FIRST_TIME:
            case AUTH:
            case AUTH_VALIDATED:
                return true;
            default:
                return false;
        }
    }
}
