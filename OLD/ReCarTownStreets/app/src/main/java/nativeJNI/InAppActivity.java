package nativeJNI;

import android.app.Activity;
import android.app.ProgressDialog;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.util.Log;

import java.util.Set;

public class InAppActivity extends cocojava {
    static final String TAG = "InAppActivity";
    /* access modifiers changed from: private */
    public boolean mBusy;

    /* access modifiers changed from: private */
    public boolean mHelperReady;
    /* access modifiers changed from: private */
    public ProgressDialog mProgressDialog;

    public String getGooglePlayPublicKey() {
        return "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAh+r1FDthSVi+/DCPsBZmqIGT1fcnheonJaS8Q77nPkSRjJOAtor2cVM6PApBmi2Z0vrPwAakT/iqaiJ1E2WiJ6DrgAjt3IjL1D3jn7g8+fdaZZlH2mAFywCzrxFPiwtfo8sqHvLgYkQHl2fyPV24IP9z26LVwuQwdHJoL9Bo00YHEStPSBBVtqCnhw9Z+ytU8kfSmB7TyjegvP3/jKKXCBimUcaIhAI2HraSvVNhRkEp8uxnwp93GfYLvftygqpg/ma8rZzkJVdg3x2mUiClcv8spbjEAwBYC6dIcd+oSCkKIvDQJ8uS3X7QFv1CxCRGuSZ0VeSWTAyvACv0etQUIQIDAQAB";
    }

    public void onCreate(Bundle savedInstanceState) {
        return;
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        Log.d(TAG, "onActivityResult(" + requestCode + "," + resultCode + "," + data);
    }

    /* access modifiers changed from: package-private */
    public void setWaitScreen(final boolean set) {
        ((Activity) mContext).runOnUiThread(new Runnable() {
            public void run() {
                if (set) {
                    ProgressDialog unused = InAppActivity.this.mProgressDialog = ProgressDialog.show(cocojava.mContext, "Processing Transaction", "Please Wait");
                } else if (InAppActivity.this.mProgressDialog != null) {
                    InAppActivity.this.mProgressDialog.dismiss();
                }
            }
        });
    }

    /* access modifiers changed from: package-private */
    public void complain(String message) {
        Log.e(TAG, "**** InAppActivity Error: " + message);
        alert("Error: " + message);
    }

    /* access modifiers changed from: package-private */
    public void alert(String message) {
    }

    public String[] getOwnedItems() {
        Set<String> products = mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0).getAll().keySet();
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
        if (mContext.getSharedPreferences("INAPP_PURCHASED_OWNEDv3", 0).getInt(productId, 0) > 0) {
            return 1;
        }
        return 0;
    }

    public String getPurchasePrice(String productId) {
        SharedPreferences settingsSku = mContext.getSharedPreferences("INAPP_SKU_INFOv3", 0);
        Log.d(TAG, "getPurchasePrice" + productId + " " + settingsSku.getString(productId + "_PRICE_UNIQUE", ""));
        return settingsSku.getString(productId + "_PRICE_UNIQUE", "");
    }
}
