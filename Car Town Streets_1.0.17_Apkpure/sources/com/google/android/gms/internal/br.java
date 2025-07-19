package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Intent;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.dynamic.e;
import com.google.android.gms.internal.bs;
import com.google.android.gms.internal.bt;
/* loaded from: classes.dex */
public final class br extends com.google.android.gms.dynamic.e<bt> {
    private static final br ha = new br();

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class a extends Exception {
        public a(String str) {
            super(str);
        }
    }

    private br() {
        super("com.google.android.gms.ads.AdOverlayCreatorImpl");
    }

    public static bs a(Activity activity) {
        bs c;
        try {
            if (b(activity)) {
                ct.r("Using AdOverlay from the client jar.");
                c = new bk(activity);
            } else {
                c = ha.c(activity);
            }
            return c;
        } catch (a e) {
            ct.v(e.getMessage());
            return null;
        }
    }

    private static boolean b(Activity activity) throws a {
        Intent intent = activity.getIntent();
        if (!intent.hasExtra("com.google.android.gms.ads.internal.overlay.useClientJar")) {
            throw new a("Ad overlay requires the useClientJar flag in intent extras.");
        }
        return intent.getBooleanExtra("com.google.android.gms.ads.internal.overlay.useClientJar", false);
    }

    private bs c(Activity activity) {
        try {
            return bs.a.m(t(activity).a(com.google.android.gms.dynamic.c.h(activity)));
        } catch (RemoteException e) {
            ct.b("Could not create remote AdOverlay.", e);
            return null;
        } catch (e.a e2) {
            ct.b("Could not create remote AdOverlay.", e2);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.e
    /* renamed from: l */
    public bt d(IBinder iBinder) {
        return bt.a.n(iBinder);
    }
}
