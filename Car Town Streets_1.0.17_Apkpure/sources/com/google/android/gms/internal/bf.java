package com.google.android.gms.internal;

import android.os.RemoteException;
import com.google.ads.AdRequest;
import com.google.ads.mediation.MediationBannerAdapter;
import com.google.ads.mediation.MediationBannerListener;
import com.google.ads.mediation.MediationInterstitialAdapter;
import com.google.ads.mediation.MediationInterstitialListener;
import com.google.ads.mediation.MediationServerParameters;
import com.google.ads.mediation.NetworkExtras;
/* loaded from: classes.dex */
public final class bf<NETWORK_EXTRAS extends NetworkExtras, SERVER_PARAMETERS extends MediationServerParameters> implements MediationBannerListener, MediationInterstitialListener {
    private final bd gi;

    public bf(bd bdVar) {
        this.gi = bdVar;
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onClick(MediationBannerAdapter<?, ?> adapter) {
        ct.r("Adapter called onClick.");
        if (!cs.ay()) {
            ct.v("onClick must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.w();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdClicked.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.w();
        } catch (RemoteException e) {
            ct.b("Could not call onAdClicked.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onDismissScreen(MediationBannerAdapter<?, ?> adapter) {
        ct.r("Adapter called onDismissScreen.");
        if (!cs.ay()) {
            ct.v("onDismissScreen must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.4
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdClosed();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdClosed.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdClosed();
        } catch (RemoteException e) {
            ct.b("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onDismissScreen(MediationInterstitialAdapter<?, ?> adapter) {
        ct.r("Adapter called onDismissScreen.");
        if (!cs.ay()) {
            ct.v("onDismissScreen must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.9
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdClosed();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdClosed.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdClosed();
        } catch (RemoteException e) {
            ct.b("Could not call onAdClosed.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onFailedToReceiveAd(MediationBannerAdapter<?, ?> adapter, final AdRequest.ErrorCode errorCode) {
        ct.r("Adapter called onFailedToReceiveAd with error. " + errorCode);
        if (!cs.ay()) {
            ct.v("onFailedToReceiveAd must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.5
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdFailedToLoad(bg.a(errorCode));
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdFailedToLoad.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdFailedToLoad(bg.a(errorCode));
        } catch (RemoteException e) {
            ct.b("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onFailedToReceiveAd(MediationInterstitialAdapter<?, ?> adapter, final AdRequest.ErrorCode errorCode) {
        ct.r("Adapter called onFailedToReceiveAd with error " + errorCode + ".");
        if (!cs.ay()) {
            ct.v("onFailedToReceiveAd must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.10
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdFailedToLoad(bg.a(errorCode));
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdFailedToLoad.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdFailedToLoad(bg.a(errorCode));
        } catch (RemoteException e) {
            ct.b("Could not call onAdFailedToLoad.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onLeaveApplication(MediationBannerAdapter<?, ?> adapter) {
        ct.r("Adapter called onLeaveApplication.");
        if (!cs.ay()) {
            ct.v("onLeaveApplication must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.6
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdLeftApplication();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdLeftApplication.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdLeftApplication();
        } catch (RemoteException e) {
            ct.b("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onLeaveApplication(MediationInterstitialAdapter<?, ?> adapter) {
        ct.r("Adapter called onLeaveApplication.");
        if (!cs.ay()) {
            ct.v("onLeaveApplication must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.11
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdLeftApplication();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdLeftApplication.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdLeftApplication();
        } catch (RemoteException e) {
            ct.b("Could not call onAdLeftApplication.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onPresentScreen(MediationBannerAdapter<?, ?> adapter) {
        ct.r("Adapter called onPresentScreen.");
        if (!cs.ay()) {
            ct.v("onPresentScreen must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.7
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdOpened();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdOpened.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdOpened();
        } catch (RemoteException e) {
            ct.b("Could not call onAdOpened.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onPresentScreen(MediationInterstitialAdapter<?, ?> adapter) {
        ct.r("Adapter called onPresentScreen.");
        if (!cs.ay()) {
            ct.v("onPresentScreen must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdOpened();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdOpened.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdOpened();
        } catch (RemoteException e) {
            ct.b("Could not call onAdOpened.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationBannerListener
    public void onReceivedAd(MediationBannerAdapter<?, ?> adapter) {
        ct.r("Adapter called onReceivedAd.");
        if (!cs.ay()) {
            ct.v("onReceivedAd must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.8
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdLoaded();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdLoaded.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdLoaded();
        } catch (RemoteException e) {
            ct.b("Could not call onAdLoaded.", e);
        }
    }

    @Override // com.google.ads.mediation.MediationInterstitialListener
    public void onReceivedAd(MediationInterstitialAdapter<?, ?> adapter) {
        ct.r("Adapter called onReceivedAd.");
        if (!cs.ay()) {
            ct.v("onReceivedAd must be called on the main UI thread.");
            cs.iI.post(new Runnable() { // from class: com.google.android.gms.internal.bf.3
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        bf.this.gi.onAdLoaded();
                    } catch (RemoteException e) {
                        ct.b("Could not call onAdLoaded.", e);
                    }
                }
            });
            return;
        }
        try {
            this.gi.onAdLoaded();
        } catch (RemoteException e) {
            ct.b("Could not call onAdLoaded.", e);
        }
    }
}
