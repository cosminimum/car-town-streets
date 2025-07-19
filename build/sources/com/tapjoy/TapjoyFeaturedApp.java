package com.tapjoy;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import com.google.android.gms.drive.DriveFile;
import java.io.ByteArrayInputStream;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;

public class TapjoyFeaturedApp {
    /* access modifiers changed from: private */
    public static TapjoyFeaturedAppNotifier featuredAppNotifier;
    public static String featuredAppURLParams;
    /* access modifiers changed from: private */
    public static TapjoyURLConnection tapjoyURLConnection = null;
    final String TAPJOY_FEATURED_APP = "Full Screen Ad";
    private Context context;
    private String currencyID;
    private int displayCount = 5;
    private TapjoyFeaturedAppObject featuredAppObject = null;

    public TapjoyFeaturedApp(Context ctx) {
        this.context = ctx;
        tapjoyURLConnection = new TapjoyURLConnection();
    }

    public void getFeaturedApp(TapjoyFeaturedAppNotifier notifier) {
        TapjoyLog.m4436i("Full Screen Ad", "Getting Full Screen Ad");
        getFeaturedApp((String) null, notifier);
    }

    public void getFeaturedApp(String theCurrencyID, TapjoyFeaturedAppNotifier notifier) {
        this.currencyID = theCurrencyID;
        TapjoyLog.m4436i("Full Screen Ad", "Getting Full Screen Ad userID: " + TapjoyConnectCore.getUserID() + ", currencyID: " + this.currencyID);
        featuredAppNotifier = notifier;
        this.featuredAppObject = new TapjoyFeaturedAppObject();
        featuredAppURLParams = TapjoyConnectCore.getURLParams();
        featuredAppURLParams += "&publisher_user_id=" + TapjoyConnectCore.getUserID();
        if (this.currencyID != null) {
            featuredAppURLParams += "&currency_id=" + this.currencyID;
        }
        new Thread(new Runnable() {
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
        TapjoyLog.m4436i("Full Screen Ad", "Displaying Full Screen AD with URL: " + fullscreenURL);
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

    /* access modifiers changed from: private */
    public boolean buildResponse(String response) {
        boolean retValue = false;
        DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
        try {
            Document document = factory.newDocumentBuilder().parse(new ByteArrayInputStream(response.getBytes("UTF-8")));
            this.featuredAppObject.cost = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Cost"));
            String amount = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Amount"));
            if (amount != null) {
                this.featuredAppObject.amount = Integer.parseInt(amount);
            }
            this.featuredAppObject.description = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Description"));
            this.featuredAppObject.iconURL = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("IconURL"));
            this.featuredAppObject.name = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("Name"));
            this.featuredAppObject.redirectURL = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("RedirectURL"));
            this.featuredAppObject.storeID = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("StoreID"));
            this.featuredAppObject.fullScreenAdURL = TapjoyUtil.getNodeTrimValue(document.getElementsByTagName("FullScreenAdURL"));
            TapjoyLog.m4436i("Full Screen Ad", "cost: " + this.featuredAppObject.cost);
            TapjoyLog.m4436i("Full Screen Ad", "amount: " + this.featuredAppObject.amount);
            TapjoyLog.m4436i("Full Screen Ad", "description: " + this.featuredAppObject.description);
            TapjoyLog.m4436i("Full Screen Ad", "iconURL: " + this.featuredAppObject.iconURL);
            TapjoyLog.m4436i("Full Screen Ad", "name: " + this.featuredAppObject.name);
            TapjoyLog.m4436i("Full Screen Ad", "redirectURL: " + this.featuredAppObject.redirectURL);
            TapjoyLog.m4436i("Full Screen Ad", "storeID: " + this.featuredAppObject.storeID);
            TapjoyLog.m4436i("Full Screen Ad", "fullScreenAdURL: " + this.featuredAppObject.fullScreenAdURL);
            if (this.featuredAppObject.fullScreenAdURL == null || this.featuredAppObject.fullScreenAdURL.length() == 0) {
                retValue = false;
            } else {
                retValue = true;
            }
        } catch (Exception e) {
            TapjoyLog.m4435e("Full Screen Ad", "Error parsing XML: " + e.toString());
        }
        if (!retValue) {
            featuredAppNotifier.getFeaturedAppResponseFailed("Failed to parse XML file from response");
            return true;
        } else if (getDisplayCountForStoreID(this.featuredAppObject.storeID) < this.displayCount) {
            featuredAppNotifier.getFeaturedAppResponse(this.featuredAppObject);
            if (TapjoyConnectCore.getAppID().equals(this.featuredAppObject.storeID)) {
                return retValue;
            }
            incrementDisplayCountForStoreID(this.featuredAppObject.storeID);
            return retValue;
        } else {
            featuredAppNotifier.getFeaturedAppResponseFailed("Full Screen Ad to display has exceeded display count");
            return retValue;
        }
    }

    private int getDisplayCountForStoreID(String storeID) {
        int count = this.context.getSharedPreferences(TapjoyConstants.TJC_FEATURED_APP_PREFERENCE, 0).getInt(storeID, 0);
        TapjoyLog.m4436i("Full Screen Ad", "getDisplayCount: " + count + ", storeID: " + storeID);
        return count;
    }

    private void incrementDisplayCountForStoreID(String storeID) {
        SharedPreferences settings = this.context.getSharedPreferences(TapjoyConstants.TJC_FEATURED_APP_PREFERENCE, 0);
        SharedPreferences.Editor editor = settings.edit();
        int count = settings.getInt(storeID, 0) + 1;
        TapjoyLog.m4436i("Full Screen Ad", "incrementDisplayCount: " + count + ", storeID: " + storeID);
        editor.putInt(storeID, count);
        editor.commit();
    }

    public TapjoyFeaturedAppObject getFeaturedAppObject() {
        return this.featuredAppObject;
    }
}
