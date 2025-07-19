package com.google.ads.internal;

import android.app.Activity;
import android.media.MediaPlayer;
import android.os.Handler;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import android.widget.MediaController;
import android.widget.VideoView;
import com.google.ads.util.C0508b;
import java.lang.ref.WeakReference;

public class AdVideoView extends FrameLayout implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener {

    /* renamed from: b */
    private static final C0462a f826b = C0462a.f841a.mo3651b();

    /* renamed from: a */
    public MediaController f827a = null;

    /* renamed from: c */
    private WeakReference<Activity> f828c;

    /* renamed from: d */
    private AdWebView f829d;

    /* renamed from: e */
    private long f830e = 0;

    /* renamed from: f */
    private VideoView f831f;

    /* renamed from: g */
    private String f832g = null;

    /* renamed from: com.google.ads.internal.AdVideoView$a */
    private static class C0460a implements Runnable {

        /* renamed from: a */
        private WeakReference<AdVideoView> f833a;

        /* renamed from: b */
        private Handler f834b = new Handler();

        public C0460a(AdVideoView adVideoView) {
            this.f833a = new WeakReference<>(adVideoView);
        }

        public void run() {
            AdVideoView adVideoView = (AdVideoView) this.f833a.get();
            if (adVideoView == null) {
                C0508b.m1034d("The video must be gone, so cancelling the timeupdate task.");
                return;
            }
            adVideoView.mo3616f();
            this.f834b.postDelayed(this, 250);
        }

        /* renamed from: a */
        public void mo3622a() {
            this.f834b.postDelayed(this, 250);
        }
    }

    public AdVideoView(Activity adActivity, AdWebView adWebView) {
        super(adActivity);
        this.f828c = new WeakReference<>(adActivity);
        this.f829d = adWebView;
        this.f831f = new VideoView(adActivity);
        addView(this.f831f, new FrameLayout.LayoutParams(-1, -1, 17));
        mo3609a();
        this.f831f.setOnCompletionListener(this);
        this.f831f.setOnPreparedListener(this);
        this.f831f.setOnErrorListener(this);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo3609a() {
        new C0460a(this).mo3622a();
    }

    /* renamed from: b */
    public void mo3612b() {
        if (!TextUtils.isEmpty(this.f832g)) {
            this.f831f.setVideoPath(this.f832g);
        } else {
            f826b.mo3643a(this.f829d, "onVideoEvent", "{'event': 'error', 'what': 'no_src'}");
        }
    }

    public void setMediaControllerEnabled(boolean enabled) {
        Activity activity = (Activity) this.f828c.get();
        if (activity == null) {
            C0508b.m1036e("adActivity was null while trying to enable controls on a video.");
        } else if (enabled) {
            if (this.f827a == null) {
                this.f827a = new MediaController(activity);
            }
            this.f831f.setMediaController(this.f827a);
        } else {
            if (this.f827a != null) {
                this.f827a.hide();
            }
            this.f831f.setMediaController((MediaController) null);
        }
    }

    public void setSrc(String src) {
        this.f832g = src;
    }

    public void onCompletion(MediaPlayer mp) {
        f826b.mo3643a(this.f829d, "onVideoEvent", "{'event': 'ended'}");
    }

    public boolean onError(MediaPlayer mp, int what, int extra) {
        C0508b.m1036e("Video threw error! <what:" + what + ", extra:" + extra + ">");
        f826b.mo3643a(this.f829d, "onVideoEvent", "{'event': 'error', 'what': '" + what + "', 'extra': '" + extra + "'}");
        return true;
    }

    public void onPrepared(MediaPlayer mp) {
        f826b.mo3643a(this.f829d, "onVideoEvent", "{'event': 'canplaythrough', 'duration': '" + (((float) this.f831f.getDuration()) / 1000.0f) + "'}");
    }

    /* renamed from: c */
    public void mo3613c() {
        this.f831f.pause();
    }

    /* renamed from: d */
    public void mo3614d() {
        this.f831f.start();
    }

    /* renamed from: a */
    public void mo3610a(int i) {
        this.f831f.seekTo(i);
    }

    /* renamed from: a */
    public void mo3611a(MotionEvent motionEvent) {
        this.f831f.onTouchEvent(motionEvent);
    }

    /* renamed from: e */
    public void mo3615e() {
        this.f831f.stopPlayback();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: f */
    public void mo3616f() {
        long currentPosition = (long) this.f831f.getCurrentPosition();
        if (this.f830e != currentPosition) {
            f826b.mo3643a(this.f829d, "onVideoEvent", "{'event': 'timeupdate', 'time': " + (((float) currentPosition) / 1000.0f) + "}");
            this.f830e = currentPosition;
        }
    }
}
