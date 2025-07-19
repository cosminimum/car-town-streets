package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.dynamic.C0777e;
import com.google.android.gms.internal.C0953bs;
import com.google.android.gms.internal.C0956bt;

/* renamed from: com.google.android.gms.internal.br */
public final class C0951br extends C0777e<C0956bt> {

    /* renamed from: ha */
    private static final C0951br f2278ha = new C0951br();

    /* renamed from: com.google.android.gms.internal.br$a */
    private static final class C0952a extends Exception {
        public C0952a(String str) {
            super(str);
        }
    }

    private C0951br() {
        super("com.google.android.gms.ads.AdOverlayCreatorImpl");
    }

    /* renamed from: a */
    public static C0953bs m2073a(Activity activity) {
        try {
            if (!m2074b(activity)) {
                return f2278ha.m2075c(activity);
            }
            C1004ct.m2214r("Using AdOverlay from the client jar.");
            return new C0939bk(activity);
        } catch (C0952a e) {
            C1004ct.m2218v(e.getMessage());
            return null;
        }
    }

    /* renamed from: b */
    private static boolean m2074b(Activity activity) throws C0952a {
        Intent intent = activity.getIntent();
        if (intent.hasExtra("com.google.android.gms.ads.internal.overlay.useClientJar")) {
            return intent.getBooleanExtra("com.google.android.gms.ads.internal.overlay.useClientJar", false);
        }
        throw new C0952a("Ad overlay requires the useClientJar flag in intent extras.");
    }

    /* renamed from: c */
    private C0953bs m2075c(Activity activity) {
        try {
            return C0953bs.C0954a.m2078m(((C0956bt) mo6407t(activity)).mo7183a(C0775c.m1696h(activity)));
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not create remote AdOverlay.", e);
            return null;
        } catch (C0777e.C0778a e2) {
            C1004ct.m2212b("Could not create remote AdOverlay.", e2);
            return null;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: l */
    public C0956bt mo6406d(IBinder iBinder) {
        return C0956bt.C0957a.m2080n(iBinder);
    }
}
