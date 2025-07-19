package com.google.ads;

import com.google.ads.AdRequest;
import com.google.ads.C0453g;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.util.C0506a;
import com.google.ads.util.C0508b;

/* renamed from: com.google.ads.k */
class C0488k implements MediationInterstitialListener {

    /* renamed from: a */
    private final C0455h f965a;

    C0488k(C0455h hVar) {
        this.f965a = hVar;
    }

    public void onReceivedAd(MediationInterstitialAdapter<?, ?> adapter) {
        synchronized (this.f965a) {
            C0506a.m1016a((Object) adapter, (Object) this.f965a.mo3602i());
            if (this.f965a.mo3596c()) {
                C0508b.m1030b("Got an onReceivedAd() callback after loadAdTask is done from an interstitial adapter. Ignoring callback.");
            } else {
                this.f965a.mo3594a(true, C0453g.C0454a.AD);
            }
        }
    }

    public void onFailedToReceiveAd(MediationInterstitialAdapter<?, ?> adapter, AdRequest.ErrorCode error) {
        synchronized (this.f965a) {
            C0506a.m1016a((Object) adapter, (Object) this.f965a.mo3602i());
            C0508b.m1026a("Mediation adapter " + adapter.getClass().getName() + " failed to receive ad with error code: " + error);
            if (this.f965a.mo3596c()) {
                C0508b.m1030b("Got an onFailedToReceiveAd() callback after loadAdTask is done from an interstitial adapter.  Ignoring callback.");
            } else {
                this.f965a.mo3594a(false, error == AdRequest.ErrorCode.NO_FILL ? C0453g.C0454a.NO_FILL : C0453g.C0454a.ERROR);
            }
        }
    }

    public void onPresentScreen(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        synchronized (this.f965a) {
            this.f965a.mo3603j().mo3568a(this.f965a);
        }
    }

    public void onDismissScreen(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        synchronized (this.f965a) {
            this.f965a.mo3603j().mo3573b(this.f965a);
        }
    }

    public void onLeaveApplication(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        synchronized (this.f965a) {
            this.f965a.mo3603j().mo3574c(this.f965a);
        }
    }
}
