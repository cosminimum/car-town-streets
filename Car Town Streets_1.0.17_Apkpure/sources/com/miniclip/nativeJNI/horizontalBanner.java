package com.miniclip.nativeJNI;

import android.content.Context;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.Animation;
import android.view.animation.RotateAnimation;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.mopub.mobileads.MoPubView;
/* loaded from: classes.dex */
public class horizontalBanner extends RelativeLayout implements MoPubView.OnAdFailedListener, MoPubView.OnAdLoadedListener {
    public static MoPubView adView;
    private RelativeLayout mAdLayoutVerticle;
    private Context mContext;
    private RelativeLayout mOfflineAd;
    private Handler mAnimationHandler = new Handler();
    Runnable mLoop = new Runnable() { // from class: com.miniclip.nativeJNI.horizontalBanner.1
        @Override // java.lang.Runnable
        public void run() {
            Log.i("horizontalBanner", "loopAnimation");
        }
    };

    public horizontalBanner(Context context) {
        super(context);
        this.mContext = context;
        float density = cocojava.mDensity;
        int resourceIdSide4 = this.mContext.getResources().getIdentifier("a100x640", "drawable", this.mContext.getPackageName());
        this.mOfflineAd = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams sideBar3Params = new RelativeLayout.LayoutParams((int) (320.0f * density), (int) (50.0d * density));
        this.mOfflineAd.setLayoutParams(sideBar3Params);
        ImageView sideBar3Image1 = new ImageView(this.mContext);
        sideBar3Image1.setImageDrawable(getResources().getDrawable(resourceIdSide4));
        sideBar3Image1.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        sideBar3Image1.setScaleType(ImageView.ScaleType.FIT_XY);
        this.mOfflineAd.addView(sideBar3Image1);
        this.mOfflineAd.setOnClickListener(new View.OnClickListener() { // from class: com.miniclip.nativeJNI.horizontalBanner.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                cocojava.openLink("http://bit.ly/wm0xXE");
            }
        });
        adView = new MoPubView(this.mContext);
        adView.setOnAdFailedListener(this);
        adView.setOnAdLoadedListener(this);
        adView.setAdUnitId(((cocojava) this.mContext).getMoPubGameplayBannerId());
        adView.loadAd();
        reAdd();
    }

    public void setAutorefreshEnabled(boolean enabled) {
    }

    public void setBlockAutoRefresh(boolean blocked) {
    }

    public void resetRefreshTime() {
    }

    public void reAdd() {
        removeAllViews();
        float width = cocojava.mWidth;
        float density = cocojava.mDensity;
        this.mAdLayoutVerticle = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams paramsHorizontal = new RelativeLayout.LayoutParams((int) (density * 320.0d), (int) (density * 320.0d));
        this.mAdLayoutVerticle.setLayoutParams(paramsHorizontal);
        ViewGroup p = (ViewGroup) adView.getParent();
        if (p != null) {
            p.removeView(adView);
        }
        this.mAdLayoutVerticle.addView(adView);
        RelativeLayout adLayoutVerticleClick = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams paramsVerticleClick = new RelativeLayout.LayoutParams((int) (density * 320.0d), (int) (50.0d * density));
        adLayoutVerticleClick.setLayoutParams(paramsVerticleClick);
        RelativeLayout.LayoutParams paramsThis = new RelativeLayout.LayoutParams(-1, -1);
        paramsThis.setMargins((int) ((width - (320.0f * density)) * 0.5f), 0, 0, 0);
        setLayoutParams(paramsThis);
        addView(this.mOfflineAd);
        addView(this.mAdLayoutVerticle);
        addView(adLayoutVerticleClick);
    }

    public void runAnimation() {
        float density = cocojava.mDensity;
        float offset = 160.0f * density;
        Animation anim = new RotateAnimation(-90.0f, -90.0f, offset, offset);
        anim.setDuration(1000L);
        anim.setRepeatCount(1);
        anim.setFillAfter(true);
        anim.setAnimationListener(new Animation.AnimationListener() { // from class: com.miniclip.nativeJNI.horizontalBanner.3
            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationStart(Animation animation) {
                Log.i("horizontalBanner", "onAnimationStart");
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationRepeat(Animation animation) {
                Log.i("horizontalBanner", "onAnimationRepeat");
            }

            @Override // android.view.animation.Animation.AnimationListener
            public void onAnimationEnd(Animation animation) {
                Log.i("horizontalBanner", "onAnimationEnd");
                horizontalBanner.this.mAnimationHandler.removeCallbacks(horizontalBanner.this.mLoop);
                horizontalBanner.this.mAnimationHandler.postDelayed(horizontalBanner.this.mLoop, 4000L);
            }
        });
        adView.startAnimation(anim);
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdFailedListener
    public void OnAdFailed(MoPubView m) {
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdLoadedListener
    public void OnAdLoaded(MoPubView m) {
        Log.i("horizontalBanner", "OnAdLoaded");
        this.mAnimationHandler.removeCallbacks(this.mLoop);
        removeView(this.mOfflineAd);
    }
}
