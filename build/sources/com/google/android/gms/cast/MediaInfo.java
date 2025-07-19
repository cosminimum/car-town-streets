package com.google.android.gms.cast;

import android.text.TextUtils;
import com.google.android.gms.internal.C1046dh;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1133fe;
import org.json.JSONException;
import org.json.JSONObject;

public final class MediaInfo {
    public static final int STREAM_TYPE_BUFFERED = 1;
    public static final int STREAM_TYPE_INVALID = -1;
    public static final int STREAM_TYPE_LIVE = 2;
    public static final int STREAM_TYPE_NONE = 0;

    /* renamed from: kH */
    private final String f1237kH;

    /* renamed from: kI */
    private int f1238kI;

    /* renamed from: kJ */
    private String f1239kJ;

    /* renamed from: kK */
    private MediaMetadata f1240kK;

    /* renamed from: kL */
    private long f1241kL;

    /* renamed from: kM */
    private JSONObject f1242kM;

    public static class Builder {

        /* renamed from: kN */
        private final MediaInfo f1243kN;

        public Builder(String contentId) throws IllegalArgumentException {
            if (TextUtils.isEmpty(contentId)) {
                throw new IllegalArgumentException("Content ID cannot be empty");
            }
            this.f1243kN = new MediaInfo(contentId);
        }

        public MediaInfo build() throws IllegalArgumentException {
            this.f1243kN.mo5736aO();
            return this.f1243kN;
        }

        public Builder setContentType(String contentType) throws IllegalArgumentException {
            this.f1243kN.setContentType(contentType);
            return this;
        }

        public Builder setCustomData(JSONObject customData) {
            this.f1243kN.mo5735a(customData);
            return this;
        }

        public Builder setMetadata(MediaMetadata metadata) {
            this.f1243kN.mo5734a(metadata);
            return this;
        }

        public Builder setStreamDuration(long duration) throws IllegalArgumentException {
            this.f1243kN.mo5739f(duration);
            return this;
        }

        public Builder setStreamType(int streamType) throws IllegalArgumentException {
            this.f1243kN.setStreamType(streamType);
            return this;
        }
    }

    MediaInfo(String contentId) throws IllegalArgumentException {
        if (TextUtils.isEmpty(contentId)) {
            throw new IllegalArgumentException("content ID cannot be null or empty");
        }
        this.f1237kH = contentId;
        this.f1238kI = -1;
    }

    MediaInfo(JSONObject json) throws JSONException {
        this.f1237kH = json.getString("contentId");
        String string = json.getString("streamType");
        if ("NONE".equals(string)) {
            this.f1238kI = 0;
        } else if ("BUFFERED".equals(string)) {
            this.f1238kI = 1;
        } else if ("LIVE".equals(string)) {
            this.f1238kI = 2;
        } else {
            this.f1238kI = -1;
        }
        this.f1239kJ = json.getString("contentType");
        if (json.has("metadata")) {
            JSONObject jSONObject = json.getJSONObject("metadata");
            this.f1240kK = new MediaMetadata(jSONObject.getInt("metadataType"));
            this.f1240kK.mo5757b(jSONObject);
        }
        this.f1241kL = C1046dh.m2370b(json.optDouble("duration", 0.0d));
        this.f1242kM = json.optJSONObject("customData");
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public void mo5734a(MediaMetadata mediaMetadata) {
        this.f1240kK = mediaMetadata;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public void mo5735a(JSONObject jSONObject) {
        this.f1242kM = jSONObject;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: aO */
    public void mo5736aO() throws IllegalArgumentException {
        if (TextUtils.isEmpty(this.f1237kH)) {
            throw new IllegalArgumentException("content ID cannot be null or empty");
        } else if (TextUtils.isEmpty(this.f1239kJ)) {
            throw new IllegalArgumentException("content type cannot be null or empty");
        } else if (this.f1238kI == -1) {
            throw new IllegalArgumentException("a valid stream type must be specified");
        }
    }

    /* renamed from: aP */
    public JSONObject mo5737aP() {
        String str;
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("contentId", this.f1237kH);
            switch (this.f1238kI) {
                case 1:
                    str = "BUFFERED";
                    break;
                case 2:
                    str = "LIVE";
                    break;
                default:
                    str = "NONE";
                    break;
            }
            jSONObject.put("streamType", str);
            if (this.f1239kJ != null) {
                jSONObject.put("contentType", this.f1239kJ);
            }
            if (this.f1240kK != null) {
                jSONObject.put("metadata", this.f1240kK.mo5755aP());
            }
            jSONObject.put("duration", C1046dh.m2371h(this.f1241kL));
            if (this.f1242kM != null) {
                jSONObject.put("customData", this.f1242kM);
            }
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    public boolean equals(Object other) {
        boolean z = true;
        if (this == other) {
            return true;
        }
        if (!(other instanceof MediaInfo)) {
            return false;
        }
        MediaInfo mediaInfo = (MediaInfo) other;
        if ((this.f1242kM == null) != (mediaInfo.f1242kM == null)) {
            return false;
        }
        if (this.f1242kM != null && mediaInfo.f1242kM != null && !C1133fe.m2762d(this.f1242kM, mediaInfo.f1242kM)) {
            return false;
        }
        if (!C1046dh.m2369a(this.f1237kH, mediaInfo.f1237kH) || this.f1238kI != mediaInfo.f1238kI || !C1046dh.m2369a(this.f1239kJ, mediaInfo.f1239kJ) || !C1046dh.m2369a(this.f1240kK, mediaInfo.f1240kK) || this.f1241kL != mediaInfo.f1241kL) {
            z = false;
        }
        return z;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: f */
    public void mo5739f(long j) throws IllegalArgumentException {
        if (j < 0) {
            throw new IllegalArgumentException("Stream duration cannot be negative");
        }
        this.f1241kL = j;
    }

    public String getContentId() {
        return this.f1237kH;
    }

    public String getContentType() {
        return this.f1239kJ;
    }

    public JSONObject getCustomData() {
        return this.f1242kM;
    }

    public MediaMetadata getMetadata() {
        return this.f1240kK;
    }

    public long getStreamDuration() {
        return this.f1241kL;
    }

    public int getStreamType() {
        return this.f1238kI;
    }

    public int hashCode() {
        return C1098ee.hashCode(this.f1237kH, Integer.valueOf(this.f1238kI), this.f1239kJ, this.f1240kK, Long.valueOf(this.f1241kL), String.valueOf(this.f1242kM));
    }

    /* access modifiers changed from: package-private */
    public void setContentType(String contentType) throws IllegalArgumentException {
        if (TextUtils.isEmpty(contentType)) {
            throw new IllegalArgumentException("content type cannot be null or empty");
        }
        this.f1239kJ = contentType;
    }

    /* access modifiers changed from: package-private */
    public void setStreamType(int streamType) throws IllegalArgumentException {
        if (streamType < -1 || streamType > 2) {
            throw new IllegalArgumentException("invalid stream type");
        }
        this.f1238kI = streamType;
    }
}
