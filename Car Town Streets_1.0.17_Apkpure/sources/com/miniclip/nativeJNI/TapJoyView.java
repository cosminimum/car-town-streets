package com.miniclip.nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.Display;
import android.view.View;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miniclip.newsfeed.MCDialog;
import com.tapjoy.TapjoyFeaturedAppObject;
/* loaded from: classes.dex */
public class TapJoyView extends MCDialog implements View.OnClickListener {
    private TapjoyFeaturedAppObject mFeaturedApObject;
    private ImageView mGameImage;
    private ImageView mGotoButton;
    private WebView mWebview;

    public TapJoyView(Context context, TapjoyFeaturedAppObject featApObj) {
        super(context);
        this.mFeaturedApObject = featApObj;
        setScreenContents();
    }

    public void setScreenContents() {
        Display display = ((Activity) this.mContext).getWindowManager().getDefaultDisplay();
        int width = display.getWidth();
        int height = display.getHeight();
        float scaleF = width / 854.0f;
        float scaleH = width / height;
        float f = (scaleH - 1.33f) * 2.2f;
        String htmlContent = ((cocojava) this.mContext).getTapJoyHtmlOffer(this.mFeaturedApObject);
        String htmlContent2 = Uri.encode(htmlContent);
        this.mWebview = new WebView(this.mContext);
        this.mWebview.setBackgroundColor(0);
        this.mWebview.loadData(htmlContent2, "text/html", "UTF-8");
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-2, -2);
        params.addRule(13);
        this.mWebview.setLayoutParams(params);
        this.mContentView.addView(this.mWebview);
        RelativeLayout.LayoutParams paramsCenter1 = new RelativeLayout.LayoutParams((int) (302.0f * scaleF), (int) (73.0f * scaleF));
        paramsCenter1.addRule(14);
        paramsCenter1.addRule(12);
        this.mGotoButton = new ImageView(this.mContext);
        int resourceId = this.mContext.getResources().getIdentifier("get_it_now_button", "drawable", this.mContext.getPackageName());
        this.mGotoButton.setImageDrawable(this.mContext.getResources().getDrawable(resourceId));
        this.mGotoButton.setLayoutParams(paramsCenter1);
        this.mContentView.addView(this.mGotoButton);
        this.mGotoButton.setOnClickListener(this);
    }

    @Override // com.miniclip.newsfeed.MCDialog, android.view.View.OnClickListener
    public void onClick(View v) {
        super.onClick(v);
        if (v == this.mGotoButton) {
            removeAllViews();
            String url = this.mFeaturedApObject.redirectURL;
            Uri uriUrl = Uri.parse(url);
            Intent launchBrowser = new Intent("android.intent.action.VIEW", uriUrl);
            this.mContext.startActivity(launchBrowser);
        } else if (v == this.mCloseButton) {
            removeAllViews();
        }
    }
}
