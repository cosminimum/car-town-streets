package com.miniclip.nativeJNI;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.os.Handler;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.mopub.mobileads.MoPubView;
/* loaded from: classes.dex */
public class rotatedBannerImg extends RelativeLayout implements MoPubView.OnAdFailedListener, MoPubView.OnAdLoadedListener {
    public static MoPubViewRotate adView;
    private RelativeLayout mAdLayoutVerticle;
    private int mAlignment;
    private Context mContext;
    private RelativeLayout mOfflineAd;
    private Handler mAnimationHandler = new Handler();
    Runnable mLoop = new Runnable() { // from class: com.miniclip.nativeJNI.rotatedBannerImg.1
        @Override // java.lang.Runnable
        public void run() {
            Log.i("rotatedBanner", "loopAnimation");
        }
    };

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class MoPubViewRotate extends MoPubView {
        public MoPubViewRotate(Context context) {
            super(context);
        }

        @Override // android.view.ViewGroup, android.view.View
        public boolean dispatchTouchEvent(MotionEvent event) {
            Log.i("RelativeLayoutRotate", String.format("x: %f y: %f", Float.valueOf(event.getY() % 320.0f), Float.valueOf(event.getX() % 48.0f)));
            event.setLocation(event.getY() % 320.0f, event.getX() % 48.0f);
            return super.dispatchTouchEvent(event);
        }
    }

    public rotatedBannerImg(Context context, int alignment) {
        super(context);
        this.mContext = context;
        this.mAlignment = alignment;
        float density = cocojava.mDensity;
        int resourceIdSide4 = this.mContext.getResources().getIdentifier("a100x640", "drawable", this.mContext.getPackageName());
        this.mOfflineAd = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams sideBar3Params = new RelativeLayout.LayoutParams((int) (50.0f * density), (int) (320.0f * density));
        this.mOfflineAd.setLayoutParams(sideBar3Params);
        ImageView sideBar3Image1 = new ImageView(this.mContext);
        sideBar3Image1.setImageDrawable(getResources().getDrawable(resourceIdSide4));
        Gallery.LayoutParams params = new Gallery.LayoutParams((int) (50.0d * density), (int) (320.0f * density));
        sideBar3Image1.setLayoutParams(params);
        sideBar3Image1.setScaleType(ImageView.ScaleType.FIT_XY);
        this.mOfflineAd.addView(sideBar3Image1);
        this.mOfflineAd.setOnClickListener(new View.OnClickListener() { // from class: com.miniclip.nativeJNI.rotatedBannerImg.2
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                cocojava.openLink("http://bit.ly/wm0xXE");
            }
        });
        adView = new MoPubViewRotate(this.mContext);
        adView.setOnAdFailedListener(this);
        adView.setOnAdLoadedListener(this);
        adView.setAdUnitId(((cocojava) this.mContext).getMoPubGameplayBannerId());
        adView.loadAd();
        reAdd();
    }

    public void setAlignment(int alignment) {
        this.mAlignment = alignment;
        if (alignment == cocojava.ALIGN_RIGHT) {
            float density = cocojava.mDensity;
            RelativeLayout.LayoutParams sideBar3Params = new RelativeLayout.LayoutParams((int) (50.0f * density), (int) (320.0f * density));
            sideBar3Params.addRule(11);
            this.mOfflineAd.setLayoutParams(sideBar3Params);
        }
    }

    public void setAutorefreshEnabled(boolean enabled) {
        adView.setAutorefreshEnabled(enabled);
    }

    public void setBlockAutoRefresh(boolean blocked) {
        adView.setBlockAutoRefresh(blocked);
    }

    public void resetRefreshTime() {
        adView.resetRefreshTime();
    }

    public void reAdd() {
        removeAllViews();
        float height = cocojava.mHeight;
        float density = cocojava.mDensity;
        this.mAdLayoutVerticle = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams paramsVerticle = new RelativeLayout.LayoutParams((int) (density * 320.0d), (int) (density * 320.0d));
        this.mAdLayoutVerticle.setLayoutParams(paramsVerticle);
        ViewGroup p = (ViewGroup) adView.getParent();
        if (p != null) {
            p.removeView(adView);
        }
        this.mAdLayoutVerticle.addView(adView);
        RelativeLayout adLayoutVerticleClick = new RelativeLayout(this.mContext) { // from class: com.miniclip.nativeJNI.rotatedBannerImg.1RelativeLayoutRotate
            @Override // android.view.ViewGroup, android.view.View
            public boolean dispatchTouchEvent(MotionEvent event) {
                rotatedBannerImg.this.runAnimation();
                return rotatedBannerImg.adView.dispatchTouchEvent(event);
            }
        };
        RelativeLayout.LayoutParams paramsVerticleClick = new RelativeLayout.LayoutParams((int) (density * 320.0d), (int) (density * 320.0d));
        adLayoutVerticleClick.setLayoutParams(paramsVerticleClick);
        RelativeLayout.LayoutParams paramsThis = new RelativeLayout.LayoutParams(-1, -1);
        paramsThis.setMargins(0, (int) ((height - (320.0f * density)) * 0.5f), 0, 0);
        setLayoutParams(paramsThis);
        addView(this.mOfflineAd);
        addView(this.mAdLayoutVerticle);
        addView(adLayoutVerticleClick);
    }

    public void runAnimation() {
        this.mAnimationHandler.postDelayed(new Runnable() { // from class: com.miniclip.nativeJNI.rotatedBannerImg.3
            @Override // java.lang.Runnable
            public void run() {
                RelativeLayout rl = new RelativeLayout(rotatedBannerImg.this.mContext);
                RelativeLayout.LayoutParams rlp = new RelativeLayout.LayoutParams((int) (cocojava.mDensity * 50.0f), (int) (cocojava.mDensity * 320.0f));
                rl.setLayoutParams(rlp);
                if (rotatedBannerImg.this.mAlignment == cocojava.ALIGN_RIGHT) {
                    rlp.addRule(11);
                }
                rl.setBackgroundColor(-16777216);
                Bitmap adBitmap = Bitmap.createBitmap((int) (cocojava.mDensity * 320.0f), (int) (cocojava.mDensity * 50.0f), Bitmap.Config.ARGB_8888);
                Canvas c = new Canvas(adBitmap);
                rotatedBannerImg.adView.layout(0, 0, (int) (cocojava.mDensity * 320.0f), (int) (cocojava.mDensity * 50.0f));
                rotatedBannerImg.adView.draw(c);
                Bitmap rotatedBitmap = Bitmap.createBitmap((int) (cocojava.mDensity * 50.0f), (int) (cocojava.mDensity * 320.0f), Bitmap.Config.ARGB_8888);
                Canvas canvas = new Canvas(rotatedBitmap);
                Matrix matrix = new Matrix();
                matrix.setRotate(270.0f, (int) (cocojava.mDensity * 160.0f), (int) (cocojava.mDensity * 160.0f));
                canvas.drawBitmap(adBitmap, matrix, new Paint());
                ImageView newImage = new ImageView(rotatedBannerImg.this.mContext);
                newImage.setImageBitmap(rotatedBitmap);
                rl.addView(newImage);
                thiz.removeView(rotatedBannerImg.this.mOfflineAd);
                rotatedBannerImg.this.mOfflineAd = rl;
                thiz.addView(rotatedBannerImg.this.mOfflineAd);
            }
        }, 1000L);
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdFailedListener
    public void OnAdFailed(MoPubView m) {
    }

    @Override // com.mopub.mobileads.MoPubView.OnAdLoadedListener
    public void OnAdLoaded(MoPubView m) {
        Log.i("rotatedBanner", "OnAdLoaded");
        runAnimation();
    }
}
