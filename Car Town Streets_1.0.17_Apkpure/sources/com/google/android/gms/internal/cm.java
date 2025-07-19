package com.google.android.gms.internal;
/* loaded from: classes.dex */
public abstract class cm {
    private final Runnable ep = new Runnable() { // from class: com.google.android.gms.internal.cm.1
        @Override // java.lang.Runnable
        public final void run() {
            cm.this.ix = Thread.currentThread();
            cm.this.ai();
        }
    };
    private volatile Thread ix;

    public abstract void ai();

    public final void cancel() {
        onStop();
        if (this.ix != null) {
            this.ix.interrupt();
        }
    }

    public abstract void onStop();

    public final void start() {
        cn.execute(this.ep);
    }
}
