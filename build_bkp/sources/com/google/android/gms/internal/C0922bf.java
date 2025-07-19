package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.AdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;

/* renamed from: com.google.android.gms.internal.bf */
public final class C0922bf<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> implements MediationBannerListener, MediationInterstitialListener {
    /* access modifiers changed from: private */

    /* renamed from: gi */
    public final C0918bd f2218gi;

    public C0922bf(C0918bd bdVar) {
        this.f2218gi = bdVar;
    }

    public void onClick(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        C1004ct.m2214r("Adapter called onClick.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onClick must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.mo7087w();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdClicked.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.mo7087w();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdClicked.", e);
        }
    }

    public void onDismissScreen(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        C1004ct.m2214r("Adapter called onDismissScreen.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onDismissScreen must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdClosed();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdClosed.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdClosed();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdClosed.", e);
        }
    }

    public void onDismissScreen(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        C1004ct.m2214r("Adapter called onDismissScreen.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onDismissScreen must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdClosed();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdClosed.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdClosed();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdClosed.", e);
        }
    }

    public void onFailedToReceiveAd(MediationBannerAdapter<?, ?> mediationBannerAdapter, final AdRequest.ErrorCode errorCode) {
        C1004ct.m2214r("Adapter called onFailedToReceiveAd with error. " + errorCode);
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onFailedToReceiveAd must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdFailedToLoad(C0934bg.m2025a(errorCode));
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdFailedToLoad.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdFailedToLoad(C0934bg.m2025a(errorCode));
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdFailedToLoad.", e);
        }
    }

    public void onFailedToReceiveAd(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter, final AdRequest.ErrorCode errorCode) {
        C1004ct.m2214r("Adapter called onFailedToReceiveAd with error " + errorCode + ".");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onFailedToReceiveAd must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdFailedToLoad(C0934bg.m2025a(errorCode));
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdFailedToLoad.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdFailedToLoad(C0934bg.m2025a(errorCode));
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdFailedToLoad.", e);
        }
    }

    public void onLeaveApplication(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        C1004ct.m2214r("Adapter called onLeaveApplication.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onLeaveApplication must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdLeftApplication();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdLeftApplication.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdLeftApplication();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdLeftApplication.", e);
        }
    }

    public void onLeaveApplication(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        C1004ct.m2214r("Adapter called onLeaveApplication.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onLeaveApplication must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdLeftApplication();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdLeftApplication.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdLeftApplication();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdLeftApplication.", e);
        }
    }

    public void onPresentScreen(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        C1004ct.m2214r("Adapter called onPresentScreen.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onPresentScreen must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdOpened();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdOpened.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdOpened();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdOpened.", e);
        }
    }

    public void onPresentScreen(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        C1004ct.m2214r("Adapter called onPresentScreen.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onPresentScreen must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdOpened();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdOpened.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdOpened();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdOpened.", e);
        }
    }

    public void onReceivedAd(MediationBannerAdapter<?, ?> mediationBannerAdapter) {
        C1004ct.m2214r("Adapter called onReceivedAd.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onReceivedAd must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdLoaded();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdLoaded.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdLoaded();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdLoaded.", e);
        }
    }

    public void onReceivedAd(MediationInterstitialAdapter<?, ?> mediationInterstitialAdapter) {
        C1004ct.m2214r("Adapter called onReceivedAd.");
        if (!C1003cs.m2208ay()) {
            C1004ct.m2218v("onReceivedAd must be called on the main UI thread.");
            C1003cs.f2412iI.post(new Runnable() {
                public void run() {
                    try {
                        C0922bf.this.f2218gi.onAdLoaded();
                    } catch (RemoteException e) {
                        C1004ct.m2212b("Could not call onAdLoaded.", e);
                    }
                }
            });
            return;
        }
        try {
            this.f2218gi.onAdLoaded();
        } catch (RemoteException e) {
            C1004ct.m2212b("Could not call onAdLoaded.", e);
        }
    }
}
