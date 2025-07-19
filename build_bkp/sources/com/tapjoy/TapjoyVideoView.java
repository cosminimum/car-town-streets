package com.tapjoy;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Typeface;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.VideoView;
import java.util.Timer;
import java.util.TimerTask;

public class TapjoyVideoView extends Activity implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener {
    private static final String BUNDLE_DIALOG_SHOWING = "dialog_showing";
    private static final String BUNDLE_SEEK_TIME = "seek_time";
    private static final int DIALOG_WARNING_ID = 0;
    private static boolean streamingVideo = false;
    static int textSize = 16;
    /* access modifiers changed from: private */
    public static TapjoyVideoObject videoData = null;
    private static boolean videoError = false;
    private static final String videoSecondsText = " seconds";
    private static final String videoWillResumeText = "";
    final String TAPJOY_VIDEO = "VIDEO";
    private boolean allowBackKey = false;
    /* access modifiers changed from: private */
    public boolean clickRequestSuccess = false;
    int deviceScreenDensity;
    int deviceScreenLayoutSize;
    Dialog dialog;
    /* access modifiers changed from: private */
    public boolean dialogShowing = false;
    final Handler mHandler = new Handler();
    final Runnable mUpdateResults = new Runnable() {
        public void run() {
            TapjoyVideoView.this.overlayText.setText(TapjoyVideoView.videoWillResumeText + TapjoyVideoView.this.getRemainingVideoTime() + TapjoyVideoView.videoSecondsText);
        }
    };
    /* access modifiers changed from: private */
    public TextView overlayText = null;
    private RelativeLayout relativeLayout;
    /* access modifiers changed from: private */
    public int seekTime = 0;
    private boolean sendClick = false;
    private ImageView tapjoyImage;
    private int timeRemaining = 0;
    Timer timer = null;
    private String videoPath = null;
    /* access modifiers changed from: private */
    public VideoView videoView = null;
    private Bitmap watermark;
    private WebView webView;
    private String webviewURL = null;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        TapjoyLog.m4436i("VIDEO", "onCreate");
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            TapjoyLog.m4436i("VIDEO", "*** Loading saved data from bundle ***");
            this.seekTime = savedInstanceState.getInt(BUNDLE_SEEK_TIME);
            this.dialogShowing = savedInstanceState.getBoolean(BUNDLE_DIALOG_SHOWING);
        }
        TapjoyLog.m4436i("VIDEO", "dialogShowing: " + this.dialogShowing + ", seekTime: " + this.seekTime);
        this.sendClick = true;
        streamingVideo = false;
        if (TapjoyVideo.getInstance() == null) {
            TapjoyLog.m4436i("VIDEO", "null video");
            finish();
            return;
        }
        videoData = TapjoyVideo.getInstance().getCurrentVideoData();
        this.videoPath = videoData.dataLocation;
        this.webviewURL = videoData.webviewURL;
        if (this.videoPath == null || this.videoPath.length() == 0) {
            TapjoyLog.m4436i("VIDEO", "no cached video, try streaming video at location: " + videoData.videoURL);
            this.videoPath = videoData.videoURL;
            streamingVideo = true;
        }
        TapjoyLog.m4436i("VIDEO", "videoPath: " + this.videoPath);
        requestWindowFeature(1);
        this.relativeLayout = new RelativeLayout(this);
        this.relativeLayout.setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
        setContentView(this.relativeLayout);
        if (Integer.parseInt(Build.VERSION.SDK) > 3) {
            this.deviceScreenLayoutSize = new TapjoyDisplayMetricsUtil(this).getScreenLayoutSize();
            TapjoyLog.m4436i("VIDEO", "deviceScreenLayoutSize: " + this.deviceScreenLayoutSize);
            if (this.deviceScreenLayoutSize == 4) {
                textSize = 32;
            }
        }
        TapjoyLog.m4436i("VIDEO", "textSize: " + textSize);
        initVideoView();
        TapjoyLog.m4436i("VIDEO", "onCreate DONE");
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        super.onPause();
        if (this.videoView.isPlaying()) {
            TapjoyLog.m4436i("VIDEO", "onPause");
            this.seekTime = this.videoView.getCurrentPosition();
            TapjoyLog.m4436i("VIDEO", "seekTime: " + this.seekTime);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        TapjoyLog.m4436i("VIDEO", "onResume");
        super.onResume();
        setRequestedOrientation(0);
        if (this.seekTime > 0) {
            TapjoyLog.m4436i("VIDEO", "seekTime: " + this.seekTime);
            this.videoView.seekTo(this.seekTime);
            if (!this.dialogShowing || this.dialog == null || !this.dialog.isShowing()) {
                this.videoView.start();
            }
        }
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        TapjoyLog.m4436i("VIDEO", "*** onSaveInstanceState ***");
        TapjoyLog.m4436i("VIDEO", "dialogShowing: " + this.dialogShowing + ", seekTime: " + this.seekTime);
        outState.putBoolean(BUNDLE_DIALOG_SHOWING, this.dialogShowing);
        outState.putInt(BUNDLE_SEEK_TIME, this.seekTime);
    }

    public void onWindowFocusChanged(boolean hasFocus) {
        TapjoyLog.m4436i("VIDEO", "onWindowFocusChanged");
        super.onWindowFocusChanged(hasFocus);
    }

    /* access modifiers changed from: private */
    public void initVideoView() {
        this.relativeLayout.removeAllViews();
        this.relativeLayout.setBackgroundColor(-16777216);
        if (this.videoView == null && this.overlayText == null) {
            this.tapjoyImage = new ImageView(this);
            this.watermark = TapjoyVideo.getWatermarkImage();
            if (this.watermark != null) {
                this.tapjoyImage.setImageBitmap(this.watermark);
            }
            RelativeLayout.LayoutParams imageParams = new RelativeLayout.LayoutParams(-2, -2);
            imageParams.addRule(12);
            imageParams.addRule(11);
            this.tapjoyImage.setLayoutParams(imageParams);
            this.videoView = new VideoView(this);
            this.videoView.setOnCompletionListener(this);
            this.videoView.setOnErrorListener(this);
            this.videoView.setOnPreparedListener(this);
            if (streamingVideo) {
                TapjoyLog.m4436i("VIDEO", "streaming video: " + this.videoPath);
                this.videoView.setVideoURI(Uri.parse(this.videoPath));
            } else {
                TapjoyLog.m4436i("VIDEO", "cached video: " + this.videoPath);
                this.videoView.setVideoPath(this.videoPath);
            }
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(13);
            this.videoView.setLayoutParams(layoutParams);
            this.timeRemaining = this.videoView.getDuration() / 1000;
            TapjoyLog.m4436i("VIDEO", "videoView.getDuration(): " + this.videoView.getDuration());
            TapjoyLog.m4436i("VIDEO", "timeRemaining: " + this.timeRemaining);
            this.overlayText = new TextView(this);
            this.overlayText.setTextSize((float) textSize);
            this.overlayText.setTypeface(Typeface.create("default", 1), 1);
            RelativeLayout.LayoutParams textParams = new RelativeLayout.LayoutParams(-2, -2);
            textParams.addRule(12);
            this.overlayText.setLayoutParams(textParams);
        }
        startVideo();
        this.relativeLayout.addView(this.videoView);
        this.relativeLayout.addView(this.tapjoyImage);
        this.relativeLayout.addView(this.overlayText);
    }

    private void initVideoCompletionScreen() {
        this.webView = new WebView(this);
        this.webView.setWebViewClient(new WebViewClient() {
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                TapjoyLog.m4436i("VIDEO", "URL = [" + url + "]");
                if (url.contains("offer_wall")) {
                    TapjoyLog.m4436i("VIDEO", "back to offers");
                    TapjoyVideoView.this.finish();
                    return true;
                } else if (url.contains("tjvideo")) {
                    TapjoyLog.m4436i("VIDEO", "replay");
                    TapjoyVideoView.this.initVideoView();
                    return true;
                } else if (url.contains(TapjoyConstants.TJC_BASE_REDIRECT_DOMAIN)) {
                    TapjoyLog.m4436i("VIDEO", "Open redirecting URL = [" + url + "]");
                    view.loadUrl(url);
                    return true;
                } else {
                    TapjoyLog.m4436i("VIDEO", "Opening URL in new browser = [" + url + "]");
                    TapjoyVideoView.this.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
                    return true;
                }
            }
        });
        this.webView.getSettings().setJavaScriptEnabled(true);
        this.webView.loadUrl(this.webviewURL);
    }

    private void showVideoCompletionScreen() {
        this.relativeLayout.removeAllViews();
        this.relativeLayout.addView(this.webView, -1, -1);
    }

    private void startVideo() {
        this.videoView.requestFocus();
        if (this.dialogShowing) {
            this.videoView.seekTo(this.seekTime);
            TapjoyLog.m4436i("VIDEO", "dialog is showing -- don't start");
        } else {
            TapjoyLog.m4436i("VIDEO", "start");
            this.videoView.seekTo(0);
            this.videoView.start();
        }
        if (this.timer != null) {
            this.timer.cancel();
        }
        this.timer = new Timer();
        this.timer.schedule(new RemainingTime(), 500, 100);
        initVideoCompletionScreen();
        this.clickRequestSuccess = false;
        if (this.sendClick) {
            new Thread(new Runnable() {
                public void run() {
                    TapjoyLog.m4436i("VIDEO", "SENDING CLICK...");
                    String response = new TapjoyURLConnection().connectToURL(TapjoyVideoView.videoData.clickURL);
                    if (response != null && response.contains("OK")) {
                        TapjoyLog.m4436i("VIDEO", "CLICK REQUEST SUCCESS!");
                        boolean unused = TapjoyVideoView.this.clickRequestSuccess = true;
                    }
                }
            }).start();
            this.sendClick = false;
        }
    }

    /* access modifiers changed from: private */
    public int getRemainingVideoTime() {
        int timeRemaining2 = (this.videoView.getDuration() - this.videoView.getCurrentPosition()) / 1000;
        if (timeRemaining2 < 0) {
            return 0;
        }
        return timeRemaining2;
    }

    private class RemainingTime extends TimerTask {
        private RemainingTime() {
        }

        public void run() {
            TapjoyVideoView.this.mHandler.post(TapjoyVideoView.this.mUpdateResults);
        }
    }

    public void onPrepared(MediaPlayer mp) {
        TapjoyLog.m4436i("VIDEO", "onPrepared");
    }

    public boolean onError(MediaPlayer mp, int what, int extra) {
        videoError = true;
        TapjoyLog.m4436i("VIDEO", "onError");
        TapjoyVideo.videoNotifierError(3);
        this.allowBackKey = true;
        if (this.timer == null) {
            return false;
        }
        this.timer.cancel();
        return false;
    }

    public void onCompletion(MediaPlayer mp) {
        TapjoyLog.m4436i("VIDEO", "onCompletion");
        if (this.timer != null) {
            this.timer.cancel();
        }
        showVideoCompletionScreen();
        if (!videoError) {
            TapjoyVideo.videoNotifierComplete();
            new Thread(new Runnable() {
                public void run() {
                    if (TapjoyVideoView.this.clickRequestSuccess) {
                        TapjoyConnectCore.getInstance().actionComplete(TapjoyVideoView.videoData.offerID);
                    }
                }
            }).start();
        }
        videoError = false;
        this.allowBackKey = true;
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            if (!this.allowBackKey) {
                this.seekTime = this.videoView.getCurrentPosition();
                this.videoView.pause();
                this.dialogShowing = true;
                showDialog(0);
                TapjoyLog.m4436i("VIDEO", "PAUSE VIDEO time: " + this.seekTime);
                TapjoyLog.m4436i("VIDEO", "currentPosition: " + this.videoView.getCurrentPosition());
                TapjoyLog.m4436i("VIDEO", "duration: " + this.videoView.getDuration() + ", elapsed: " + (this.videoView.getDuration() - this.videoView.getCurrentPosition()));
                return true;
            } else if (this.videoView.isPlaying()) {
                this.videoView.stopPlayback();
                showVideoCompletionScreen();
                if (this.timer == null) {
                    return true;
                }
                this.timer.cancel();
                return true;
            }
        }
        return super.onKeyDown(keyCode, event);
    }

    /* access modifiers changed from: protected */
    public Dialog onCreateDialog(int id) {
        TapjoyLog.m4436i("VIDEO", "dialog onCreateDialog");
        if (!this.dialogShowing) {
            return this.dialog;
        }
        switch (id) {
            case 0:
                this.dialog = new AlertDialog.Builder(this).setTitle("Cancel Video?").setMessage("Currency will not be awarded, are you sure you want to cancel the video?").setNegativeButton("End", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int whichButton) {
                        TapjoyVideoView.this.finish();
                    }
                }).setPositiveButton("Resume", new DialogInterface.OnClickListener() {
                    public void onClick(DialogInterface dialog, int whichButton) {
                        dialog.dismiss();
                        TapjoyVideoView.this.videoView.seekTo(TapjoyVideoView.this.seekTime);
                        TapjoyVideoView.this.videoView.start();
                        boolean unused = TapjoyVideoView.this.dialogShowing = false;
                        TapjoyLog.m4436i("VIDEO", "RESUME VIDEO time: " + TapjoyVideoView.this.seekTime);
                        TapjoyLog.m4436i("VIDEO", "currentPosition: " + TapjoyVideoView.this.videoView.getCurrentPosition());
                        TapjoyLog.m4436i("VIDEO", "duration: " + TapjoyVideoView.this.videoView.getDuration() + ", elapsed: " + (TapjoyVideoView.this.videoView.getDuration() - TapjoyVideoView.this.videoView.getCurrentPosition()));
                    }
                }).create();
                this.dialog.setOnCancelListener(new DialogInterface.OnCancelListener() {
                    public void onCancel(DialogInterface dialog) {
                        TapjoyLog.m4436i("VIDEO", "dialog onCancel");
                        dialog.dismiss();
                        TapjoyVideoView.this.videoView.seekTo(TapjoyVideoView.this.seekTime);
                        TapjoyVideoView.this.videoView.start();
                        boolean unused = TapjoyVideoView.this.dialogShowing = false;
                    }
                });
                this.dialog.show();
                this.dialogShowing = true;
                break;
            default:
                this.dialog = null;
                break;
        }
        return this.dialog;
    }
}
