package nativeJNI;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;

import com.tapjoy.TapjoyFeaturedAppObject;

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
        this.mBodyView = new ImageView(this.mContext);
        this.mBodyView.setImageDrawable(this.mContext.getResources().getDrawable(this.mContext.getResources().getIdentifier("buynow_v2", "drawable", this.mContext.getPackageName())));
        this.mBodyView.setOnClickListener(this);
        RelativeLayout relativeLayout = new RelativeLayout(this.mContext);
        relativeLayout.setLayoutParams(paramsF1);
        relativeLayout.setPadding(60, 50, 60, 50);
        relativeLayout.addView(this.mBodyView);
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
        this.mMainView.addView(relativeLayout6);
        this.mUrl = new ImageView(this.mContext);
        this.mUrl.setImageDrawable(this.mContext.getResources().getDrawable(this.mContext.getResources().getIdentifier("newsgetitnow1", "drawable", this.mContext.getPackageName())));
        this.mUrl.setOnClickListener(this);
        relativeLayout4.addView(this.mUrl);
        this.mCloseButton = new ImageView(this.mContext);
        this.mCloseButton.setImageDrawable(this.mContext.getResources().getDrawable(this.mContext.getResources().getIdentifier("newsclose1", "drawable", this.mContext.getPackageName())));
        this.mCloseButton.setOnClickListener(this);
        LayoutParams paramsnb3 = new LayoutParams((int) (120.0f * scaleF), -2);
        paramsnb3.addRule(11);
        this.mCloseButton.setLayoutParams(paramsnb3);
        relativeLayout6.addView(this.mCloseButton);
    }

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
