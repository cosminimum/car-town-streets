package com.miniclip.cartownstreets;

import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import com.apsalar.sdk.Apsalar;
import com.flurry.android.FlurryAgent;
import com.google.analytics.tracking.android.EasyTracker;
import com.miniclip.Chartboost.Chartboost;
import com.miniclip.GetJar.GetJar;
import com.miniclip.GooglePlayServices.GooglePlayServices;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.InAppActivity;
import com.tapjoy.TapjoyConstants;
import com.tapjoy.TapjoyFeaturedAppObject;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class CarTownStreetsActivity extends InAppActivity implements GetJar.GetJarListener, GooglePlayServices.GooglePlayServicesListener {
    static final int SCREEN_ORIENTATION_SENSOR_LANDSCAPE = 6;
    static final String gameID = "";
    static final String gameKey = "";
    static final String gameName = "";
    static final String gameSecret = "";
    private static final double[] mPrices = {1.99d, 4.99d, 9.99d, 24.99d, 49.99d, 4.99d, 9.99d, 24.99d, 49.99d, 99.99d, 1.99d, 4.99d, 9.99d, 24.99d, 49.99d};
    WifiManager.WifiLock mWifiLock = null;

    @Override // com.miniclip.nativeJNI.InAppActivity
    public String getGooglePlayPublicKey() {
        return "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAmOLtspNLA93iOvbgW0vUZM92hXUd+6zvzKLDTB20i0WQ8Gk/+uGBrec6ZtPOqR59gmRrfvQa0fjvCb559mc3TCAPwJaP9xOeYFGIKRsQkKn/oUPNggMhKlRbh8/wByhGvw53dc9xRU03+RuyfoStf6OIC2nqUhbTKvRDeDalKs3eSuoPd/rwvmRfQBLABEyywZ5pcBMISpFBlOF8cAMS1NcJY4kb+tfNbKfy9sarBmhT5teKRCdEJ7fiqY9PR35VOHYsiXnS0/vkB0kE1pdPiHqIaVsml6/9q+Oypp6Xo6i82fPWqGM0sauPQlzSDbLj3DnAht40MYZf7qeLmnpuyQIDAQAB";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava
    public String[] getInAppSkus() {
        return new String[]{"com.miniclip.coins15k", "com.miniclip.coins40k", "com.miniclip.coins90k", "com.miniclip.coins225k", "com.miniclip.coins500000", "com.miniclip.cash130", "com.miniclip.cash275", "com.miniclip.cash700", "com.miniclip.cash1500", "com.miniclip.cash3750", "com.miniclip.parts300", "com.miniclip.parts875", "com.miniclip.parts1800", "com.miniclip.parts4500", "com.miniclip.parts10k"};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava
    public String getMoPubGameplayBannerId() {
        return "";
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected String getMoPubMenuBannerId() {
        return "";
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected String getMoPubBannerId() {
        return "";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava
    public String getMoPubInterstitialId() {
        return "";
    }

    @Override // com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers
    protected String getAppId() {
        return "";
    }

    @Override // com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers
    protected String getSecretKey() {
        return "";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava
    public String getFullAppURI() {
        return "market://details?id=com.miniclip.cartownstreets";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava
    public String getFullVersionGameImageId() {
        return "buynow_v2";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava
    public String getTapJoyHtmlOffer(TapjoyFeaturedAppObject featApObj) {
        return String.format("<center><p style='font-family:Impact;color:white;font-size:20px;font-name:arial;font-weight:bold'>Get %s free coins</p><img style='display: block;margin-left: auto;margin-right: auto;width:100px;height:100px;' src='%s' /><p style='font-family:Impact;color:white;font-size:20px;font-name:arial'>%s %s</p></center>", String.valueOf(featApObj.amount), featApObj.iconURL, featApObj.description, featApObj.cost);
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected String getTapjoyOfferDialogTitle(TapjoyFeaturedAppObject featuredAppObject) {
        return "";
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected String getTapjoyOfferDialogMessage(TapjoyFeaturedAppObject featuredAppObject) {
        return String.format("Download and run this app for %d free coins:\n%s", Integer.valueOf(featuredAppObject.amount), featuredAppObject.name);
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected void createCustomNotification(int nid, String title, String text, int seconds) {
        Log.i("activity", "createNotification");
        BootReceiver.setupAlarm(this, nid, title, text, seconds);
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected void cancelCustomNotification(int nid) {
        BootReceiver.removeAlarm(this, nid);
    }

    @Override // com.miniclip.nativeJNI.InAppActivity, com.miniclip.nativeJNI.cocojava, com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        mUSE_TAPJOY = false;
        mHAS_RETINA = true;
        mUSE_C2DM = true;
        mSPINNING_ANIMATION = true;
        mUSE_FACEBOOK = true;
        GooglePlayServices.Setup(this);
        super.onCreate(savedInstanceState);
        int runBefore = SharedPreferences_getInt("RUN_BEFORE");
        if (runBefore == 0) {
        }
        SharedPreferences_setInt("RUN_BEFORE", 1);
        Apsalar.startSession(this, "miniclip", "pvrJP5Py");
        FlurryAgent.onStartSession(this, "RSQ9MMVDS4KQKHW4RN2F");
        mINGAME_LANDSCAPE = true;
        mSHOW_KEYBOARD_INPUT = true;
        mKEYBOARD_INPUT_SINGLE_LINE = true;
        mKEYBOARD_FULLSCREEN = false;
        mSTORE_PENDING_PURCHASES_SIGNATURE = true;
        getWindow().addFlags(128);
        if (getResources().getDisplayMetrics().heightPixels < 480) {
            mMinimumResolutionSD = true;
        }
        mUSE_ADS = false;
        if (Build.VERSION.SDK_INT >= 9) {
            setRequestedOrientation(6);
        }
        Chartboost.onCreate(this, "52308a3916ba479948000000", "9464551ce5ceebf76f181c0eb4f0905078e1cfbe");
        Hashtable<String, Integer> items = new Hashtable<>();
        String[] itemIDs = getInAppSkus();
        for (int i = 0; i < itemIDs.length; i++) {
            items.put(itemIDs[i], Integer.valueOf((int) (mPrices[i] * 70.0d)));
        }
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected void showMiniclipViewInternal() {
        if (mLastBigAdType != 0) {
            showUpSellDialogInternal();
        }
    }

    @Override // com.miniclip.nativeJNI.cocojava
    protected void showUpSellDialogInternal() {
        mGLView.queueEvent(new Runnable() { // from class: com.miniclip.cartownstreets.CarTownStreetsActivity.1
            @Override // java.lang.Runnable
            public void run() {
                CocoJNI.MshowUpSellScreen();
            }
        });
    }

    @Override // com.miniclip.nativeJNI.cocojava
    public void logCustomEvent(String eventId, String jsonString) {
        Log.i("cocojava", String.format("logCustomEvent %s %s", eventId, jsonString));
        try {
            JSONObject json = new JSONObject(jsonString);
            Apsalar.eventJSON(eventId, json);
            HashMap<String, String> map = new HashMap<>();
            Iterator<?> keys = json.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                map.put(key, json.getString(key));
            }
            FlurryAgent.logEvent(eventId, map);
            Log.i("cocojava", "logCustomEvent Success");
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    @Override // com.miniclip.nativeJNI.cocojava, android.app.Activity
    public void onStart() {
        super.onStart();
        Chartboost.onStart();
        GooglePlayServices.gPlay.onStart();
        WifiManager wm = (WifiManager) getSystemService(TapjoyConstants.TJC_CONNECTION_TYPE_WIFI);
        this.mWifiLock = wm.createWifiLock(1, "EBPWifiLock");
        if (!this.mWifiLock.isHeld()) {
            this.mWifiLock.acquire();
        }
        Log.i("CarTownStreetsActivity", "WifiLock acquired!");
        EasyTracker.getInstance(this).activityStart(this);
    }

    @Override // com.miniclip.nativeJNI.cocojava, android.app.Activity
    public void onStop() {
        super.onStop();
        Chartboost.onStop();
        GooglePlayServices.gPlay.onStop();
        EasyTracker.getInstance(this).activityStop(this);
        if (this.mWifiLock != null && this.mWifiLock.isHeld()) {
            this.mWifiLock.release();
            Log.i("CarTownStreetsActivity", "WiFi Lock released!");
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.miniclip.nativeJNI.cocojava, com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers, android.app.Activity
    public void onDestroy() {
        super.onDestroy();
        Chartboost.onDestroy();
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        if (!Chartboost.onBackPressed()) {
            super.onBackPressed();
        }
    }

    @Override // com.miniclip.GetJar.GetJar.GetJarListener
    public void onGetJarInAppPurchase(String itemID, int managed, String title, int callback, int self, int showDialog) {
        boolean z = true;
        Log.i(getClass().getName(), "onGetJarInAppPurchase");
        mInAppCallback = callback;
        mInAppSelf = self;
        mInAppProductId = itemID;
        if (managed != 1) {
            z = false;
        }
        mInAppManaged = z;
        mInAppTitle = title;
    }

    public void sendAdxPurchaseImpl(String productId, int purchaseType) {
        String[] itemIDs = getInAppSkus();
        for (int i = 0; i < itemIDs.length; i++) {
            if (productId.equals(itemIDs[i])) {
                sendAdXEvent(purchaseType == 0 ? "SaleGetJar" : "Sale", String.valueOf(mPrices[i]), "USD");
                return;
            }
        }
    }

    public static void sendAdxPurchase(final String productId, final int purchaseType) {
        Log.i("CarTownStreetsActivity", String.format("sendAdxPurchase %s", productId));
        ((CarTownStreetsActivity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.cartownstreets.CarTownStreetsActivity.2
            @Override // java.lang.Runnable
            public void run() {
                ((CarTownStreetsActivity) CarTownStreetsActivity.mContext).sendAdxPurchaseImpl(productId, purchaseType);
            }
        });
    }

    public void sendAdXEvent(String event, String price, String currency) {
    }

    @Override // com.miniclip.GooglePlayServices.GooglePlayServices.GooglePlayServicesListener
    public void onSignInFailed() {
    }

    @Override // com.miniclip.GooglePlayServices.GooglePlayServices.GooglePlayServicesListener
    public void onSignInSucceeded() {
    }

    @Override // com.miniclip.nativeJNI.InAppActivity, com.miniclip.nativeJNI.cocojava, android.app.Activity
    public void onActivityResult(int requestCode, int responseCode, Intent intent) {
        Log.i("activity", "onActivityResult.................., req " + requestCode + " response " + responseCode);
        super.onActivityResult(requestCode, responseCode, intent);
        GooglePlayServices.gPlay.onActivityResult(requestCode, responseCode, intent);
    }
}
