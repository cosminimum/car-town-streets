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
/* loaded from: classes.dex */
public class HTML5AdView extends AdView {
    static final FrameLayout.LayoutParams COVER_SCREEN_GRAVITY_CENTER = new FrameLayout.LayoutParams(-1, -1, 17);
    private View mCustomView;
    private WebChromeClient.CustomViewCallback mCustomViewCallback;
    private FrameLayout mCustomViewContainer;
    private Bitmap mDefaultVideoPoster;
    private View mVideoProgressView;

    public HTML5AdView(Context context, MoPubView view) {
        super(context, view);
        int sdkVersion = new Integer(Build.VERSION.SDK).intValue();
        if (sdkVersion > 7) {
            setWebChromeClient(new HTML5WebChromeClient());
        }
        this.mCustomViewContainer = new FrameLayout(context);
        this.mCustomViewContainer.setVisibility(8);
        this.mCustomViewContainer.setLayoutParams(COVER_SCREEN_GRAVITY_CENTER);
    }

    /* loaded from: classes.dex */
    private class HTML5WebChromeClient extends WebChromeClient implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener {
        private HTML5WebChromeClient() {
        }

        @Override // android.webkit.WebChromeClient
        public void onShowCustomView(View view, WebChromeClient.CustomViewCallback callback) {
            super.onShowCustomView(view, callback);
            HTML5AdView.this.setVisibility(8);
            if (HTML5AdView.this.mCustomView == null) {
                HTML5AdView.this.mCustomViewContainer.addView(view, HTML5AdView.COVER_SCREEN_GRAVITY_CENTER);
                HTML5AdView.this.mCustomView = view;
                HTML5AdView.this.mCustomViewCallback = callback;
                HTML5AdView.this.mMoPubView.addView(HTML5AdView.this.mCustomViewContainer);
                HTML5AdView.this.mCustomViewContainer.setVisibility(0);
                HTML5AdView.this.mCustomViewContainer.bringToFront();
                return;
            }
            callback.onCustomViewHidden();
        }

        @Override // android.webkit.WebChromeClient
        public void onHideCustomView() {
            if (HTML5AdView.this.mCustomView != null) {
                HTML5AdView.this.mCustomView.setVisibility(8);
                HTML5AdView.this.mCustomViewContainer.removeView(HTML5AdView.this.mCustomView);
                HTML5AdView.this.mCustomView = null;
                HTML5AdView.this.mCustomViewContainer.setVisibility(8);
                HTML5AdView.this.mCustomViewCallback.onCustomViewHidden();
                HTML5AdView.this.mMoPubView.removeView(HTML5AdView.this.mCustomViewContainer);
                HTML5AdView.this.setVisibility(0);
            }
        }

        @Override // android.webkit.WebChromeClient
        public Bitmap getDefaultVideoPoster() {
            if (HTML5AdView.this.mDefaultVideoPoster == null) {
                HTML5AdView.this.mDefaultVideoPoster = BitmapFactory.decodeResource(HTML5AdView.this.getResources(), R.drawable.default_video_poster);
            }
            return HTML5AdView.this.mDefaultVideoPoster;
        }

        @Override // android.webkit.WebChromeClient
        public View getVideoLoadingProgressView() {
            if (HTML5AdView.this.mVideoProgressView == null) {
                LayoutInflater inflater = LayoutInflater.from(HTML5AdView.this.getContext());
                HTML5AdView.this.mVideoProgressView = inflater.inflate(R.layout.video_loading_progress, (ViewGroup) null);
            }
            return HTML5AdView.this.mVideoProgressView;
        }

        @Override // android.media.MediaPlayer.OnErrorListener
        public boolean onError(MediaPlayer arg0, int arg1, int arg2) {
            Log.d("MoPub", "Video errored!");
            return false;
        }

        @Override // android.media.MediaPlayer.OnCompletionListener
        public void onCompletion(MediaPlayer mp) {
            mp.stop();
            HTML5AdView.this.mCustomViewCallback.onCustomViewHidden();
            Log.d("MoPub", "Video completed!");
        }
    }
}
