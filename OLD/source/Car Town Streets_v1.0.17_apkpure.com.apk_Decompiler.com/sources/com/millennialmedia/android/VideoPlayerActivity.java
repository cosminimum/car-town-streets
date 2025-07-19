package com.millennialmedia.android;

import android.content.BroadcastReceiver;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.media.MediaPlayer;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.RelativeLayout;
import android.widget.TextView;
import android.widget.Toast;
import com.google.android.gms.wallet.WalletConstants;
import com.millennialmedia.android.HttpRedirection;
import com.millennialmedia.android.MMAdViewSDK;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.ServerSocket;
import java.net.SocketAddress;
import java.util.List;

public class VideoPlayerActivity extends MMBaseActivity implements Handler.Callback, HttpRedirection.Listener {
    private static final int MESSAGE_DELAYED_BUTTON = 3;
    private static final int MESSAGE_EVENTLOG_CHECK = 2;
    private static final int MESSAGE_INACTIVITY_ANIMATION = 1;
    /* access modifiers changed from: private */
    public RelativeLayout buttonsLayout;
    private RelativeLayout controlsLayout;
    /* access modifiers changed from: private */
    public String current;
    private int currentVideoPosition = 0;
    /* access modifiers changed from: private */
    public Handler handler;
    private TextView hudSeconds;
    private TextView hudStaticText;
    /* access modifiers changed from: private */
    public boolean isCachedAd;
    /* access modifiers changed from: private */
    public int lastVideoPosition;
    /* access modifiers changed from: private */
    public Button mPausePlay;
    private Button mRewind;
    private Button mStop;
    /* access modifiers changed from: private */
    public VideoView mVideoView;
    /* access modifiers changed from: private */
    public boolean paused = false;
    private ScreenReceiver receiver;
    private RelativeLayout relLayout;
    private boolean showBottomBar = true;
    /* access modifiers changed from: private */
    public boolean showCountdownHud = true;
    View testView;
    /* access modifiers changed from: private */
    public VideoAd videoAd;
    private boolean videoCompleted;
    private boolean videoCompletedOnce;
    protected VideoServer videoServer;
    /* access modifiers changed from: private */
    public boolean waitForUserPresent;

    interface VideoHackBgListener {
        void callback(long j);
    }

    public /* bridge */ /* synthetic */ void finish() {
        super.finish();
    }

    public /* bridge */ /* synthetic */ File getCacheDir() {
        return super.getCacheDir();
    }

    public /* bridge */ /* synthetic */ ContentResolver getContentResolver() {
        return super.getContentResolver();
    }

    public /* bridge */ /* synthetic */ Intent getIntent() {
        return super.getIntent();
    }

    public /* bridge */ /* synthetic */ Object getLastNonConfigurationInstance() {
        return super.getLastNonConfigurationInstance();
    }

    public /* bridge */ /* synthetic */ Object getSystemService(String x0) {
        return super.getSystemService(x0);
    }

    public /* bridge */ /* synthetic */ Window getWindow() {
        return super.getWindow();
    }

    public /* bridge */ /* synthetic */ Object onRetainNonConfigurationInstance() {
        return super.onRetainNonConfigurationInstance();
    }

    public /* bridge */ /* synthetic */ Intent registerReceiver(BroadcastReceiver x0, IntentFilter x1) {
        return super.registerReceiver(x0, x1);
    }

    public /* bridge */ /* synthetic */ void setContentView(View x0) {
        super.setContentView(x0);
    }

    public /* bridge */ /* synthetic */ void setRequestedOrientation(int x0) {
        super.setRequestedOrientation(x0);
    }

    public /* bridge */ /* synthetic */ void setTheme(int x0) {
        super.setTheme(x0);
    }

    public /* bridge */ /* synthetic */ void startActivity(Intent x0) {
        super.startActivity(x0);
    }

    public /* bridge */ /* synthetic */ void startActivityForResult(Intent x0, int x1) {
        super.startActivityForResult(x0, x1);
    }

    public /* bridge */ /* synthetic */ void unregisterReceiver(BroadcastReceiver x0) {
        super.unregisterReceiver(x0);
    }

    public void onCreate(Bundle savedInstanceState) {
        setTheme(16973829);
        super.onCreate(savedInstanceState);
        requestWindowFeature(1);
        getWindow().clearFlags(2048);
        getWindow().addFlags(1024);
        MMAdViewSDK.Log.d("Setting up the video player");
        if (savedInstanceState != null) {
            this.isCachedAd = savedInstanceState.getBoolean("isCachedAd");
            this.videoCompleted = savedInstanceState.getBoolean("videoCompleted");
            this.videoCompletedOnce = savedInstanceState.getBoolean("videoCompletedOnce");
            this.currentVideoPosition = savedInstanceState.getInt("videoPosition");
            this.lastVideoPosition = savedInstanceState.getInt("lastVideoPosition");
        } else {
            this.isCachedAd = getIntent().getBooleanExtra("cached", false);
            this.currentVideoPosition = 0;
            this.videoCompletedOnce = false;
            this.videoCompleted = false;
        }
        this.receiver = new ScreenReceiver();
        IntentFilter intentFilter = new IntentFilter();
        intentFilter.addAction("android.intent.action.SCREEN_OFF");
        intentFilter.addAction("android.intent.action.SCREEN_ON");
        intentFilter.addAction("android.intent.action.USER_PRESENT");
        registerReceiver(this.receiver, intentFilter);
        this.relLayout = new RelativeLayout(this.activity);
        this.relLayout.setId(400);
        this.relLayout.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        this.relLayout.setBackgroundColor(-16777216);
        this.relLayout.setDrawingCacheBackgroundColor(-16777216);
        RelativeLayout relativeLayout = new RelativeLayout(this.activity);
        relativeLayout.setBackgroundColor(-16777216);
        relativeLayout.setId(WalletConstants.ERROR_CODE_INVALID_TRANSACTION);
        RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-1, -1);
        layoutParams.addRule(13);
        relativeLayout.setLayoutParams(layoutParams);
        relativeLayout.setDrawingCacheBackgroundColor(-16777216);
        RelativeLayout.LayoutParams videoLp = new RelativeLayout.LayoutParams(-1, -1);
        videoLp.addRule(13);
        this.mVideoView = new VideoView(this.activity);
        this.mVideoView.setId(WalletConstants.ERROR_CODE_AUTHENTICATION_FAILURE);
        this.mVideoView.getHolder().setFormat(-2);
        relativeLayout.addView(this.mVideoView, videoLp);
        this.mVideoView.setDrawingCacheBackgroundColor(-16777216);
        this.relLayout.addView(relativeLayout, layoutParams);
        RelativeLayout.LayoutParams buttonsLp = new RelativeLayout.LayoutParams(-1, -1);
        MMAdViewSDK.Log.v("Is Cached Ad: %b", Boolean.valueOf(this.isCachedAd));
        if (this.isCachedAd) {
            this.handler = new Handler(this);
            setRequestedOrientation(0);
            if (savedInstanceState == null) {
                this.videoAd = (VideoAd) AdCache.load(this.activity, getIntent().getStringExtra("videoId"));
                if (this.videoAd != null) {
                    this.showBottomBar = this.videoAd.showControls;
                    this.showCountdownHud = this.videoAd.showCountdown;
                }
            } else {
                this.videoAd = (VideoAd) savedInstanceState.getParcelable("videoAd");
                this.showBottomBar = savedInstanceState.getBoolean("shouldShowBottomBar");
                this.showCountdownHud = this.videoAd.showCountdown;
            }
            this.buttonsLayout = new RelativeLayout(this.activity);
            this.buttonsLayout.setId(1000);
            if (this.showCountdownHud) {
                showHud(false);
            }
            List<VideoImage> buttons = null;
            if (this.videoAd != null) {
                buttons = this.videoAd.buttons;
            }
            if (buttons != null) {
                File adDir = AdCache.getCacheDirectory(this.activity);
                for (int i = 0; i < buttons.size(); i++) {
                    final VideoImage button = buttons.get(i);
                    ImageButton imageButton = new ImageButton(this.activity);
                    button.button = imageButton;
                    try {
                        Bitmap bitmap = BitmapFactory.decodeFile(adDir.getAbsolutePath() + File.separator + this.videoAd.id + Uri.parse(button.imageUrl).getLastPathSegment().replaceFirst("\\.[^\\.]*$", ".dat"));
                        if (bitmap != null) {
                            imageButton.setImageBitmap(bitmap);
                        } else {
                            imageButton.setImageURI(Uri.parse(adDir.getAbsolutePath() + File.separator + this.videoAd.id + Uri.parse(button.imageUrl).getLastPathSegment().replaceFirst("\\.[^\\.]*$", ".dat")));
                        }
                    } catch (Exception e) {
                        MMAdViewSDK.Log.e((Throwable) e);
                    }
                    imageButton.setPadding(0, 0, 0, 0);
                    imageButton.setBackgroundColor(0);
                    setButtonAlpha(imageButton, button.fromAlpha);
                    imageButton.setId(i + 1);
                    RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
                    MMAdViewSDK.Log.v("Button: %d Anchor: %d Position: %d Anchor2: %d Position2: %d", Integer.valueOf(imageButton.getId()), Integer.valueOf(button.anchor), Integer.valueOf(button.position), Integer.valueOf(button.anchor2), Integer.valueOf(button.position2));
                    layoutParams2.addRule(button.position, button.anchor);
                    layoutParams2.addRule(button.position2, button.anchor2);
                    layoutParams2.setMargins(button.paddingLeft, button.paddingTop, button.paddingRight, button.paddingBottom);
                    if (!TextUtils.isEmpty(button.linkUrl)) {
                        final ImageButton imageButton2 = imageButton;
                        imageButton.setOnClickListener(new View.OnClickListener() {
                            public void onClick(View view) {
                                VideoPlayerActivity.this.dispatchButtonClick(button.linkUrl, button.overlayOrientation, imageButton2);
                                VideoPlayerActivity.this.logButtonEvent(button);
                            }
                        });
                    }
                    if (button.appearanceDelay > 0) {
                        button.layoutParams = layoutParams2;
                        Message message = Message.obtain(this.handler, 3, button);
                        this.handler.sendMessageDelayed(message, button.appearanceDelay);
                    } else {
                        this.buttonsLayout.addView(imageButton, layoutParams2);
                    }
                    if (button.inactivityTimeout > 0) {
                        Message message2 = Message.obtain(this.handler, 1, button);
                        this.handler.sendMessageDelayed(message2, button.inactivityTimeout + button.appearanceDelay + button.fadeDuration);
                    }
                }
                this.relLayout.addView(this.buttonsLayout, buttonsLp);
            }
        } else {
            this.testView = new View(this.activity);
            this.testView.setBackgroundColor(-16777216);
            this.relLayout.addView(this.testView, new RelativeLayout.LayoutParams(-1, -1));
            this.mVideoView.setCallBack(new VideoHackBgListener() {
                public void callback(long delayMS) {
                    VideoPlayerActivity.this.testView.postDelayed(new Runnable() {
                        public void run() {
                            if (VideoPlayerActivity.this.testView.getVisibility() != 4) {
                                VideoPlayerActivity.this.testView.setVisibility(4);
                            }
                        }
                    }, delayMS);
                }
            });
        }
        if (this.showBottomBar) {
            this.controlsLayout = new RelativeLayout(this.activity);
            this.controlsLayout.setBackgroundColor(-16777216);
            RelativeLayout.LayoutParams controlsLp = new RelativeLayout.LayoutParams(-1, -2);
            this.controlsLayout.setLayoutParams(controlsLp);
            controlsLp.addRule(12);
            this.mRewind = new Button(this.activity);
            this.mPausePlay = new Button(this.activity);
            this.mStop = new Button(this.activity);
            this.mRewind.setBackgroundResource(17301541);
            this.mPausePlay.setBackgroundResource(17301539);
            this.mStop.setBackgroundResource(17301560);
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams layoutParams5 = new RelativeLayout.LayoutParams(-2, -2);
            layoutParams3.addRule(14);
            this.controlsLayout.addView(this.mPausePlay, layoutParams3);
            layoutParams5.addRule(0, this.mPausePlay.getId());
            this.controlsLayout.addView(this.mRewind);
            layoutParams4.addRule(11);
            this.controlsLayout.addView(this.mStop, layoutParams4);
            this.mRewind.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.mVideoView.seekTo(0);
                    }
                }
            });
            this.mPausePlay.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (VideoPlayerActivity.this.paused) {
                        if (VideoPlayerActivity.this.mVideoView != null) {
                            VideoPlayerActivity.this.playVideo(VideoPlayerActivity.this.mVideoView.getCurrentPosition());
                        }
                        VideoPlayerActivity.this.mPausePlay.setBackgroundResource(17301539);
                        boolean unused = VideoPlayerActivity.this.paused = false;
                    } else if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.mVideoView.pause();
                        VideoPlayerActivity.this.mPausePlay.setBackgroundResource(17301540);
                        boolean unused2 = VideoPlayerActivity.this.paused = true;
                    }
                }
            });
            this.mStop.setOnClickListener(new View.OnClickListener() {
                public void onClick(View view) {
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        String unused = VideoPlayerActivity.this.current = null;
                        VideoPlayerActivity.this.mVideoView.stopPlayback();
                        VideoPlayerActivity.this.dismiss();
                    }
                }
            });
            this.relLayout.addView(this.controlsLayout, controlsLp);
        }
        if (this.controlsLayout != null) {
            this.controlsLayout.bringToFront();
        }
        if (this.buttonsLayout != null) {
            this.relLayout.bringChildToFront(this.buttonsLayout);
        }
        setContentView(this.relLayout);
    }

    private boolean canFadeButtons() {
        if (!this.videoAd.stayInPlayer || !this.videoCompleted) {
            return true;
        }
        return false;
    }

    private void setButtonAlpha(ImageButton button, float alpha) {
        AlphaAnimation animation = new AlphaAnimation(alpha, alpha);
        animation.setDuration(0);
        animation.setFillEnabled(true);
        animation.setFillBefore(true);
        animation.setFillAfter(true);
        button.startAnimation(animation);
    }

    private class DelayedAnimationListener implements Animation.AnimationListener {
        private ImageButton button;
        private RelativeLayout.LayoutParams layoutParams;

        DelayedAnimationListener(ImageButton b, RelativeLayout.LayoutParams lp) {
            this.button = b;
            this.layoutParams = lp;
        }

        public void onAnimationStart(Animation animation) {
        }

        public void onAnimationEnd(Animation animation) {
        }

        public void onAnimationRepeat(Animation animation) {
        }
    }

    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 1:
                if (!canFadeButtons()) {
                    return true;
                }
                VideoImage videoImage = (VideoImage) msg.obj;
                AlphaAnimation animation = new AlphaAnimation(videoImage.fromAlpha, videoImage.toAlpha);
                animation.setDuration(videoImage.fadeDuration);
                animation.setFillEnabled(true);
                animation.setFillBefore(true);
                animation.setFillAfter(true);
                videoImage.button.startAnimation(animation);
                return true;
            case 2:
                try {
                    if (this.mVideoView.isPlaying()) {
                        int currentPosition = this.mVideoView.getCurrentPosition();
                        if (currentPosition > this.lastVideoPosition) {
                            if (this.videoAd != null) {
                                if (this.lastVideoPosition == 0) {
                                    logBeginEvent(this.videoAd);
                                }
                                for (int i = 0; i < this.videoAd.activities.size(); i++) {
                                    VideoLogEvent videoEvent = this.videoAd.activities.get(i);
                                    if (videoEvent != null && videoEvent.position >= ((long) this.lastVideoPosition) && videoEvent.position < ((long) currentPosition)) {
                                        for (int j = 0; j < videoEvent.activities.length; j++) {
                                            try {
                                                logEvent(videoEvent.activities[j]);
                                            } catch (UnsupportedEncodingException e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    }
                                }
                            }
                            this.lastVideoPosition = currentPosition;
                        }
                        if (this.showCountdownHud) {
                            long seconds = (this.videoAd.duration - ((long) currentPosition)) / 1000;
                            if (seconds <= 0) {
                                hideHud();
                            } else if (this.hudSeconds != null) {
                                this.hudSeconds.setText(String.valueOf(seconds));
                            }
                        }
                    }
                    this.handler.sendMessageDelayed(Message.obtain(this.handler, 2), 1000);
                    return true;
                } catch (IllegalStateException e2) {
                    e2.printStackTrace();
                    return true;
                }
            case 3:
                VideoImage videoImage2 = (VideoImage) msg.obj;
                try {
                    if (this.buttonsLayout.indexOfChild(videoImage2.button) == -1) {
                        this.buttonsLayout.addView(videoImage2.button, videoImage2.layoutParams);
                    }
                } catch (IllegalStateException e3) {
                    e3.printStackTrace();
                }
                AlphaAnimation animation2 = new AlphaAnimation(videoImage2.toAlpha, videoImage2.fromAlpha);
                animation2.setDuration(videoImage2.fadeDuration);
                animation2.setAnimationListener(new DelayedAnimationListener(videoImage2.button, videoImage2.layoutParams));
                animation2.setFillEnabled(true);
                animation2.setFillBefore(true);
                animation2.setFillAfter(true);
                MMAdViewSDK.Log.v("Beginning animation to visibility. Fade duration: %d Button: %d Time: %d", Long.valueOf(videoImage2.fadeDuration), Integer.valueOf(videoImage2.button.getId()), Long.valueOf(System.currentTimeMillis()));
                videoImage2.button.startAnimation(animation2);
                return true;
            default:
                return true;
        }
    }

    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (this.videoAd != null) {
            if (this.handler != null) {
                this.handler.removeMessages(1);
            }
            for (int i = 0; i < this.videoAd.buttons.size(); i++) {
                VideoImage videoImage = this.videoAd.buttons.get(i);
                setButtonAlpha(videoImage.button, videoImage.fromAlpha);
                if (videoImage.inactivityTimeout > 0) {
                    this.handler.sendMessageDelayed(Message.obtain(this.handler, 1, videoImage), videoImage.inactivityTimeout);
                } else if (ev.getAction() == 1) {
                    if (canFadeButtons()) {
                        AlphaAnimation animation = new AlphaAnimation(videoImage.fromAlpha, videoImage.toAlpha);
                        animation.setDuration(videoImage.fadeDuration);
                        animation.setFillEnabled(true);
                        animation.setFillBefore(true);
                        animation.setFillAfter(true);
                        videoImage.button.startAnimation(animation);
                    }
                } else if (ev.getAction() == 0) {
                    setButtonAlpha(videoImage.button, videoImage.fromAlpha);
                }
            }
        }
        return super.dispatchTouchEvent(ev);
    }

    /* access modifiers changed from: protected */
    public void logBeginEvent(VideoAd videoAd2) {
        if (videoAd2 != null && videoAd2.startActivity != null) {
            try {
                MMAdViewSDK.Log.d("Cached video begin event logged");
                for (String logEvent : videoAd2.startActivity) {
                    logEvent(logEvent);
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
    }

    /* access modifiers changed from: protected */
    public void logEndEvent(VideoAd videoAd2) {
        MMAdViewSDK.Log.d("Cached video end event logged");
        int i = 0;
        while (i < videoAd2.endActivity.length) {
            try {
                logEvent(videoAd2.endActivity[i]);
                i++;
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void logButtonEvent(VideoImage button) {
        MMAdViewSDK.Log.d("Cached video button event logged");
        int i = 0;
        while (i < button.activity.length) {
            try {
                logEvent(button.activity[i]);
                i++;
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return;
            }
        }
    }

    /* access modifiers changed from: protected */
    public void logEvent(String activity) throws UnsupportedEncodingException {
        final String logString = activity;
        MMAdViewSDK.Log.d("Logging event to: %s", logString);
        new Thread(new Runnable() {
            public void run() {
                try {
                    new HttpGetRequest().get(logString);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    /* access modifiers changed from: private */
    public void showHud(boolean restart) {
        if (this.hudStaticText == null || this.hudSeconds == null) {
            RelativeLayout.LayoutParams hudLp = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams hudSecLp = new RelativeLayout.LayoutParams(-2, -2);
            this.hudStaticText = new TextView(this.activity);
            this.hudStaticText.setText(" seconds remaining ...");
            this.hudStaticText.setTextColor(-1);
            this.hudStaticText.setPadding(0, 0, 5, 0);
            this.hudSeconds = new TextView(this.activity);
            if (restart) {
                if (this.videoAd != null) {
                    this.hudSeconds.setText(String.valueOf(this.videoAd.duration / 1000));
                }
            } else if (this.currentVideoPosition != 0) {
                this.hudSeconds.setText(String.valueOf(this.currentVideoPosition / 1000));
            } else if (this.videoAd != null) {
                this.hudSeconds.setText(String.valueOf(this.videoAd.duration / 1000));
            }
            this.hudSeconds.setTextColor(-1);
            this.hudSeconds.setId(401);
            this.hudStaticText.setId(WalletConstants.ERROR_CODE_SERVICE_UNAVAILABLE);
            hudLp.addRule(10);
            hudLp.addRule(11);
            this.buttonsLayout.addView(this.hudStaticText, hudLp);
            hudSecLp.addRule(10);
            hudSecLp.addRule(0, this.hudStaticText.getId());
            this.buttonsLayout.addView(this.hudSeconds, hudSecLp);
            return;
        }
        if (restart) {
            if (this.videoAd != null) {
                this.hudSeconds.setText(String.valueOf(this.videoAd.duration / 1000));
            } else {
                this.hudSeconds.setText("");
            }
        }
        this.hudStaticText.setVisibility(0);
        this.hudSeconds.setVisibility(0);
    }

    /* access modifiers changed from: private */
    public void hideHud() {
        if (this.hudStaticText != null) {
            this.hudStaticText.setVisibility(4);
        }
        if (this.hudSeconds != null) {
            this.hudSeconds.setVisibility(4);
        }
    }

    /* access modifiers changed from: private */
    public void playVideo(int position) {
        try {
            String name = getIntent().getData().toString();
            MMAdViewSDK.Log.d("playVideo path: %s", name);
            if (name == null || name.length() == 0) {
                Toast.makeText(this.activity, "Sorry. There was a problem playing the video", 1).show();
                if (this.videoAd != null) {
                    HttpGetRequest.log(this.videoAd.videoError);
                    return;
                }
                return;
            }
            this.videoCompleted = false;
            if (!name.equals(this.current) || this.mVideoView == null) {
                this.current = name;
                if (this.mVideoView == null) {
                    MMAdViewSDK.Log.e("Video Player is Null");
                } else if (!this.isCachedAd) {
                    this.mVideoView.setVideoURI(Uri.parse(name));
                    this.mVideoView.requestFocus();
                    this.mVideoView.seekTo(position);
                    this.mVideoView.start();
                    this.paused = false;
                } else if (this.videoAd == null) {
                } else {
                    if (!this.videoAd.storedOnSdCard) {
                        MMAdViewSDK.Log.d("Cached Ad. Starting Server");
                        startServer(name, position, false);
                        return;
                    }
                    this.mVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                        public void onCompletion(MediaPlayer mp) {
                            MMAdViewSDK.Log.d("Video Playing Complete");
                            if (VideoPlayerActivity.this.showCountdownHud) {
                                VideoPlayerActivity.this.hideHud();
                            }
                            if (VideoPlayerActivity.this.videoAd != null) {
                                VideoPlayerActivity.this.videoPlayerOnCompletion(VideoPlayerActivity.this.videoAd.onCompletionUrl);
                            }
                        }
                    });
                    this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
                        public void onPrepared(MediaPlayer mp) {
                            MMAdViewSDK.Log.d("Video Prepared");
                        }
                    });
                    this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener() {
                        public boolean onError(MediaPlayer mp, int what, int extra) {
                            if (VideoPlayerActivity.this.videoAd == null) {
                                return false;
                            }
                            HttpGetRequest.log(VideoPlayerActivity.this.videoAd.videoError);
                            return false;
                        }
                    });
                    this.mVideoView.setVideoURI(Uri.parse(name));
                    this.mVideoView.requestFocus();
                    this.mVideoView.seekTo(position);
                    this.mVideoView.start();
                    this.paused = false;
                }
            } else if (!this.isCachedAd) {
                this.mVideoView.requestFocus();
                this.mVideoView.seekTo(position);
                this.mVideoView.start();
                this.paused = false;
            } else if (this.videoAd == null) {
            } else {
                if (this.videoAd.storedOnSdCard) {
                    this.mVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                        public void onCompletion(MediaPlayer mp) {
                            MMAdViewSDK.Log.d("Video Playing Complete");
                            if (VideoPlayerActivity.this.showCountdownHud) {
                                VideoPlayerActivity.this.hideHud();
                            }
                            if (VideoPlayerActivity.this.videoAd != null) {
                                VideoPlayerActivity.this.videoPlayerOnCompletion(VideoPlayerActivity.this.videoAd.onCompletionUrl);
                            }
                        }
                    });
                    this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
                        public void onPrepared(MediaPlayer mp) {
                            MMAdViewSDK.Log.d("Video Prepared");
                        }
                    });
                    this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener() {
                        public boolean onError(MediaPlayer mp, int what, int extra) {
                            if (VideoPlayerActivity.this.videoAd == null) {
                                return false;
                            }
                            HttpGetRequest.log(VideoPlayerActivity.this.videoAd.videoError);
                            return false;
                        }
                    });
                    this.mVideoView.setVideoURI(Uri.parse(name));
                    this.mVideoView.requestFocus();
                    this.mVideoView.seekTo(position);
                    this.mVideoView.start();
                    this.paused = false;
                    return;
                }
                startServer(name, position, false);
            }
        } catch (Exception e) {
            MMAdViewSDK.Log.e("error: " + e.getMessage(), e);
            Toast.makeText(this.activity, "Sorry. There was a problem playing the video", 1).show();
            if (this.mVideoView != null) {
                this.mVideoView.stopPlayback();
            }
            if (this.videoAd != null) {
                HttpGetRequest.log(this.videoAd.videoError);
            }
        }
    }

    public void onStart() {
        super.onStart();
        if (this.videoAd != null && this.videoAd.stayInPlayer && this.videoCompleted && this.videoAd.buttons != null) {
            for (int i = 0; i < this.videoAd.buttons.size(); i++) {
                VideoImage videoImage = this.videoAd.buttons.get(i);
                setButtonAlpha(videoImage.button, videoImage.fromAlpha);
                if (videoImage.button.getParent() == null) {
                    this.buttonsLayout.addView(videoImage.button, videoImage.layoutParams);
                }
                for (int j = 0; j < this.videoAd.buttons.size(); j++) {
                    this.buttonsLayout.bringChildToFront(this.videoAd.buttons.get(j).button);
                }
            }
        }
    }

    public void onResume() {
        super.onResume();
        MMAdViewSDK.Log.v("VideoPlayer - onResume");
        if (!this.waitForUserPresent) {
            resumeVideo();
        }
    }

    public void onPause() {
        super.onPause();
        MMAdViewSDK.Log.v("VideoPlayer - onPause");
        if (!this.waitForUserPresent) {
            pauseVideo();
        }
    }

    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4 && event.getRepeatCount() == 0 && !this.videoCompletedOnce) {
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    /* access modifiers changed from: private */
    public void dismiss() {
        MMAdViewSDK.Log.d("Video ad player closed");
        if (this.mVideoView != null) {
            this.mVideoView.stopPlayback();
        }
        finish();
    }

    public void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.receiver);
        if (this.isCachedAd) {
            stopServer();
        }
    }

    public void onSaveInstanceState(Bundle outState) {
        if (this.mVideoView != null) {
            outState.putInt("videoPosition", this.mVideoView.getCurrentPosition());
            outState.putInt("lastVideoPosition", this.lastVideoPosition);
        }
        outState.putBoolean("isCachedAd", this.isCachedAd);
        outState.putBoolean("videoCompleted", this.videoCompleted);
        outState.putBoolean("videoCompletedOnce", this.videoCompletedOnce);
        outState.putBoolean("shouldShowBottomBar", this.showBottomBar);
        outState.putParcelable("videoAd", this.videoAd);
        super.onSaveInstanceState(outState);
    }

    private void pauseVideo() {
        if (this.mVideoView != null) {
            if (this.mVideoView.isPlaying()) {
                this.mVideoView.pause();
                this.paused = true;
                MMAdViewSDK.Log.v("Video paused");
            }
            this.currentVideoPosition = this.mVideoView.getCurrentPosition();
        }
        if (this.isCachedAd) {
            this.handler.removeMessages(1);
            this.handler.removeMessages(2);
            this.handler.removeMessages(3);
            stopServer();
        }
    }

    /* access modifiers changed from: private */
    public void resumeVideo() {
        if (this.mVideoView != null && !this.mVideoView.isPlaying() && !this.videoCompleted) {
            if (this.isCachedAd && !this.handler.hasMessages(2) && this.videoAd != null) {
                this.handler.sendMessageDelayed(Message.obtain(this.handler, 2), 1000);
                if (this.showCountdownHud) {
                    long seconds = (this.videoAd.duration - ((long) this.currentVideoPosition)) / 1000;
                    if (seconds <= 0) {
                        hideHud();
                    } else if (this.hudSeconds != null) {
                        this.hudSeconds.setText(String.valueOf(seconds));
                    }
                }
                for (int i = 0; i < this.videoAd.buttons.size(); i++) {
                    VideoImage button = this.videoAd.buttons.get(i);
                    long delay = 0;
                    if (button.appearanceDelay > 0 && this.buttonsLayout.indexOfChild(button.button) == -1) {
                        Message message = Message.obtain(this.handler, 3, button);
                        delay = button.appearanceDelay - ((long) this.currentVideoPosition);
                        if (delay < 0) {
                            delay = 500;
                        }
                        this.handler.sendMessageDelayed(message, delay);
                    }
                    if (button.inactivityTimeout > 0) {
                        this.handler.sendMessageDelayed(Message.obtain(this.handler, 1, button), button.inactivityTimeout + delay + button.fadeDuration);
                    }
                }
            }
            playVideo(this.currentVideoPosition);
        }
    }

    /* access modifiers changed from: private */
    public void videoPlayerOnCompletion(String url) {
        this.videoCompletedOnce = true;
        this.videoCompleted = true;
        if (!this.mVideoView.isInErrorState()) {
            logEndEvent(this.videoAd);
        }
        stopServer();
        MMAdViewSDK.Log.v("Video player on complete");
        if (url != null) {
            dispatchButtonClick(url, (String) null, (ImageButton) null);
        }
        if (this.videoAd == null) {
            return;
        }
        if (!this.videoAd.stayInPlayer) {
            dismiss();
            return;
        }
        if (this.videoAd.buttons != null) {
            for (int i = 0; i < this.videoAd.buttons.size(); i++) {
                VideoImage videoImage = this.videoAd.buttons.get(i);
                setButtonAlpha(videoImage.button, videoImage.fromAlpha);
                if (videoImage.button.getParent() == null) {
                    this.buttonsLayout.addView(videoImage.button, videoImage.layoutParams);
                }
                for (int j = 0; j < this.videoAd.buttons.size(); j++) {
                    this.buttonsLayout.bringChildToFront(this.videoAd.buttons.get(j).button);
                }
                MMAdViewSDK.Log.v("Button: %d alpha: %f", Integer.valueOf(i), Float.valueOf(videoImage.fromAlpha));
            }
        }
        this.handler.removeMessages(1);
        this.handler.removeMessages(2);
        this.handler.removeMessages(3);
    }

    /* access modifiers changed from: package-private */
    public boolean processVideoPlayerUri(Uri actionUri) {
        String host;
        if (actionUri == null || !actionUri.getScheme().equalsIgnoreCase("mmsdk") || (host = actionUri.getHost()) == null) {
            return false;
        }
        if (host.equalsIgnoreCase("restartVideo")) {
            runOnUiThread(new Runnable() {
                public void run() {
                    MMAdViewSDK.Log.d("Restart Video.");
                    if (VideoPlayerActivity.this.isCachedAd && VideoPlayerActivity.this.videoAd != null) {
                        List<VideoImage> buttons = VideoPlayerActivity.this.videoAd.buttons;
                        if (!(VideoPlayerActivity.this.buttonsLayout == null || buttons == null)) {
                            VideoPlayerActivity.this.handler.removeMessages(1);
                            VideoPlayerActivity.this.handler.removeMessages(2);
                            VideoPlayerActivity.this.handler.removeMessages(3);
                            int unused = VideoPlayerActivity.this.lastVideoPosition = 0;
                            for (int i = 0; i < buttons.size(); i++) {
                                VideoImage buttonData = buttons.get(i);
                                if (buttonData != null) {
                                    if (buttonData.appearanceDelay > 0) {
                                        VideoPlayerActivity.this.buttonsLayout.removeView(buttonData.button);
                                        VideoPlayerActivity.this.handler.sendMessageDelayed(Message.obtain(VideoPlayerActivity.this.handler, 3, buttonData), buttonData.appearanceDelay);
                                    }
                                    if (buttonData.inactivityTimeout > 0) {
                                        VideoPlayerActivity.this.handler.sendMessageDelayed(Message.obtain(VideoPlayerActivity.this.handler, 1, buttonData), buttonData.inactivityTimeout + buttonData.appearanceDelay + buttonData.fadeDuration);
                                    }
                                    if (VideoPlayerActivity.this.showCountdownHud) {
                                        VideoPlayerActivity.this.showHud(true);
                                    }
                                    if (VideoPlayerActivity.this.handler != null) {
                                        VideoPlayerActivity.this.handler.sendMessageDelayed(Message.obtain(VideoPlayerActivity.this.handler, 2), 1000);
                                    }
                                }
                            }
                        }
                    }
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.playVideo(0);
                    }
                }
            });
            return true;
        } else if (host.equalsIgnoreCase("endVideo")) {
            runOnUiThread(new Runnable() {
                public void run() {
                    MMAdViewSDK.Log.d("End Video.");
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        String unused = VideoPlayerActivity.this.current = null;
                        VideoPlayerActivity.this.mVideoView.stopPlayback();
                        if (VideoPlayerActivity.this.videoAd != null) {
                            VideoPlayerActivity.this.dismiss();
                        }
                    }
                }
            });
            return true;
        } else {
            MMAdViewSDK.Log.v("Unrecognized mmsdk:// URI %s.", actionUri);
            return false;
        }
    }

    /* access modifiers changed from: package-private */
    public void enableButtons() {
        runOnUiThread(new Runnable() {
            public void run() {
                List<VideoImage> buttons = null;
                if (VideoPlayerActivity.this.videoAd != null) {
                    buttons = VideoPlayerActivity.this.videoAd.buttons;
                }
                if (buttons != null) {
                    for (VideoImage image : buttons) {
                        if (image.button != null) {
                            image.button.setEnabled(true);
                        }
                    }
                }
            }
        });
    }

    public boolean shouldStartActivityForUri(Uri uri) {
        enableButtons();
        if (processVideoPlayerUri(uri)) {
            return false;
        }
        MMAdViewSDK.Log.d("Starting activity for %s", uri);
        return true;
    }

    public void didFailToResolveUri(Uri uri) {
        enableButtons();
    }

    /* access modifiers changed from: private */
    public void dispatchButtonClick(String urlString, String overlayOrientation, ImageButton button) {
        if (button != null) {
            button.setEnabled(false);
        }
        if (urlString != null) {
            MMAdViewSDK.Log.d("Button Click with URL: %s", urlString);
            OverlaySettings settings = new OverlaySettings();
            if (overlayOrientation != null) {
                settings.orientation = overlayOrientation;
            }
            settings.shouldLaunchToOverlay = true;
            HttpRedirection.startActivityFromUri(this.activity, urlString, settings, this, (String) null);
        }
    }

    public synchronized void startServer(String name, int position, boolean isSDCard) {
        if (this.videoServer == null) {
            this.videoServer = new VideoServer(this.activity, name);
            Thread thread = new Thread(this.videoServer);
            thread.start();
            thread.getId();
            if (this.mVideoView != null) {
                this.mVideoView.setVideoURI(Uri.parse("http://localhost:" + this.videoServer.port + "/" + name + "video.dat"));
                this.mVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
                    public void onCompletion(MediaPlayer mp) {
                        MMAdViewSDK.Log.d("Video Playing Complete");
                        if (VideoPlayerActivity.this.showCountdownHud) {
                            VideoPlayerActivity.this.hideHud();
                        }
                        if (VideoPlayerActivity.this.videoAd != null) {
                            VideoPlayerActivity.this.videoPlayerOnCompletion(VideoPlayerActivity.this.videoAd.onCompletionUrl);
                        }
                    }
                });
                this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() {
                    public void onPrepared(MediaPlayer mp) {
                        MMAdViewSDK.Log.d("Video Prepared");
                    }
                });
                this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener() {
                    public boolean onError(MediaPlayer mp, int what, int extra) {
                        if (VideoPlayerActivity.this.videoAd == null) {
                            return false;
                        }
                        HttpGetRequest.log(VideoPlayerActivity.this.videoAd.videoError);
                        return false;
                    }
                });
                this.mVideoView.requestFocus();
                this.mVideoView.seekTo(position);
                this.mVideoView.start();
                this.paused = false;
            } else {
                MMAdViewSDK.Log.e("Null Video View");
            }
        }
    }

    public synchronized void stopServer() {
        if (this.videoServer != null) {
            MMAdViewSDK.Log.d("Stop video server");
            if (this.mVideoView != null) {
                this.mVideoView.stopPlayback();
            }
            this.videoServer.requestStop();
            this.videoServer = null;
        }
    }

    private class ScreenReceiver extends BroadcastReceiver {
        private ScreenReceiver() {
        }

        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                MMAdViewSDK.Log.v("VideoPlayerActivity - Screen off");
                boolean unused = VideoPlayerActivity.this.waitForUserPresent = true;
            } else if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                MMAdViewSDK.Log.v("VideoPlayerActivity - Screen on");
            } else if (intent.getAction().equals("android.intent.action.USER_PRESENT")) {
                MMAdViewSDK.Log.v("VideoPlayerActivity - Screen unlocked");
                VideoPlayerActivity.this.resumeVideo();
                boolean unused2 = VideoPlayerActivity.this.waitForUserPresent = false;
            }
        }
    }

    private class VideoServer implements Runnable {
        private File cacheDir;
        boolean done = false;
        private final String fileName;
        Integer port;
        private ServerSocket serverSocket = null;

        public VideoServer(Context context, String fileName2) {
            this.fileName = fileName2;
            this.cacheDir = AdCache.getCacheDirectory(context);
            try {
                this.serverSocket = new ServerSocket();
                this.serverSocket.bind((SocketAddress) null);
                this.serverSocket.setSoTimeout(0);
                this.port = new Integer(this.serverSocket.getLocalPort());
                MMAdViewSDK.Log.v("Video Server Port: %d", this.port);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        /* JADX WARNING: Removed duplicated region for block: B:106:0x043b A[SYNTHETIC, Splitter:B:106:0x043b] */
        /* JADX WARNING: Removed duplicated region for block: B:109:0x0440 A[Catch:{ IOException -> 0x044a }] */
        /* JADX WARNING: Removed duplicated region for block: B:111:0x0445 A[Catch:{ IOException -> 0x044a }] */
        /* JADX WARNING: Removed duplicated region for block: B:128:0x04dc A[SYNTHETIC, Splitter:B:128:0x04dc] */
        /* JADX WARNING: Removed duplicated region for block: B:131:0x04e1 A[Catch:{ IOException -> 0x04eb }] */
        /* JADX WARNING: Removed duplicated region for block: B:133:0x04e6 A[Catch:{ IOException -> 0x04eb }] */
        /* JADX WARNING: Removed duplicated region for block: B:169:0x000a A[SYNTHETIC] */
        /* JADX WARNING: Removed duplicated region for block: B:183:? A[RETURN, SYNTHETIC] */
        /* JADX WARNING: Removed duplicated region for block: B:36:0x01ba  */
        /* JADX WARNING: Removed duplicated region for block: B:43:0x01d3 A[Catch:{ IOException -> 0x0529 }] */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public void run() {
            /*
                r33 = this;
                r10 = 0
                r22 = 0
                r14 = 0
                r29 = 1024(0x400, float:1.435E-42)
                r0 = r29
                byte[] r3 = new byte[r0]
            L_0x000a:
                r0 = r33
                boolean r0 = r0.done
                r29 = r0
                if (r29 != 0) goto L_0x01b2
                r0 = r33
                java.net.ServerSocket r0 = r0.serverSocket     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29 = r0
                java.net.Socket r10 = r29.accept()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Accepted new incoming connection"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.io.InputStream r16 = r10.getInputStream()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.io.OutputStream r22 = r10.getOutputStream()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r28 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r28.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
            L_0x002e:
                r0 = r16
                r0.read(r3)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = new java.lang.String     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                r0.<init>(r3)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r28.append(r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r25 = r28.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "\r\n\r\n"
                r0 = r25
                r1 = r29
                boolean r29 = r0.contains(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r29 == 0) goto L_0x002e
                java.lang.String r29 = "Request string: %s"
                r30 = 1
                r0 = r30
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30 = r0
                r31 = 0
                r30[r31] = r25     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                com.millennialmedia.android.MMAdViewSDK.Log.v(r29, r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "******************"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r29 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = "HEAD /"
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                java.lang.String r0 = r0.fileName     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30 = r0
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = "video.dat"
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = r29.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r25
                r1 = r29
                boolean r29 = r0.startsWith(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r29 == 0) goto L_0x014b
                java.io.File r13 = new java.io.File     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                java.io.File r0 = r0.cacheDir     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29 = r0
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = java.io.File.separator     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                com.millennialmedia.android.VideoPlayerActivity r0 = com.millennialmedia.android.VideoPlayerActivity.this     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r31 = r0
                com.millennialmedia.android.VideoAd r31 = r31.videoAd     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r31
                java.lang.String r0 = r0.id     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r31 = r0
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                java.lang.String r0 = r0.fileName     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r31 = r0
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = "video.dat"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                r1 = r30
                r13.<init>(r0, r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "HTTP/1.1 200 OK\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Content-Type: video/mp4\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = new java.lang.String     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = "Content-Length: "
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                long r31 = r13.length()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = "\r\n"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29.<init>(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Cache-Control: no-cache\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Connection: close\r\n\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
            L_0x012f:
                java.lang.String r29 = "Closing video server socket"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)
                if (r10 == 0) goto L_0x0139
                r10.close()     // Catch:{ IOException -> 0x0145 }
            L_0x0139:
                if (r14 == 0) goto L_0x013e
                r14.close()     // Catch:{ IOException -> 0x0145 }
            L_0x013e:
                if (r22 == 0) goto L_0x000a
                r22.close()     // Catch:{ IOException -> 0x0145 }
                goto L_0x000a
            L_0x0145:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x000a
            L_0x014b:
                java.lang.StringBuilder r29 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = "GET /"
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                java.lang.String r0 = r0.fileName     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30 = r0
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = "video.dat"
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = r29.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r25
                r1 = r29
                boolean r29 = r0.startsWith(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r29 == 0) goto L_0x04f1
                java.io.File r13 = new java.io.File     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                java.io.File r0 = r0.cacheDir     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29 = r0
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r33
                java.lang.String r0 = r0.fileName     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r31 = r0
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = "video.dat"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                r1 = r30
                r13.<init>(r0, r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r13 != 0) goto L_0x01e7
                java.lang.String r29 = "Closing video server socket"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)
                if (r10 == 0) goto L_0x01a8
                r10.close()     // Catch:{ IOException -> 0x01e2 }
            L_0x01a8:
                if (r14 == 0) goto L_0x01ad
                r14.close()     // Catch:{ IOException -> 0x01e2 }
            L_0x01ad:
                if (r22 == 0) goto L_0x01b2
                r22.close()     // Catch:{ IOException -> 0x01e2 }
            L_0x01b2:
                r0 = r33
                boolean r0 = r0.done
                r29 = r0
                if (r29 == 0) goto L_0x01bf
                java.lang.String r29 = "Detected stop"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)
            L_0x01bf:
                r0 = r33
                java.net.ServerSocket r0 = r0.serverSocket     // Catch:{ IOException -> 0x0529 }
                r29 = r0
                if (r29 == 0) goto L_0x01e1
                r0 = r33
                java.net.ServerSocket r0 = r0.serverSocket     // Catch:{ IOException -> 0x0529 }
                r29 = r0
                boolean r29 = r29.isBound()     // Catch:{ IOException -> 0x0529 }
                if (r29 == 0) goto L_0x01e1
                java.lang.String r29 = "Closing server socket connection"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ IOException -> 0x0529 }
                r0 = r33
                java.net.ServerSocket r0 = r0.serverSocket     // Catch:{ IOException -> 0x0529 }
                r29 = r0
                r29.close()     // Catch:{ IOException -> 0x0529 }
            L_0x01e1:
                return
            L_0x01e2:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x01b2
            L_0x01e7:
                java.io.OutputStream r22 = r10.getOutputStream()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Range:"
                r0 = r25
                r1 = r29
                boolean r29 = r0.contains(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r29 == 0) goto L_0x0450
                java.lang.String r29 = "Range found in request string "
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Range: bytes=([0-9]+)-\\s"
                java.util.regex.Pattern r24 = java.util.regex.Pattern.compile(r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.util.regex.Matcher r20 = r24.matcher(r25)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r7 = 1
                r4 = 1
            L_0x020a:
                boolean r29 = r20.find()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r29 == 0) goto L_0x022d
                r29 = 1
                r0 = r20
                r1 = r29
                java.lang.String r9 = r0.group(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.Integer r29 = new java.lang.Integer     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                r0.<init>(r9)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                int r29 = r29.intValue()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                long r7 = (long) r0     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                long r4 = r13.length()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                goto L_0x020a
            L_0x022d:
                java.lang.String r29 = "Range: bytes=([0-9]+)-([0-9]+)"
                java.util.regex.Pattern r23 = java.util.regex.Pattern.compile(r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r23
                r1 = r25
                java.util.regex.Matcher r19 = r0.matcher(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
            L_0x023b:
                boolean r29 = r19.find()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r29 == 0) goto L_0x027d
                r29 = 1
                r0 = r19
                r1 = r29
                java.lang.String r9 = r0.group(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29 = 2
                r0 = r19
                r1 = r29
                java.lang.String r6 = r0.group(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.Integer r29 = new java.lang.Integer     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                r0.<init>(r9)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                int r29 = r29.intValue()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                long r7 = (long) r0     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                if (r6 == 0) goto L_0x0274
                java.lang.Integer r29 = new java.lang.Integer     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                r0.<init>(r6)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                int r29 = r29.intValue()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                long r4 = (long) r0     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                goto L_0x023b
            L_0x0274:
                long r29 = r13.length()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r31 = 1
                long r4 = r29 - r31
                goto L_0x023b
            L_0x027d:
                java.lang.StringBuilder r29 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = "Bytes: "
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                java.lang.StringBuilder r29 = r0.append(r7)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = "-"
                java.lang.StringBuilder r29 = r29.append(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r29
                java.lang.StringBuilder r29 = r0.append(r4)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = r29.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                com.millennialmedia.android.MMAdViewSDK.Log.i((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.io.FileInputStream r15 = new java.io.FileInputStream     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r15.<init>(r13)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                long r26 = r15.skip(r7)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r29 = "Bytes skipped: %d"
                r30 = 1
                r0 = r30
                java.lang.Object[] r0 = new java.lang.Object[r0]     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r30 = r0
                r31 = 0
                java.lang.Long r32 = java.lang.Long.valueOf(r26)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r30[r31] = r32     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                com.millennialmedia.android.MMAdViewSDK.Log.v(r29, r30)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                long r29 = r4 - r26
                r31 = 1
                long r17 = r29 + r31
                java.lang.String r29 = "HTTP/1.1 206 Partial Content\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r29 = "Date: Thu, 17 Feb 2011 01:27:03 GMT\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r29 = "Etag: \"320581-329f19-235b0a40\"\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r29 = 1
                int r29 = (r4 > r29 ? 1 : (r4 == r29 ? 0 : -1))
                if (r29 <= 0) goto L_0x03bd
                java.lang.String r29 = new java.lang.String     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "Content-Range: "
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r30
                java.lang.StringBuilder r30 = r0.append(r7)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "-"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r30
                java.lang.StringBuilder r30 = r0.append(r4)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "\r\n"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r29.<init>(r30)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
            L_0x0329:
                java.lang.String r29 = "Content-Type: video/mp4\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r29 = new java.lang.String     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "Content-Length: "
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r30
                r1 = r17
                java.lang.StringBuilder r30 = r0.append(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "\r\n"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r29.<init>(r30)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r29 = "Connection: close\r\n\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
            L_0x0370:
                int r21 = r15.read(r3)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                if (r21 > 0) goto L_0x03fb
                java.lang.String r29 = "Video Did Finish"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
            L_0x037b:
                r14 = r15
            L_0x037c:
                java.lang.String r29 = "\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "200 OK"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29 = 1
                r0 = r29
                r1 = r33
                r1.done = r0     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                goto L_0x012f
            L_0x0398:
                r11 = move-exception
            L_0x0399:
                r11.printStackTrace()     // Catch:{ all -> 0x050e }
                if (r10 == 0) goto L_0x03a1
                r10.close()     // Catch:{ IOException -> 0x0508 }
            L_0x03a1:
                java.lang.String r29 = "Closing video server socket"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)
                if (r10 == 0) goto L_0x03ab
                r10.close()     // Catch:{ IOException -> 0x03b7 }
            L_0x03ab:
                if (r14 == 0) goto L_0x03b0
                r14.close()     // Catch:{ IOException -> 0x03b7 }
            L_0x03b0:
                if (r22 == 0) goto L_0x000a
                r22.close()     // Catch:{ IOException -> 0x03b7 }
                goto L_0x000a
            L_0x03b7:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x000a
            L_0x03bd:
                java.lang.String r29 = new java.lang.String     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "Content-Range: "
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r30
                java.lang.StringBuilder r30 = r0.append(r7)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "-"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                long r31 = r13.length()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r31 = "\r\n"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r29.<init>(r30)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                goto L_0x0329
            L_0x03f8:
                r11 = move-exception
                r14 = r15
                goto L_0x0399
            L_0x03fb:
                r0 = r21
                long r0 = (long) r0     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r29 = r0
                int r29 = (r17 > r29 ? 1 : (r17 == r29 ? 0 : -1))
                if (r29 < 0) goto L_0x041e
                r29 = 0
                r0 = r22
                r1 = r29
                r2 = r21
                r0.write(r3, r1, r2)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
            L_0x040f:
                r0 = r21
                long r0 = (long) r0     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r29 = r0
                long r17 = r17 - r29
                r29 = 0
                int r29 = (r17 > r29 ? 1 : (r17 == r29 ? 0 : -1))
                if (r29 > 0) goto L_0x0370
                goto L_0x037b
            L_0x041e:
                r29 = 0
                r0 = r17
                int r0 = (int) r0     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r30 = r0
                r0 = r22
                r1 = r29
                r2 = r30
                r0.write(r3, r1, r2)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                goto L_0x040f
            L_0x042f:
                r11 = move-exception
                r14 = r15
            L_0x0431:
                r11.printStackTrace()     // Catch:{ all -> 0x050e }
                java.lang.String r29 = "Closing video server socket"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)
                if (r10 == 0) goto L_0x043e
                r10.close()     // Catch:{ IOException -> 0x044a }
            L_0x043e:
                if (r14 == 0) goto L_0x0443
                r14.close()     // Catch:{ IOException -> 0x044a }
            L_0x0443:
                if (r22 == 0) goto L_0x01b2
                r22.close()     // Catch:{ IOException -> 0x044a }
                goto L_0x01b2
            L_0x044a:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x01b2
            L_0x0450:
                java.lang.String r29 = "HTTP/1.1 200 OK\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Content-Type: video/mp4\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = new java.lang.String     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r30 = new java.lang.StringBuilder     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r30.<init>()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = "Content-Length: "
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                long r31 = r13.length()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r31 = "\r\n"
                java.lang.StringBuilder r30 = r30.append(r31)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r30 = r30.toString()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r29.<init>(r30)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Cache-Control: no-cache\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "Connection: close\r\n\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.io.FileInputStream r15 = new java.io.FileInputStream     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r15.<init>(r13)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
            L_0x04b6:
                int r21 = r15.read(r3)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                if (r21 > 0) goto L_0x04c4
                java.lang.String r29 = "Video Did Finish"
                com.millennialmedia.android.MMAdViewSDK.Log.i((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                r14 = r15
                goto L_0x037c
            L_0x04c4:
                r29 = 0
                r0 = r22
                r1 = r29
                r2 = r21
                r0.write(r3, r1, r2)     // Catch:{ SocketTimeoutException -> 0x03f8, FileNotFoundException -> 0x042f, IOException -> 0x04d0, all -> 0x052f }
                goto L_0x04b6
            L_0x04d0:
                r11 = move-exception
                r14 = r15
            L_0x04d2:
                r11.printStackTrace()     // Catch:{ all -> 0x050e }
                java.lang.String r29 = "Closing video server socket"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)
                if (r10 == 0) goto L_0x04df
                r10.close()     // Catch:{ IOException -> 0x04eb }
            L_0x04df:
                if (r14 == 0) goto L_0x04e4
                r14.close()     // Catch:{ IOException -> 0x04eb }
            L_0x04e4:
                if (r22 == 0) goto L_0x000a
                r22.close()     // Catch:{ IOException -> 0x04eb }
                goto L_0x000a
            L_0x04eb:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x000a
            L_0x04f1:
                java.lang.String r29 = "HTTP/1.1 400 Bad Request\r\n\r\n"
                byte[] r29 = r29.getBytes()     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                r0 = r22
                r1 = r29
                r0.write(r1)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                java.lang.String r29 = "400 Bad Request"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r29)     // Catch:{ SocketTimeoutException -> 0x0398, FileNotFoundException -> 0x0505, IOException -> 0x0532 }
                goto L_0x012f
            L_0x0505:
                r11 = move-exception
                goto L_0x0431
            L_0x0508:
                r12 = move-exception
                r12.printStackTrace()     // Catch:{ all -> 0x050e }
                goto L_0x03a1
            L_0x050e:
                r29 = move-exception
            L_0x050f:
                java.lang.String r30 = "Closing video server socket"
                com.millennialmedia.android.MMAdViewSDK.Log.v((java.lang.String) r30)
                if (r10 == 0) goto L_0x0519
                r10.close()     // Catch:{ IOException -> 0x0524 }
            L_0x0519:
                if (r14 == 0) goto L_0x051e
                r14.close()     // Catch:{ IOException -> 0x0524 }
            L_0x051e:
                if (r22 == 0) goto L_0x0523
                r22.close()     // Catch:{ IOException -> 0x0524 }
            L_0x0523:
                throw r29
            L_0x0524:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x0523
            L_0x0529:
                r11 = move-exception
                r11.printStackTrace()
                goto L_0x01e1
            L_0x052f:
                r29 = move-exception
                r14 = r15
                goto L_0x050f
            L_0x0532:
                r11 = move-exception
                goto L_0x04d2
            */
            throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.VideoPlayerActivity.VideoServer.run():void");
        }

        public synchronized void requestStop() {
            this.done = true;
            MMAdViewSDK.Log.v("Requested video server stop. Done: " + this.done);
        }
    }
}
