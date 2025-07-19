package com.getjar.sdk.exceptions;

import com.getjar.sdk.GetJarException;
import com.getjar.sdk.comm.Result;
/* loaded from: classes.dex */
public class ServiceException extends GetJarException {
    private Result _requestResult;

    public ServiceException(String msg, Result requestResult) {
        super(msg);
        this._requestResult = null;
        this._requestResult = requestResult;
    }

    public Result getRequestResult() {
        return this._requestResult;
    }
}
