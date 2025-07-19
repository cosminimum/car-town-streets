package com.google.ads;

import android.app.Activity;
import com.google.ads.C0453g;
import com.google.ads.mediation.MediationAdRequest;
import com.google.ads.mediation.MediationAdapter;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
import com.google.ads.util.C0508b;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.google.ads.i */
class C0458i implements Runnable {

    /* renamed from: a */
    private final C0455h f820a;

    /* renamed from: b */
    private final String f821b;

    /* renamed from: c */
    private final AdRequest f822c;

    /* renamed from: d */
    private final HashMap<String, String> f823d;

    /* renamed from: e */
    private final boolean f824e = m770a((Map<String, String>) this.f823d);

    /* renamed from: f */
    private final WeakReference<Activity> f825f;

    /* renamed from: com.google.ads.i$a */
    private static class C0459a extends Exception {
        public C0459a(String str) {
            super(str);
        }
    }

    /* renamed from: a */
    private static boolean m770a(Map<String, String> map) {
        String remove = map.remove("gwhirl_share_location");
        if ("1".equals(remove)) {
            return true;
        }
        if (remove != null && !"0".equals(remove)) {
            C0508b.m1030b("Received an illegal value, '" + remove + "', for the special share location parameter from mediation server" + " (expected '0' or '1'). Will not share the location.");
        }
        return false;
    }

    public C0458i(C0455h hVar, Activity activity, String str, AdRequest adRequest, HashMap<String, String> hashMap) {
        this.f820a = hVar;
        this.f821b = str;
        this.f825f = new WeakReference<>(activity);
        this.f822c = adRequest;
        this.f823d = new HashMap<>(hashMap);
    }

    public void run() {
        try {
            C0508b.m1026a("Trying to instantiate: " + this.f821b);
            m768a((MediationAdapter) C0453g.m749a(this.f821b, MediationAdapter.class));
        } catch (ClassNotFoundException e) {
            m769a("Cannot find adapter class '" + this.f821b + "'. Did you link the ad network's mediation adapter? Skipping ad network.", e, C0453g.C0454a.NOT_FOUND);
        } catch (Throwable th) {
            m769a("Error while creating adapter and loading ad from ad network. Skipping ad network.", th, C0453g.C0454a.EXCEPTION);
        }
    }

    /* renamed from: a */
    private void m769a(String str, Throwable th, C0453g.C0454a aVar) {
        C0508b.m1031b(str, th);
        this.f820a.mo3594a(false, aVar);
    }

    /* renamed from: a */
    private <T extends NetworkExtras, U extends MediationServerParameters> void m768a(MediationAdapter<T, U> mediationAdapter) throws MediationServerParameters.MappingException, C0459a, IllegalAccessException, InstantiationException {
        MediationServerParameters mediationServerParameters;
        NetworkExtras networkExtras;
        Activity activity = (Activity) this.f825f.get();
        if (activity == null) {
            throw new C0459a("Activity became null while trying to instantiate adapter.");
        }
        this.f820a.mo3593a((MediationAdapter<?, ?>) mediationAdapter);
        Class<U> serverParametersType = mediationAdapter.getServerParametersType();
        if (serverParametersType != null) {
            MediationServerParameters mediationServerParameters2 = (MediationServerParameters) serverParametersType.newInstance();
            mediationServerParameters2.load(this.f823d);
            mediationServerParameters = mediationServerParameters2;
        } else {
            mediationServerParameters = null;
        }
        Class<T> additionalParametersType = mediationAdapter.getAdditionalParametersType();
        if (additionalParametersType != null) {
            networkExtras = (NetworkExtras) this.f822c.getNetworkExtras(additionalParametersType);
        } else {
            networkExtras = null;
        }
        MediationAdRequest mediationAdRequest = new MediationAdRequest(this.f822c, activity, this.f824e);
        if (this.f820a.f803a.mo3767a()) {
            if (!(mediationAdapter instanceof MediationInterstitialAdapter)) {
                throw new C0459a("Adapter " + this.f821b + " doesn't support the MediationInterstitialAdapter" + " interface.");
            }
            ((MediationInterstitialAdapter) mediationAdapter).requestInterstitialAd(new C0488k(this.f820a), activity, mediationServerParameters, mediationAdRequest, networkExtras);
        } else if (!(mediationAdapter instanceof MediationBannerAdapter)) {
            throw new C0459a("Adapter " + this.f821b + " doesn't support the MediationBannerAdapter interface");
        } else {
            ((MediationBannerAdapter) mediationAdapter).requestBannerAd(new C0487j(this.f820a), activity, mediationServerParameters, this.f820a.f803a.mo3768b(), mediationAdRequest, networkExtras);
        }
        this.f820a.mo3604k();
    }
}
