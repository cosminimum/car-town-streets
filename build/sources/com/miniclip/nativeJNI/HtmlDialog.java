package com.miniclip.nativeJNI;

import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import com.facebook.android.Facebook;
import com.facebook.widget.WebDialog;
import java.io.IOException;
import java.net.URLEncoder;

public class HtmlDialog extends Dialog {
    static final float[] DIMENSIONS_DIFF_LANDSCAPE = {20.0f, 60.0f};
    static final float[] DIMENSIONS_DIFF_PORTRAIT = {40.0f, 60.0f};
    static final String DISPLAY_STRING = "touch";
    static final FrameLayout.LayoutParams FILL = new FrameLayout.LayoutParams(-1, -1);
    static final int MARGIN = 4;
    static final int PADDING = 2;
    private FrameLayout mContent;
    private ImageView mCrossImage;
    private String mHtml;
    private int mIsInternalURL = 1;
    /* access modifiers changed from: private */
    public Facebook.DialogListener mListener;
    private WebView mWebView;

    public HtmlDialog(Context context, String html, int isInternalURL, Facebook.DialogListener listener) {
        super(context, WebDialog.DEFAULT_THEME);
        this.mHtml = html;
        this.mListener = listener;
        this.mIsInternalURL = isInternalURL;
        getWindow().setFlags(1024, 1024);
    }

    public HtmlDialog(Context context, String html, Facebook.DialogListener listener) {
        super(context, WebDialog.DEFAULT_THEME);
        this.mHtml = html;
        this.mListener = listener;
        getWindow().setFlags(1024, 1024);
    }

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        this.mContent = new FrameLayout(getContext());
        createCrossImage();
        setUpWebView(this.mCrossImage.getDrawable().getIntrinsicWidth() / 2);
        this.mContent.addView(this.mCrossImage, new ViewGroup.LayoutParams(-2, -2));
        addContentView(this.mContent, new ViewGroup.LayoutParams(-1, -1));
    }

    private void createCrossImage() {
        this.mCrossImage = new ImageView(getContext());
        this.mCrossImage.setOnClickListener(new View.OnClickListener() {
            public void onClick(View v) {
                HtmlDialog.this.mListener.onCancel();
                HtmlDialog.this.dismiss();
            }
        });
        this.mCrossImage.setImageDrawable(getContext().getResources().getDrawable(getContext().getResources().getIdentifier("close", "drawable", getContext().getPackageName())));
    }

    private void setUpWebView(int margin) {
        LinearLayout webViewContainer = new LinearLayout(getContext());
        this.mWebView = new WebView(getContext());
        this.mWebView.setVerticalScrollBarEnabled(true);
        this.mWebView.setHorizontalScrollBarEnabled(false);
        this.mWebView.setWebViewClient(new WebViewClient());
        this.mWebView.getSettings().setJavaScriptEnabled(true);
        this.mWebView.getSettings().setDefaultTextEncodingName("utf-8");
        try {
            if (this.mIsInternalURL == 0) {
                this.mWebView.loadUrl(this.mHtml);
            } else {
                this.mWebView.loadData(URLEncoder.encode(this.mHtml, "utf-8").replaceAll("\\+", " "), "text/html; charset=UTF-8", (String) null);
            }
        } catch (IOException e) {
        }
        this.mWebView.setScrollContainer(true);
        this.mWebView.setLayoutParams(FILL);
        this.mContent.setBackgroundColor(0);
        this.mWebView.setVisibility(0);
        this.mCrossImage.setVisibility(0);
        webViewContainer.setPadding(margin, margin, margin, margin);
        webViewContainer.addView(this.mWebView);
        this.mContent.addView(webViewContainer);
    }
}
