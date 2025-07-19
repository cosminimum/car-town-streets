package com.google.android.gms.ads.search;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.internal.C0864af;

public final class SearchAdRequest {
    public static final int BORDER_TYPE_DASHED = 1;
    public static final int BORDER_TYPE_DOTTED = 2;
    public static final int BORDER_TYPE_NONE = 0;
    public static final int BORDER_TYPE_SOLID = 3;
    public static final int CALL_BUTTON_COLOR_DARK = 2;
    public static final int CALL_BUTTON_COLOR_LIGHT = 0;
    public static final int CALL_BUTTON_COLOR_MEDIUM = 1;
    public static final String DEVICE_ID_EMULATOR = C0864af.DEVICE_ID_EMULATOR;
    public static final int ERROR_CODE_INTERNAL_ERROR = 0;
    public static final int ERROR_CODE_INVALID_REQUEST = 1;
    public static final int ERROR_CODE_NETWORK_ERROR = 2;
    public static final int ERROR_CODE_NO_FILL = 3;

    /* renamed from: dW */
    private final C0864af f1123dW;

    /* renamed from: jj */
    private final int f1124jj;

    /* renamed from: jk */
    private final int f1125jk;

    /* renamed from: jl */
    private final int f1126jl;

    /* renamed from: jm */
    private final int f1127jm;

    /* renamed from: jn */
    private final int f1128jn;

    /* renamed from: jo */
    private final int f1129jo;

    /* renamed from: jp */
    private final int f1130jp;

    /* renamed from: jq */
    private final int f1131jq;

    /* renamed from: jr */
    private final String f1132jr;

    /* renamed from: js */
    private final int f1133js;

    /* renamed from: jt */
    private final String f1134jt;

    /* renamed from: ju */
    private final int f1135ju;

    /* renamed from: jv */
    private final int f1136jv;

    /* renamed from: jw */
    private final String f1137jw;

    public static final class Builder {
        /* access modifiers changed from: private */

        /* renamed from: dX */
        public final C0864af.C0865a f1138dX = new C0864af.C0865a();
        /* access modifiers changed from: private */

        /* renamed from: jj */
        public int f1139jj;
        /* access modifiers changed from: private */

        /* renamed from: jk */
        public int f1140jk;
        /* access modifiers changed from: private */

        /* renamed from: jl */
        public int f1141jl;
        /* access modifiers changed from: private */

        /* renamed from: jm */
        public int f1142jm;
        /* access modifiers changed from: private */

        /* renamed from: jn */
        public int f1143jn;
        /* access modifiers changed from: private */

        /* renamed from: jo */
        public int f1144jo;
        /* access modifiers changed from: private */

        /* renamed from: jp */
        public int f1145jp = 0;
        /* access modifiers changed from: private */

        /* renamed from: jq */
        public int f1146jq;
        /* access modifiers changed from: private */

        /* renamed from: jr */
        public String f1147jr;
        /* access modifiers changed from: private */

        /* renamed from: js */
        public int f1148js;
        /* access modifiers changed from: private */

        /* renamed from: jt */
        public String f1149jt;
        /* access modifiers changed from: private */

        /* renamed from: ju */
        public int f1150ju;
        /* access modifiers changed from: private */

        /* renamed from: jv */
        public int f1151jv;
        /* access modifiers changed from: private */

        /* renamed from: jw */
        public String f1152jw;

        public Builder addNetworkExtras(NetworkExtras networkExtras) {
            this.f1138dX.mo7030a(networkExtras);
            return this;
        }

        public Builder addTestDevice(String deviceId) {
            this.f1138dX.mo7036h(deviceId);
            return this;
        }

        public SearchAdRequest build() {
            return new SearchAdRequest(this);
        }

        public Builder setAnchorTextColor(int anchorTextColor) {
            this.f1139jj = anchorTextColor;
            return this;
        }

        public Builder setBackgroundColor(int backgroundColor) {
            this.f1140jk = backgroundColor;
            this.f1141jl = Color.argb(0, 0, 0, 0);
            this.f1142jm = Color.argb(0, 0, 0, 0);
            return this;
        }

        public Builder setBackgroundGradient(int top, int bottom) {
            this.f1140jk = Color.argb(0, 0, 0, 0);
            this.f1141jl = bottom;
            this.f1142jm = top;
            return this;
        }

        public Builder setBorderColor(int borderColor) {
            this.f1143jn = borderColor;
            return this;
        }

        public Builder setBorderThickness(int borderThickness) {
            this.f1144jo = borderThickness;
            return this;
        }

        public Builder setBorderType(int borderType) {
            this.f1145jp = borderType;
            return this;
        }

        public Builder setCallButtonColor(int callButtonColor) {
            this.f1146jq = callButtonColor;
            return this;
        }

        public Builder setCustomChannels(String channelIds) {
            this.f1147jr = channelIds;
            return this;
        }

        public Builder setDescriptionTextColor(int descriptionTextColor) {
            this.f1148js = descriptionTextColor;
            return this;
        }

        public Builder setFontFace(String fontFace) {
            this.f1149jt = fontFace;
            return this;
        }

        public Builder setHeaderTextColor(int headerTextColor) {
            this.f1150ju = headerTextColor;
            return this;
        }

        public Builder setHeaderTextSize(int headerTextSize) {
            this.f1151jv = headerTextSize;
            return this;
        }

        public Builder setLocation(Location location) {
            this.f1138dX.mo7029a(location);
            return this;
        }

        public Builder setQuery(String query) {
            this.f1152jw = query;
            return this;
        }

        public Builder tagForChildDirectedTreatment(boolean tagForChildDirectedTreatment) {
            this.f1138dX.mo7034e(tagForChildDirectedTreatment);
            return this;
        }
    }

    private SearchAdRequest(Builder builder) {
        this.f1124jj = builder.f1139jj;
        this.f1125jk = builder.f1140jk;
        this.f1126jl = builder.f1141jl;
        this.f1127jm = builder.f1142jm;
        this.f1128jn = builder.f1143jn;
        this.f1129jo = builder.f1144jo;
        this.f1130jp = builder.f1145jp;
        this.f1131jq = builder.f1146jq;
        this.f1132jr = builder.f1147jr;
        this.f1133js = builder.f1148js;
        this.f1134jt = builder.f1149jt;
        this.f1135ju = builder.f1150ju;
        this.f1136jv = builder.f1151jv;
        this.f1137jw = builder.f1152jw;
        this.f1123dW = new C0864af(builder.f1138dX, this);
    }

    public int getAnchorTextColor() {
        return this.f1124jj;
    }

    public int getBackgroundColor() {
        return this.f1125jk;
    }

    public int getBackgroundGradientBottom() {
        return this.f1126jl;
    }

    public int getBackgroundGradientTop() {
        return this.f1127jm;
    }

    public int getBorderColor() {
        return this.f1128jn;
    }

    public int getBorderThickness() {
        return this.f1129jo;
    }

    public int getBorderType() {
        return this.f1130jp;
    }

    public int getCallButtonColor() {
        return this.f1131jq;
    }

    public String getCustomChannels() {
        return this.f1132jr;
    }

    public int getDescriptionTextColor() {
        return this.f1133js;
    }

    public String getFontFace() {
        return this.f1134jt;
    }

    public int getHeaderTextColor() {
        return this.f1135ju;
    }

    public int getHeaderTextSize() {
        return this.f1136jv;
    }

    public Location getLocation() {
        return this.f1123dW.getLocation();
    }

    public <T extends NetworkExtras> T getNetworkExtras(Class<T> networkExtrasClass) {
        return this.f1123dW.getNetworkExtras(networkExtrasClass);
    }

    public String getQuery() {
        return this.f1137jw;
    }

    public boolean isTestDevice(Context context) {
        return this.f1123dW.isTestDevice(context);
    }

    /* access modifiers changed from: package-private */
    /* renamed from: v */
    public C0864af mo5539v() {
        return this.f1123dW;
    }
}
