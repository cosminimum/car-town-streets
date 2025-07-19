package com.flurry.android;
/* loaded from: classes.dex */
final class l implements Runnable {
    private /* synthetic */ b a;

    /* JADX INFO: Access modifiers changed from: package-private */
    public l(b bVar) {
        this.a = bVar;
    }

    @Override // java.lang.Runnable
    public final void run() {
        FlurryAgent.b(this.a.b, this.a.a);
    }
}
