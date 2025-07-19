package com.getjar.sdk.comm;

public interface CommFailureCallbackInterface {
    void authorizationFailure(String str);

    void networkFailure();

    void serviceFailure(Result result);
}
