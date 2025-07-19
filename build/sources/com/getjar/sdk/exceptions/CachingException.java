package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;

public class CachingException extends GetJarException {
    private static final long serialVersionUID = -7981640080536510422L;

    public CachingException() {
    }

    public CachingException(String message) {
        super(message);
    }

    public CachingException(String message, Throwable cause) {
        super(message, cause);
    }

    public CachingException(Throwable cause) {
        super(cause);
    }
}
