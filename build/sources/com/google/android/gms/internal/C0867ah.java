package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.doubleclick.AppEventListener;

/* renamed from: com.google.android.gms.internal.ah */
public final class C0867ah {

    /* renamed from: eI */
    private AppEventListener f1936eI;

    /* renamed from: eK */
    private String f1937eK;

    /* renamed from: eW */
    private final C0911ba f1938eW = new C0911ba();

    /* renamed from: eX */
    private C0855ac f1939eX;

    /* renamed from: ev */
    private AdListener f1940ev;
    private final Context mContext;

    public C0867ah(Context context) {
        this.mContext = context;
    }

    /* renamed from: j */
    private void m1941j(String str) throws RemoteException {
        if (this.f1937eK == null) {
            m1942k(str);
        }
        this.f1939eX = C1463u.m4069a(this.mContext, new C1466x(), this.f1937eK, this.f1938eW);
        if (this.f1940ev != null) {
            this.f1939eX.mo6996a((C0852ab) new C1462t(this.f1940ev));
        }
        if (this.f1936eI != null) {
            this.f1939eX.mo6997a((C0861ae) new C1468z(this.f1936eI));
        }
    }

    /* renamed from: k */
    private void m1942k(String str) {
        if (this.f1939eX == null) {
            throw new IllegalStateException("The ad unit ID must be set on InterstitialAd before " + str + " is called.");
        }
    }

    /* renamed from: a */
    public void mo7053a(C0864af afVar) {
        try {
            if (this.f1939eX == null) {
                m1941j("loadAd");
            }
            if (this.f1939eX.mo6999a(new C1464v(this.mContext, afVar))) {
                this.f1938eW.mo7094c(afVar.mo7019R());
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to load ad.", e);
        }
    }

    public AdListener getAdListener() {
        return this.f1940ev;
    }

    public String getAdUnitId() {
        return this.f1937eK;
    }

    public AppEventListener getAppEventListener() {
        return this.f1936eI;
    }

    public boolean isLoaded() {
        try {
            if (this.f1939eX == null) {
                return false;
            }
            return this.f1939eX.isReady();
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to check if ad is ready.", e);
            return false;
        }
    }

    public void setAdListener(AdListener adListener) {
        try {
            this.f1940ev = adListener;
            if (this.f1939eX != null) {
                this.f1939eX.mo6996a((C0852ab) adListener != null ? new C1462t(adListener) : null);
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to set the AdListener.", e);
        }
    }

    public void setAdUnitId(String adUnitId) {
        if (this.f1937eK != null) {
            throw new IllegalStateException("The ad unit ID can only be set once on InterstitialAd.");
        }
        this.f1937eK = adUnitId;
    }

    public void setAppEventListener(AppEventListener appEventListener) {
        try {
            this.f1936eI = appEventListener;
            if (this.f1939eX != null) {
                this.f1939eX.mo6997a((C0861ae) appEventListener != null ? new C1468z(appEventListener) : null);
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to set the AppEventListener.", e);
        }
    }

    public void show() {
        try {
            m1942k("show");
            this.f1939eX.showInterstitial();
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to show interstitial.", e);
        }
    }
}
