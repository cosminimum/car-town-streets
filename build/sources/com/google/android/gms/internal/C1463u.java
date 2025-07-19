package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.dynamic.C0777e;
import com.google.android.gms.internal.C0855ac;
import com.google.android.gms.internal.C0858ad;

/* renamed from: com.google.android.gms.internal.u */
public final class C1463u extends C0777e<C0858ad> {

    /* renamed from: ew */
    private static final C1463u f3476ew = new C1463u();

    private C1463u() {
        super("com.google.android.gms.ads.AdManagerCreatorImpl");
    }

    /* renamed from: a */
    public static C0855ac m4069a(Context context, C1466x xVar, String str, C0911ba baVar) {
        C0855ac b;
        if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) == 0 && (b = f3476ew.m4070b(context, xVar, str, baVar)) != null) {
            return b;
        }
        C1004ct.m2214r("Using AdManager from the client jar.");
        return new C1458r(context, xVar, str, baVar, new C1005cu(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, true));
    }

    /* renamed from: b */
    private C0855ac m4070b(Context context, C1466x xVar, String str, C0911ba baVar) {
        try {
            return C0855ac.C0856a.m1904f(((C0858ad) mo6407t(context)).mo7011a(C0775c.m1696h(context), xVar, str, baVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE));
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not create remote AdManager.", e);
            return null;
        } catch (C0777e.C0778a e2) {
            C1004ct.m2212b("Could not create remote AdManager.", e2);
            return null;
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: c */
    public C0858ad mo6406d(IBinder iBinder) {
        return C0858ad.C0859a.m1913g(iBinder);
    }
}
