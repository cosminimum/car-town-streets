package com.google.android.gms.common.api;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.internal.eg;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public class a {

    /* renamed from: com.google.android.gms.common.api.a$a  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public static abstract class AbstractC0011a<R extends Result, A extends Api.a> implements GoogleApiClient.b<A>, PendingResult<R>, c<R> {
        private final Api.b<A> mU;
        private ResultCallback<R> mZ;
        private R na;
        private boolean nb;
        private GoogleApiClient.a nc;
        private final Object mV = new Object();
        private final CountDownLatch mX = new CountDownLatch(1);
        private final ArrayList<PendingResult.a> mY = new ArrayList<>();
        private final b<R> mW = (b<R>) new b<R>() { // from class: com.google.android.gms.common.api.a.a.1
            @Override // com.google.android.gms.common.api.a.b
            protected void a(ResultCallback<R> resultCallback, R r) {
                resultCallback.onResult(r);
            }
        };

        public AbstractC0011a(Api.b<A> bVar) {
            this.mU = bVar;
        }

        private R bl() {
            R r;
            synchronized (this.mV) {
                eg.a(!this.nb, "Result has already been consumed.");
                eg.a(isReady(), "Result is not ready.");
                r = this.na;
                bm();
            }
            return r;
        }

        protected abstract void a(A a);

        @Override // com.google.android.gms.common.api.GoogleApiClient.b
        public void a(GoogleApiClient.a aVar) {
            this.nc = aVar;
        }

        public final void a(R r) {
            boolean z = true;
            eg.a(!isReady(), "Results have already been set");
            if (this.nb) {
                z = false;
            }
            eg.a(z, "Result has already been consumed");
            synchronized (this.mV) {
                this.na = r;
                this.mX.countDown();
                Status status = this.na.getStatus();
                if (this.mZ != null) {
                    this.mW.b(this.mZ, bl());
                }
                Iterator<PendingResult.a> it = this.mY.iterator();
                while (it.hasNext()) {
                    it.next().l(status);
                }
                this.mY.clear();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // com.google.android.gms.common.api.a.c
        public /* bridge */ /* synthetic */ void a(Object obj) {
            a((AbstractC0011a<R, A>) ((Result) obj));
        }

        @Override // com.google.android.gms.common.api.PendingResult
        public final R await() {
            eg.a(!this.nb, "Results has already been consumed");
            try {
                this.mX.await();
            } catch (InterruptedException e) {
                a((AbstractC0011a<R, A>) e(Status.nB));
            }
            eg.a(isReady(), "Result is not ready.");
            return bl();
        }

        @Override // com.google.android.gms.common.api.PendingResult
        public final R await(long time, TimeUnit units) {
            eg.a(!this.nb, "Result has already been consumed.");
            try {
                if (!this.mX.await(time, units)) {
                    a((AbstractC0011a<R, A>) e(Status.nC));
                }
            } catch (InterruptedException e) {
                a((AbstractC0011a<R, A>) e(Status.nB));
            }
            eg.a(isReady(), "Result is not ready.");
            return bl();
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.b
        public final void b(A a) {
            a((AbstractC0011a<R, A>) a);
        }

        @Override // com.google.android.gms.common.api.GoogleApiClient.b
        public final Api.b<A> bj() {
            return this.mU;
        }

        void bm() {
            this.nb = true;
            this.na = null;
            if (this.nc != null) {
                this.nc.b(this);
            }
        }

        public final boolean isReady() {
            return this.mX.getCount() == 0;
        }

        @Override // com.google.android.gms.common.api.PendingResult
        public final void setResultCallback(ResultCallback<R> callback) {
            eg.a(!this.nb, "Result has already been consumed.");
            synchronized (this.mV) {
                if (isReady()) {
                    this.mW.b(callback, bl());
                } else {
                    this.mZ = callback;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static abstract class b<R extends Result> extends Handler {
        public b() {
            this(Looper.getMainLooper());
        }

        public b(Looper looper) {
            super(looper);
        }

        protected abstract void a(ResultCallback<R> resultCallback, R r);

        public void b(ResultCallback<R> resultCallback, R r) {
            sendMessage(obtainMessage(1, new Pair(resultCallback, r)));
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    Pair pair = (Pair) msg.obj;
                    a((ResultCallback) pair.first, (Result) pair.second);
                    return;
                default:
                    Log.wtf("GoogleApi", "Don't know how to handle this message.");
                    return;
            }
        }
    }

    /* loaded from: classes.dex */
    public interface c<R> {
        void a(R r);
    }
}
