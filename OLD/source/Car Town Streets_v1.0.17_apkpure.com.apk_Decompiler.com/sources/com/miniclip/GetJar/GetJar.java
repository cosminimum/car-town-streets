package com.miniclip.GetJar;

import android.app.AlertDialog;
import android.content.DialogInterface;
import android.os.ResultReceiver;
import android.util.Log;
import com.getjar.sdk.ConsumableProduct;
import com.getjar.sdk.GetJarContext;
import com.getjar.sdk.GetJarManager;
import com.getjar.sdk.GetJarPage;
import com.getjar.sdk.LicensableProduct;
import com.getjar.sdk.License;
import com.getjar.sdk.Licensing;
import com.getjar.sdk.Localization;
import com.getjar.sdk.Pricing;
import com.getjar.sdk.Product;
import com.getjar.sdk.RecommendedPrices;
import com.getjar.sdk.User;
import com.getjar.sdk.UserAuth;
import com.getjar.sdk.listener.EnsureUserAuthListener;
import com.getjar.sdk.listener.RecommendedPricesListener;
import com.getjar.sdk.utilities.Constants;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.InAppActivity;
import com.miniclip.nativeJNI.cocojava;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Map;

public class GetJar {
    private static String APP_TOKEN = null;
    private static boolean DEBUG = false;
    private static String ENCRYPTION_KEY = null;
    private static GetJarContext GETJAR_CONTEXT = null;
    private static String GETJAR_CONTEXT_ID = null;
    private static GetJarPage GETJAR_PAGE = null;
    private static String GETJAR_TAG = "GetJar";
    /* access modifiers changed from: private */
    public static AlertDialog dialog = null;
    private static String[] inAppList = null;
    /* access modifiers changed from: private */
    public static Hashtable<String, Integer> items;
    private static Licensing licensing;
    /* access modifiers changed from: private */
    public static InAppActivity mActivity = null;
    private static GetJarListener mListener = null;
    /* access modifiers changed from: private */
    public static User mUser = null;
    static EnsureUserAuthListener userAuthListener = new EnsureUserAuthListener() {
        public void userAuthCompleted(User user) {
            User unused = GetJar.mUser = user;
        }
    };

    public interface GetJarListener {
        void onGetJarInAppPurchase(String str, int i, String str2, int i2, int i3, int i4);
    }

    public static void setup(InAppActivity activity, GetJarListener listener, String appToken, String encryptionKey, Hashtable<String, Integer> items2, boolean useRecommendedPrices, ResultReceiver resultReceiver) {
        mActivity = activity;
        mListener = listener;
        APP_TOKEN = appToken;
        ENCRYPTION_KEY = encryptionKey;
        items = items2;
        try {
            GETJAR_CONTEXT = GetJarManager.createContext(APP_TOKEN, ENCRYPTION_KEY, mActivity, resultReceiver);
            GETJAR_PAGE = new GetJarPage(GETJAR_CONTEXT);
            licensing = new Licensing(GETJAR_CONTEXT);
            try {
                new UserAuth(GETJAR_CONTEXT).ensureUserAsync("Pick an email account for using with GetJar", userAuthListener);
            } catch (Exception e) {
            }
            if (useRecommendedPrices) {
                ArrayList<Pricing> prices = new ArrayList<>();
                for (Map.Entry<String, Integer> entry : items2.entrySet()) {
                    Pricing price = new Pricing(entry.getValue().intValue());
                    if (!prices.contains(price)) {
                        prices.add(price);
                    }
                }
                new Localization(GETJAR_CONTEXT).getRecommendedPricesAsync(prices, new PricingCallback());
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }

    public static int restorePurchases(final int callback, final int self) {
        if (licensing == null) {
            return 0;
        }
        int count = 0;
        try {
            for (final String itemId : inAppList) {
                if (licensing.isUnmanagedProductLicensed(itemId).booleanValue()) {
                    cocojava.mGLView.queueEvent(new Runnable() {
                        public void run() {
                            CocoJNI.MsetInAppResponce(1, callback, self, itemId, "", "");
                            cocojava.permanentlyRemoveAds();
                        }
                    });
                    count++;
                }
            }
            return count;
        } catch (Exception e) {
            return 0;
        }
    }

    public static void getJarResponce(final int value) {
        mActivity.runOnUiThread(new Runnable() {
            public void run() {
                if (value == 1) {
                    AlertDialog dialog = new AlertDialog.Builder(GetJar.mActivity).create();
                    dialog.setTitle("GetJar");
                    dialog.setMessage("You received " + cocojava.mInAppTitle + " using GetJar Gold!");
                    dialog.setButton(-1, "Ok", (DialogInterface.OnClickListener) null);
                    dialog.show();
                }
            }
        });
        cocojava.mGLView.queueEvent(new Runnable() {
            public void run() {
                if (value == 1) {
                    CocoJNI.MsetInAppResponce(1, cocojava.mInAppCallback, cocojava.mInAppSelf, cocojava.mInAppProductId, "", "");
                    cocojava.permanentlyRemoveAds();
                } else if (cocojava.mInAppManaged) {
                    cocojava.callInAppPurchaseRemoveAdsManaged(cocojava.mInAppProductId, cocojava.mInAppCallback, cocojava.mInAppSelf);
                } else {
                    cocojava.callInAppPurchaseRemoveAds(cocojava.mInAppProductId, cocojava.mInAppCallback, cocojava.mInAppSelf);
                }
            }
        });
    }

    public static void dismissPickDialog() {
        if (dialog != null) {
            dialog.dismiss();
        }
    }

    public static void createPickDialog(String itemID, int managed, String title, int showDialog) {
        int price;
        Product getJarProduct;
        Product googlePlayProduct;
        debugLog("itemID = " + itemID + " managed = " + managed + " price = " + " title = " + title + " showDialog = " + showDialog);
        if (items.containsKey(itemID)) {
            ArrayList arrayList = new ArrayList();
            if (DEBUG) {
                price = 0;
            } else {
                price = items.get(itemID).intValue();
            }
            int icon_getjar = mActivity.getResources().getIdentifier("icon_getjar", Constants.APP_ID, mActivity.getPackageName());
            int icon_googlewallet = mActivity.getResources().getIdentifier("icon_googlewallet", Constants.APP_ID, mActivity.getPackageName());
            if (managed == 1) {
                getJarProduct = new LicensableProduct(itemID, title, "Getjar Gold", (long) price, icon_getjar, License.LicenseScope.USER);
                googlePlayProduct = new LicensableProduct(itemID, title, "Google Play Store", (long) price, icon_googlewallet, License.LicenseScope.USER);
            } else {
                getJarProduct = new ConsumableProduct(itemID, title, "Getjar Gold", (long) price, icon_getjar);
                googlePlayProduct = new ConsumableProduct(itemID, title, "Google Play Store", (long) price, icon_googlewallet);
            }
            arrayList.add(getJarProduct);
            arrayList.add(googlePlayProduct);
            PurchaseMethodAdapter purchaseMethodAdapter = new PurchaseMethodAdapter(mActivity, arrayList);
            if (showDialog == 1) {
                final String str = title;
                final PurchaseMethodAdapter purchaseMethodAdapter2 = purchaseMethodAdapter;
                mActivity.runOnUiThread(new Runnable() {
                    public void run() {
                        AlertDialog.Builder builder = new AlertDialog.Builder(GetJar.mActivity);
                        builder.setCancelable(true);
                        builder.setNegativeButton("Cancel", (DialogInterface.OnClickListener) null);
                        builder.setTitle(String.format("Buy %s?", new Object[]{str}));
                        builder.setInverseBackgroundForced(true);
                        builder.setAdapter(purchaseMethodAdapter2, (DialogInterface.OnClickListener) null);
                        AlertDialog unused = GetJar.dialog = builder.create();
                        GetJar.dialog.show();
                    }
                });
                return;
            }
            GETJAR_PAGE.setProduct(getJarProduct);
            GETJAR_PAGE.showPage();
        }
    }

    public static void inAppPurchase(String itemID, int managed, String title, int callback, int self, int showDialog) {
        if (mListener != null) {
            mListener.onGetJarInAppPurchase(itemID, managed, title, callback, self, showDialog);
            createPickDialog(itemID, managed, title, showDialog);
        }
    }

    static void debugLog(String message) {
        if (DEBUG) {
            Log.d(GETJAR_TAG, message);
        }
    }

    public static void showOfferWall(Product product) {
        GETJAR_PAGE.setProduct(product);
        GETJAR_PAGE.showPage();
    }

    private static class PricingCallback implements RecommendedPricesListener {
        private PricingCallback() {
        }

        public void recommendedPricesEvent(RecommendedPrices recommendedPrices) {
            if (recommendedPrices != null) {
                for (Map.Entry<String, Integer> entry : GetJar.items.entrySet()) {
                    String itemID = entry.getKey();
                    int price = entry.getValue().intValue();
                    int recommendedPrice = recommendedPrices.getRecommendedPrice(new Pricing(price)).intValue();
                    if (recommendedPrice != price) {
                        GetJar.items.put(itemID, Integer.valueOf(recommendedPrice));
                    }
                }
            }
        }
    }
}
