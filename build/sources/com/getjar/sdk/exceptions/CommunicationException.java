package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;

public class CommunicationException extends GetJarException {
    private static final long serialVersionUID = 7148297634011153457L;

    public CommunicationException() {
    }

    public CommunicationException(String message) {
        super(message);
    }

    public CommunicationException(String message, Throwable cause) {
        super(message, cause);
    }

    public CommunicationException(Throwable cause) {
        super(cause);
    }
}
