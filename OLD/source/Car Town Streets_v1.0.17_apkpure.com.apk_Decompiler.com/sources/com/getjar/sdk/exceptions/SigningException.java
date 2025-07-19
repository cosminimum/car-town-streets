package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;

public class SigningException extends GetJarException {
    private static final long serialVersionUID = -7981640040536510422L;

    public SigningException() {
    }

    public SigningException(String message) {
        super(message);
    }

    public SigningException(String message, Throwable cause) {
        super(message, cause);
    }

    public SigningException(Throwable cause) {
        super(cause);
    }
}
