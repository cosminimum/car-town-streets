package com.tapjoy.easyAppConnectOffers;

import android.app.Activity;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.RelativeLayout;
import android.widget.TextView;
import com.getjar.sdk.utilities.Constants;
import com.miniclip.nativeJNI.CocoJNI;
import com.miniclip.nativeJNI.cocojava;
import com.tapjoy.TapjoyAwardPointsNotifier;
import com.tapjoy.TapjoyConnect;
import com.tapjoy.TapjoyDisplayAdNotifier;
import com.tapjoy.TapjoyEarnedPointsNotifier;
import com.tapjoy.TapjoyFeaturedAppNotifier;
import com.tapjoy.TapjoyFeaturedAppObject;
import com.tapjoy.TapjoyLog;
import com.tapjoy.TapjoyNotifier;
import com.tapjoy.TapjoySpendPointsNotifier;
/* loaded from: classes.dex */
public class EasyAppConnectOffers extends Activity implements TapjoyNotifier, TapjoyFeaturedAppNotifier, TapjoySpendPointsNotifier, TapjoyDisplayAdNotifier, TapjoyAwardPointsNotifier, TapjoyEarnedPointsNotifier {
    public static final String TAPJOY_INFO = "TapJoyInfo";
    public static final String TAPJOY_INFO_CURRENCY_NAME = "currency_name";
    public static final String TAPJOY_INFO_TOTAL_POINTS = "point_total";
    protected static boolean mUSE_TAPJOY = true;
    LinearLayout adLinearLayout;
    View adView;
    String currency_name;
    protected int point_total;
    TextView pointsTextView;
    RelativeLayout relativeLayout;
    TextView tapjoySDKVersionView;
    String displayText = "";
    boolean update_text = false;
    boolean earnedPoints = false;
    boolean update_display_ad = false;
    final Handler mHandler = new Handler();
    final Runnable mUpdateResults = new Runnable() { // from class: com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers.1
        @Override // java.lang.Runnable
        public void run() {
            EasyAppConnectOffers.this.updateResultsInUi();
        }
    };

    protected String getAppId() {
        return "Error! OVERRIDE ME!";
    }

    protected String getSecretKey() {
        return "Error! OVERRIDE ME!";
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.app.Activity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        TapjoyLog.enableLogging(true);
        if (mUSE_TAPJOY) {
            TapjoyConnect.requestTapjoyConnect(getApplicationContext(), getAppId(), getSecretKey());
            TapjoyConnect.getTapjoyConnectInstance().setEarnedPointsNotifier(this);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.app.Activity
    public void onDestroy() {
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.app.Activity
    public void onResume() {
        super.onResume();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateResultsInUi() {
        if (this.update_display_ad) {
            this.adLinearLayout.removeAllViews();
            this.adLinearLayout.addView(this.adView);
            this.update_display_ad = false;
        }
        if (this.pointsTextView != null && this.update_text) {
            this.pointsTextView.setText(this.displayText);
            this.update_text = false;
        }
    }

    @Override // com.tapjoy.TapjoyNotifier
    public void getUpdatePoints(String currencyName, final int pointTotal) {
        Log.i("EASY_APP", "currencyName: " + currencyName);
        Log.i("EASY_APP", "pointTotal: " + pointTotal);
        this.currency_name = currencyName;
        this.point_total = pointTotal;
        cocojava.mGLView.queueEvent(new Runnable() { // from class: com.tapjoy.easyAppConnectOffers.EasyAppConnectOffers.2
            @Override // java.lang.Runnable
            public void run() {
                CocoJNI.MsetTapjoyCoins(pointTotal);
            }
        });
        this.update_text = true;
        if (this.earnedPoints) {
            this.displayText += "\n" + currencyName + ": " + pointTotal;
            this.earnedPoints = false;
        } else {
            this.displayText = currencyName + ": " + pointTotal;
        }
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyNotifier
    public void getUpdatePointsFailed(String error) {
        Log.i("EASY_APP", "getTapPoints error: " + error);
        this.update_text = true;
        this.displayText = "Unable to retrieve tap points from server.";
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyFeaturedAppNotifier
    public void getFeaturedAppResponse(TapjoyFeaturedAppObject featuredApObject) {
        Log.i("EASY_APP", "Displaying Featured App..");
        cocojava cocojavaVar = (cocojava) this;
        cocojava.showTapJoyView(featuredApObject);
    }

    @Override // com.tapjoy.TapjoyFeaturedAppNotifier
    public void getFeaturedAppResponseFailed(String error) {
        Log.i("EASY_APP", "No Featured App to display: " + error);
        this.update_text = true;
        this.displayText = "No Featured App to display.";
        cocojava cocojavaVar = (cocojava) this;
        cocojava.tapjoy_showTapFeatureAdFailed();
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoySpendPointsNotifier
    public void getSpendPointsResponse(String currencyName, int pointTotal) {
        Log.i("EASY_APP", "currencyName: " + currencyName);
        Log.i("EASY_APP", "pointTotal: " + pointTotal);
        this.update_text = true;
        this.displayText = currencyName + ": " + pointTotal;
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoySpendPointsNotifier
    public void getSpendPointsResponseFailed(String error) {
        Log.i("EASY_APP", "spendTapPoints error: " + error);
        this.update_text = true;
        this.displayText = "Spend Tap Points: " + error;
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyDisplayAdNotifier
    public void getDisplayAdResponse(View view) {
        this.adView = view;
        Log.i("EASY_APP", "adView dimensions: " + this.adView.getLayoutParams().width + Constants.X + this.adView.getLayoutParams().height);
        if (this.adView.getLayoutParams().width > this.adLinearLayout.getMeasuredWidth()) {
            ViewGroup.LayoutParams layout = new ViewGroup.LayoutParams(this.adLinearLayout.getMeasuredWidth(), (this.adLinearLayout.getMeasuredWidth() * 10) / 64);
            this.adView.setLayoutParams(layout);
        }
        Log.i("EASY_APP", "adLinearLayout dimensions: " + this.adLinearLayout.getMeasuredWidth() + Constants.X + this.adLinearLayout.getMeasuredHeight());
        this.update_display_ad = true;
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyDisplayAdNotifier
    public void getDisplayAdResponseFailed(String error) {
        Log.i("EASY_APP", "getDisplayAd error: " + error);
        this.update_text = true;
        this.displayText = "Display Ads: " + error;
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyAwardPointsNotifier
    public void getAwardPointsResponse(String currencyName, int pointTotal) {
        this.update_text = true;
        this.displayText = currencyName + ": " + pointTotal;
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyAwardPointsNotifier
    public void getAwardPointsResponseFailed(String error) {
        this.update_text = true;
        this.displayText = "Award Points: " + error;
        this.mHandler.post(this.mUpdateResults);
    }

    @Override // com.tapjoy.TapjoyEarnedPointsNotifier
    public void earnedTapPoints(int amount) {
        this.earnedPoints = true;
        this.update_text = true;
        this.displayText = "You've just earned " + amount + " Tap Points!";
        this.mHandler.post(this.mUpdateResults);
    }
}
