package com.tapjoy;

import android.content.Context;
import android.util.Log;
import java.util.Hashtable;

public final class TapjoyConnect {
    public static final String TAPJOY_CONNECT = "TapjoyConnect";
    private static TapjoyConnect tapjoyConnectInstance = null;
    private static TapjoyDisplayAd tapjoyDisplayAd = null;
    private static TapjoyEvent tapjoyEvent = null;
    private static TapjoyFeaturedApp tapjoyFeaturedApp = null;
    private static TJCOffers tapjoyOffers = null;
    private static TapjoyReEngagementAd tapjoyReEngagementAd = null;
    private static TapjoyVideo tapjoyVideo = null;

    public static void requestTapjoyConnect(Context context, String appID, String secretKey) {
        requestTapjoyConnect(context, appID, secretKey, (Hashtable<String, String>) null);
    }

    public static void requestTapjoyConnect(Context context, String appID, String secretKey, Hashtable<String, String> flags) {
        TapjoyConnectCore.setSDKType(TapjoyConstants.TJC_SDK_TYPE_OFFERS);
        TapjoyConnectCore.setPlugin(TapjoyConstants.TJC_PLUGIN_NATIVE);
        tapjoyConnectInstance = new TapjoyConnect(context, appID, secretKey, flags);
        tapjoyOffers = new TJCOffers(context);
        tapjoyFeaturedApp = new TapjoyFeaturedApp(context);
        tapjoyDisplayAd = new TapjoyDisplayAd(context);
        tapjoyVideo = new TapjoyVideo(context);
        tapjoyEvent = new TapjoyEvent(context);
        tapjoyReEngagementAd = new TapjoyReEngagementAd(context);
    }

    public static TapjoyConnect getTapjoyConnectInstance() {
        if (tapjoyConnectInstance == null) {
            Log.e("TapjoyConnect", "----------------------------------------");
            Log.e("TapjoyConnect", "ERROR -- call requestTapjoyConnect before any other Tapjoy methods");
            Log.e("TapjoyConnect", "----------------------------------------");
        }
        return tapjoyConnectInstance;
    }

    private TapjoyConnect(Context context, String appID, String secretKey, Hashtable<String, String> flags) {
        TapjoyConnectCore.requestTapjoyConnect(context, appID, secretKey, flags);
    }

    public void setUserID(String userID) {
        TapjoyConnectCore.setUserID(userID);
    }

    public String getUserID() {
        return TapjoyConnectCore.getUserID();
    }

    public String getAppID() {
        return TapjoyConnectCore.getAppID();
    }

    public void enablePaidAppWithActionID(String paidAppPayPerActionID) {
        TapjoyConnectCore.getInstance().enablePaidAppWithActionID(paidAppPayPerActionID);
    }

    public void setCurrencyMultiplier(float multiplier) {
        TapjoyConnectCore.getInstance().setCurrencyMultiplier(multiplier);
    }

    public float getCurrencyMultiplier() {
        return TapjoyConnectCore.getInstance().getCurrencyMultiplier();
    }

    public void actionComplete(String actionID) {
        TapjoyConnectCore.getInstance().actionComplete(actionID);
    }

    public void showOffers() {
        tapjoyOffers.showOffers();
    }

    public void showOffersWithCurrencyID(String currencyID, boolean enableCurrencySelector) {
        tapjoyOffers.showOffersWithCurrencyID(currencyID, enableCurrencySelector);
    }

    public void getTapPoints(TapjoyNotifier notifier) {
        tapjoyOffers.getTapPoints(notifier);
    }

    public void spendTapPoints(int amount, TapjoySpendPointsNotifier notifier) {
        tapjoyOffers.spendTapPoints(amount, notifier);
    }

    public void awardTapPoints(int amount, TapjoyAwardPointsNotifier notifier) {
        tapjoyOffers.awardTapPoints(amount, notifier);
    }

    public void setEarnedPointsNotifier(TapjoyEarnedPointsNotifier notifier) {
        tapjoyOffers.setEarnedPointsNotifier(notifier);
    }

    public void getFeaturedApp(TapjoyFeaturedAppNotifier notifier) {
        tapjoyFeaturedApp.getFeaturedApp(notifier);
    }

    public void getFeaturedAppWithCurrencyID(String currencyID, TapjoyFeaturedAppNotifier notifier) {
        tapjoyFeaturedApp.getFeaturedApp(currencyID, notifier);
    }

    public void setFeaturedAppDisplayCount(int count) {
        tapjoyFeaturedApp.setDisplayCount(count);
    }

    public void showFeaturedAppFullScreenAd() {
        tapjoyFeaturedApp.showFeaturedAppFullScreenAd();
    }

    public void getReEngagementAd(TapjoyReEngagementAdNotifier notifier) {
        tapjoyReEngagementAd.getReEngagementAd(notifier);
    }

    public void getReEngagementAdWithCurrencyID(String currencyID, TapjoyReEngagementAdNotifier notifier) {
        tapjoyReEngagementAd.getReEngagementAdWithCurrencyID(currencyID, notifier);
    }

    public void showReEngagementFullScreenAd() {
        tapjoyReEngagementAd.showReEngagementFullScreenAd();
    }

    public void setBannerAdSize(String dimensions) {
        tapjoyDisplayAd.setBannerAdSize(dimensions);
    }

    public void enableBannerAdAutoRefresh(boolean shouldAutoRefresh) {
        tapjoyDisplayAd.enableAutoRefresh(shouldAutoRefresh);
    }

    public void getDisplayAd(TapjoyDisplayAdNotifier notifier) {
        tapjoyDisplayAd.getDisplayAd(notifier);
    }

    public void getDisplayAdWithCurrencyID(String currencyID, TapjoyDisplayAdNotifier notifier) {
        tapjoyDisplayAd.getDisplayAd(currencyID, notifier);
    }

    public void initVideoAd(TapjoyVideoNotifier notifier) {
        tapjoyVideo.initVideoAd(notifier);
    }

    public void setVideoCacheCount(int count) {
        tapjoyVideo.setVideoCacheCount(count);
    }

    public void enableVideoCache(boolean enable) {
        tapjoyVideo.enableVideoCache(enable);
    }

    public void sendShutDownEvent() {
        tapjoyEvent.sendShutDownEvent();
    }

    public void sendIAPEvent(String name, float price, int quantity, String currencyCode) {
        tapjoyEvent.sendIAPEvent(name, price, quantity, currencyCode);
    }
}
