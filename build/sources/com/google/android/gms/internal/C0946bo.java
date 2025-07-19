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

/* renamed from: com.google.android.gms.internal.bo */
public final class C0946bo extends FrameLayout implements MediaPlayer.OnCompletionListener, MediaPlayer.OnErrorListener, MediaPlayer.OnPreparedListener {

    /* renamed from: gQ */
    private final MediaController f2265gQ;

    /* renamed from: gR */
    private final C0947a f2266gR = new C0947a(this);

    /* renamed from: gS */
    private final VideoView f2267gS;

    /* renamed from: gT */
    private long f2268gT;

    /* renamed from: gU */
    private String f2269gU;

    /* renamed from: gv */
    private final C1007cw f2270gv;

    /* renamed from: com.google.android.gms.internal.bo$a */
    private static final class C0947a {

        /* renamed from: ep */
        private final Runnable f2271ep;
        /* access modifiers changed from: private */

        /* renamed from: gV */
        public volatile boolean f2272gV = false;

        public C0947a(final C0946bo boVar) {
            this.f2271ep = new Runnable() {

                /* renamed from: gW */
                private final WeakReference<C0946bo> f2273gW = new WeakReference<>(boVar);

                public void run() {
                    C0946bo boVar = (C0946bo) this.f2273gW.get();
                    if (!C0947a.this.f2272gV && boVar != null) {
                        boVar.mo7162ag();
                        C0947a.this.mo7173ah();
                    }
                }
            };
        }

        /* renamed from: ah */
        public void mo7173ah() {
            C1003cs.f2412iI.postDelayed(this.f2271ep, 250);
        }

        public void cancel() {
            this.f2272gV = true;
            C1003cs.f2412iI.removeCallbacks(this.f2271ep);
        }
    }

    public C0946bo(Context context, C1007cw cwVar) {
        super(context);
        this.f2270gv = cwVar;
        this.f2267gS = new VideoView(context);
        addView(this.f2267gS, new FrameLayout.LayoutParams(-1, -1, 17));
        this.f2265gQ = new MediaController(context);
        this.f2266gR.mo7173ah();
        this.f2267gS.setOnCompletionListener(this);
        this.f2267gS.setOnPreparedListener(this);
        this.f2267gS.setOnErrorListener(this);
    }

    /* renamed from: a */
    private static void m2060a(C1007cw cwVar, String str) {
        m2063a(cwVar, str, (Map<String, String>) new HashMap(1));
    }

    /* renamed from: a */
    public static void m2061a(C1007cw cwVar, String str, String str2) {
        boolean z = str2 == null;
        HashMap hashMap = new HashMap(z ? 2 : 3);
        hashMap.put("what", str);
        if (!z) {
            hashMap.put("extra", str2);
        }
        m2063a(cwVar, GCMConstants.EXTRA_ERROR, (Map<String, String>) hashMap);
    }

    /* renamed from: a */
    private static void m2062a(C1007cw cwVar, String str, String str2, String str3) {
        HashMap hashMap = new HashMap(2);
        hashMap.put(str2, str3);
        m2063a(cwVar, str, (Map<String, String>) hashMap);
    }

    /* renamed from: a */
    private static void m2063a(C1007cw cwVar, String str, Map<String, String> map) {
        map.put(HitTypes.EVENT, str);
        cwVar.mo7237a("onVideoEvent", (Map<String, ?>) map);
    }

    /* renamed from: af */
    public void mo7161af() {
        if (!TextUtils.isEmpty(this.f2269gU)) {
            this.f2267gS.setVideoPath(this.f2269gU);
        } else {
            m2061a(this.f2270gv, "no_src", (String) null);
        }
    }

    /* renamed from: ag */
    public void mo7162ag() {
        long currentPosition = (long) this.f2267gS.getCurrentPosition();
        if (this.f2268gT != currentPosition) {
            m2062a(this.f2270gv, "timeupdate", "time", String.valueOf(((float) currentPosition) / 1000.0f));
            this.f2268gT = currentPosition;
        }
    }

    /* renamed from: b */
    public void mo7163b(MotionEvent motionEvent) {
        this.f2267gS.dispatchTouchEvent(motionEvent);
    }

    public void destroy() {
        this.f2266gR.cancel();
        this.f2267gS.stopPlayback();
    }

    /* renamed from: i */
    public void mo7165i(boolean z) {
        if (z) {
            this.f2267gS.setMediaController(this.f2265gQ);
            return;
        }
        this.f2265gQ.hide();
        this.f2267gS.setMediaController((MediaController) null);
    }

    /* renamed from: n */
    public void mo7166n(String str) {
        this.f2269gU = str;
    }

    public void onCompletion(MediaPlayer mediaPlayer) {
        m2060a(this.f2270gv, "ended");
    }

    public boolean onError(MediaPlayer mediaPlayer, int what, int extra) {
        m2061a(this.f2270gv, String.valueOf(what), String.valueOf(extra));
        return true;
    }

    public void onPrepared(MediaPlayer mediaPlayer) {
        m2062a(this.f2270gv, "canplaythrough", "duration", String.valueOf(((float) this.f2267gS.getDuration()) / 1000.0f));
    }

    public void pause() {
        this.f2267gS.pause();
    }

    public void play() {
        this.f2267gS.start();
    }

    public void seekTo(int timeInMilliseconds) {
        this.f2267gS.seekTo(timeInMilliseconds);
    }
}
