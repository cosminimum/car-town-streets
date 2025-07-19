package com.getjar.sdk.comm;

public interface CallbackInterface {
    void serviceRequestFailed(Result result, Exception exc, String str, CommContext commContext);

    void serviceRequestRetry(Exception exc, String str, CommContext commContext, int i);

    void serviceRequestSucceeded(Result result, String str, CommContext commContext);
}
