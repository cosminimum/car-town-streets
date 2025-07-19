package com.google.android.gms.internal;

import android.content.Context;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.ads.AdListener;
import com.google.android.gms.ads.AdSize;
import com.google.android.gms.ads.doubleclick.AppEventListener;
import com.google.android.gms.dynamic.C0772b;
import com.google.android.gms.dynamic.C0775c;

/* renamed from: com.google.android.gms.internal.ag */
public final class C0866ag {

    /* renamed from: eI */
    private AppEventListener f1929eI;

    /* renamed from: eJ */
    private AdSize[] f1930eJ;

    /* renamed from: eK */
    private String f1931eK;

    /* renamed from: eW */
    private final C0911ba f1932eW = new C0911ba();

    /* renamed from: eX */
    private C0855ac f1933eX;

    /* renamed from: eY */
    private ViewGroup f1934eY;

    /* renamed from: ev */
    private AdListener f1935ev;

    public C0866ag(ViewGroup viewGroup) {
        this.f1934eY = viewGroup;
    }

    public C0866ag(ViewGroup viewGroup, AttributeSet attributeSet, boolean z) {
        this.f1934eY = viewGroup;
        Context context = viewGroup.getContext();
        try {
            C0851aa aaVar = new C0851aa(context, attributeSet);
            this.f1930eJ = aaVar.mo6985c(z);
            this.f1931eK = aaVar.getAdUnitId();
            if (viewGroup.isInEditMode()) {
                C1003cs.m2204a(viewGroup, new C1466x(context, this.f1930eJ[0]), "Ads by Google");
            }
        } catch (IllegalArgumentException e) {
            C1003cs.m2206a(viewGroup, new C1466x(context, AdSize.BANNER), e.getMessage(), e.getMessage());
        }
    }

    /* renamed from: T */
    private void m1937T() {
        try {
            C0772b x = this.f1933eX.mo7006x();
            if (x != null) {
                this.f1934eY.addView((View) C0775c.m1695b(x));
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to get an ad frame.", e);
        }
    }

    /* renamed from: U */
    private void m1938U() throws RemoteException {
        if ((this.f1930eJ == null || this.f1931eK == null) && this.f1933eX == null) {
            throw new IllegalStateException("The ad size and ad unit ID must be set before loadAd is called.");
        }
        Context context = this.f1934eY.getContext();
        this.f1933eX = C1463u.m4069a(context, new C1466x(context, this.f1930eJ), this.f1931eK, this.f1932eW);
        if (this.f1935ev != null) {
            this.f1933eX.mo6996a((C0852ab) new C1462t(this.f1935ev));
        }
        if (this.f1929eI != null) {
            this.f1933eX.mo6997a((C0861ae) new C1468z(this.f1929eI));
        }
        m1937T();
    }

    /* renamed from: a */
    public void mo7038a(C0864af afVar) {
        try {
            if (this.f1933eX == null) {
                m1938U();
            }
            if (this.f1933eX.mo6999a(new C1464v(this.f1934eY.getContext(), afVar))) {
                this.f1932eW.mo7094c(afVar.mo7019R());
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to load ad.", e);
        }
    }

    /* renamed from: a */
    public void mo7039a(AdSize... adSizeArr) {
        this.f1930eJ = adSizeArr;
        try {
            if (this.f1933eX != null) {
                this.f1933eX.mo6998a(new C1466x(this.f1934eY.getContext(), this.f1930eJ));
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to set the ad size.", e);
        }
        this.f1934eY.requestLayout();
    }

    public void destroy() {
        try {
            if (this.f1933eX != null) {
                this.f1933eX.destroy();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to destroy AdView.", e);
        }
    }

    public AdListener getAdListener() {
        return this.f1935ev;
    }

    public AdSize getAdSize() {
        try {
            if (this.f1933eX != null) {
                return this.f1933eX.mo7007y().mo8835P();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to get the current AdSize.", e);
        }
        if (this.f1930eJ != null) {
            return this.f1930eJ[0];
        }
        return null;
    }

    public AdSize[] getAdSizes() {
        return this.f1930eJ;
    }

    public String getAdUnitId() {
        return this.f1931eK;
    }

    public AppEventListener getAppEventListener() {
        return this.f1929eI;
    }

    public void pause() {
        try {
            if (this.f1933eX != null) {
                this.f1933eX.pause();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to call pause.", e);
        }
    }

    public void recordManualImpression() {
        try {
            this.f1933eX.mo6995H();
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to record impression.", e);
        }
    }

    public void resume() {
        try {
            if (this.f1933eX != null) {
                this.f1933eX.resume();
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to call resume.", e);
        }
    }

    public void setAdListener(AdListener adListener) {
        try {
            this.f1935ev = adListener;
            if (this.f1933eX != null) {
                this.f1933eX.mo6996a((C0852ab) adListener != null ? new C1462t(adListener) : null);
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to set the AdListener.", e);
        }
    }

    public void setAdSizes(AdSize... adSizes) {
        if (this.f1930eJ != null) {
            throw new IllegalStateException("The ad size can only be set once on AdView.");
        }
        mo7039a(adSizes);
    }

    public void setAdUnitId(String adUnitId) {
        if (this.f1931eK != null) {
            throw new IllegalStateException("The ad unit ID can only be set once on AdView.");
        }
        this.f1931eK = adUnitId;
    }

    public void setAppEventListener(AppEventListener appEventListener) {
        try {
            this.f1929eI = appEventListener;
            if (this.f1933eX != null) {
                this.f1933eX.mo6997a((C0861ae) appEventListener != null ? new C1468z(appEventListener) : null);
            }
        } catch (RemoteException e) {
            C1004ct.m2212b("Failed to set the AppEventListener.", e);
        }
    }
}
