package com.res.recartownstreets.core;

import android.content.Intent;
import android.net.wifi.WifiManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;

import GooglePlayServices.GooglePlayServices;
import nativeJNI.CocoJNI;
import nativeJNI.InAppActivity;
import tapjoy.TapjoyConstants;
import tapjoy.TapjoyFeaturedAppObject;

import org.json.JSONException;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.Map;

public class CarTownStreetsActivity extends InAppActivity implements GooglePlayServices.GooglePlayServicesListener {
    static final int SCREEN_ORIENTATION_SENSOR_LANDSCAPE = 6;
    static final String gameID = "";
    static final String gameKey = "";
    static final String gameName = "";
    static final String gameSecret = "";
    private static final double[] mPrices = {1.99d, 4.99d, 9.99d, 24.99d, 49.99d, 4.99d, 9.99d, 24.99d, 49.99d, 99.99d, 1.99d, 4.99d, 9.99d, 24.99d, 49.99d};
    WifiManager.WifiLock mWifiLock = null;

    public String getGooglePlayPublicKey() {
        return "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh+r1FDthSVi+/DCPsBZmqIGT1fcnheonJaS8Q77nPkSRjJOAtor2cVM6PApBmi2Z0vrPwAakT/iqaiJ1E2WiJ6DrgAjt3IjL1D3jn7g8+fdaZZlH2mAFywCzrxFPiwtfo8sqHvLgYkQHl2fyPV24IP9z26LVwuQwdHJoL9Bo00YHEStPSBBVtqCnhw9Z+ytU8kfSmB7TyjegvP3/jKKXCBimUcaIhAI2HraSvVNhRkEp8uxnwp93GfYLvftygqpg/ma8rZzkJVdg3x2mUiClcv8spbjEAwBYC6dIcd+oSCkKIvDQJ8uS3X7QFv1CxCRGuSZ0VeSWTAyvACv0etQUIQIDAQAB";
    }

    /* access modifiers changed from: protected */
    public String[] getInAppSkus() {
        return new String[]{"leroy"};
    }

    /* access modifiers changed from: protected */
    public String getMoPubGameplayBannerId() {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getMoPubMenuBannerId() {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getMoPubBannerId() {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getMoPubInterstitialId() {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getAppId() {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getSecretKey() {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getFullAppURI() {
        return "market://details?id=com.miniclip.cartownstreets";
    }

    /* access modifiers changed from: protected */
    public String getFullVersionGameImageId() {
        return "buynow_v2";
    }

    /* access modifiers changed from: protected */
    public String getTapJoyHtmlOffer(TapjoyFeaturedAppObject featApObj) {
        return String.format("<center><p style='font-family:Impact;color:white;font-size:20px;font-name:arial;font-weight:bold'>Get %s free coins</p><img style='display: block;margin-left: auto;margin-right: auto;width:100px;height:100px;' src='%s' /><p style='font-family:Impact;color:white;font-size:20px;font-name:arial'>%s %s</p></center>", new Object[]{String.valueOf(featApObj.amount), featApObj.iconURL, featApObj.description, featApObj.cost});
    }

    /* access modifiers changed from: protected */
    public String getTapjoyOfferDialogTitle(TapjoyFeaturedAppObject featuredAppObject) {
        return "";
    }

    /* access modifiers changed from: protected */
    public String getTapjoyOfferDialogMessage(TapjoyFeaturedAppObject featuredAppObject) {
        return String.format("Download and run this app for %d free coins:\n%s", new Object[]{Integer.valueOf(featuredAppObject.amount), featuredAppObject.name});
    }

    /* access modifiers changed from: protected */
    public void createCustomNotification(int nid, String title, String text, int seconds) {
        Log.i("activity", "createNotification");
        BootReceiver.setupAlarm(this, nid, title, text, seconds);
    }

    /* access modifiers changed from: protected */
    public void cancelCustomNotification(int nid) {
        BootReceiver.removeAlarm(this, nid);
    }

    public void onCreate(Bundle savedInstanceState) {
        boolean mUSE_TAPJOY = false;
        mHAS_RETINA = true;
        mUSE_C2DM = true;
        mSPINNING_ANIMATION = true;
        mUSE_FACEBOOK = true;
        GooglePlayServices.Setup(this);
        super.onCreate(savedInstanceState);
        if (SharedPreferences_getInt("RUN_BEFORE") == 0) {
        }
        SharedPreferences_setInt("RUN_BEFORE", 1);
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

        Hashtable<String, Integer> items = new Hashtable<>();
        String[] itemIDs = getInAppSkus();
        for (int i = 0; i < itemIDs.length; i++) {
            items.put(itemIDs[i], Integer.valueOf((int) (mPrices[i] * 70.0d)));
        }
    }

    /* access modifiers changed from: protected */
    public void showMiniclipViewInternal() {
        if (mLastBigAdType != 0) {
            showUpSellDialogInternal();
        }
    }

    /* access modifiers changed from: protected */
    public void showUpSellDialogInternal() {
        mGLView.queueEvent(new Runnable() {
            public void run() {
                CocoJNI.MshowUpSellScreen();
            }
        });
    }

    public void logCustomEvent(String eventId, String jsonString) {
        Log.i("cocojava", String.format("logCustomEvent %s %s", new Object[]{eventId, jsonString}));
        try {
            JSONObject json = new JSONObject(jsonString);
            HashMap<String, String> map = new HashMap<>();
            Iterator<String> keys = json.keys();
            while (keys.hasNext()) {
                String key = keys.next();
                map.put(key, json.getString(key));
            }

            Log.i("cocojava", "logCustomEvent Success");
        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

    public void onStart() {
        super.onStart();

        GooglePlayServices.gPlay.onStart();
        this.mWifiLock = ((WifiManager) getSystemService(TapjoyConstants.TJC_CONNECTION_TYPE_WIFI)).createWifiLock(1, "EBPWifiLock");
        if (!this.mWifiLock.isHeld()) {
            this.mWifiLock.acquire();
        }
        Log.i("CarTownStreetsActivity", "WifiLock acquired!");

    }

    public void onStop() {
        super.onStop();

        GooglePlayServices.gPlay.onStop();
        if (this.mWifiLock != null && this.mWifiLock.isHeld()) {
            this.mWifiLock.release();
            Log.i("CarTownStreetsActivity", "WiFi Lock released!");
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        super.onDestroy();
    }

    public void onBackPressed() {

    }

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
        Log.i("CarTownStreetsActivity", String.format("sendAdxPurchase %s", new Object[]{productId}));
        ((CarTownStreetsActivity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                ((CarTownStreetsActivity) CarTownStreetsActivity.mContext).sendAdxPurchaseImpl(productId, purchaseType);
            }
        });
    }

    public void sendAdXEvent(String event, String price, String currency) {
    }

    public void onSignInFailed() {
    }

    public void onSignInSucceeded() {
    }

    public void onActivityResult(int requestCode, int responseCode, Intent intent) {
        Log.i("activity", "onActivityResult.................., req " + requestCode + " response " + responseCode);
        super.onActivityResult(requestCode, responseCode, intent);
        GooglePlayServices.gPlay.onActivityResult(requestCode, responseCode, intent);
    }
}
