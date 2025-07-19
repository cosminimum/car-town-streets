package com.millennialmedia.android;

import android.util.Log;
import com.millennialmedia.android.MMAdView;

public class BasicMMAdListener implements MMAdView.MMAdListener {
    public void MMAdFailed(MMAdView adview) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View request failed");
    }

    public void MMAdReturned(MMAdView adview) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View request succeeded");
    }

    public void MMAdClickedToNewBrowser(MMAdView adview) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View clicked and launched new browser");
    }

    public void MMAdClickedToOverlay(MMAdView adview) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View clicked to overlay");
    }

    public void MMAdOverlayLaunched(MMAdView adview) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View overlay launched");
    }

    public void MMAdRequestIsCaching(MMAdView adview) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View caching request");
    }

    public void MMAdCachingCompleted(MMAdView adview, boolean success) {
        Log.i(MMAdViewSDK.SDKLOG, "Millennial Media Ad View caching request completed successfully: " + success);
    }
}
