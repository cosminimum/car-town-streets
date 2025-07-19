package com.miniclip.nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import com.google.ads.AdListener;
import com.google.ads.AdRequest;
import com.google.ads.C0423Ad;
import com.google.ads.InterstitialAd;
import com.mopub.mobileads.MoPubInterstitial;

public class MopubInterstitial implements MoPubInterstitial.MoPubInterstitialListener, AdListener {
    private InterstitialAd interstitialn;
    private Context mContext;
    private Boolean showOnLoad = false;
    private int state = 0;

    public MopubInterstitial(Context context) {
        this.mContext = context;
    }

    public void loadInterstitialAd() {
        this.state = 1;
        this.interstitialn = new InterstitialAd((Activity) this.mContext, ((cocojava) this.mContext).getMoPubFullScreenInterstitialId());
        AdRequest adRequest = new AdRequest();
        adRequest.addTestDevice("D579FE21B1D06263659D782107D111D3");
        adRequest.addTestDevice("EB6192601108B8711C1D22A99293DD07");
        adRequest.addTestDevice("4EAB4B0CAE6A7C3F6D0AA4968C3F7B0D");
        this.interstitialn.setAdListener(this);
        this.interstitialn.loadAd(adRequest);
    }

    public void showInterstitialAd() {
        if (this.state == -1) {
            Log.i("MopubInterstitial", "no ad available");
        } else if (this.state == 0) {
            this.showOnLoad = true;
            loadInterstitialAd();
            Log.i("MopubInterstitial", "start loading then will show ad");
        } else if (this.state == 1) {
            this.showOnLoad = true;
            Log.i("MopubInterstitial", "ad still loading will show on load");
        } else if (this.state == 2) {
            this.interstitialn.show();
            this.state = 3;
        }
    }

    public Boolean hasFinished() {
        if (this.state == 3) {
            return true;
        }
        return false;
    }

    public void OnInterstitialLoaded() {
    }

    public void OnInterstitialFailed() {
        this.state = -1;
        Log.i("MopubInterstitial", "No interstitial ad available");
    }

    public void onDismissScreen(C0423Ad arg0) {
    }

    public void onFailedToReceiveAd(C0423Ad arg0, AdRequest.ErrorCode arg1) {
        this.state = -1;
        Log.i("MopubInterstitial", "No interstitial ad available");
    }

    public void onLeaveApplication(C0423Ad arg0) {
    }

    public void onPresentScreen(C0423Ad arg0) {
    }

    public void onReceiveAd(C0423Ad arg0) {
        this.state = 2;
        if (this.showOnLoad.booleanValue()) {
            this.interstitialn.show();
            this.state = 3;
        }
    }
}
