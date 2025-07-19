package com.miniclip.newsfeed;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.Handler;
import android.support.v4.view.MotionEventCompat;
import android.util.Log;
import android.view.Display;
import android.view.View;
import android.widget.Button;
import android.widget.Gallery;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.miniclip.nativeJNI.cocojava;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
/* loaded from: classes.dex */
public class NewsfeedDialog extends RelativeLayout implements View.OnClickListener {
    private int localUrgentNewsNum;
    protected ImageView mCloseButton;
    protected RelativeLayout mContentView;
    protected Context mContext;
    private int mCurNews;
    private RelativeLayout mDialogView;
    protected RelativeLayout mFullView;
    private ImageView mGotoButton1;
    private URLImageView mImageView;
    private ImageView mLeftButton1;
    private Newsfeed mNewsfeed;
    private ImageView mRightButton1;
    private boolean mUrgent;
    private RelativeLayout mWebCover1;
    protected RelativeLayout mWindowView;
    private Handler mHandler = new Handler();
    private Runnable mResetEffests = new Runnable() { // from class: com.miniclip.newsfeed.NewsfeedDialog.1
        @Override // java.lang.Runnable
        public void run() {
            NewsfeedDialog.this.mLeftButton1.setAlpha(MotionEventCompat.ACTION_MASK);
            NewsfeedDialog.this.mRightButton1.setAlpha(MotionEventCompat.ACTION_MASK);
        }
    };

    /* loaded from: classes.dex */
    public class URLImageView extends ImageView {
        public URLImageView(Context context) {
            super(context);
        }

        public boolean loadFromURL(String url) {
            try {
                URL newurl = new URL(url);
                try {
                    Bitmap imageBitmap = BitmapFactory.decodeStream(newurl.openConnection().getInputStream());
                    setImageBitmap(imageBitmap);
                    return true;
                } catch (IOException e) {
                    e.printStackTrace();
                    return false;
                }
            } catch (MalformedURLException e2) {
                e2.printStackTrace();
                return false;
            }
        }
    }

    public NewsfeedDialog(Context context, Newsfeed newsfeed, boolean urgent) {
        super(context);
        RelativeLayout.LayoutParams paramsFull2;
        RelativeLayout.LayoutParams paramsFull3;
        RelativeLayout.LayoutParams paramsContent1;
        String htmlContent;
        this.mImageView = null;
        this.mContext = context;
        this.mUrgent = urgent;
        Display display = ((Activity) this.mContext).getWindowManager().getDefaultDisplay();
        int width = display.getWidth();
        display.getHeight();
        float density = cocojava.mDensity;
        RelativeLayout.LayoutParams paramsFull1 = new RelativeLayout.LayoutParams(-1, -1);
        this.mFullView = new RelativeLayout(this.mContext);
        this.mFullView.setLayoutParams(paramsFull1);
        this.mFullView.setOnClickListener(this);
        addView(this.mFullView);
        if (cocojava.mINGAME_LANDSCAPE) {
            paramsFull2 = new RelativeLayout.LayoutParams((int) (490.0f * density), (int) (325.0f * density));
        } else {
            paramsFull2 = new RelativeLayout.LayoutParams((int) (320.0f * density), (int) (440.0f * density));
        }
        paramsFull2.addRule(13);
        this.mDialogView = new RelativeLayout(this.mContext);
        this.mDialogView.setLayoutParams(paramsFull2);
        this.mFullView.addView(this.mDialogView);
        if (cocojava.mINGAME_LANDSCAPE) {
            paramsFull3 = new RelativeLayout.LayoutParams((int) (450.0f * density), (int) (265.0f * density));
        } else {
            paramsFull3 = new RelativeLayout.LayoutParams((int) (280.0f * density), (int) (380.0f * density));
        }
        paramsFull3.addRule(13);
        this.mWindowView = new RelativeLayout(this.mContext);
        this.mWindowView.setLayoutParams(paramsFull3);
        this.mDialogView.addView(this.mWindowView);
        Button i = new Button(this.mContext);
        int resourceId = this.mContext.getResources().getIdentifier("full_dialog1", "drawable", this.mContext.getPackageName());
        i.setBackgroundResource(resourceId);
        i.setLayoutParams(new Gallery.LayoutParams(-1, -1));
        this.mWindowView.addView(i);
        if (cocojava.mINGAME_LANDSCAPE) {
            paramsContent1 = new RelativeLayout.LayoutParams((int) (430.0f * density), (int) (215.0f * density));
        } else {
            paramsContent1 = new RelativeLayout.LayoutParams((int) (260.0f * density), (int) (330.0f * density));
        }
        paramsContent1.addRule(13);
        int margin2 = (int) (38.0f * density);
        this.mContentView = new RelativeLayout(this.mContext);
        this.mContentView.setLayoutParams(paramsContent1);
        this.mDialogView.addView(this.mContentView);
        RelativeLayout.LayoutParams paramsRight1 = new RelativeLayout.LayoutParams((int) (55.0f * density), (int) (55.0f * density));
        paramsRight1.addRule(11);
        this.mCloseButton = new ImageView(this.mContext);
        int resourceId2 = this.mContext.getResources().getIdentifier("close_button", "drawable", this.mContext.getPackageName());
        this.mCloseButton.setImageDrawable(this.mContext.getResources().getDrawable(resourceId2));
        this.mCloseButton.setLayoutParams(paramsRight1);
        this.mDialogView.addView(this.mCloseButton);
        this.mCloseButton.setOnClickListener(this);
        this.mCurNews = 0;
        this.mNewsfeed = newsfeed;
        if (!urgent && this.mNewsfeed.messagesNum < 1) {
            Log.i("Newsfeed", "0 messages");
        } else if (urgent && this.mNewsfeed.messagesNumUrgent < 1) {
            Log.i("Newsfeed", "0 urgent messages");
        } else {
            this.localUrgentNewsNum = this.mNewsfeed.messagesNumUrgent;
            this.mImageView = new URLImageView(this.mContext);
            this.mImageView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            this.mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
            this.mContentView.addView(this.mImageView);
            RelativeLayout.LayoutParams paramsWeb2 = new RelativeLayout.LayoutParams(-1, -1);
            paramsWeb2.addRule(14);
            this.mWebCover1 = new RelativeLayout(this.mContext);
            this.mWebCover1.setLayoutParams(paramsWeb2);
            this.mWebCover1.setOnClickListener(this);
            if (this.mUrgent) {
                htmlContent = this.mNewsfeed.getHTML(0, true);
            } else {
                htmlContent = this.mNewsfeed.getHTML(0, false);
            }
            this.mImageView.loadFromURL(htmlContent);
            int bWidth = (width - margin2) - margin2;
            bWidth = ((float) bWidth) > 300.0f * density ? (int) (300.0f * density) : bWidth;
            float bScale = 1.0f;
            bScale = ((int) (534.0f * density)) > bWidth ? bWidth / (534.0f * density) : bScale;
            RelativeLayout.LayoutParams paramsCenter2 = new RelativeLayout.LayoutParams(((int) (534.0f * density * bScale)) + ((int) (60.0f * density * bScale)), ((int) (73.0f * density * bScale)) + ((int) (35.0f * density * bScale)));
            paramsCenter2.addRule(14);
            paramsCenter2.addRule(12);
            RelativeLayout navButtons = new RelativeLayout(this.mContext);
            navButtons.setLayoutParams(paramsCenter2);
            RelativeLayout.LayoutParams paramsLeft1 = new RelativeLayout.LayoutParams((int) (116.0f * density * bScale), (int) (73.0f * density * bScale));
            paramsLeft1.addRule(15);
            this.mLeftButton1 = new ImageView(this.mContext);
            int resourceId3 = this.mContext.getResources().getIdentifier("left_button", "drawable", this.mContext.getPackageName());
            this.mLeftButton1.setImageDrawable(this.mContext.getResources().getDrawable(resourceId3));
            this.mLeftButton1.setLayoutParams(paramsLeft1);
            navButtons.addView(this.mLeftButton1);
            this.mLeftButton1.setOnClickListener(this);
            RelativeLayout.LayoutParams paramsCenter1 = new RelativeLayout.LayoutParams((int) (302.0f * density * bScale), (int) (73.0f * density * bScale));
            paramsCenter1.addRule(14);
            paramsCenter1.addRule(15);
            this.mGotoButton1 = new ImageView(this.mContext);
            int resourceId4 = this.mContext.getResources().getIdentifier("get_it_now_button", "drawable", this.mContext.getPackageName());
            this.mGotoButton1.setImageDrawable(this.mContext.getResources().getDrawable(resourceId4));
            this.mGotoButton1.setLayoutParams(paramsCenter1);
            navButtons.addView(this.mGotoButton1);
            this.mGotoButton1.setOnClickListener(this);
            RelativeLayout.LayoutParams paramsRight2 = new RelativeLayout.LayoutParams((int) (116.0d * density * bScale), (int) (73.0d * density * bScale));
            paramsRight2.addRule(11);
            paramsRight2.addRule(15);
            this.mRightButton1 = new ImageView(this.mContext);
            int resourceId5 = this.mContext.getResources().getIdentifier("right_button", "drawable", this.mContext.getPackageName());
            this.mRightButton1.setImageDrawable(this.mContext.getResources().getDrawable(resourceId5));
            this.mRightButton1.setLayoutParams(paramsRight2);
            navButtons.addView(this.mRightButton1);
            this.mRightButton1.setOnClickListener(this);
            this.mDialogView.addView(navButtons);
            RelativeLayout.LayoutParams paramsNews1 = new RelativeLayout.LayoutParams((int) (126.0f * density), (int) (50.0f * density));
            paramsNews1.setMargins((int) (55.0f * density), 0, 0, 0);
            ImageView newsImg1 = new ImageView(this.mContext);
            int resourceId6 = this.mContext.getResources().getIdentifier("news", "drawable", this.mContext.getPackageName());
            newsImg1.setImageDrawable(this.mContext.getResources().getDrawable(resourceId6));
            newsImg1.setLayoutParams(paramsNews1);
            this.mDialogView.addView(newsImg1);
        }
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        String url;
        String htmlContent;
        String htmlContent2;
        if (v == this.mCloseButton) {
            cocojava.NF_dismissBoard();
        } else if (v == this.mLeftButton1) {
            int messageNumCur = this.mNewsfeed.messagesNum;
            if (this.mUrgent) {
                messageNumCur = this.localUrgentNewsNum;
            }
            if (this.mCurNews > 0) {
                this.mCurNews--;
            } else {
                this.mCurNews = messageNumCur - 1;
            }
            if (this.mCurNews < 0) {
                this.mCurNews = 0;
            }
            this.mLeftButton1.setAlpha(100);
            if (this.mUrgent) {
                htmlContent2 = this.mNewsfeed.getHTML(this.mCurNews, true);
            } else {
                htmlContent2 = this.mNewsfeed.getHTML(this.mCurNews, false);
            }
            Log.i("NewsFeed", "html content is" + htmlContent2);
            if (this.mImageView != null) {
                this.mContentView.removeView(this.mImageView);
            }
            this.mImageView = new URLImageView(this.mContext);
            this.mImageView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            this.mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
            this.mImageView.loadFromURL(htmlContent2);
            this.mContentView.addView(this.mImageView);
            this.mHandler.removeCallbacks(this.mResetEffests);
            this.mHandler.postDelayed(this.mResetEffests, 200L);
        } else if (v == this.mRightButton1) {
            int messageNumCur2 = this.mNewsfeed.messagesNum;
            if (this.mUrgent) {
                messageNumCur2 = this.localUrgentNewsNum;
            }
            if (this.mCurNews + 1 < messageNumCur2) {
                this.mCurNews++;
            } else {
                this.mCurNews = 0;
            }
            this.mRightButton1.setAlpha(100);
            if (this.mUrgent) {
                htmlContent = this.mNewsfeed.getHTML(this.mCurNews, true);
            } else {
                htmlContent = this.mNewsfeed.getHTML(this.mCurNews, false);
            }
            Log.i("NewsFeed", "html content is" + htmlContent);
            if (this.mImageView != null) {
                this.mContentView.removeView(this.mImageView);
            }
            this.mImageView = new URLImageView(this.mContext);
            this.mImageView.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            this.mImageView.setScaleType(ImageView.ScaleType.FIT_XY);
            this.mImageView.loadFromURL(htmlContent);
            this.mContentView.addView(this.mImageView);
            this.mHandler.removeCallbacks(this.mResetEffests);
            this.mHandler.postDelayed(this.mResetEffests, 200L);
        } else if (v == this.mGotoButton1 || v == this.mWebCover1) {
            this.mCloseButton.setAlpha(100);
            if (this.mUrgent) {
                this.mNewsfeed.setClicked(this.mCurNews, true);
                url = this.mNewsfeed.getLink(this.mCurNews, true);
            } else {
                this.mNewsfeed.setClicked(this.mCurNews, false);
                url = this.mNewsfeed.getLink(this.mCurNews, false);
            }
            if (url != null && url != "") {
                Log.i("Newsfeed", url);
                Uri uriUrl = Uri.parse(url);
                if (uriUrl != null) {
                    Intent launchBrowser = new Intent("android.intent.action.VIEW", uriUrl);
                    this.mContext.startActivity(launchBrowser);
                }
            }
        }
    }
}
