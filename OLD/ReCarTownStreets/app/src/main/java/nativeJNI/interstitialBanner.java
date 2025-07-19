package nativeJNI;

import android.content.Context;
import android.os.Handler;
import android.view.View;
import android.view.animation.Animation;
import android.view.animation.ScaleAnimation;
import android.widget.Button;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.mopub.mobileads.MoPubView;

public class interstitialBanner extends RelativeLayout implements View.OnClickListener {
    private static MoPubView adView;
    /* access modifiers changed from: private */
    public static Button mSkip1;
    private Runnable mAddSkipButton = new Runnable() {
        public void run() {
            interstitialBanner.this.mDialogView.addView(interstitialBanner.mSkip1);
        }
    };
    private Context mContext;
    /* access modifiers changed from: private */
    public RelativeLayout mDialogView;
    protected RelativeLayout mFullView;
    private Handler mHandler = new Handler();

    public interstitialBanner(Context context) {
        super(context);
        this.mContext = context;
    }

    /* access modifiers changed from: package-private */
    public void loadAd() {
        adView = new MoPubView(this.mContext);
        adView.setAdUnitId(((cocojava) this.mContext).getMoPubInterstitialBannerId());
        adView.loadAd();
    }

    /* access modifiers changed from: package-private */
    public void showAd() {
        LayoutParams paramsFull1 = new LayoutParams(-1, -1);
        this.mFullView = new RelativeLayout(this.mContext);
        this.mFullView.setLayoutParams(paramsFull1);
        this.mFullView.setOnClickListener(this);
        this.mFullView.setBackgroundColor(-1879048192);
        addView(this.mFullView);
        float density = cocojava.mDensity;
        LayoutParams paramsFull2 = new LayoutParams(((int) (320.0f * density)) + 10, ((int) (50.0f * density * 2.0f)) + 10);
        paramsFull2.addRule(13);
        this.mDialogView = new RelativeLayout(this.mContext);
        this.mDialogView.setLayoutParams(paramsFull2);
        this.mDialogView.setBackgroundColor(-16777216);
        this.mFullView.addView(this.mDialogView);
        LayoutParams paramsS = new LayoutParams((int) (320.0f * density), (int) (50.0f * density));
        paramsS.addRule(14);
        paramsS.addRule(12);
        mSkip1 = new Button(this.mContext);
        mSkip1.setLayoutParams(paramsS);
        mSkip1.setText("Skip");
        mSkip1.setOnClickListener(this);
        if (!hasAd()) {
            int resourceIdOffline1 = this.mContext.getResources().getIdentifier("a640x100", "drawable", this.mContext.getPackageName());
            RelativeLayout offlineView = new RelativeLayout(this.mContext);
            LayoutParams paramsD = new LayoutParams((int) (320.0f * density), (int) (50.0f * density));
            paramsD.addRule(14);
            paramsD.addRule(10);
            paramsD.setMargins(0, 5, 0, 0);
            offlineView.setLayoutParams(paramsD);
            ImageView offlineImage = new ImageView(this.mContext);
            offlineImage.setImageDrawable(getResources().getDrawable(resourceIdOffline1));
            offlineImage.setLayoutParams(new Gallery.LayoutParams(-1, -1));
            offlineImage.setScaleType(ImageView.ScaleType.FIT_XY);
            offlineView.addView(offlineImage);
            this.mDialogView.addView(offlineView);
            Animation anim = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * density, BitmapDescriptorFactory.HUE_RED);
            anim.setDuration(500);
            offlineView.startAnimation(anim);
        } else {
            LayoutParams paramsN = new LayoutParams((int) (320.0f * density), (int) (50.0f * density));
            paramsN.addRule(14);
            paramsN.addRule(10);
            paramsN.setMargins(0, 5, 0, 0);
            adView.setLayoutParams(paramsN);
            this.mDialogView.addView(adView);
            Animation anim2 = new ScaleAnimation(BitmapDescriptorFactory.HUE_RED, 1.0f, 1.0f, 1.0f, 160.0f * density, BitmapDescriptorFactory.HUE_RED);
            anim2.setDuration(500);
            adView.startAnimation(anim2);
        }
        this.mHandler.postDelayed(this.mAddSkipButton, 2000);
    }

    /* access modifiers changed from: package-private */
    public void hideAd() {
        this.mDialogView.removeAllViews();
        removeAllViews();
    }

    /* access modifiers changed from: package-private */
    public boolean hasAd() {
        return adView.AdLoaded();
    }

    public void onClick(View v) {
        if (v == mSkip1) {
            hideAd();
        }
    }
}
