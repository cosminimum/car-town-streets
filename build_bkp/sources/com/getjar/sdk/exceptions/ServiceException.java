package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;
import com.getjar.sdk.comm.Result;

public class ServiceException extends GetJarException {
    private Result _requestResult = null;

    public ServiceException(String msg, Result requestResult) {
        super(msg);
        this._requestResult = requestResult;
    }

    public Result getRequestResult() {
        return this._requestResult;
    }
}
