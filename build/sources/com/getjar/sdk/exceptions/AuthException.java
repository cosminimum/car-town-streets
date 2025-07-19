package com.getjar.sdk.exceptions;

public class AuthException extends CommunicationException {
    private static final long serialVersionUID = 7148297634011153457L;

    public AuthException() {
    }

    public AuthException(String message) {
        super(message);
    }

    public AuthException(String message, Throwable cause) {
        super(message, cause);
    }

    public AuthException(Throwable cause) {
        super(cause);
    }
}
