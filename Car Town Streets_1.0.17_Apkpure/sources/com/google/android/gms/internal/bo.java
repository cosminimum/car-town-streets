package com.google.android.gms.internal;

import android.content.Context;
import android.media.MediaPlayer;
import android.text.TextUtils;
import android.view.MotionEvent;
import android.widget.FrameLayout;
import android.widget.MediaController;
import android.widget.VideoView;
import com.google.analytics.tracking.android.HitTypes;
import com.google.android.gcm.GCMConstants;
import java.lang.ref.WeakReference;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public final class bo extends FrameLayout implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener {
    private final MediaController gQ;
    private final a gR = new a(this);
    private final VideoView gS;
    private long gT;
    private String gU;
    private final cw gv;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class a {
        private final Runnable ep;
        private volatile boolean gV = false;

        public a(final bo boVar) {
            this.ep = new Runnable() { // from class: com.google.android.gms.internal.bo.a.1
                private final WeakReference<bo> gW;

                {
                    this.gW = new WeakReference<>(boVar);
                }

                @Override // java.lang.Runnable
                public void run() {
                    bo boVar2 = this.gW.get();
                    if (a.this.gV || boVar2 == null) {
                        return;
                    }
                    boVar2.ag();
                    a.this.ah();
                }
            };
        }

        public void ah() {
            cs.iI.postDelayed(this.ep, 250L);
        }

        public void cancel() {
            this.gV = true;
            cs.iI.removeCallbacks(this.ep);
        }
    }

    public bo(Context context, cw cwVar) {
        super(context);
        this.gv = cwVar;
        this.gS = new VideoView(context);
        addView(this.gS, new FrameLayout.LayoutParams(-1, -1, 17));
        this.gQ = new MediaController(context);
        this.gR.ah();
        this.gS.setOnCompletionListener(this);
        this.gS.setOnPreparedListener(this);
        this.gS.setOnErrorListener(this);
    }

    private static void a(cw cwVar, String str) {
        a(cwVar, str, new HashMap(1));
    }

    public static void a(cw cwVar, String str, String str2) {
        boolean z = str2 == null;
        HashMap hashMap = new HashMap(z ? 2 : 3);
        hashMap.put("what", str);
        if (!z) {
            hashMap.put("extra", str2);
        }
        a(cwVar, GCMConstants.EXTRA_ERROR, hashMap);
    }

    private static void a(cw cwVar, String str, String str2, String str3) {
        HashMap hashMap = new HashMap(2);
        hashMap.put(str2, str3);
        a(cwVar, str, hashMap);
    }

    private static void a(cw cwVar, String str, Map<String, String> map) {
        map.put(HitTypes.EVENT, str);
        cwVar.a("onVideoEvent", map);
    }

    public void af() {
        if (!TextUtils.isEmpty(this.gU)) {
            this.gS.setVideoPath(this.gU);
        } else {
            a(this.gv, "no_src", (String) null);
        }
    }

    public void ag() {
        long currentPosition = this.gS.getCurrentPosition();
        if (this.gT != currentPosition) {
            a(this.gv, "timeupdate", "time", String.valueOf(((float) currentPosition) / 1000.0f));
            this.gT = currentPosition;
        }
    }

    public void b(MotionEvent motionEvent) {
        this.gS.dispatchTouchEvent(motionEvent);
    }

    public void destroy() {
        this.gR.cancel();
        this.gS.stopPlayback();
    }

    public void i(boolean z) {
        if (z) {
            this.gS.setMediaController(this.gQ);
            return;
        }
        this.gQ.hide();
        this.gS.setMediaController(null);
    }

    public void n(String str) {
        this.gU = str;
    }

    @Override // android.media.MediaPlayer.OnCompletionListener
    public void onCompletion(MediaPlayer mediaPlayer) {
        a(this.gv, "ended");
    }

    @Override // android.media.MediaPlayer.OnErrorListener
    public boolean onError(MediaPlayer mediaPlayer, int what, int extra) {
        a(this.gv, String.valueOf(what), String.valueOf(extra));
        return true;
    }

    @Override // android.media.MediaPlayer.OnPreparedListener
    public void onPrepared(MediaPlayer mediaPlayer) {
        a(this.gv, "canplaythrough", "duration", String.valueOf(this.gS.getDuration() / 1000.0f));
    }

    public void pause() {
        this.gS.pause();
    }

    public void play() {
        this.gS.start();
    }

    public void seekTo(int timeInMilliseconds) {
        this.gS.seekTo(timeInMilliseconds);
    }
}
