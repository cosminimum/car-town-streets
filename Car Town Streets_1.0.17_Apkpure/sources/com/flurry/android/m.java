package com.flurry.android;
/* loaded from: classes.dex */
final class m implements Runnable {
    private /* synthetic */ String a;
    private /* synthetic */ ak b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public m(ak akVar, String str) {
        this.b = akVar;
        this.a = str;
    }

    @Override // java.lang.Runnable
    public final void run() {
        if (this.a != null) {
            u.a(this.b.d, this.b.b, this.a);
            this.b.c.a(new f((byte) 8, this.b.d.k()));
            return;
        }
        String str = "Unable to launch in app market: " + this.b.a;
        ah.d(u.a, str);
        this.b.d.e(str);
    }
}
