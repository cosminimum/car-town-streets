package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.internal.C0912bb;
import java.util.Map;

/* renamed from: com.google.android.gms.internal.ba */
public final class C0911ba extends C0912bb.C0913a {

    /* renamed from: gf */
    private Map<Class<? extends NetworkExtras>, NetworkExtras> f2212gf;

    /* renamed from: m */
    private <NETWORK_EXTRAS extends com.google.ads.mediation.NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> C0915bc m2001m(String str) throws RemoteException {
        try {
            Class<?> cls = Class.forName(str, false, C0911ba.class.getClassLoader());
            if (!MediationAdapter.class.isAssignableFrom(cls)) {
                C1004ct.m2218v("Could not instantiate mediation adapter: " + str + ".");
                throw new RemoteException();
            }
            MediationAdapter mediationAdapter = (MediationAdapter) cls.newInstance();
            return new C0921be(mediationAdapter, (com.google.ads.mediation.NetworkExtras) this.f2212gf.get(mediationAdapter.getAdditionalParametersType()));
        } catch (Throwable th) {
            C1004ct.m2218v("Could not instantiate mediation adapter: " + str + ". " + th.getMessage());
            throw new RemoteException();
        }
    }

    /* renamed from: c */
    public void mo7094c(Map<Class<? extends NetworkExtras>, NetworkExtras> map) {
        this.f2212gf = map;
    }

    /* renamed from: l */
    public C0915bc mo7095l(String str) throws RemoteException {
        return m2001m(str);
    }
}
