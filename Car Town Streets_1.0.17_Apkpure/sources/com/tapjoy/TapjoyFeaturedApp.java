package com.tapjoy;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.google.android.gms.drive.DriveFile;
/* loaded from: classes.dex */
public class TapjoyFeaturedApp {
    private static TapjoyFeaturedAppNotifier featuredAppNotifier;
    public static String featuredAppURLParams;
    private static TapjoyURLConnection tapjoyURLConnection = null;
    private Context context;
    private String currencyID;
    private TapjoyFeaturedAppObject featuredAppObject = null;
    private int displayCount = 5;
    final String TAPJOY_FEATURED_APP = "Full Screen Ad";

    public TapjoyFeaturedApp(Context ctx) {
        this.context = ctx;
        tapjoyURLConnection = new TapjoyURLConnection();
    }

    public void getFeaturedApp(TapjoyFeaturedAppNotifier notifier) {
        TapjoyLog.i("Full Screen Ad", "Getting Full Screen Ad");
        getFeaturedApp(null, notifier);
    }

    public void getFeaturedApp(String theCurrencyID, TapjoyFeaturedAppNotifier notifier) {
        this.currencyID = theCurrencyID;
        TapjoyLog.i("Full Screen Ad", "Getting Full Screen Ad userID: " + TapjoyConnectCore.getUserID() + ", currencyID: " + this.currencyID);
        featuredAppNotifier = notifier;
        this.featuredAppObject = new TapjoyFeaturedAppObject();
        featuredAppURLParams = TapjoyConnectCore.getURLParams();
        featuredAppURLParams += "&publisher_user_id=" + TapjoyConnectCore.getUserID();
        if (this.currencyID != null) {
            featuredAppURLParams += "&currency_id=" + this.currencyID;
        }
        new Thread(new Runnable() { // from class: com.tapjoy.TapjoyFeaturedApp.1
            @Override // java.lang.Runnable
            public void run() {
                boolean returnValue = false;
                String response = TapjoyFeaturedApp.tapjoyURLConnection.connectToURL("https://ws.tapjoyads.com/get_offers/featured?", TapjoyFeaturedApp.featuredAppURLParams);
                if (response != null) {
                    returnValue = TapjoyFeaturedApp.this.buildResponse(response);
                }
                if (!returnValue) {
                    TapjoyFeaturedApp.featuredAppNotifier.getFeaturedAppResponseFailed("Error retrieving full screen ad data from the server.");
                }
            }
        }).start();
    }

    public void showFeaturedAppFullScreenAd() {
        String fullscreenURL = "";
        if (this.featuredAppObject != null) {
            fullscreenURL = this.featuredAppObject.fullScreenAdURL;
        }
        TapjoyLog.i("Full Screen Ad", "Displaying Full Screen AD with URL: " + fullscreenURL);
        if (fullscreenURL.length() != 0) {
            String urlParams = TapjoyConnectCore.getURLParams();
            if (this.currencyID != null && this.currencyID.length() > 0) {
                urlParams = urlParams + "&currency_id=" + this.currencyID;
            }
            Intent featuredAppIntent = new Intent(this.context, TapjoyFeaturedAppWebView.class);
            featuredAppIntent.setFlags(DriveFile.MODE_READ_ONLY);
            featuredAppIntent.putExtra(TapjoyConstants.EXTRA_USER_ID, TapjoyConnectCore.getUserID());
            featuredAppIntent.putExtra(TapjoyConstants.EXTRA_URL_PARAMS, urlParams);
            featuredAppIntent.putExtra(TapjoyConstants.EXTRA_FEATURED_APP_FULLSCREEN_AD_URL, fullscreenURL);
            this.context.startActivity(featuredAppIntent);
        }
    }

    public void setDisplayCount(int count) {
        this.displayCount = count;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Removed duplicated region for block: B:12:0x0181  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x01d2  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean buildResponse(java.lang.String r11) {
        /*
            Method dump skipped, instructions count: 475
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.tapjoy.TapjoyFeaturedApp.buildResponse(java.lang.String):boolean");
    }

    private int getDisplayCountForStoreID(String storeID) {
        SharedPreferences settings = this.context.getSharedPreferences(TapjoyConstants.TJC_FEATURED_APP_PREFERENCE, 0);
        int count = settings.getInt(storeID, 0);
        TapjoyLog.i("Full Screen Ad", "getDisplayCount: " + count + ", storeID: " + storeID);
        return count;
    }

    private void incrementDisplayCountForStoreID(String storeID) {
        SharedPreferences settings = this.context.getSharedPreferences(TapjoyConstants.TJC_FEATURED_APP_PREFERENCE, 0);
        SharedPreferences.Editor editor = settings.edit();
        int count = settings.getInt(storeID, 0) + 1;
        TapjoyLog.i("Full Screen Ad", "incrementDisplayCount: " + count + ", storeID: " + storeID);
        editor.putInt(storeID, count);
        editor.commit();
    }

    public TapjoyFeaturedAppObject getFeaturedAppObject() {
        return this.featuredAppObject;
    }
}
