package com.google.android.gms.cast;

import com.google.android.gms.internal.C1046dh;
import org.json.JSONException;
import org.json.JSONObject;

public final class MediaStatus {
    public static final long COMMAND_PAUSE = 1;
    public static final long COMMAND_SEEK = 2;
    public static final long COMMAND_SET_VOLUME = 4;
    public static final long COMMAND_SKIP_BACKWARD = 32;
    public static final long COMMAND_SKIP_FORWARD = 16;
    public static final long COMMAND_TOGGLE_MUTE = 8;
    public static final int IDLE_REASON_CANCELED = 2;
    public static final int IDLE_REASON_ERROR = 4;
    public static final int IDLE_REASON_FINISHED = 1;
    public static final int IDLE_REASON_INTERRUPTED = 3;
    public static final int IDLE_REASON_NONE = 0;
    public static final int PLAYER_STATE_BUFFERING = 4;
    public static final int PLAYER_STATE_IDLE = 1;
    public static final int PLAYER_STATE_PAUSED = 3;
    public static final int PLAYER_STATE_PLAYING = 2;
    public static final int PLAYER_STATE_UNKNOWN = 0;

    /* renamed from: kM */
    private JSONObject f1252kM;

    /* renamed from: kN */
    private MediaInfo f1253kN;

    /* renamed from: kV */
    private long f1254kV;

    /* renamed from: kW */
    private double f1255kW;

    /* renamed from: kX */
    private int f1256kX;

    /* renamed from: kY */
    private int f1257kY;

    /* renamed from: kZ */
    private long f1258kZ;

    /* renamed from: la */
    private long f1259la;

    /* renamed from: lb */
    private double f1260lb;

    /* renamed from: lc */
    private boolean f1261lc;

    public MediaStatus(JSONObject json) throws JSONException {
        mo5780a(json, 0);
    }

    /* renamed from: a */
    public int mo5780a(JSONObject jSONObject, int i) throws JSONException {
        int i2;
        int i3 = 2;
        long j = jSONObject.getLong("mediaSessionId");
        if (j != this.f1254kV) {
            this.f1254kV = j;
            i2 = 1;
        } else {
            i2 = 0;
        }
        if (jSONObject.has("playerState")) {
            String string = jSONObject.getString("playerState");
            int i4 = string.equals("IDLE") ? 1 : string.equals("PLAYING") ? 2 : string.equals("PAUSED") ? 3 : string.equals("BUFFERING") ? 4 : 0;
            if (i4 != this.f1256kX) {
                this.f1256kX = i4;
                i2 |= 2;
            }
            if (i4 == 1 && jSONObject.has("idleReason")) {
                String string2 = jSONObject.getString("idleReason");
                if (!string2.equals("CANCELLED")) {
                    i3 = string2.equals("INTERRUPTED") ? 3 : string2.equals("FINISHED") ? 1 : string2.equals("ERROR") ? 4 : 0;
                }
                if (i3 != this.f1257kY) {
                    this.f1257kY = i3;
                    i2 |= 2;
                }
            }
        }
        if (jSONObject.has("playbackRate")) {
            double d = jSONObject.getDouble("playbackRate");
            if (this.f1255kW != d) {
                this.f1255kW = d;
                i2 |= 2;
            }
        }
        if (jSONObject.has("currentTime") && (i & 2) == 0) {
            long b = C1046dh.m2370b(jSONObject.getDouble("currentTime"));
            if (b != this.f1258kZ) {
                this.f1258kZ = b;
                i2 |= 2;
            }
        }
        if (jSONObject.has("supportedMediaCommands")) {
            long j2 = jSONObject.getLong("supportedMediaCommands");
            if (j2 != this.f1259la) {
                this.f1259la = j2;
                i2 |= 2;
            }
        }
        if (jSONObject.has("volume") && (i & 1) == 0) {
            JSONObject jSONObject2 = jSONObject.getJSONObject("volume");
            double d2 = jSONObject2.getDouble("level");
            if (d2 != this.f1260lb) {
                this.f1260lb = d2;
                i2 |= 2;
            }
            boolean z = jSONObject2.getBoolean("muted");
            if (z != this.f1261lc) {
                this.f1261lc = z;
                i2 |= 2;
            }
        }
        if (jSONObject.has("customData")) {
            this.f1252kM = jSONObject.getJSONObject("customData");
            i2 |= 2;
        }
        if (!jSONObject.has("media")) {
            return i2;
        }
        JSONObject jSONObject3 = jSONObject.getJSONObject("media");
        this.f1253kN = new MediaInfo(jSONObject3);
        int i5 = i2 | 2;
        return jSONObject3.has("metadata") ? i5 | 4 : i5;
    }

    /* renamed from: aQ */
    public long mo5781aQ() {
        return this.f1254kV;
    }

    public JSONObject getCustomData() {
        return this.f1252kM;
    }

    public int getIdleReason() {
        return this.f1257kY;
    }

    public MediaInfo getMediaInfo() {
        return this.f1253kN;
    }

    public double getPlaybackRate() {
        return this.f1255kW;
    }

    public int getPlayerState() {
        return this.f1256kX;
    }

    public long getStreamPosition() {
        return this.f1258kZ;
    }

    public double getStreamVolume() {
        return this.f1260lb;
    }

    public boolean isMediaCommandSupported(long mediaCommand) {
        return (this.f1259la & mediaCommand) != 0;
    }

    public boolean isMute() {
        return this.f1261lc;
    }
}
