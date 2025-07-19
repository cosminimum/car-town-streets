package com.getjar.sdk;

public class GetJarException extends RuntimeException {
    private static final long serialVersionUID = -127143903208982659L;

    public GetJarException() {
    }

    public GetJarException(String message) {
        super(message);
    }

    public GetJarException(String message, Throwable cause) {
        super(message, cause);
    }

    public GetJarException(Throwable cause) {
        super(cause);
    }
}
