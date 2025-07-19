package com.google.android.gms.internal;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import com.facebook.internal.ServerProtocol;
import com.google.android.gms.cast.MediaInfo;
import com.google.android.gms.cast.MediaStatus;
import java.io.IOException;
import java.util.concurrent.TimeUnit;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/* renamed from: com.google.android.gms.internal.dl */
public class C1053dl extends C1039df {

    /* renamed from: me */
    private static final long f2515me = TimeUnit.SECONDS.toMillis(3);

    /* renamed from: mf */
    private static final long f2516mf = TimeUnit.HOURS.toMillis(24);

    /* renamed from: mg */
    private static final long f2517mg = TimeUnit.SECONDS.toMillis(5);

    /* renamed from: mh */
    private static final long f2518mh = TimeUnit.SECONDS.toMillis(1);
    private final Handler mHandler = new Handler(Looper.getMainLooper());

    /* renamed from: mi */
    private long f2519mi;

    /* renamed from: mj */
    private MediaStatus f2520mj;
    /* access modifiers changed from: private */

    /* renamed from: mk */
    public final C1058do f2521mk = new C1058do(f2516mf);
    /* access modifiers changed from: private */

    /* renamed from: ml */
    public final C1058do f2522ml = new C1058do(f2517mg);
    /* access modifiers changed from: private */

    /* renamed from: mm */
    public final C1058do f2523mm = new C1058do(f2515me);
    /* access modifiers changed from: private */

    /* renamed from: mn */
    public final C1058do f2524mn = new C1058do(f2515me);
    /* access modifiers changed from: private */

    /* renamed from: mo */
    public final C1058do f2525mo = new C1058do(f2515me);

    /* renamed from: mp */
    private final Runnable f2526mp = new C1055a();
    /* access modifiers changed from: private */

    /* renamed from: mq */
    public boolean f2527mq;

    /* renamed from: com.google.android.gms.internal.dl$a */
    private class C1055a implements Runnable {
        private C1055a() {
        }

        public void run() {
            boolean z = false;
            boolean unused = C1053dl.this.f2527mq = false;
            long elapsedRealtime = SystemClock.elapsedRealtime();
            C1053dl.this.f2521mk.mo7402d(elapsedRealtime, 3);
            C1053dl.this.f2522ml.mo7402d(elapsedRealtime, 3);
            C1053dl.this.f2523mm.mo7402d(elapsedRealtime, 3);
            C1053dl.this.f2524mn.mo7402d(elapsedRealtime, 3);
            C1053dl.this.f2525mo.mo7402d(elapsedRealtime, 3);
            synchronized (C1058do.f2530mw) {
                if (C1053dl.this.f2521mk.mo7399bf() || C1053dl.this.f2522ml.mo7399bf() || C1053dl.this.f2523mm.mo7399bf() || C1053dl.this.f2524mn.mo7399bf() || C1053dl.this.f2525mo.mo7399bf()) {
                    z = true;
                }
            }
            C1053dl.this.m2419o(z);
        }
    }

    public C1053dl() {
        super("urn:x-cast:com.google.cast.media", "MediaControlChannel");
        m2415bd();
    }

    /* renamed from: a */
    private void m2411a(long j, JSONObject jSONObject) throws JSONException {
        int i;
        boolean z = true;
        boolean i2 = this.f2521mk.mo7403i(j);
        boolean z2 = this.f2522ml.mo7399bf() && !this.f2522ml.mo7403i(j);
        if ((!this.f2523mm.mo7399bf() || this.f2523mm.mo7403i(j)) && (!this.f2524mn.mo7399bf() || this.f2524mn.mo7403i(j))) {
            z = false;
        }
        int i3 = z2 ? 2 : 0;
        if (z) {
            i3 |= 1;
        }
        if (i2 || this.f2520mj == null) {
            this.f2520mj = new MediaStatus(jSONObject);
            this.f2519mi = SystemClock.elapsedRealtime();
            i = 7;
        } else {
            i = this.f2520mj.mo5780a(jSONObject, i3);
        }
        if ((i & 1) != 0) {
            this.f2519mi = SystemClock.elapsedRealtime();
            onStatusUpdated();
        }
        if ((i & 2) != 0) {
            this.f2519mi = SystemClock.elapsedRealtime();
            onStatusUpdated();
        }
        if ((i & 4) != 0) {
            onMetadataUpdated();
        }
        this.f2521mk.mo7400c(j, 0);
        this.f2522ml.mo7400c(j, 0);
        this.f2523mm.mo7400c(j, 0);
        this.f2524mn.mo7400c(j, 0);
        this.f2525mo.mo7400c(j, 0);
    }

    /* renamed from: bd */
    private void m2415bd() {
        m2419o(false);
        this.f2519mi = 0;
        this.f2520mj = null;
        this.f2521mk.clear();
        this.f2522ml.clear();
        this.f2523mm.clear();
    }

    /* access modifiers changed from: private */
    /* renamed from: o */
    public void m2419o(boolean z) {
        if (this.f2527mq != z) {
            this.f2527mq = z;
            if (z) {
                this.mHandler.postDelayed(this.f2526mp, f2518mh);
            } else {
                this.mHandler.removeCallbacks(this.f2526mp);
            }
        }
    }

    /* renamed from: B */
    public final void mo7327B(String str) {
        this.f2472lx.mo7380b("message received: %s", str);
        try {
            JSONObject jSONObject = new JSONObject(str);
            String string = jSONObject.getString(ServerProtocol.DIALOG_PARAM_TYPE);
            long optLong = jSONObject.optLong("requestId", -1);
            if (string.equals("MEDIA_STATUS")) {
                JSONArray jSONArray = jSONObject.getJSONArray("status");
                if (jSONArray.length() > 0) {
                    m2411a(optLong, jSONArray.getJSONObject(0));
                    return;
                }
                this.f2520mj = null;
                onStatusUpdated();
                onMetadataUpdated();
                this.f2525mo.mo7400c(optLong, 0);
            } else if (string.equals("INVALID_PLAYER_STATE")) {
                this.f2472lx.mo7382d("received unexpected error: Invalid Player State.", new Object[0]);
                JSONObject optJSONObject = jSONObject.optJSONObject("customData");
                this.f2521mk.mo7398b(optLong, 1, optJSONObject);
                this.f2522ml.mo7398b(optLong, 1, optJSONObject);
                this.f2523mm.mo7398b(optLong, 1, optJSONObject);
                this.f2524mn.mo7398b(optLong, 1, optJSONObject);
                this.f2525mo.mo7398b(optLong, 1, optJSONObject);
            } else if (string.equals("LOAD_FAILED")) {
                this.f2521mk.mo7398b(optLong, 1, jSONObject.optJSONObject("customData"));
            } else if (string.equals("LOAD_CANCELLED")) {
                this.f2521mk.mo7398b(optLong, 2, jSONObject.optJSONObject("customData"));
            } else if (string.equals("INVALID_REQUEST")) {
                this.f2472lx.mo7382d("received unexpected error: Invalid Request.", new Object[0]);
                JSONObject optJSONObject2 = jSONObject.optJSONObject("customData");
                this.f2521mk.mo7398b(optLong, 1, optJSONObject2);
                this.f2522ml.mo7398b(optLong, 1, optJSONObject2);
                this.f2523mm.mo7398b(optLong, 1, optJSONObject2);
                this.f2524mn.mo7398b(optLong, 1, optJSONObject2);
                this.f2525mo.mo7398b(optLong, 1, optJSONObject2);
            }
        } catch (JSONException e) {
            this.f2472lx.mo7382d("Message is malformed (%s); ignoring: %s", e.getMessage(), str);
        }
    }

    /* renamed from: a */
    public long mo7383a(C1057dn dnVar) throws IOException {
        JSONObject jSONObject = new JSONObject();
        long aS = mo7331aS();
        this.f2525mo.mo7397a(aS, dnVar);
        m2419o(true);
        try {
            jSONObject.put("requestId", aS);
            jSONObject.put(ServerProtocol.DIALOG_PARAM_TYPE, "GET_STATUS");
            if (this.f2520mj != null) {
                jSONObject.put("mediaSessionId", this.f2520mj.mo5781aQ());
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject.toString(), aS, (String) null);
        return aS;
    }

    /* renamed from: a */
    public long mo7384a(C1057dn dnVar, double d, JSONObject jSONObject) throws IOException, IllegalStateException, IllegalArgumentException {
        if (Double.isInfinite(d) || Double.isNaN(d)) {
            throw new IllegalArgumentException("Volume cannot be " + d);
        }
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        this.f2523mm.mo7397a(aS, dnVar);
        m2419o(true);
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "SET_VOLUME");
            jSONObject2.put("mediaSessionId", mo7388aQ());
            JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put("level", d);
            jSONObject2.put("volume", jSONObject3);
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
        return aS;
    }

    /* renamed from: a */
    public long mo7385a(C1057dn dnVar, long j, int i, JSONObject jSONObject) throws IOException, IllegalStateException {
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        this.f2522ml.mo7397a(aS, dnVar);
        m2419o(true);
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "SEEK");
            jSONObject2.put("mediaSessionId", mo7388aQ());
            jSONObject2.put("currentTime", C1046dh.m2371h(j));
            if (i == 1) {
                jSONObject2.put("resumeState", "PLAYBACK_START");
            } else if (i == 2) {
                jSONObject2.put("resumeState", "PLAYBACK_PAUSE");
            }
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
        return aS;
    }

    /* renamed from: a */
    public long mo7386a(C1057dn dnVar, MediaInfo mediaInfo, boolean z, long j, JSONObject jSONObject) throws IOException {
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        this.f2521mk.mo7397a(aS, dnVar);
        m2419o(true);
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "LOAD");
            jSONObject2.put("media", mediaInfo.mo5737aP());
            jSONObject2.put("autoplay", z);
            jSONObject2.put("currentTime", C1046dh.m2371h(j));
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
        return aS;
    }

    /* renamed from: a */
    public long mo7387a(C1057dn dnVar, boolean z, JSONObject jSONObject) throws IOException, IllegalStateException {
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        this.f2524mn.mo7397a(aS, dnVar);
        m2419o(true);
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "SET_VOLUME");
            jSONObject2.put("mediaSessionId", mo7388aQ());
            JSONObject jSONObject3 = new JSONObject();
            jSONObject3.put("muted", z);
            jSONObject2.put("volume", jSONObject3);
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
        return aS;
    }

    /* renamed from: a */
    public void mo7328a(long j, int i) {
        this.f2521mk.mo7400c(j, i);
        this.f2522ml.mo7400c(j, i);
        this.f2523mm.mo7400c(j, i);
        this.f2524mn.mo7400c(j, i);
        this.f2525mo.mo7400c(j, i);
    }

    /* renamed from: aQ */
    public long mo7388aQ() throws IllegalStateException {
        if (this.f2520mj != null) {
            return this.f2520mj.mo5781aQ();
        }
        throw new IllegalStateException("No current media session");
    }

    /* renamed from: aT */
    public void mo7332aT() {
        m2415bd();
    }

    /* renamed from: c */
    public void mo7389c(JSONObject jSONObject) throws IOException {
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "PAUSE");
            jSONObject2.put("mediaSessionId", mo7388aQ());
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
    }

    /* renamed from: d */
    public void mo7390d(JSONObject jSONObject) throws IOException {
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "STOP");
            jSONObject2.put("mediaSessionId", mo7388aQ());
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
    }

    /* renamed from: e */
    public void mo7391e(JSONObject jSONObject) throws IOException, IllegalStateException {
        JSONObject jSONObject2 = new JSONObject();
        long aS = mo7331aS();
        try {
            jSONObject2.put("requestId", aS);
            jSONObject2.put(ServerProtocol.DIALOG_PARAM_TYPE, "PLAY");
            jSONObject2.put("mediaSessionId", mo7388aQ());
            if (jSONObject != null) {
                jSONObject2.put("customData", jSONObject);
            }
        } catch (JSONException e) {
        }
        mo7330a(jSONObject2.toString(), aS, (String) null);
    }

    public long getApproximateStreamPosition() {
        MediaInfo mediaInfo = getMediaInfo();
        if (mediaInfo == null || this.f2519mi == 0) {
            return 0;
        }
        double playbackRate = this.f2520mj.getPlaybackRate();
        long streamPosition = this.f2520mj.getStreamPosition();
        int playerState = this.f2520mj.getPlayerState();
        if (playbackRate == 0.0d || playerState != 2) {
            return streamPosition;
        }
        long elapsedRealtime = SystemClock.elapsedRealtime() - this.f2519mi;
        long j = elapsedRealtime < 0 ? 0 : elapsedRealtime;
        if (j == 0) {
            return streamPosition;
        }
        long streamDuration = mediaInfo.getStreamDuration();
        long j2 = streamPosition + ((long) (((double) j) * playbackRate));
        if (j2 <= streamDuration) {
            streamDuration = j2 < 0 ? 0 : j2;
        }
        return streamDuration;
    }

    public MediaInfo getMediaInfo() {
        if (this.f2520mj == null) {
            return null;
        }
        return this.f2520mj.getMediaInfo();
    }

    public MediaStatus getMediaStatus() {
        return this.f2520mj;
    }

    public long getStreamDuration() {
        MediaInfo mediaInfo = getMediaInfo();
        if (mediaInfo != null) {
            return mediaInfo.getStreamDuration();
        }
        return 0;
    }

    /* access modifiers changed from: protected */
    public void onMetadataUpdated() {
    }

    /* access modifiers changed from: protected */
    public void onStatusUpdated() {
    }
}
