package com.flurry.android;

/* renamed from: com.flurry.android.m */
final class C0315m implements Runnable {

    /* renamed from: a */
    private /* synthetic */ String f601a;

    /* renamed from: b */
    private /* synthetic */ C0302ak f602b;

    C0315m(C0302ak akVar, String str) {
        this.f602b = akVar;
        this.f601a = str;
    }

    public final void run() {
        if (this.f601a != null) {
            C0323u.m569a(this.f602b.f515d, this.f602b.f513b, this.f601a);
            this.f602b.f514c.mo2419a(new C0308f((byte) 8, this.f602b.f515d.mo2453k()));
            return;
        }
        String str = "Unable to launch in app market: " + this.f602b.f512a;
        C0299ah.m542d(C0323u.f617a, str);
        this.f602b.f515d.m574e(str);
    }
}
