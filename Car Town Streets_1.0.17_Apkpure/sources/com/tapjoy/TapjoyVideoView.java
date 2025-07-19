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
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.VideoView;
import java.util.Timer;
import java.util.TimerTask;
/* loaded from: classes.dex */
public class TapjoyVideoView extends Activity implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener {
    private static final String BUNDLE_DIALOG_SHOWING = "dialog_showing";
    private static final String BUNDLE_SEEK_TIME = "seek_time";
    private static final int DIALOG_WARNING_ID = 0;
    private static TapjoyVideoObject videoData = null;
    private static final String videoSecondsText = " seconds";
    private static final String videoWillResumeText = "";
    int deviceScreenDensity;
    int deviceScreenLayoutSize;
    Dialog dialog;
    private RelativeLayout relativeLayout;
    private ImageView tapjoyImage;
    private Bitmap watermark;
    private WebView webView;
    private static boolean videoError = false;
    private static boolean streamingVideo = false;
    static int textSize = 16;
    private VideoView videoView = null;
    private String videoPath = null;
    private TextView overlayText = null;
    private String webviewURL = null;
    Timer timer = null;
    private boolean dialogShowing = false;
    private boolean sendClick = false;
    private boolean clickRequestSuccess = false;
    private boolean allowBackKey = false;
    private int timeRemaining = 0;
    private int seekTime = 0;
    final String TAPJOY_VIDEO = "VIDEO";
    final Handler mHandler = new Handler();
    final Runnable mUpdateResults = new Runnable() { // from class: com.tapjoy.TapjoyVideoView.3
        @Override // java.lang.Runnable
        public void run() {
            TapjoyVideoView.this.overlayText.setText(TapjoyVideoView.videoWillResumeText + TapjoyVideoView.this.getRemainingVideoTime() + TapjoyVideoView.videoSecondsText);
        }
    };

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        TapjoyLog.i("VIDEO", "onCreate");
        super.onCreate(savedInstanceState);
        if (savedInstanceState != null) {
            TapjoyLog.i("VIDEO", "*** Loading saved data from bundle ***");
            this.seekTime = savedInstanceState.getInt(BUNDLE_SEEK_TIME);
            this.dialogShowing = savedInstanceState.getBoolean(BUNDLE_DIALOG_SHOWING);
        }
        TapjoyLog.i("VIDEO", "dialogShowing: " + this.dialogShowing + ", seekTime: " + this.seekTime);
        this.sendClick = true;
        streamingVideo = false;
        if (TapjoyVideo.getInstance() == null) {
            TapjoyLog.i("VIDEO", "null video");
            finish();
            return;
        }
        videoData = TapjoyVideo.getInstance().getCurrentVideoData();
        this.videoPath = videoData.dataLocation;
        this.webviewURL = videoData.webviewURL;
        if (this.videoPath == null || this.videoPath.length() == 0) {
            TapjoyLog.i("VIDEO", "no cached video, try streaming video at location: " + videoData.videoURL);
            this.videoPath = videoData.videoURL;
            streamingVideo = true;
        }
        TapjoyLog.i("VIDEO", "videoPath: " + this.videoPath);
        requestWindowFeature(1);
        this.relativeLayout = new RelativeLayout(this);
        RelativeLayout.LayoutParams params = new RelativeLayout.LayoutParams(-1, -1);
        this.relativeLayout.setLayoutParams(params);
        setContentView(this.relativeLayout);
        if (Integer.parseInt(Build.VERSION.SDK) > 3) {
            TapjoyDisplayMetricsUtil displayMetricsUtil = new TapjoyDisplayMetricsUtil(this);
            this.deviceScreenLayoutSize = displayMetricsUtil.getScreenLayoutSize();
            TapjoyLog.i("VIDEO", "deviceScreenLayoutSize: " + this.deviceScreenLayoutSize);
            if (this.deviceScreenLayoutSize == 4) {
                textSize = 32;
            }
        }
        TapjoyLog.i("VIDEO", "textSize: " + textSize);
        initVideoView();
        TapjoyLog.i("VIDEO", "onCreate DONE");
    }

    @Override // android.app.Activity
    protected void onPause() {
        super.onPause();
        if (this.videoView.isPlaying()) {
            TapjoyLog.i("VIDEO", "onPause");
            this.seekTime = this.videoView.getCurrentPosition();
            TapjoyLog.i("VIDEO", "seekTime: " + this.seekTime);
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        TapjoyLog.i("VIDEO", "onResume");
        super.onResume();
        setRequestedOrientation(0);
        if (this.seekTime > 0) {
            TapjoyLog.i("VIDEO", "seekTime: " + this.seekTime);
            this.videoView.seekTo(this.seekTime);
            if (!this.dialogShowing || this.dialog == null || !this.dialog.isShowing()) {
                this.videoView.start();
            }
        }
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        TapjoyLog.i("VIDEO", "*** onSaveInstanceState ***");
        TapjoyLog.i("VIDEO", "dialogShowing: " + this.dialogShowing + ", seekTime: " + this.seekTime);
        outState.putBoolean(BUNDLE_DIALOG_SHOWING, this.dialogShowing);
        outState.putInt(BUNDLE_SEEK_TIME, this.seekTime);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public void onWindowFocusChanged(boolean hasFocus) {
        TapjoyLog.i("VIDEO", "onWindowFocusChanged");
        super.onWindowFocusChanged(hasFocus);
    }

    /* JADX INFO: Access modifiers changed from: private */
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
                TapjoyLog.i("VIDEO", "streaming video: " + this.videoPath);
                this.videoView.setVideoURI(Uri.parse(this.videoPath));
            } else {
                TapjoyLog.i("VIDEO", "cached video: " + this.videoPath);
                this.videoView.setVideoPath(this.videoPath);
            }
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams.addRule(13);
            this.videoView.setLayoutParams(layoutParams);
            this.timeRemaining = this.videoView.getDuration() / 1000;
            TapjoyLog.i("VIDEO", "videoView.getDuration(): " + this.videoView.getDuration());
            TapjoyLog.i("VIDEO", "timeRemaining: " + this.timeRemaining);
            this.overlayText = new TextView(this);
            this.overlayText.setTextSize(textSize);
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
        this.webView.setWebViewClient(new WebViewClient() { // from class: com.tapjoy.TapjoyVideoView.1
            @Override // android.webkit.WebViewClient
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                TapjoyLog.i("VIDEO", "URL = [" + url + "]");
                if (url.contains("offer_wall")) {
                    TapjoyLog.i("VIDEO", "back to offers");
                    TapjoyVideoView.this.finish();
                    return true;
                } else if (url.contains("tjvideo")) {
                    TapjoyLog.i("VIDEO", "replay");
                    TapjoyVideoView.this.initVideoView();
                    return true;
                } else if (url.contains(TapjoyConstants.TJC_BASE_REDIRECT_DOMAIN)) {
                    TapjoyLog.i("VIDEO", "Open redirecting URL = [" + url + "]");
                    view.loadUrl(url);
                    return true;
                } else {
                    TapjoyLog.i("VIDEO", "Opening URL in new browser = [" + url + "]");
                    Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                    TapjoyVideoView.this.startActivity(intent);
                    return true;
                }
            }
        });
        WebSettings webSettings = this.webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
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
            TapjoyLog.i("VIDEO", "dialog is showing -- don't start");
        } else {
            TapjoyLog.i("VIDEO", "start");
            this.videoView.seekTo(0);
            this.videoView.start();
        }
        if (this.timer != null) {
            this.timer.cancel();
        }
        this.timer = new Timer();
        this.timer.schedule(new RemainingTime(), 500L, 100L);
        initVideoCompletionScreen();
        this.clickRequestSuccess = false;
        if (this.sendClick) {
            new Thread(new Runnable() { // from class: com.tapjoy.TapjoyVideoView.2
                @Override // java.lang.Runnable
                public void run() {
                    TapjoyLog.i("VIDEO", "SENDING CLICK...");
                    String response = new TapjoyURLConnection().connectToURL(TapjoyVideoView.videoData.clickURL);
                    if (response != null && response.contains("OK")) {
                        TapjoyLog.i("VIDEO", "CLICK REQUEST SUCCESS!");
                        TapjoyVideoView.this.clickRequestSuccess = true;
                    }
                }
            }).start();
            this.sendClick = false;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public int getRemainingVideoTime() {
        int timeRemaining = (this.videoView.getDuration() - this.videoView.getCurrentPosition()) / 1000;
        if (timeRemaining < 0) {
            return 0;
        }
        return timeRemaining;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class RemainingTime extends TimerTask {
        private RemainingTime() {
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            TapjoyVideoView.this.mHandler.post(TapjoyVideoView.this.mUpdateResults);
        }
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    public void onPrepared(MediaPlayer mp) {
        TapjoyLog.i("VIDEO", "onPrepared");
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    public boolean onError(MediaPlayer mp, int what, int extra) {
        videoError = true;
        TapjoyLog.i("VIDEO", "onError");
        TapjoyVideo.videoNotifierError(3);
        this.allowBackKey = true;
        if (this.timer != null) {
            this.timer.cancel();
            return false;
        }
        return false;
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mp) {
        TapjoyLog.i("VIDEO", "onCompletion");
        if (this.timer != null) {
            this.timer.cancel();
        }
        showVideoCompletionScreen();
        if (!videoError) {
            TapjoyVideo.videoNotifierComplete();
            new Thread(new Runnable() { // from class: com.tapjoy.TapjoyVideoView.4
                @Override // java.lang.Runnable
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

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            if (!this.allowBackKey) {
                this.seekTime = this.videoView.getCurrentPosition();
                this.videoView.pause();
                this.dialogShowing = true;
                showDialog(0);
                TapjoyLog.i("VIDEO", "PAUSE VIDEO time: " + this.seekTime);
                TapjoyLog.i("VIDEO", "currentPosition: " + this.videoView.getCurrentPosition());
                TapjoyLog.i("VIDEO", "duration: " + this.videoView.getDuration() + ", elapsed: " + (this.videoView.getDuration() - this.videoView.getCurrentPosition()));
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

    @Override // android.app.Activity
    protected Dialog onCreateDialog(int id) {
        TapjoyLog.i("VIDEO", "dialog onCreateDialog");
        if (!this.dialogShowing) {
            return this.dialog;
        }
        switch (id) {
            case 0:
                this.dialog = new AlertDialog.Builder(this).setTitle("Cancel Video?").setMessage("Currency will not be awarded, are you sure you want to cancel the video?").setNegativeButton("End", new DialogInterface.OnClickListener() { // from class: com.tapjoy.TapjoyVideoView.6
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                        TapjoyVideoView.this.finish();
                    }
                }).setPositiveButton("Resume", new DialogInterface.OnClickListener() { // from class: com.tapjoy.TapjoyVideoView.5
                    @Override // android.content.DialogInterface.OnClickListener
                    public void onClick(DialogInterface dialog, int whichButton) {
                        dialog.dismiss();
                        TapjoyVideoView.this.videoView.seekTo(TapjoyVideoView.this.seekTime);
                        TapjoyVideoView.this.videoView.start();
                        TapjoyVideoView.this.dialogShowing = false;
                        TapjoyLog.i("VIDEO", "RESUME VIDEO time: " + TapjoyVideoView.this.seekTime);
                        TapjoyLog.i("VIDEO", "currentPosition: " + TapjoyVideoView.this.videoView.getCurrentPosition());
                        TapjoyLog.i("VIDEO", "duration: " + TapjoyVideoView.this.videoView.getDuration() + ", elapsed: " + (TapjoyVideoView.this.videoView.getDuration() - TapjoyVideoView.this.videoView.getCurrentPosition()));
                    }
                }).create();
                this.dialog.setOnCancelListener(new DialogInterface.OnCancelListener() { // from class: com.tapjoy.TapjoyVideoView.7
                    @Override // android.content.DialogInterface.OnCancelListener
                    public void onCancel(DialogInterface dialog) {
                        TapjoyLog.i("VIDEO", "dialog onCancel");
                        dialog.dismiss();
                        TapjoyVideoView.this.videoView.seekTo(TapjoyVideoView.this.seekTime);
                        TapjoyVideoView.this.videoView.start();
                        TapjoyVideoView.this.dialogShowing = false;
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
