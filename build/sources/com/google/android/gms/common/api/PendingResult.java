package com.google.android.gms.common.api;

import com.google.android.gms.common.api.Result;
import java.util.concurrent.TimeUnit;

public interface PendingResult<R extends Result> {

    /* renamed from: com.google.android.gms.common.api.PendingResult$a */
    public interface C0654a {
        /* renamed from: l */
        void mo5903l(Status status);
    }

    R await();

    R await(long j, TimeUnit timeUnit);

    /* renamed from: e */
    R mo5631e(Status status);

    void setResultCallback(ResultCallback<R> resultCallback);
}
