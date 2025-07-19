package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;

public class ConfigurationException extends GetJarException {
    private static final long serialVersionUID = 5108870908395296453L;

    public ConfigurationException() {
    }

    public ConfigurationException(String message) {
        super(message);
    }

    public ConfigurationException(String message, Throwable cause) {
        super(message, cause);
    }

    public ConfigurationException(Throwable cause) {
        super(cause);
    }
}
