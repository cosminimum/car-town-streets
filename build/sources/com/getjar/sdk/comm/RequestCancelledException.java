package com.getjar.sdk.comm;

public class RequestCancelledException extends Exception {
    public RequestCancelledException() {
    }

    public RequestCancelledException(String message) {
        super(message);
    }
}
