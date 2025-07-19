package com.google.android.gms.internal;

import android.app.Activity;
import android.os.RemoteException;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.ads.mediation.admob.AdMobServerParameters;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.internal.C0915bc;
import java.util.HashMap;
import java.util.Iterator;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.be */
public final class C0921be<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> extends C0915bc.C0916a {

    /* renamed from: gg */
    private final MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> f2216gg;

    /* renamed from: gh */
    private final NETWORK_EXTRAS f2217gh;

    public C0921be(MediationAdapter<NETWORK_EXTRAS, SERVER_PARAMETERS> mediationAdapter, NETWORK_EXTRAS network_extras) {
        this.f2216gg = mediationAdapter;
        this.f2217gh = network_extras;
    }

    /* renamed from: a */
    private SERVER_PARAMETERS m2019a(String str, int i, String str2) throws RemoteException {
        HashMap hashMap;
        if (str != null) {
            try {
                JSONObject jSONObject = new JSONObject(str);
                HashMap hashMap2 = new HashMap(jSONObject.length());
                Iterator<String> keys = jSONObject.keys();
                while (keys.hasNext()) {
                    String next = keys.next();
                    hashMap2.put(next, jSONObject.getString(next));
                }
                hashMap = hashMap2;
            } catch (Throwable th) {
                C1004ct.m2212b("Could not get MediationServerParameters.", th);
                throw new RemoteException();
            }
        } else {
            hashMap = new HashMap(0);
        }
        Class<SERVER_PARAMETERS> serverParametersType = this.f2216gg.getServerParametersType();
        SERVER_PARAMETERS server_parameters = null;
        if (serverParametersType != null) {
            SERVER_PARAMETERS server_parameters2 = (MediationServerParameters) serverParametersType.newInstance();
            server_parameters2.load(hashMap);
            server_parameters = server_parameters2;
        }
        if (server_parameters instanceof AdMobServerParameters) {
            AdMobServerParameters adMobServerParameters = (AdMobServerParameters) server_parameters;
            adMobServerParameters.adJson = str2;
            adMobServerParameters.tagForChildDirectedTreatment = i;
        }
        return server_parameters;
    }

    /* renamed from: a */
    public void mo7099a(C0772b bVar, C1464v vVar, String str, C0918bd bdVar) throws RemoteException {
        mo7100a(bVar, vVar, str, (String) null, bdVar);
    }

    /* renamed from: a */
    public void mo7100a(C0772b bVar, C1464v vVar, String str, String str2, C0918bd bdVar) throws RemoteException {
        if (!(this.f2216gg instanceof MediationInterstitialAdapter)) {
            C1004ct.m2218v("MediationAdapter is not a MediationInterstitialAdapter: " + this.f2216gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        C1004ct.m2214r("Requesting interstitial ad from adapter.");
        try {
            ((MediationInterstitialAdapter) this.f2216gg).requestInterstitialAd(new C0922bf(bdVar), (Activity) C0775c.m1695b(bVar), m2019a(str, vVar.tagForChildDirectedTreatment, str2), C0934bg.m2028e(vVar), this.f2217gh);
        } catch (Throwable th) {
            C1004ct.m2212b("Could not request interstitial ad from adapter.", th);
            throw new RemoteException();
        }
    }

    /* renamed from: a */
    public void mo7101a(C0772b bVar, C1466x xVar, C1464v vVar, String str, C0918bd bdVar) throws RemoteException {
        mo7102a(bVar, xVar, vVar, str, (String) null, bdVar);
    }

    /* renamed from: a */
    public void mo7102a(C0772b bVar, C1466x xVar, C1464v vVar, String str, String str2, C0918bd bdVar) throws RemoteException {
        if (!(this.f2216gg instanceof MediationBannerAdapter)) {
            C1004ct.m2218v("MediationAdapter is not a MediationBannerAdapter: " + this.f2216gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        C1004ct.m2214r("Requesting banner ad from adapter.");
        try {
            ((MediationBannerAdapter) this.f2216gg).requestBannerAd(new C0922bf(bdVar), (Activity) C0775c.m1695b(bVar), m2019a(str, vVar.tagForChildDirectedTreatment, str2), C0934bg.m2027b(xVar), C0934bg.m2028e(vVar), this.f2217gh);
        } catch (Throwable th) {
            C1004ct.m2212b("Could not request banner ad from adapter.", th);
            throw new RemoteException();
        }
    }

    public void destroy() throws RemoteException {
        try {
            this.f2216gg.destroy();
        } catch (Throwable th) {
            C1004ct.m2212b("Could not destroy adapter.", th);
            throw new RemoteException();
        }
    }

    public C0772b getView() throws RemoteException {
        if (!(this.f2216gg instanceof MediationBannerAdapter)) {
            C1004ct.m2218v("MediationAdapter is not a MediationBannerAdapter: " + this.f2216gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        try {
            return C0775c.m1696h(((MediationBannerAdapter) this.f2216gg).getBannerView());
        } catch (Throwable th) {
            C1004ct.m2212b("Could not get banner view from adapter.", th);
            throw new RemoteException();
        }
    }

    public void showInterstitial() throws RemoteException {
        if (!(this.f2216gg instanceof MediationInterstitialAdapter)) {
            C1004ct.m2218v("MediationAdapter is not a MediationInterstitialAdapter: " + this.f2216gg.getClass().getCanonicalName());
            throw new RemoteException();
        }
        C1004ct.m2214r("Showing interstitial from adapter.");
        try {
            ((MediationInterstitialAdapter) this.f2216gg).showInterstitial();
        } catch (Throwable th) {
            C1004ct.m2212b("Could not show interstitial from adapter.", th);
            throw new RemoteException();
        }
    }
}
