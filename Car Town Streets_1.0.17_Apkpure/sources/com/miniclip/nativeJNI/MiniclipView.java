package com.miniclip.nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.tapjoy.TapjoyFeaturedAppObject;
/* loaded from: classes.dex */
public class MiniclipView extends RelativeLayout implements View.OnClickListener {
    private ImageView mBodyView;
    private ImageView mCloseButton;
    private Context mContext;
    private TapjoyFeaturedAppObject mFeaturedApObject;
    private int mImageId;
    private RelativeLayout mMainView = null;
    private ImageView mUrl;
    private String mUrlString;

    public MiniclipView(Context context, int imageId, String urlString) {
        super(context);
        this.mContext = context;
        this.mImageId = imageId;
        this.mUrlString = urlString;
        display();
    }

    public void display() {
        removeAllViews();
        int height = ((Activity) this.mContext).getResources().getDisplayMetrics().heightPixels;
        float density = ((Activity) this.mContext).getResources().getDisplayMetrics().density;
        float scaleF = height / 480.0f;
        RelativeLayout.LayoutParams paramsF1 = new RelativeLayout.LayoutParams(-1, -1);
        RelativeLayout blockTouch = new RelativeLayout(this.mContext);
        blockTouch.setLayoutParams(paramsF1);
        blockTouch.setOnClickListener(this);
        addView(blockTouch);
        if (this.mMainView != null) {
            this.mMainView.removeAllViews();
        }
        this.mMainView = new RelativeLayout(this.mContext);
        this.mMainView.setPadding(20, 5, 20, 5);
        addView(this.mMainView);
        setOnClickListener(this);
        ImageView bg1 = new ImageView(this.mContext);
        int resourceId = this.mContext.getResources().getIdentifier("newbox2", "drawable", this.mContext.getPackageName());
        bg1.setImageDrawable(this.mContext.getResources().getDrawable(resourceId));
        this.mMainView.addView(bg1);
        this.mBodyView = new ImageView(this.mContext);
        int resourceId2 = this.mContext.getResources().getIdentifier("buynow_v2", "drawable", this.mContext.getPackageName());
        this.mBodyView.setImageDrawable(this.mContext.getResources().getDrawable(resourceId2));
        this.mBodyView.setOnClickListener(this);
        RelativeLayout rl1 = new RelativeLayout(this.mContext);
        rl1.setLayoutParams(paramsF1);
        rl1.setPadding(60, 50, 60, 50);
        rl1.addView(this.mBodyView);
        RelativeLayout rl7 = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams params7 = new RelativeLayout.LayoutParams((int) (120.0f * density), (int) (120.0f * density));
        params7.addRule(14);
        rl7.setLayoutParams(params7);
        RelativeLayout rl3 = new RelativeLayout(this.mContext);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -2);
        params.addRule(12);
        params.addRule(9);
        rl3.setLayoutParams(params);
        RelativeLayout.LayoutParams paramsnb1 = new RelativeLayout.LayoutParams((int) (400.0f * scaleF), -2);
        RelativeLayout rl4 = new RelativeLayout(this.mContext);
        paramsnb1.addRule(14);
        rl4.setLayoutParams(paramsnb1);
        rl3.addView(rl4);
        RelativeLayout.LayoutParams paramsnb2 = new RelativeLayout.LayoutParams((int) (400.0f * scaleF), -2);
        RelativeLayout rl5 = new RelativeLayout(this.mContext);
        paramsnb2.addRule(11);
        rl5.setLayoutParams(paramsnb2);
        rl3.addView(rl5);
        RelativeLayout rl2 = new RelativeLayout(this.mContext);
        rl2.setPadding(22, 20, 20, 10);
        rl2.addView(rl1);
        rl2.addView(rl3);
        this.mMainView.addView(rl2);
        this.mUrl = new ImageView(this.mContext);
        int resourceId3 = this.mContext.getResources().getIdentifier("newsgetitnow1", "drawable", this.mContext.getPackageName());
        this.mUrl.setImageDrawable(this.mContext.getResources().getDrawable(resourceId3));
        this.mUrl.setOnClickListener(this);
        rl4.addView(this.mUrl);
        this.mCloseButton = new ImageView(this.mContext);
        int resourceId4 = this.mContext.getResources().getIdentifier("newsclose1", "drawable", this.mContext.getPackageName());
        this.mCloseButton.setImageDrawable(this.mContext.getResources().getDrawable(resourceId4));
        this.mCloseButton.setOnClickListener(this);
        RelativeLayout.LayoutParams paramsnb3 = new RelativeLayout.LayoutParams((int) (120.0f * scaleF), -2);
        paramsnb3.addRule(11);
        this.mCloseButton.setLayoutParams(paramsnb3);
        rl2.addView(this.mCloseButton);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        if (v == this.mUrl) {
            removeAllViews();
            Intent intent = new Intent("android.intent.action.VIEW");
            intent.setData(Uri.parse("market://details?id=com.miniclip.gravityguypaid"));
            this.mContext.startActivity(intent);
        } else if (v == this.mCloseButton) {
            removeAllViews();
        }
    }
}
