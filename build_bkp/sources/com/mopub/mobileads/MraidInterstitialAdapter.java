package com.mopub.mobileads;

import android.app.Activity;
import android.content.Intent;

public class MraidInterstitialAdapter extends BaseInterstitialAdapter {
    public void loadInterstitial() {
        if (this.mAdapterListener != null) {
            this.mAdapterListener.onNativeInterstitialLoaded(this);
        }
    }

    public void showInterstitial() {
        Activity activity = this.mInterstitial.getActivity();
        Intent i = new Intent(activity, MraidActivity.class);
        i.putExtra("com.mopub.mobileads.Source", this.mJsonParams);
        activity.startActivity(i);
    }
}
