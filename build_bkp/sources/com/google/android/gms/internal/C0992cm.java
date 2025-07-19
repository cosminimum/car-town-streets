package com.google.android.gms.internal;

/* renamed from: com.google.android.gms.internal.cm */
public abstract class C0992cm {

    /* renamed from: ep */
    private final Runnable f2398ep = new Runnable() {
        public final void run() {
            Thread unused = C0992cm.this.f2399ix = Thread.currentThread();
            C0992cm.this.mo7188ai();
        }
    };
    /* access modifiers changed from: private */

    /* renamed from: ix */
    public volatile Thread f2399ix;

    /* renamed from: ai */
    public abstract void mo7188ai();

    public final void cancel() {
        onStop();
        if (this.f2399ix != null) {
            this.f2399ix.interrupt();
        }
    }

    public abstract void onStop();

    public final void start() {
        C0994cn.execute(this.f2398ep);
    }
}
