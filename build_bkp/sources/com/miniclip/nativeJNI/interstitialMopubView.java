package com.miniclip.nativeJNI;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.Button;
import android.widget.RelativeLayout;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.mopub.mobileads.MoPubView;

public class interstitialMopubView extends RelativeLayout implements View.OnClickListener {
    private static MoPubView adView;
    private static Button mRemove1;
    /* access modifiers changed from: private */
    public static Button mSkip1;
    private Runnable mAddSkipButton = new Runnable() {
        public void run() {
            if (interstitialMopubView.this.mDialog != null) {
                interstitialMopubView.this.mDialog.addView(interstitialMopubView.mSkip1);
            }
        }
    };
    private Context mContext;
    protected RelativeLayout mDialog;
    protected RelativeLayout mFullView;
    private Handler mHandler = new Handler();

    public interstitialMopubView(Context context) {
        super(context);
        this.mContext = context;
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -1);
        setHorizontalGravity(17);
        setLayoutParams(params);
    }

    /* access modifiers changed from: package-private */
    public void loadAd() {
        adView = new MoPubView(this.mContext);
        adView.setAdUnitId(((cocojava) this.mContext).getMoPubInterstitialId());
        adView.loadAd();
        adView.setAutorefreshEnabled(false);
    }

    /* access modifiers changed from: package-private */
    public void showAd() {
        RelativeLayout.LayoutParams paramsDialog;
        RelativeLayout.LayoutParams paramsS;
        RelativeLayout.LayoutParams paramsR;
        if (!adView.AdLoaded()) {
            Log.i("interstitialBanner", "showAd called when ad not loaded");
            adView.loadAd();
            ((cocojava) this.mContext).onInterstitialMopubViewExit();
            return;
        }
        RelativeLayout.LayoutParams paramsFull1 = new RelativeLayout.LayoutParams(-1, -1);
        this.mFullView = new RelativeLayout(this.mContext);
        this.mFullView.setLayoutParams(paramsFull1);
        this.mFullView.setOnClickListener(this);
        this.mFullView.setBackgroundColor(-1895825408);
        addView(this.mFullView);
        float density = cocojava.mDensity;
        if (cocojava.mINGAME_LANDSCAPE) {
            paramsDialog = new RelativeLayout.LayoutParams((int) (((float) cocojava.mWidth) * density), (int) (((float) cocojava.mHeight) * density));
        } else {
            paramsDialog = new RelativeLayout.LayoutParams(cocojava.mWidth, cocojava.mHeight);
        }
        paramsDialog.addRule(14);
        paramsDialog.addRule(13);
        this.mDialog = new RelativeLayout(this.mContext);
        this.mDialog.setLayoutParams(paramsDialog);
        this.mDialog.setOnClickListener(this);
        this.mDialog.setBackgroundColor(0);
        this.mFullView.addView(this.mDialog);
        if (cocojava.mINGAME_LANDSCAPE) {
            RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams((int) (220.0f * density), (int) (50.0f * density));
            params.addRule(12);
            params.addRule(9);
            paramsS = params;
        } else {
            RelativeLayout.LayoutParams params2 = new RelativeLayout.LayoutParams(paramsDialog.width / 2, (int) (50.0f * density));
            params2.addRule(12);
            params2.addRule(9);
            paramsS = params2;
        }
        mSkip1 = new Button(this.mContext);
        mSkip1.setLayoutParams(paramsS);
        mSkip1.setText("Skip");
        mSkip1.setOnClickListener(this);
        if (cocojava.mINGAME_LANDSCAPE) {
            RelativeLayout.LayoutParams params3 = new RelativeLayout.LayoutParams((int) (220.0f * density), (int) (50.0f * density));
            params3.addRule(12);
            params3.addRule(11);
            paramsR = params3;
        } else {
            RelativeLayout.LayoutParams params4 = new RelativeLayout.LayoutParams(paramsDialog.width / 2, (int) (50.0f * density));
            params4.addRule(12);
            params4.addRule(11);
            paramsR = params4;
        }
        mRemove1 = new Button(this.mContext);
        mRemove1.setLayoutParams(paramsR);
        mRemove1.setText("Remove Ads");
        this.mDialog.addView(mRemove1);
        mRemove1.setOnClickListener(this);
        RelativeLayout.LayoutParams paramsN = new RelativeLayout.LayoutParams((int) (300.0f * density), (int) (250.0f * density));
        if ((paramsN.height / 2) + paramsS.height >= getHeight() / 2) {
            paramsN.addRule(10);
            paramsN.addRule(14);
            paramsN.setMargins(0, 5, 0, 0);
        } else {
            paramsN.addRule(13);
        }
        adView.setLayoutParams(paramsN);
        this.mDialog.addView(adView);
        this.mHandler.postDelayed(this.mAddSkipButton, 2000);
        Animation anim = new AlphaAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f);
        anim.setDuration(500);
        this.mFullView.startAnimation(anim);
    }

    /* access modifiers changed from: package-private */
    public void hideAd() {
        this.mDialog.removeAllViews();
        this.mFullView.removeAllViews();
        removeAllViews();
        this.mDialog = null;
        this.mFullView = null;
    }

    public void onClick(View v) {
        if (v == mSkip1) {
            hideAd();
            ((cocojava) this.mContext).onInterstitialMopubViewExit();
        } else if (v == mRemove1) {
            hideAd();
            ((cocojava) this.mContext).callRemoveAds();
            ((cocojava) this.mContext).onInterstitialMopubViewExit();
        }
    }
}
