package com.flurry.android;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class k implements Runnable {
    private /* synthetic */ ag a;

    /* JADX INFO: Access modifiers changed from: package-private */
    public k(ag agVar) {
        this.a = agVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        this.a.a();
    }
}
