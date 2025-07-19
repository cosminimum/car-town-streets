package com.flurry.android;

import android.content.Context;
import android.view.View;
import java.util.List;

public class AppCircle {
    public void launchCanvasOnBannerClicked(boolean z) {
        FlurryAgent.m482a(z);
    }

    public void launchCatalogOnBannerClicked(boolean z) {
        FlurryAgent.m482a(z);
    }

    public boolean isLaunchCanvasOnBannerClicked() {
        return FlurryAgent.m483a();
    }

    public boolean isLaunchCatalogOnBannerClicked() {
        return FlurryAgent.m483a();
    }

    public View getHook(Context context, String str, int i) {
        return FlurryAgent.m467a(context, str, i);
    }

    public void openCatalog(Context context) {
        openCatalog(context, "");
    }

    public void openCatalog(Context context, String str) {
        FlurryAgent.m472a(context, str);
    }

    public boolean hasAds() {
        return FlurryAgent.m504d();
    }

    public Offer getOffer() {
        return getOffer("");
    }

    public Offer getOffer(String str) {
        return FlurryAgent.m468a(str);
    }

    public List getAllOffers() {
        return FlurryAgent.m490b("");
    }

    public List getAllOffers(String str) {
        return FlurryAgent.m490b(str);
    }

    public void acceptOffer(Context context, long j) {
        FlurryAgent.m471a(context, j);
    }

    public void removeOffers(List list) {
        FlurryAgent.m481a(list);
    }

    public void setDefaultNoAdsMessage(String str) {
        FlurryAgent.setDefaultNoAdsMessage(str);
    }

    public void setAppCircleCallback(AppCircleCallback appCircleCallback) {
        FlurryAgent.m474a(appCircleCallback);
    }

    public void addUserCookie(String str, String str2) {
        FlurryAgent.addUserCookie(str, str2);
    }

    public void clearUserCookies() {
        FlurryAgent.clearUserCookies();
    }
}
