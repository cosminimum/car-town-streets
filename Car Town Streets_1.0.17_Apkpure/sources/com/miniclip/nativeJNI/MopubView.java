package com.miniclip.nativeJNI;

import android.content.Context;
import android.os.Handler;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miniclip.newsfeed.MCDialog;
import com.mopub.mobileads.MoPubView;
/* loaded from: classes.dex */
public class MopubView extends MCDialog implements View.OnClickListener {
    private MoPubView mAdView;
    private Handler mHandler = new Handler();
    private ImageView mRemoveAdsButton;

    public MopubView(Context context, MoPubView adView) {
        super(context);
        this.mAdView = adView;
        this.mWindowView.setPadding(0, 25, 0, 10);
        RelativeLayout.LayoutParams paramsWeb1 = new RelativeLayout.LayoutParams(-2, -2);
        paramsWeb1.addRule(13);
        RelativeLayout webLayout1 = new RelativeLayout(this.mContext);
        webLayout1.setLayoutParams(paramsWeb1);
        if (!this.mAdView.AdLoaded()) {
            this.mRemoveAdsButton = new ImageView(this.mContext);
            int resourceId = getResources().getIdentifier("remove_ads", "drawable", this.mContext.getPackageName());
            this.mRemoveAdsButton.setImageDrawable(getResources().getDrawable(resourceId));
            this.mRemoveAdsButton.setOnClickListener(this);
            webLayout1.addView(this.mRemoveAdsButton);
        } else {
            webLayout1.addView(this.mAdView);
        }
        this.mFullView.addView(webLayout1);
    }

    @Override // com.miniclip.newsfeed.MCDialog, android.view.View.OnClickListener
    public void onClick(View view) {
        super.onClick(view);
        if (view == this.mRemoveAdsButton) {
            cocojava.callInAppPurchaseManaged("remove_ads", 0, 0);
        }
    }
}
