package com.millennialmedia.android;

import android.content.Context;
import com.millennialmedia.android.MMAdView;
import com.millennialmedia.android.MMAdViewSDK;
import java.util.Hashtable;
/* loaded from: classes.dex */
public class MMInterstitialAd extends MMAdView {
    public MMInterstitialAd(Context context) {
        super(context, MMAdViewSDK.DEFAULT_APID, MMAdView.FULLSCREEN_AD_TRANSITION, false, (Hashtable<String, String>) null);
    }

    public void fetch(String apid, MMAdView.RequestListener listener) {
        MMAdView.Request request = new MMAdView.Request(apid, listener, true);
        if (super.check()) {
            MMAdViewSDK.Log.d("Ad already fetched and ready for display...");
            MMAdViewSDK.Event.requestFailed(getContext(), this, request, new MMError(17));
        } else if (!canRequestAd()) {
            MMAdViewSDK.Event.requestFailed(getContext(), this, request, new MMError(16));
        } else {
            MMAdViewSDK.Log.d("Fetching new ad...");
            super.requestAd(request);
        }
    }

    public boolean isAdAvailable() {
        return super.check();
    }

    public boolean display(boolean throwError) {
        try {
            int error = super.displayInternal();
            if (error == 0 || !throwError) {
                return error == 0;
            }
            throw new MMError(error);
        } catch (Exception e) {
            if (!throwError) {
                return false;
            }
            throw new MMError(e);
        }
    }

    @Override // com.millennialmedia.android.MMAdView
    public boolean display() {
        return display(false);
    }
}
