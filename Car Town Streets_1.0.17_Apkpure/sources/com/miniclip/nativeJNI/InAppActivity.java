package com.miniclip.nativeJNI;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;
import com.google.android.gms.games.GamesActivityResultCodes;
import com.miniclip.googlebilling.IabHelper;
import com.miniclip.googlebilling.IabResult;
import com.miniclip.googlebilling.Inventory;
import com.miniclip.googlebilling.Purchase;
import com.miniclip.googlebilling.SkuDetails;
import java.util.Arrays;
import java.util.List;
import java.util.Set;
import org.json.JSONException;
/* loaded from: classes.dex */
public class InAppActivity extends cocojava {
    static final String TAG = "InAppActivity";
    private boolean mBusy;
    private IabHelper mHelper;
    private boolean mHelperReady;
    private ProgressDialog mProgressDialog;
    IabHelper.QueryInventoryFinishedListener mGotInventoryListener = new IabHelper.QueryInventoryFinishedListener() { // from class: com.miniclip.nativeJNI.InAppActivity.2
        @Override // com.miniclip.googlebilling.IabHelper.QueryInventoryFinishedListener
        public void onQueryInventoryFinished(IabResult result, Inventory inventory) {
            Log.d(InAppActivity.TAG, "Query inventory finished.");
            if (result.isFailure()) {
                InAppActivity.this.complain("Failed to query inventory: " + result);
                return;
            }
            Log.d(InAppActivity.TAG, "Query inventory was successful.");
            InAppActivity.this.syncInventory(inventory);
            List<String> products = inventory.getAllOwnedSkus();
            for (String product : products) {
                Log.d(InAppActivity.TAG, "Inventory item: " + product);
            }
            String[] productsStored = InAppActivity.this.getOwnedItems();
            for (String product2 : productsStored) {
                Log.d(InAppActivity.TAG, "Inventory item stored: " + product2);
            }
            InAppActivity.this.setWaitScreen(false);
            Log.d(InAppActivity.TAG, "Initial inventory query finished.");
            Boolean CLEAR_PURCHASES = false;
            if (CLEAR_PURCHASES.booleanValue()) {
                InAppActivity.this.setWaitScreen(true);
                InAppActivity.this.mHelper.consumeAsync(inventory.getAllPurchases(), new IabHelper.OnConsumeMultiFinishedListener() { // from class: com.miniclip.nativeJNI.InAppActivity.2.1
                    @Override // com.miniclip.googlebilling.IabHelper.OnConsumeMultiFinishedListener
                    public void onConsumeMultiFinished(List<Purchase> purchases, List<IabResult> results) {
                        InAppActivity.this.setWaitScreen(false);
                    }
                });
            }
        }
    };
    IabHelper.OnIabPurchaseFinishedListener mPurchaseFinishedListener = new IabHelper.OnIabPurchaseFinishedListener() { // from class: com.miniclip.nativeJNI.InAppActivity.5
        @Override // com.miniclip.googlebilling.IabHelper.OnIabPurchaseFinishedListener
        public void onIabPurchaseFinished(IabResult result, Purchase purchase) {
            InAppActivity.this.purchaseFinishedCallback(result, purchase, false);
        }
    };
    IabHelper.OnIabPurchaseFinishedListener mPurchaseFinishedListenerManaged = new IabHelper.OnIabPurchaseFinishedListener() { // from class: com.miniclip.nativeJNI.InAppActivity.6
        @Override // com.miniclip.googlebilling.IabHelper.OnIabPurchaseFinishedListener
        public void onIabPurchaseFinished(IabResult result, Purchase purchase) {
            InAppActivity.this.purchaseFinishedCallback(result, purchase, true);
        }
    };
    IabHelper.OnConsumeFinishedListener mConsumeFinishedListener = new IabHelper.OnConsumeFinishedListener() { // from class: com.miniclip.nativeJNI.InAppActivity.7
        @Override // com.miniclip.googlebilling.IabHelper.OnConsumeFinishedListener
        public void onConsumeFinished(Purchase purchase, IabResult result) {
            Log.d(InAppActivity.TAG, "Consumption finished. Purchase: " + purchase + ", result: " + result);
            if (result.isSuccess()) {
                Log.d(InAppActivity.TAG, "Consumption successful. Provisioning.");
                SharedPreferences settings = cocojava.mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0);
                SharedPreferences.Editor editor = settings.edit();
                editor.putInt(purchase.getSku(), -4);
                editor.commit();
            } else {
                InAppActivity.this.complain("Error while consuming: " + result);
            }
            InAppActivity.this.mBusy = false;
            InAppActivity.this.setWaitScreen(false);
            Log.d(InAppActivity.TAG, "End consumption flow.");
        }
    };

    public String getGooglePlayPublicKey() {
        return "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh+r1FDthSVi+/DCPsBZmqIGT1fcnheonJaS8Q77nPkSRjJOAtor2cVM6PApBmi2Z0vrPwAakT/iqaiJ1E2WiJ6DrgAjt3IjL1D3jn7g8+fdaZZlH2mAFywCzrxFPiwtfo8sqHvLgYkQHl2fyPV24IP9z26LVwuQwdHJoL9Bo00YHEStPSBBVtqCnhw9Z+ytU8kfSmB7TyjegvP3/jKKXCBimUcaIhAI2HraSvVNhRkEp8uxnwp93GfYLvftygqpg/ma8rZzkJVdg3x2mUiClcv8spbjEAwBYC6dIcd+oSCkKIvDQJ8uS3X7QFv1CxCRGuSZ0VeSWTAyvACv0etQUIQIDAQAB";
    }

    @Override // com.miniclip.nativeJNI.cocojava, com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers, android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        this.mHelperReady = false;
        this.mBusy = false;
        Log.d(TAG, "Creating IAB helper.");
        this.mHelper = new IabHelper(this, getGooglePlayPublicKey());
        this.mHelper.enableDebugLogging(true);
        Log.d(TAG, "Starting setup.");
        this.mHelper.startSetup(new IabHelper.OnIabSetupFinishedListener() { // from class: com.miniclip.nativeJNI.InAppActivity.1
            @Override // com.miniclip.googlebilling.IabHelper.OnIabSetupFinishedListener
            public void onIabSetupFinished(IabResult result) {
                Log.d(InAppActivity.TAG, "Setup finished.");
                if (!result.isSuccess()) {
                    InAppActivity.this.complain("Problem setting up in-app billing: " + result);
                    return;
                }
                Log.d(InAppActivity.TAG, "Setup successful. Querying inventory.");
                InAppActivity.this.mHelper.queryInventoryAsync(true, Arrays.asList(InAppActivity.this.getInAppSkus()), InAppActivity.this.mGotInventoryListener);
                InAppActivity.this.mHelperReady = true;
            }
        });
    }

    @Override // com.miniclip.nativeJNI.cocojava, android.app.Activity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        Log.d(TAG, "onActivityResult(" + requestCode + "," + resultCode + "," + data);
        if (!this.mHelper.handleActivityResult(requestCode, resultCode, data)) {
            super.onActivityResult(requestCode, resultCode, data);
        } else {
            Log.d(TAG, "onActivityResult handled by IABUtil.");
        }
    }

    public void purchaseFinishedCallback(IabResult result, final Purchase purchase, final Boolean managed) {
        if (purchase == null) {
            Log.d(TAG, "Purchase finished: " + result);
        } else {
            Log.d(TAG, "Purchase finished: " + result + ", purchase: " + purchase);
        }
        if (result.isFailure()) {
            complain("Error purchasing: " + result);
            this.mBusy = false;
            setWaitScreen(false);
            inAppResponce(-1, mInAppProductId);
            Log.d(TAG, "purchaseFinishedCallback failed: " + mInAppProductId);
            mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.3
                @Override // java.lang.Runnable
                public void run() {
                    cocojava.mInAppResponce = -1;
                    CocoJNI.MsetInAppResponce(cocojava.mInAppResponce, cocojava.mInAppCallback, cocojava.mInAppSelf, cocojava.mInAppProductId, "", "");
                }
            });
            return;
        }
        Log.d(TAG, "Purchase successful.");
        syncPurchase(purchase);
        inAppResponce(1, mInAppProductId);
        Log.d(TAG, "purchaseFinishedCallback success: " + mInAppProductId);
        mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.4
            @Override // java.lang.Runnable
            public void run() {
                cocojava.mInAppResponce = 1;
                CocoJNI.MsetInAppResponce(cocojava.mInAppResponce, cocojava.mInAppCallback, cocojava.mInAppSelf, cocojava.mInAppProductId, purchase.getOriginalJson(), purchase.getSignature());
                if (managed.booleanValue()) {
                    InAppActivity.this.mBusy = false;
                    InAppActivity.this.setWaitScreen(false);
                    return;
                }
                ((Activity) cocojava.mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.4.1
                    @Override // java.lang.Runnable
                    public void run() {
                        InAppActivity.this.mHelper.consumeAsync(purchase, InAppActivity.this.mConsumeFinishedListener);
                    }
                });
            }
        });
    }

    void syncPurchase(Purchase purchase) {
        if (purchase.getPurchaseState() == 0) {
            SharedPreferences settingsExtra = mContext.getSharedPreferences("INAPP_PURCHASED_OWNED_EXTRAv3", 0);
            SharedPreferences.Editor editorExtra = settingsExtra.edit();
            SharedPreferences settings = mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0);
            SharedPreferences.Editor editor = settings.edit();
            String sku = purchase.getSku();
            editor.putInt(sku, 1);
            editorExtra.putString(sku + "_DATA_UNIQUE", purchase.getOriginalJson());
            editorExtra.putString(sku + "_SIGNATURE_UNIQUE", purchase.getSignature());
            editor.commit();
            editorExtra.commit();
        }
    }

    void syncInventory(Inventory inventory) {
        SharedPreferences settingsExtra = mContext.getSharedPreferences("INAPP_PURCHASED_OWNED_EXTRAv3", 0);
        SharedPreferences.Editor editorExtra = settingsExtra.edit();
        SharedPreferences settings = mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0);
        SharedPreferences.Editor editor = settings.edit();
        List<Purchase> products = inventory.getAllPurchases();
        for (int i = 0; i < products.size(); i++) {
            if (products.get(i).getPurchaseState() == 0) {
                String sku = products.get(i).getSku();
                editor.putInt(sku, 1);
                Purchase p = inventory.getPurchase(sku);
                editorExtra.putString(sku + "_DATA_UNIQUE", p.getOriginalJson());
                editorExtra.putString(sku + "_SIGNATURE_UNIQUE", p.getSignature());
            }
        }
        SharedPreferences settingsSku = mContext.getSharedPreferences("INAPP_SKU_INFOv3", 0);
        SharedPreferences.Editor editorSku = settingsSku.edit();
        List<SkuDetails> skuDetails = inventory.getAllSkuDetails();
        for (int i2 = 0; i2 < skuDetails.size(); i2++) {
            editorSku.putString(skuDetails.get(i2).getSku() + "_PRICE_UNIQUE", skuDetails.get(i2).getPrice());
            Log.d(TAG, "Inventory price stored: " + skuDetails.get(i2).getSku() + " " + skuDetails.get(i2).getPrice());
        }
        editorSku.commit();
        editor.commit();
        editorExtra.commit();
    }

    void setWaitScreen(final boolean set) {
        ((Activity) mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.8
            @Override // java.lang.Runnable
            public void run() {
                if (!set) {
                    if (InAppActivity.this.mProgressDialog != null) {
                        InAppActivity.this.mProgressDialog.dismiss();
                        return;
                    }
                    return;
                }
                InAppActivity.this.mProgressDialog = ProgressDialog.show(cocojava.mContext, "Processing Transaction", "Please Wait");
            }
        });
    }

    void complain(String message) {
        Log.e(TAG, "**** InAppActivity Error: " + message);
        alert("Error: " + message);
    }

    void alert(String message) {
    }

    public void requestPurchaseActManaged(String productId) {
        if (this.mHelperReady && !this.mBusy) {
            if (isPurchaseReallyOwned(productId) == 1) {
                Log.i(TAG, "requestPurchaseActManaged restore: " + mInAppProductId);
                SharedPreferences settingsExtra = mContext.getSharedPreferences("INAPP_PURCHASED_OWNED_EXTRAv3", 0);
                final String data = settingsExtra.getString(productId + "_DATA_UNIQUE", "");
                final String signature = settingsExtra.getString(productId + "_SIGNATURE_UNIQUE", "");
                inAppResponce(1, mInAppProductId);
                mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.9
                    @Override // java.lang.Runnable
                    public void run() {
                        cocojava.mInAppResponce = 1;
                        CocoJNI.MsetInAppResponce(cocojava.mInAppResponce, cocojava.mInAppCallback, cocojava.mInAppSelf, cocojava.mInAppProductId, data, signature);
                    }
                });
                return;
            }
            this.mBusy = true;
            setWaitScreen(true);
            this.mHelper.launchPurchaseFlow(this, productId, GamesActivityResultCodes.RESULT_RECONNECT_REQUIRED, this.mPurchaseFinishedListenerManaged);
        }
    }

    public void requestPurchaseAct(String productId) {
        if (this.mHelperReady && !this.mBusy) {
            if (isPurchaseReallyOwned(productId) == 1) {
                Log.i(TAG, "requestPurchaseAct restore: " + mInAppProductId);
                SharedPreferences settingsExtra = mContext.getSharedPreferences("INAPP_PURCHASED_OWNED_EXTRAv3", 0);
                final String data = settingsExtra.getString(productId + "_DATA_UNIQUE", "");
                final String signature = settingsExtra.getString(productId + "_SIGNATURE_UNIQUE", "");
                inAppResponce(1, mInAppProductId);
                mGLView.queueEvent(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.10
                    @Override // java.lang.Runnable
                    public void run() {
                        cocojava.mInAppResponce = 1;
                        CocoJNI.MsetInAppResponce(cocojava.mInAppResponce, cocojava.mInAppCallback, cocojava.mInAppSelf, cocojava.mInAppProductId, data, signature);
                        ((Activity) cocojava.mContext).runOnUiThread(new Runnable() { // from class: com.miniclip.nativeJNI.InAppActivity.10.1
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    Purchase purchase = new Purchase(data, signature);
                                    InAppActivity.this.mBusy = true;
                                    InAppActivity.this.setWaitScreen(true);
                                    InAppActivity.this.mHelper.consumeAsync(purchase, InAppActivity.this.mConsumeFinishedListener);
                                } catch (JSONException e) {
                                    e.printStackTrace();
                                }
                            }
                        });
                    }
                });
                return;
            }
            this.mBusy = true;
            setWaitScreen(true);
            this.mHelper.launchPurchaseFlow(this, productId, GamesActivityResultCodes.RESULT_RECONNECT_REQUIRED, this.mPurchaseFinishedListener);
        }
    }

    public String[] getOwnedItems() {
        SharedPreferences settings = mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0);
        Set<String> products = settings.getAll().keySet();
        String[] productStrings = new String[products.size()];
        int i = 0;
        for (String key : products) {
            if (isPurchaseReallyOwned(key) == 1) {
                productStrings[i] = key;
                i++;
            }
        }
        return productStrings;
    }

    public int isPurchaseReallyOwned(String productId) {
        SharedPreferences settings = mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0);
        return settings.getInt(productId, 0) > 0 ? 1 : 0;
    }

    public String getPurchasePrice(String productId) {
        SharedPreferences settingsSku = mContext.getSharedPreferences("INAPP_SKU_INFOv3", 0);
        Log.d(TAG, "getPurchasePrice" + productId + " " + settingsSku.getString(productId + "_PRICE_UNIQUE", ""));
        return settingsSku.getString(productId + "_PRICE_UNIQUE", "");
    }
}
