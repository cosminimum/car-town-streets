package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.dynamic.e;
import com.google.android.gms.internal.ac;
import com.google.android.gms.internal.ad;
/* loaded from: classes.dex */
public final class u extends com.google.android.gms.dynamic.e<ad> {
    private static final u ew = new u();

    private u() {
        super("com.google.android.gms.ads.AdManagerCreatorImpl");
    }

    public static ac a(Context context, x xVar, String str, ba baVar) {
        ac b;
        if (GooglePlayServicesUtil.isGooglePlayServicesAvailable(context) != 0 || (b = ew.b(context, xVar, str, baVar)) == null) {
            ct.r("Using AdManager from the client jar.");
            return new r(context, xVar, str, baVar, new cu(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, true));
        }
        return b;
    }

    private ac b(Context context, x xVar, String str, ba baVar) {
        try {
            return ac.a.f(t(context).a(com.google.android.gms.dynamic.c.h(context), xVar, str, baVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE));
        } catch (RemoteException e) {
            ct.b("Could not create remote AdManager.", e);
            return null;
        } catch (e.a e2) {
            ct.b("Could not create remote AdManager.", e2);
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.dynamic.e
    /* renamed from: c */
    public ad d(IBinder iBinder) {
        return ad.a.g(iBinder);
    }
}
