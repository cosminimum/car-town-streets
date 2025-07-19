package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;

public class TransactionException extends GetJarException {
    private static final long serialVersionUID = 1766816765706005035L;

    public TransactionException() {
    }

    public TransactionException(String message) {
        super(message);
    }

    public TransactionException(String message, Throwable cause) {
        super(message, cause);
    }

    public TransactionException(Throwable cause) {
        super(cause);
    }
}
