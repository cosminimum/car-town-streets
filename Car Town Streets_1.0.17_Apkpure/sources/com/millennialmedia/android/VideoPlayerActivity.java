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
import java.util.List;
/* loaded from: classes.dex */
public class VideoPlayerActivity extends MMBaseActivity implements Handler.Callback, HttpRedirection.Listener {
    private static final int MESSAGE_DELAYED_BUTTON = 3;
    private static final int MESSAGE_EVENTLOG_CHECK = 2;
    private static final int MESSAGE_INACTIVITY_ANIMATION = 1;
    private RelativeLayout buttonsLayout;
    private RelativeLayout controlsLayout;
    private String current;
    private Handler handler;
    private TextView hudSeconds;
    private TextView hudStaticText;
    private boolean isCachedAd;
    private int lastVideoPosition;
    private Button mPausePlay;
    private Button mRewind;
    private Button mStop;
    private VideoView mVideoView;
    private ScreenReceiver receiver;
    private RelativeLayout relLayout;
    View testView;
    private VideoAd videoAd;
    private boolean videoCompleted;
    private boolean videoCompletedOnce;
    protected VideoServer videoServer;
    private boolean waitForUserPresent;
    private boolean paused = false;
    private boolean showBottomBar = true;
    private int currentVideoPosition = 0;
    private boolean showCountdownHud = true;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public interface VideoHackBgListener {
        void callback(long j);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void finish() {
        super.finish();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ File getCacheDir() {
        return super.getCacheDir();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ ContentResolver getContentResolver() {
        return super.getContentResolver();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ Intent getIntent() {
        return super.getIntent();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ Object getLastNonConfigurationInstance() {
        return super.getLastNonConfigurationInstance();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ Object getSystemService(String x0) {
        return super.getSystemService(x0);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ Window getWindow() {
        return super.getWindow();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ Object onRetainNonConfigurationInstance() {
        return super.onRetainNonConfigurationInstance();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ Intent registerReceiver(BroadcastReceiver x0, IntentFilter x1) {
        return super.registerReceiver(x0, x1);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void setContentView(View x0) {
        super.setContentView(x0);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void setRequestedOrientation(int x0) {
        super.setRequestedOrientation(x0);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void setTheme(int x0) {
        super.setTheme(x0);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void startActivity(Intent x0) {
        super.startActivity(x0);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void startActivityForResult(Intent x0, int x1) {
        super.startActivityForResult(x0, x1);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public /* bridge */ /* synthetic */ void unregisterReceiver(BroadcastReceiver x0) {
        super.unregisterReceiver(x0);
    }

    @Override // com.millennialmedia.android.MMBaseActivity
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
        RelativeLayout videoLayout = new RelativeLayout(this.activity);
        videoLayout.setBackgroundColor(-16777216);
        videoLayout.setId(WalletConstants.ERROR_CODE_INVALID_TRANSACTION);
        RelativeLayout.LayoutParams videoContainerLp = new RelativeLayout.LayoutParams(-1, -1);
        videoContainerLp.addRule(13);
        videoLayout.setLayoutParams(videoContainerLp);
        videoLayout.setDrawingCacheBackgroundColor(-16777216);
        RelativeLayout.LayoutParams videoLp = new RelativeLayout.LayoutParams(-1, -1);
        videoLp.addRule(13);
        this.mVideoView = new VideoView(this.activity);
        this.mVideoView.setId(WalletConstants.ERROR_CODE_AUTHENTICATION_FAILURE);
        this.mVideoView.getHolder().setFormat(-2);
        videoLayout.addView(this.mVideoView, videoLp);
        this.mVideoView.setDrawingCacheBackgroundColor(-16777216);
        this.relLayout.addView(videoLayout, videoContainerLp);
        RelativeLayout.LayoutParams buttonsLp = new RelativeLayout.LayoutParams(-1, -1);
        MMAdViewSDK.Log.v("Is Cached Ad: %b", Boolean.valueOf(this.isCachedAd));
        if (this.isCachedAd) {
            this.handler = new Handler(this);
            setRequestedOrientation(0);
            if (savedInstanceState == null) {
                String id = getIntent().getStringExtra("videoId");
                this.videoAd = (VideoAd) AdCache.load(this.activity, id);
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
                    final ImageButton newButton = new ImageButton(this.activity);
                    button.button = newButton;
                    try {
                        Bitmap bitmap = BitmapFactory.decodeFile(adDir.getAbsolutePath() + File.separator + this.videoAd.id + Uri.parse(button.imageUrl).getLastPathSegment().replaceFirst("\\.[^\\.]*$", ".dat"));
                        if (bitmap != null) {
                            newButton.setImageBitmap(bitmap);
                        } else {
                            newButton.setImageURI(Uri.parse(adDir.getAbsolutePath() + File.separator + this.videoAd.id + Uri.parse(button.imageUrl).getLastPathSegment().replaceFirst("\\.[^\\.]*$", ".dat")));
                        }
                    } catch (Exception e) {
                        MMAdViewSDK.Log.e(e);
                    }
                    newButton.setPadding(0, 0, 0, 0);
                    newButton.setBackgroundColor(0);
                    setButtonAlpha(newButton, button.fromAlpha);
                    newButton.setId(i + 1);
                    RelativeLayout.LayoutParams newButtonLp = new RelativeLayout.LayoutParams(-2, -2);
                    MMAdViewSDK.Log.v("Button: %d Anchor: %d Position: %d Anchor2: %d Position2: %d", Integer.valueOf(newButton.getId()), Integer.valueOf(button.anchor), Integer.valueOf(button.position), Integer.valueOf(button.anchor2), Integer.valueOf(button.position2));
                    newButtonLp.addRule(button.position, button.anchor);
                    newButtonLp.addRule(button.position2, button.anchor2);
                    newButtonLp.setMargins(button.paddingLeft, button.paddingTop, button.paddingRight, button.paddingBottom);
                    if (!TextUtils.isEmpty(button.linkUrl)) {
                        newButton.setOnClickListener(new View.OnClickListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.1
                            @Override // android.view.View.OnClickListener
                            public void onClick(View view) {
                                VideoPlayerActivity.this.dispatchButtonClick(button.linkUrl, button.overlayOrientation, newButton);
                                VideoPlayerActivity.this.logButtonEvent(button);
                            }
                        });
                    }
                    if (button.appearanceDelay > 0) {
                        button.layoutParams = newButtonLp;
                        Message message = Message.obtain(this.handler, 3, button);
                        this.handler.sendMessageDelayed(message, button.appearanceDelay);
                    } else {
                        this.buttonsLayout.addView(newButton, newButtonLp);
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
            this.mVideoView.setCallBack(new VideoHackBgListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.2
                @Override // com.millennialmedia.android.VideoPlayerActivity.VideoHackBgListener
                public void callback(long delayMS) {
                    VideoPlayerActivity.this.testView.postDelayed(new Runnable() { // from class: com.millennialmedia.android.VideoPlayerActivity.2.1
                        @Override // java.lang.Runnable
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
            RelativeLayout.LayoutParams pauseLp = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams stopLp = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams rewindLp = new RelativeLayout.LayoutParams(-2, -2);
            pauseLp.addRule(14);
            this.controlsLayout.addView(this.mPausePlay, pauseLp);
            rewindLp.addRule(0, this.mPausePlay.getId());
            this.controlsLayout.addView(this.mRewind);
            stopLp.addRule(11);
            this.controlsLayout.addView(this.mStop, stopLp);
            this.mRewind.setOnClickListener(new View.OnClickListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.3
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.mVideoView.seekTo(0);
                    }
                }
            });
            this.mPausePlay.setOnClickListener(new View.OnClickListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.4
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (VideoPlayerActivity.this.paused) {
                        if (VideoPlayerActivity.this.mVideoView != null) {
                            VideoPlayerActivity.this.playVideo(VideoPlayerActivity.this.mVideoView.getCurrentPosition());
                        }
                        VideoPlayerActivity.this.mPausePlay.setBackgroundResource(17301539);
                        VideoPlayerActivity.this.paused = false;
                    } else if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.mVideoView.pause();
                        VideoPlayerActivity.this.mPausePlay.setBackgroundResource(17301540);
                        VideoPlayerActivity.this.paused = true;
                    }
                }
            });
            this.mStop.setOnClickListener(new View.OnClickListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.5
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.current = null;
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
        return !this.videoAd.stayInPlayer || !this.videoCompleted;
    }

    private void setButtonAlpha(ImageButton button, float alpha) {
        AlphaAnimation animation = new AlphaAnimation(alpha, alpha);
        animation.setDuration(0L);
        animation.setFillEnabled(true);
        animation.setFillBefore(true);
        animation.setFillAfter(true);
        button.startAnimation(animation);
    }

    /* loaded from: classes.dex */
    private class DelayedAnimationListener implements Animation.AnimationListener {
        private ImageButton button;
        private RelativeLayout.LayoutParams layoutParams;

        DelayedAnimationListener(ImageButton b, RelativeLayout.LayoutParams lp) {
            this.button = b;
            this.layoutParams = lp;
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationStart(Animation animation) {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationEnd(Animation animation) {
        }

        @Override // android.view.animation.Animation.AnimationListener
        public void onAnimationRepeat(Animation animation) {
        }
    }

    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message msg) {
        switch (msg.what) {
            case 1:
                if (canFadeButtons()) {
                    VideoImage videoImage = (VideoImage) msg.obj;
                    AlphaAnimation animation = new AlphaAnimation(videoImage.fromAlpha, videoImage.toAlpha);
                    animation.setDuration(videoImage.fadeDuration);
                    animation.setFillEnabled(true);
                    animation.setFillBefore(true);
                    animation.setFillAfter(true);
                    videoImage.button.startAnimation(animation);
                    return true;
                }
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
                                    if (videoEvent != null && videoEvent.position >= this.lastVideoPosition && videoEvent.position < currentPosition) {
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
                            long seconds = (this.videoAd.duration - currentPosition) / 1000;
                            if (seconds > 0) {
                                if (this.hudSeconds != null) {
                                    this.hudSeconds.setText(String.valueOf(seconds));
                                }
                            } else {
                                hideHud();
                            }
                        }
                    }
                    this.handler.sendMessageDelayed(Message.obtain(this.handler, 2), 1000L);
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

    @Override // com.millennialmedia.android.MMBaseActivity
    public boolean dispatchTouchEvent(MotionEvent ev) {
        if (this.videoAd != null) {
            if (this.handler != null) {
                this.handler.removeMessages(1);
            }
            for (int i = 0; i < this.videoAd.buttons.size(); i++) {
                VideoImage videoImage = this.videoAd.buttons.get(i);
                setButtonAlpha(videoImage.button, videoImage.fromAlpha);
                if (videoImage.inactivityTimeout > 0) {
                    Message message = Message.obtain(this.handler, 1, videoImage);
                    this.handler.sendMessageDelayed(message, videoImage.inactivityTimeout);
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

    protected void logBeginEvent(VideoAd videoAd) {
        if (videoAd != null && videoAd.startActivity != null) {
            try {
                MMAdViewSDK.Log.d("Cached video begin event logged");
                for (int i = 0; i < videoAd.startActivity.length; i++) {
                    logEvent(videoAd.startActivity[i]);
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
    }

    protected void logEndEvent(VideoAd videoAd) {
        MMAdViewSDK.Log.d("Cached video end event logged");
        for (int i = 0; i < videoAd.endActivity.length; i++) {
            try {
                logEvent(videoAd.endActivity[i]);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return;
            }
        }
    }

    protected void logButtonEvent(VideoImage button) {
        MMAdViewSDK.Log.d("Cached video button event logged");
        for (int i = 0; i < button.activity.length; i++) {
            try {
                logEvent(button.activity[i]);
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
                return;
            }
        }
    }

    protected void logEvent(final String activity) throws UnsupportedEncodingException {
        MMAdViewSDK.Log.d("Logging event to: %s", activity);
        new Thread(new Runnable() { // from class: com.millennialmedia.android.VideoPlayerActivity.6
            @Override // java.lang.Runnable
            public void run() {
                HttpGetRequest getRequest = new HttpGetRequest();
                try {
                    getRequest.get(activity);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
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

    /* JADX INFO: Access modifiers changed from: private */
    public void hideHud() {
        if (this.hudStaticText != null) {
            this.hudStaticText.setVisibility(4);
        }
        if (this.hudSeconds != null) {
            this.hudSeconds.setVisibility(4);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void playVideo(int position) {
        try {
            Uri uri = getIntent().getData();
            String name = uri.toString();
            MMAdViewSDK.Log.d("playVideo path: %s", name);
            if (name == null || name.length() == 0) {
                Toast.makeText(this.activity, "Sorry. There was a problem playing the video", 1).show();
                if (this.videoAd != null) {
                    HttpGetRequest.log(this.videoAd.videoError);
                }
            } else {
                this.videoCompleted = false;
                if (name.equals(this.current) && this.mVideoView != null) {
                    if (this.isCachedAd) {
                        if (this.videoAd != null) {
                            if (this.videoAd.storedOnSdCard) {
                                this.mVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.7
                                    @Override // android.media.MediaPlayer.OnCompletionListener
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
                                this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.8
                                    @Override // android.media.MediaPlayer.OnPreparedListener
                                    public void onPrepared(MediaPlayer mp) {
                                        MMAdViewSDK.Log.d("Video Prepared");
                                    }
                                });
                                this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.9
                                    @Override // android.media.MediaPlayer.OnErrorListener
                                    public boolean onError(MediaPlayer mp, int what, int extra) {
                                        if (VideoPlayerActivity.this.videoAd != null) {
                                            HttpGetRequest.log(VideoPlayerActivity.this.videoAd.videoError);
                                            return false;
                                        }
                                        return false;
                                    }
                                });
                                this.mVideoView.setVideoURI(Uri.parse(name));
                                this.mVideoView.requestFocus();
                                this.mVideoView.seekTo(position);
                                this.mVideoView.start();
                                this.paused = false;
                            } else {
                                startServer(name, position, false);
                            }
                        }
                    } else {
                        this.mVideoView.requestFocus();
                        this.mVideoView.seekTo(position);
                        this.mVideoView.start();
                        this.paused = false;
                    }
                } else {
                    this.current = name;
                    if (this.mVideoView != null) {
                        if (this.isCachedAd) {
                            if (this.videoAd != null) {
                                if (!this.videoAd.storedOnSdCard) {
                                    MMAdViewSDK.Log.d("Cached Ad. Starting Server");
                                    startServer(name, position, false);
                                } else {
                                    this.mVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.10
                                        @Override // android.media.MediaPlayer.OnCompletionListener
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
                                    this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.11
                                        @Override // android.media.MediaPlayer.OnPreparedListener
                                        public void onPrepared(MediaPlayer mp) {
                                            MMAdViewSDK.Log.d("Video Prepared");
                                        }
                                    });
                                    this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.12
                                        @Override // android.media.MediaPlayer.OnErrorListener
                                        public boolean onError(MediaPlayer mp, int what, int extra) {
                                            if (VideoPlayerActivity.this.videoAd != null) {
                                                HttpGetRequest.log(VideoPlayerActivity.this.videoAd.videoError);
                                                return false;
                                            }
                                            return false;
                                        }
                                    });
                                    this.mVideoView.setVideoURI(Uri.parse(name));
                                    this.mVideoView.requestFocus();
                                    this.mVideoView.seekTo(position);
                                    this.mVideoView.start();
                                    this.paused = false;
                                }
                            }
                        } else {
                            this.mVideoView.setVideoURI(Uri.parse(name));
                            this.mVideoView.requestFocus();
                            this.mVideoView.seekTo(position);
                            this.mVideoView.start();
                            this.paused = false;
                        }
                    } else {
                        MMAdViewSDK.Log.e("Video Player is Null");
                    }
                }
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

    @Override // com.millennialmedia.android.MMBaseActivity
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

    @Override // com.millennialmedia.android.MMBaseActivity
    public void onResume() {
        super.onResume();
        MMAdViewSDK.Log.v("VideoPlayer - onResume");
        if (!this.waitForUserPresent) {
            resumeVideo();
        }
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public void onPause() {
        super.onPause();
        MMAdViewSDK.Log.v("VideoPlayer - onPause");
        if (!this.waitForUserPresent) {
            pauseVideo();
        }
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4 && event.getRepeatCount() == 0 && !this.videoCompletedOnce) {
            return true;
        }
        return super.onKeyDown(keyCode, event);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void dismiss() {
        MMAdViewSDK.Log.d("Video ad player closed");
        if (this.mVideoView != null) {
            this.mVideoView.stopPlayback();
        }
        finish();
    }

    @Override // com.millennialmedia.android.MMBaseActivity
    public void onDestroy() {
        super.onDestroy();
        unregisterReceiver(this.receiver);
        if (this.isCachedAd) {
            stopServer();
        }
    }

    @Override // com.millennialmedia.android.MMBaseActivity
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

    /* JADX INFO: Access modifiers changed from: private */
    public void resumeVideo() {
        if (this.mVideoView != null && !this.mVideoView.isPlaying() && !this.videoCompleted) {
            if (this.isCachedAd && !this.handler.hasMessages(2) && this.videoAd != null) {
                this.handler.sendMessageDelayed(Message.obtain(this.handler, 2), 1000L);
                if (this.showCountdownHud) {
                    long seconds = (this.videoAd.duration - this.currentVideoPosition) / 1000;
                    if (seconds > 0) {
                        if (this.hudSeconds != null) {
                            this.hudSeconds.setText(String.valueOf(seconds));
                        }
                    } else {
                        hideHud();
                    }
                }
                for (int i = 0; i < this.videoAd.buttons.size(); i++) {
                    VideoImage button = this.videoAd.buttons.get(i);
                    long delay = 0;
                    if (button.appearanceDelay > 0 && this.buttonsLayout.indexOfChild(button.button) == -1) {
                        Message message = Message.obtain(this.handler, 3, button);
                        delay = button.appearanceDelay - this.currentVideoPosition;
                        if (delay < 0) {
                            delay = 500;
                        }
                        this.handler.sendMessageDelayed(message, delay);
                    }
                    if (button.inactivityTimeout > 0) {
                        Message message2 = Message.obtain(this.handler, 1, button);
                        this.handler.sendMessageDelayed(message2, button.inactivityTimeout + delay + button.fadeDuration);
                    }
                }
            }
            playVideo(this.currentVideoPosition);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void videoPlayerOnCompletion(String url) {
        this.videoCompletedOnce = true;
        this.videoCompleted = true;
        if (!this.mVideoView.isInErrorState()) {
            logEndEvent(this.videoAd);
        }
        stopServer();
        MMAdViewSDK.Log.v("Video player on complete");
        if (url != null) {
            dispatchButtonClick(url, null, null);
        }
        if (this.videoAd != null) {
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
    }

    boolean processVideoPlayerUri(Uri actionUri) {
        String host;
        if (actionUri == null || !actionUri.getScheme().equalsIgnoreCase("mmsdk") || (host = actionUri.getHost()) == null) {
            return false;
        }
        if (host.equalsIgnoreCase("restartVideo")) {
            runOnUiThread(new Runnable() { // from class: com.millennialmedia.android.VideoPlayerActivity.13
                @Override // java.lang.Runnable
                public void run() {
                    MMAdViewSDK.Log.d("Restart Video.");
                    if (VideoPlayerActivity.this.isCachedAd && VideoPlayerActivity.this.videoAd != null) {
                        List<VideoImage> buttons = VideoPlayerActivity.this.videoAd.buttons;
                        if (VideoPlayerActivity.this.buttonsLayout != null && buttons != null) {
                            VideoPlayerActivity.this.handler.removeMessages(1);
                            VideoPlayerActivity.this.handler.removeMessages(2);
                            VideoPlayerActivity.this.handler.removeMessages(3);
                            VideoPlayerActivity.this.lastVideoPosition = 0;
                            for (int i = 0; i < buttons.size(); i++) {
                                VideoImage buttonData = buttons.get(i);
                                if (buttonData != null) {
                                    if (buttonData.appearanceDelay > 0) {
                                        ImageButton button = buttonData.button;
                                        VideoPlayerActivity.this.buttonsLayout.removeView(button);
                                        Message message = Message.obtain(VideoPlayerActivity.this.handler, 3, buttonData);
                                        VideoPlayerActivity.this.handler.sendMessageDelayed(message, buttonData.appearanceDelay);
                                    }
                                    if (buttonData.inactivityTimeout > 0) {
                                        Message message2 = Message.obtain(VideoPlayerActivity.this.handler, 1, buttonData);
                                        VideoPlayerActivity.this.handler.sendMessageDelayed(message2, buttonData.inactivityTimeout + buttonData.appearanceDelay + buttonData.fadeDuration);
                                    }
                                    if (VideoPlayerActivity.this.showCountdownHud) {
                                        VideoPlayerActivity.this.showHud(true);
                                    }
                                    if (VideoPlayerActivity.this.handler != null) {
                                        VideoPlayerActivity.this.handler.sendMessageDelayed(Message.obtain(VideoPlayerActivity.this.handler, 2), 1000L);
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
            runOnUiThread(new Runnable() { // from class: com.millennialmedia.android.VideoPlayerActivity.14
                @Override // java.lang.Runnable
                public void run() {
                    MMAdViewSDK.Log.d("End Video.");
                    if (VideoPlayerActivity.this.mVideoView != null) {
                        VideoPlayerActivity.this.current = null;
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

    void enableButtons() {
        runOnUiThread(new Runnable() { // from class: com.millennialmedia.android.VideoPlayerActivity.15
            @Override // java.lang.Runnable
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

    @Override // com.millennialmedia.android.HttpRedirection.Listener
    public boolean shouldStartActivityForUri(Uri uri) {
        enableButtons();
        if (processVideoPlayerUri(uri)) {
            return false;
        }
        MMAdViewSDK.Log.d("Starting activity for %s", uri);
        return true;
    }

    @Override // com.millennialmedia.android.HttpRedirection.Listener
    public void didFailToResolveUri(Uri uri) {
        enableButtons();
    }

    /* JADX INFO: Access modifiers changed from: private */
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
            HttpRedirection.startActivityFromUri(this.activity, urlString, settings, this, null);
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
                this.mVideoView.setOnCompletionListener(new MediaPlayer.OnCompletionListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.16
                    @Override // android.media.MediaPlayer.OnCompletionListener
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
                this.mVideoView.setOnPreparedListener(new MediaPlayer.OnPreparedListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.17
                    @Override // android.media.MediaPlayer.OnPreparedListener
                    public void onPrepared(MediaPlayer mp) {
                        MMAdViewSDK.Log.d("Video Prepared");
                    }
                });
                this.mVideoView.setOnErrorListener(new MediaPlayer.OnErrorListener() { // from class: com.millennialmedia.android.VideoPlayerActivity.18
                    @Override // android.media.MediaPlayer.OnErrorListener
                    public boolean onError(MediaPlayer mp, int what, int extra) {
                        if (VideoPlayerActivity.this.videoAd != null) {
                            HttpGetRequest.log(VideoPlayerActivity.this.videoAd.videoError);
                            return false;
                        }
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

    /* loaded from: classes.dex */
    private class ScreenReceiver extends BroadcastReceiver {
        private ScreenReceiver() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            if (intent.getAction().equals("android.intent.action.SCREEN_OFF")) {
                MMAdViewSDK.Log.v("VideoPlayerActivity - Screen off");
                VideoPlayerActivity.this.waitForUserPresent = true;
            } else if (intent.getAction().equals("android.intent.action.SCREEN_ON")) {
                MMAdViewSDK.Log.v("VideoPlayerActivity - Screen on");
            } else if (intent.getAction().equals("android.intent.action.USER_PRESENT")) {
                MMAdViewSDK.Log.v("VideoPlayerActivity - Screen unlocked");
                VideoPlayerActivity.this.resumeVideo();
                VideoPlayerActivity.this.waitForUserPresent = false;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class VideoServer implements Runnable {
        private File cacheDir;
        boolean done = false;
        private final String fileName;
        Integer port;
        private ServerSocket serverSocket;

        public VideoServer(Context context, String fileName) {
            this.serverSocket = null;
            this.fileName = fileName;
            this.cacheDir = AdCache.getCacheDirectory(context);
            try {
                this.serverSocket = new ServerSocket();
                this.serverSocket.bind(null);
                this.serverSocket.setSoTimeout(0);
                this.port = new Integer(this.serverSocket.getLocalPort());
                MMAdViewSDK.Log.v("Video Server Port: %d", this.port);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

        /* JADX WARN: Removed duplicated region for block: B:86:0x01ba  */
        @Override // java.lang.Runnable
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public void run() {
            /*
                Method dump skipped, instructions count: 1332
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.VideoPlayerActivity.VideoServer.run():void");
        }

        public synchronized void requestStop() {
            this.done = true;
            MMAdViewSDK.Log.v("Requested video server stop. Done: " + this.done);
        }
    }
}
