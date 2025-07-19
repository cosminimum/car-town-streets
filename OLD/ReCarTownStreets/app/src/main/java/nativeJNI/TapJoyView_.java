package nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.webkit.WebView;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import com.tapjoy.TapjoyFeaturedAppObject;

public class TapJoyView_ extends RelativeLayout implements View.OnClickListener {
    private ImageView mCloseButton;
    private Context mContext;
    private TapjoyFeaturedAppObject mFeaturedApObject;
    private ImageView mForwardButton;
    private ImageView mGotoButton;
    private RelativeLayout mMainView = null;
    private ImageView mUrlButton;
    private WebView mWebview;

    public TapJoyView_(Context context, TapjoyFeaturedAppObject featuredApObject) {
        super(context);
        this.mContext = context;
        this.mFeaturedApObject = featuredApObject;
        displayTJ();
    }

    public void displayTJ() {
        removeAllViews();
        int height = ((Activity) this.mContext).getResources().getDisplayMetrics().heightPixels;
        float density = ((Activity) this.mContext).getResources().getDisplayMetrics().density;
        float scaleF = ((float) height) / 480.0f;
        LayoutParams paramsF1 = new LayoutParams(-1, -1);
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
        bg1.setImageDrawable(this.mContext.getResources().getDrawable(this.mContext.getResources().getIdentifier("newbox2", "drawable", this.mContext.getPackageName())));
        this.mMainView.addView(bg1);
        this.mWebview = new WebView(this.mContext);
        this.mWebview.setBackgroundColor(0);
        RelativeLayout relativeLayout = new RelativeLayout(this.mContext);
        relativeLayout.setLayoutParams(paramsF1);
        relativeLayout.setPadding(60, 50, 60, 0);
        relativeLayout.addView(this.mWebview);
        RelativeLayout relativeLayout2 = new RelativeLayout(this.mContext);
        LayoutParams params7 = new LayoutParams((int) (120.0f * density), (int) (120.0f * density));
        params7.addRule(14);
        relativeLayout2.setLayoutParams(params7);
        RelativeLayout relativeLayout3 = new RelativeLayout(this.mContext);
        LayoutParams params = new LayoutParams(-1, -2);
        params.addRule(12);
        params.addRule(9);
        relativeLayout3.setLayoutParams(params);
        LayoutParams paramsnb1 = new LayoutParams((int) (400.0f * scaleF), -2);
        RelativeLayout relativeLayout4 = new RelativeLayout(this.mContext);
        paramsnb1.addRule(14);
        relativeLayout4.setLayoutParams(paramsnb1);
        relativeLayout3.addView(relativeLayout4);
        LayoutParams paramsnb2 = new LayoutParams((int) (400.0f * scaleF), -2);
        RelativeLayout relativeLayout5 = new RelativeLayout(this.mContext);
        paramsnb2.addRule(11);
        relativeLayout5.setLayoutParams(paramsnb2);
        relativeLayout3.addView(relativeLayout5);
        RelativeLayout relativeLayout6 = new RelativeLayout(this.mContext);
        relativeLayout6.setPadding(22, 20, 20, 10);
        relativeLayout6.addView(relativeLayout);
        relativeLayout6.addView(relativeLayout3);
        this.mWebview.loadData(Uri.encode(String.format("<center><p style='font-family:Impact;color:white;font-size:20px;font-name:arial;font-weight:bold'>Get %s free slowmotions</p><img style='display: block;margin-left: auto;margin-right: auto;width:100px;height:100px;' src='%s' /><p style='font-family:Impact;color:white;font-size:20px;font-name:arial'>%s %s</p></center>", new Object[]{String.valueOf(this.mFeaturedApObject.amount / 50), this.mFeaturedApObject.iconURL, this.mFeaturedApObject.description, this.mFeaturedApObject.cost})), "text/html", "UTF-8");
        this.mMainView.addView(relativeLayout6);
        this.mUrlButton = new ImageView(this.mContext);
        this.mUrlButton.setImageDrawable(this.mContext.getResources().getDrawable(this.mContext.getResources().getIdentifier("newsgetitnow1", "drawable", this.mContext.getPackageName())));
        this.mUrlButton.setOnClickListener(this);
        relativeLayout4.addView(this.mUrlButton);
        this.mCloseButton = new ImageView(this.mContext);
        this.mCloseButton.setImageDrawable(this.mContext.getResources().getDrawable(this.mContext.getResources().getIdentifier("newsclose1", "drawable", this.mContext.getPackageName())));
        this.mCloseButton.setOnClickListener(this);
        LayoutParams paramsnb3 = new LayoutParams((int) (120.0f * scaleF), -2);
        paramsnb3.addRule(11);
        this.mCloseButton.setLayoutParams(paramsnb3);
        relativeLayout6.addView(this.mCloseButton);
    }

    public void onClick(View v) {
        if (v == this.mUrlButton) {
            removeAllViews();
            this.mContext.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(this.mFeaturedApObject.redirectURL)));
        } else if (v == this.mCloseButton) {
            removeAllViews();
        }
    }
}
