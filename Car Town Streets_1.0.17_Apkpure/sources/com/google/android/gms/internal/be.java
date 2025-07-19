package com.google.android.gms.internal;

import android.app.Activity;
import android.os.RemoteException;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.ads.mediation.admob.AdMobServerParameters;
import com.google.android.gms.internal.bc;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class be<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> extends bc.a {
    private final MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> gg;
    private final NETWORK_EXTRAS gh;

    public be(MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> mediationAdapter, NETWORK_EXTRAS network_extras) {
        this.gg = mediationAdapter;
        this.gh = network_extras;
    }

    private SERVER_PARAMETERS a(String str, int i, String str2) throws RemoteException {
        HashMap hashMap;
        try {
            if (str != null) {
                JSONObject jSONObject = new JSONObject(str);
                HashMap hashMap2 = new HashMap(jSONObject.length());
                Iterator<String> keys = jSONObject.keys();
                while (keys.hasNext()) {
                    String next = keys.next();
                    hashMap2.put(next, jSONObject.getString(next));
                }
                hashMap = hashMap2;
            } else {
                hashMap = new HashMap(0);
            }
            Class<SERVER_PARAMETERS> serverParametersType = this.gg.getServerParametersType();
            AdMobServerParameters adMobServerParameters = null;
            if (serverParametersType != null) {
                SERVER_PARAMETERS newInstance = serverParametersType.newInstance();
                newInstance.load(hashMap);
                adMobServerParameters = newInstance;
            }
            if (adMobServerParameters instanceof AdMobServerParameters) {
                AdMobServerParameters adMobServerParameters2 = adMobServerParameters;
                adMobServerParameters2.adJson = str2;
                adMobServerParameters2.tagForChildDirectedTreatment = i;
            }
            return adMobServerParameters;
        } catch (Throwable th) {
            ct.b("Could not get MediationServerParameters.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.bc
    public void a(com.google.android.gms.dynamic.b bVar, v vVar, String str, bd bdVar) throws RemoteException {
        a(bVar, vVar, str, (String) null, bdVar);
    }

    @Override // com.google.android.gms.internal.bc
    public void a(com.google.android.gms.dynamic.b bVar, v vVar, String str, String str2, bd bdVar) throws RemoteException {
        if (!(this.gg instanceof MediationInterstitialAdapter)) {
            ct.v("MediationAdapter is not a MediationInterstitialAdapter: " + this.gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        ct.r("Requesting interstitial ad from adapter.");
        try {
            ((MediationInterstitialAdapter) this.gg).requestInterstitialAd(new bf(bdVar), (Activity) com.google.android.gms.dynamic.c.b(bVar), a(str, vVar.tagForChildDirectedTreatment, str2), bg.e(vVar), this.gh);
        } catch (Throwable th) {
            ct.b("Could not request interstitial ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.bc
    public void a(com.google.android.gms.dynamic.b bVar, x xVar, v vVar, String str, bd bdVar) throws RemoteException {
        a(bVar, xVar, vVar, str, null, bdVar);
    }

    @Override // com.google.android.gms.internal.bc
    public void a(com.google.android.gms.dynamic.b bVar, x xVar, v vVar, String str, String str2, bd bdVar) throws RemoteException {
        if (!(this.gg instanceof MediationBannerAdapter)) {
            ct.v("MediationAdapter is not a MediationBannerAdapter: " + this.gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        ct.r("Requesting banner ad from adapter.");
        try {
            ((MediationBannerAdapter) this.gg).requestBannerAd(new bf(bdVar), (Activity) com.google.android.gms.dynamic.c.b(bVar), a(str, vVar.tagForChildDirectedTreatment, str2), bg.b(xVar), bg.e(vVar), this.gh);
        } catch (Throwable th) {
            ct.b("Could not request banner ad from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.bc
    public void destroy() throws RemoteException {
        try {
            this.gg.destroy();
        } catch (Throwable th) {
            ct.b("Could not destroy adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.bc
    public com.google.android.gms.dynamic.b getView() throws RemoteException {
        if (!(this.gg instanceof MediationBannerAdapter)) {
            ct.v("MediationAdapter is not a MediationBannerAdapter: " + this.gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        try {
            return com.google.android.gms.dynamic.c.h(((MediationBannerAdapter) this.gg).getBannerView());
        } catch (Throwable th) {
            ct.b("Could not get banner view from adapter.", th);
            throw new RemoteException();
        }
    }

    @Override // com.google.android.gms.internal.bc
    public void showInterstitial() throws RemoteException {
        if (!(this.gg instanceof MediationInterstitialAdapter)) {
            ct.v("MediationAdapter is not a MediationInterstitialAdapter: " + this.gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        ct.r("Showing interstitial from adapter.");
        try {
            ((MediationInterstitialAdapter) this.gg).showInterstitial();
        } catch (Throwable th) {
            ct.b("Could not show interstitial from adapter.", th);
            throw new RemoteException();
        }
    }
}
