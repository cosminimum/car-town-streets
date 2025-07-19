package com.google.ads.mediation.customevent;

import android.app.Activity;
import android.view.View;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.C0453g;
import com.google.ads.mediation.MediationAdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.util.C0506a;
import com.google.ads.util.C0508b;

public class CustomEventAdapter implements MediationBannerAdapter<CustomEventExtras, CustomEventServerParameters>, MediationInterstitialAdapter<CustomEventExtras, CustomEventServerParameters> {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public String f1006a;

    /* renamed from: b */
    private CustomEventBanner f1007b = null;

    /* renamed from: c */
    private C0495a f1008c = null;

    /* renamed from: d */
    private CustomEventInterstitial f1009d = null;

    /* renamed from: com.google.ads.mediation.customevent.CustomEventAdapter$a */
    private class C0495a implements CustomEventBannerListener {

        /* renamed from: b */
        private View f1011b;

        /* renamed from: c */
        private final MediationBannerListener f1012c;

        public C0495a(MediationBannerListener mediationBannerListener) {
            this.f1012c = mediationBannerListener;
        }

        public synchronized void onReceivedAd(View view) {
            C0508b.m1026a(m969b() + " called onReceivedAd.");
            this.f1011b = view;
            this.f1012c.onReceivedAd(CustomEventAdapter.this);
        }

        public void onFailedToReceiveAd() {
            C0508b.m1026a(m969b() + " called onFailedToReceiveAd().");
            this.f1012c.onFailedToReceiveAd(CustomEventAdapter.this, AdRequest.ErrorCode.NO_FILL);
        }

        public void onClick() {
            C0508b.m1026a(m969b() + " called onClick().");
            this.f1012c.onClick(CustomEventAdapter.this);
        }

        public void onPresentScreen() {
            C0508b.m1026a(m969b() + " called onPresentScreen().");
            this.f1012c.onPresentScreen(CustomEventAdapter.this);
        }

        public void onDismissScreen() {
            C0508b.m1026a(m969b() + " called onDismissScreen().");
            this.f1012c.onDismissScreen(CustomEventAdapter.this);
        }

        public synchronized void onLeaveApplication() {
            C0508b.m1026a(m969b() + " called onLeaveApplication().");
            this.f1012c.onLeaveApplication(CustomEventAdapter.this);
        }

        /* renamed from: a */
        public synchronized View mo3819a() {
            return this.f1011b;
        }

        /* renamed from: b */
        private String m969b() {
            return "Banner custom event labeled '" + CustomEventAdapter.this.f1006a + "'";
        }
    }

    public void requestBannerAd(MediationBannerListener mediationListener, Activity activity, CustomEventServerParameters serverParameters, AdSize adSize, MediationAdRequest mediationAdRequest, CustomEventExtras mediationExtras) {
        C0506a.m1015a((Object) this.f1006a);
        this.f1006a = serverParameters.label;
        String str = serverParameters.className;
        String str2 = serverParameters.parameter;
        this.f1007b = (CustomEventBanner) m966a(str, CustomEventBanner.class, this.f1006a);
        if (this.f1007b == null) {
            mediationListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
            return;
        }
        C0506a.m1015a((Object) this.f1008c);
        this.f1008c = new C0495a(mediationListener);
        try {
            this.f1007b.requestBannerAd(this.f1008c, activity, this.f1006a, str2, adSize, mediationAdRequest, mediationExtras == null ? null : mediationExtras.getExtra(this.f1006a));
        } catch (Throwable th) {
            m968a("", th);
            mediationListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
        }
    }

    public View getBannerView() {
        C0506a.m1020b((Object) this.f1008c);
        return this.f1008c.mo3819a();
    }

    /* renamed from: com.google.ads.mediation.customevent.CustomEventAdapter$b */
    private class C0496b implements CustomEventInterstitialListener {

        /* renamed from: b */
        private final MediationInterstitialListener f1014b;

        public C0496b(MediationInterstitialListener mediationInterstitialListener) {
            this.f1014b = mediationInterstitialListener;
        }

        public void onReceivedAd() {
            C0508b.m1026a(m971a() + " called onReceivedAd.");
            this.f1014b.onReceivedAd(CustomEventAdapter.this);
        }

        public void onFailedToReceiveAd() {
            C0508b.m1026a(m971a() + " called onFailedToReceiveAd().");
            this.f1014b.onFailedToReceiveAd(CustomEventAdapter.this, AdRequest.ErrorCode.NO_FILL);
        }

        public void onPresentScreen() {
            C0508b.m1026a(m971a() + " called onPresentScreen().");
            this.f1014b.onPresentScreen(CustomEventAdapter.this);
        }

        public void onDismissScreen() {
            C0508b.m1026a(m971a() + " called onDismissScreen().");
            this.f1014b.onDismissScreen(CustomEventAdapter.this);
        }

        public synchronized void onLeaveApplication() {
            C0508b.m1026a(m971a() + " called onLeaveApplication().");
            this.f1014b.onLeaveApplication(CustomEventAdapter.this);
        }

        /* renamed from: a */
        private String m971a() {
            return "Interstitial custom event labeled '" + CustomEventAdapter.this.f1006a + "'";
        }
    }

    public void showInterstitial() {
        C0506a.m1020b((Object) this.f1009d);
        try {
            this.f1009d.showInterstitial();
        } catch (Throwable th) {
            C0508b.m1031b("Exception when showing custom event labeled '" + this.f1006a + "'.", th);
        }
    }

    public void requestInterstitialAd(MediationInterstitialListener mediationListener, Activity activity, CustomEventServerParameters serverParameters, MediationAdRequest mediationAdRequest, CustomEventExtras mediationExtras) {
        C0506a.m1015a((Object) this.f1006a);
        this.f1006a = serverParameters.label;
        String str = serverParameters.className;
        String str2 = serverParameters.parameter;
        this.f1009d = (CustomEventInterstitial) m966a(str, CustomEventInterstitial.class, this.f1006a);
        if (this.f1009d == null) {
            mediationListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
            return;
        }
        try {
            this.f1009d.requestInterstitialAd(new C0496b(mediationListener), activity, this.f1006a, str2, mediationAdRequest, mediationExtras == null ? null : mediationExtras.getExtra(this.f1006a));
        } catch (Throwable th) {
            m968a("", th);
            mediationListener.onFailedToReceiveAd(this, AdRequest.ErrorCode.INTERNAL_ERROR);
        }
    }

    public Class<CustomEventExtras> getAdditionalParametersType() {
        return CustomEventExtras.class;
    }

    public Class<CustomEventServerParameters> getServerParametersType() {
        return CustomEventServerParameters.class;
    }

    public void destroy() {
        if (this.f1007b != null) {
            this.f1007b.destroy();
        }
        if (this.f1009d != null) {
            this.f1009d.destroy();
        }
    }

    /* renamed from: a */
    private void m968a(String str, Throwable th) {
        C0508b.m1031b("Error during processing of custom event with label: '" + this.f1006a + "'. Skipping custom event. " + str, th);
    }

    /* renamed from: a */
    private <T> T m966a(String str, Class<T> cls, String str2) {
        try {
            return C0453g.m749a(str, cls);
        } catch (ClassNotFoundException e) {
            m968a("Make sure you created a visible class named: " + str + ". ", e);
        } catch (ClassCastException e2) {
            m968a("Make sure your custom event implements the " + cls.getName() + " interface.", e2);
        } catch (IllegalAccessException e3) {
            m968a("Make sure the default constructor for class " + str + " is visible. ", e3);
        } catch (InstantiationException e4) {
            m968a("Make sure the name " + str + " does not denote an abstract class or an interface.", e4);
        } catch (Throwable th) {
            m968a("", th);
        }
        return null;
    }
}
