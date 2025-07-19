package com.mopub.mobileads;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaPlayer;
import android.os.Build;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.webkit.WebChromeClient;
import android.widget.FrameLayout;

public class HTML5AdView extends AdView {
    static final FrameLayout.LayoutParams COVER_SCREEN_GRAVITY_CENTER = new FrameLayout.LayoutParams(-1, -1, 17);
    /* access modifiers changed from: private */
    public View mCustomView;
    /* access modifiers changed from: private */
    public WebChromeClient.CustomViewCallback mCustomViewCallback;
    /* access modifiers changed from: private */
    public FrameLayout mCustomViewContainer;
    /* access modifiers changed from: private */
    public Bitmap mDefaultVideoPoster;
    /* access modifiers changed from: private */
    public View mVideoProgressView;

    public HTML5AdView(Context context, MoPubView view) {
        super(context, view);
        if (new Integer(Build.VERSION.SDK).intValue() > 7) {
            setWebChromeClient(new HTML5WebChromeClient());
        }
        this.mCustomViewContainer = new FrameLayout(context);
        this.mCustomViewContainer.setVisibility(8);
        this.mCustomViewContainer.setLayoutParams(COVER_SCREEN_GRAVITY_CENTER);
    }

    private class HTML5WebChromeClient extends WebChromeClient implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener {
        private HTML5WebChromeClient() {
        }

        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback callback) {
            super.onShowCustomView(view, callback);
            HTML5AdView.this.setVisibility(8);
            if (HTML5AdView.this.mCustomView != null) {
                callback.onCustomViewHidden();
                return;
            }
            HTML5AdView.this.mCustomViewContainer.addView(view, HTML5AdView.COVER_SCREEN_GRAVITY_CENTER);
            View unused = HTML5AdView.this.mCustomView = view;
            WebChromeClient.CustomViewCallback unused2 = HTML5AdView.this.mCustomViewCallback = callback;
            HTML5AdView.this.mMoPubView.addView(HTML5AdView.this.mCustomViewContainer);
            HTML5AdView.this.mCustomViewContainer.setVisibility(0);
            HTML5AdView.this.mCustomViewContainer.bringToFront();
        }

        public void onHideCustomView() {
            if (HTML5AdView.this.mCustomView != null) {
                HTML5AdView.this.mCustomView.setVisibility(8);
                HTML5AdView.this.mCustomViewContainer.removeView(HTML5AdView.this.mCustomView);
                View unused = HTML5AdView.this.mCustomView = null;
                HTML5AdView.this.mCustomViewContainer.setVisibility(8);
                HTML5AdView.this.mCustomViewCallback.onCustomViewHidden();
                HTML5AdView.this.mMoPubView.removeView(HTML5AdView.this.mCustomViewContainer);
                HTML5AdView.this.setVisibility(0);
            }
        }

        public Bitmap getDefaultVideoPoster() {
            if (HTML5AdView.this.mDefaultVideoPoster == null) {
                Bitmap unused = HTML5AdView.this.mDefaultVideoPoster = BitmapFactory.decodeResource(HTML5AdView.this.getResources(), R.drawable.default_video_poster);
            }
            return HTML5AdView.this.mDefaultVideoPoster;
        }

        public View getVideoLoadingProgressView() {
            if (HTML5AdView.this.mVideoProgressView == null) {
                View unused = HTML5AdView.this.mVideoProgressView = LayoutInflater.from(HTML5AdView.this.getContext()).inflate(R.layout.video_loading_progress, (ViewGroup) null);
            }
            return HTML5AdView.this.mVideoProgressView;
        }

        public boolean onError(MediaPlayer arg0, int arg1, int arg2) {
            Log.d("MoPub", "Video errored!");
            return false;
        }

        public void onCompletion(MediaPlayer mp) {
            mp.stop();
            HTML5AdView.this.mCustomViewCallback.onCustomViewHidden();
            Log.d("MoPub", "Video completed!");
        }
    }
}
