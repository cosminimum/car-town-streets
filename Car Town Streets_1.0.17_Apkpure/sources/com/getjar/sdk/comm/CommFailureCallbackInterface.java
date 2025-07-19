package com.getjar.sdk.comm;
/* loaded from: classes.dex */
public interface CommFailureCallbackInterface {
    void authorizationFailure(String str);

    void networkFailure();

    void serviceFailure(Result result);
}
