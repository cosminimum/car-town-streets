package com.google.android.gms.common.api;

import com.google.android.gms.common.api.Result;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public interface PendingResult<R extends Result> {

    /* loaded from: classes.dex */
    public interface a {
        void l(Status status);
    }

    R await();

    R await(long j, TimeUnit timeUnit);

    R e(Status status);

    void setResultCallback(ResultCallback<R> resultCallback);
}
