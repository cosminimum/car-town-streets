package com.google.android.gms.common.api;

import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.util.Log;
import android.util.Pair;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.internal.C1102eg;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

/* renamed from: com.google.android.gms.common.api.a */
public class C0655a {

    /* renamed from: com.google.android.gms.common.api.a$a */
    public static abstract class C0656a<R extends Result, A extends Api.C0646a> implements GoogleApiClient.C0653b<A>, PendingResult<R>, C0659c<R> {

        /* renamed from: mU */
        private final Api.C0647b<A> f1356mU;

        /* renamed from: mV */
        private final Object f1357mV = new Object();

        /* renamed from: mW */
        private final C0658b<R> f1358mW;

        /* renamed from: mX */
        private final CountDownLatch f1359mX = new CountDownLatch(1);

        /* renamed from: mY */
        private final ArrayList<PendingResult.C0654a> f1360mY = new ArrayList<>();

        /* renamed from: mZ */
        private ResultCallback<R> f1361mZ;

        /* renamed from: na */
        private R f1362na;

        /* renamed from: nb */
        private boolean f1363nb;

        /* renamed from: nc */
        private GoogleApiClient.C0652a f1364nc;

        public C0656a(Api.C0647b<A> bVar) {
            this.f1356mU = bVar;
            this.f1358mW = new C0658b<R>() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5926a(ResultCallback<R> resultCallback, R r) {
                    resultCallback.onResult(r);
                }
            };
        }

        /* renamed from: bl */
        private R m1280bl() {
            R r;
            synchronized (this.f1357mV) {
                C1102eg.m2612a(!this.f1363nb, "Result has already been consumed.");
                C1102eg.m2612a(isReady(), "Result is not ready.");
                r = this.f1362na;
                mo5924bm();
            }
            return r;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo5626a(A a);

        /* renamed from: a */
        public void mo5897a(GoogleApiClient.C0652a aVar) {
            this.f1364nc = aVar;
        }

        /* renamed from: a */
        public final void mo5612a(R r) {
            boolean z = true;
            C1102eg.m2612a(!isReady(), "Results have already been set");
            if (this.f1363nb) {
                z = false;
            }
            C1102eg.m2612a(z, "Result has already been consumed");
            synchronized (this.f1357mV) {
                this.f1362na = r;
                this.f1359mX.countDown();
                Status status = this.f1362na.getStatus();
                if (this.f1361mZ != null) {
                    this.f1358mW.mo5927b(this.f1361mZ, m1280bl());
                }
                Iterator<PendingResult.C0654a> it = this.f1360mY.iterator();
                while (it.hasNext()) {
                    it.next().mo5903l(status);
                }
                this.f1360mY.clear();
            }
        }

        public final R await() {
            C1102eg.m2612a(!this.f1363nb, "Results has already been consumed");
            try {
                this.f1359mX.await();
            } catch (InterruptedException e) {
                mo5612a(mo5631e(Status.f1351nB));
            }
            C1102eg.m2612a(isReady(), "Result is not ready.");
            return m1280bl();
        }

        public final R await(long time, TimeUnit units) {
            C1102eg.m2612a(!this.f1363nb, "Result has already been consumed.");
            try {
                if (!this.f1359mX.await(time, units)) {
                    mo5612a(mo5631e(Status.f1352nC));
                }
            } catch (InterruptedException e) {
                mo5612a(mo5631e(Status.f1351nB));
            }
            C1102eg.m2612a(isReady(), "Result is not ready.");
            return m1280bl();
        }

        /* renamed from: b */
        public final void mo5898b(A a) {
            mo5626a(a);
        }

        /* renamed from: bj */
        public final Api.C0647b<A> mo5899bj() {
            return this.f1356mU;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: bm */
        public void mo5924bm() {
            this.f1363nb = true;
            this.f1362na = null;
            if (this.f1364nc != null) {
                this.f1364nc.mo5880b(this);
            }
        }

        public final boolean isReady() {
            return this.f1359mX.getCount() == 0;
        }

        public final void setResultCallback(ResultCallback<R> callback) {
            C1102eg.m2612a(!this.f1363nb, "Result has already been consumed.");
            synchronized (this.f1357mV) {
                if (isReady()) {
                    this.f1358mW.mo5927b(callback, m1280bl());
                } else {
                    this.f1361mZ = callback;
                }
            }
        }
    }

    /* renamed from: com.google.android.gms.common.api.a$b */
    static abstract class C0658b<R extends Result> extends Handler {
        public C0658b() {
            this(Looper.getMainLooper());
        }

        public C0658b(Looper looper) {
            super(looper);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public abstract void mo5926a(ResultCallback<R> resultCallback, R r);

        /* renamed from: b */
        public void mo5927b(ResultCallback<R> resultCallback, R r) {
            sendMessage(obtainMessage(1, new Pair(resultCallback, r)));
        }

        public void handleMessage(Message msg) {
            switch (msg.what) {
                case 1:
                    Pair pair = (Pair) msg.obj;
                    mo5926a((ResultCallback) pair.first, (Result) pair.second);
                    return;
                default:
                    Log.wtf("GoogleApi", "Don't know how to handle this message.");
                    return;
            }
        }
    }

    /* renamed from: com.google.android.gms.common.api.a$c */
    public interface C0659c<R> {
        /* renamed from: a */
        void mo5612a(R r);
    }
}
