package com.getjar.sdk;

import android.content.Context;
import com.getjar.sdk.comm.CommContext;
/* loaded from: classes.dex */
public class GetJarContext {
    private CommContext _commContext;

    /* JADX INFO: Access modifiers changed from: protected */
    public CommContext getCommContext() {
        return this._commContext;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public GetJarContext(CommContext commContext) {
        this._commContext = null;
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' can not be NULL");
        }
        this._commContext = commContext;
    }

    public String getGetJarContextId() {
        return this._commContext.getCommContextId();
    }

    public Context getAndroidContext() {
        return this._commContext.getApplicationContext();
    }
}
