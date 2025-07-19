package com.google.android.gms.ads.search;

import android.content.Context;
import android.graphics.Color;
import android.location.Location;
import com.google.android.gms.ads.mediation.NetworkExtras;
import com.google.android.gms.internal.af;
/* loaded from: classes.dex */
public final class SearchAdRequest {
    public static final int BORDER_TYPE_DASHED = 1;
    public static final int BORDER_TYPE_DOTTED = 2;
    public static final int BORDER_TYPE_NONE = 0;
    public static final int BORDER_TYPE_SOLID = 3;
    public static final int CALL_BUTTON_COLOR_DARK = 2;
    public static final int CALL_BUTTON_COLOR_LIGHT = 0;
    public static final int CALL_BUTTON_COLOR_MEDIUM = 1;
    public static final String DEVICE_ID_EMULATOR = af.DEVICE_ID_EMULATOR;
    public static final int ERROR_CODE_INTERNAL_ERROR = 0;
    public static final int ERROR_CODE_INVALID_REQUEST = 1;
    public static final int ERROR_CODE_NETWORK_ERROR = 2;
    public static final int ERROR_CODE_NO_FILL = 3;
    private final af dW;
    private final int jj;
    private final int jk;
    private final int jl;
    private final int jm;
    private final int jn;
    private final int jo;
    private final int jp;
    private final int jq;
    private final String jr;
    private final int js;
    private final String jt;
    private final int ju;
    private final int jv;
    private final String jw;

    /* loaded from: classes.dex */
    public static final class Builder {
        private int jj;
        private int jk;
        private int jl;
        private int jm;
        private int jn;
        private int jo;
        private int jq;
        private String jr;
        private int js;
        private String jt;
        private int ju;
        private int jv;
        private String jw;
        private final af.a dX = new af.a();
        private int jp = 0;

        public Builder addNetworkExtras(NetworkExtras networkExtras) {
            this.dX.a(networkExtras);
            return this;
        }

        public Builder addTestDevice(String deviceId) {
            this.dX.h(deviceId);
            return this;
        }

        public SearchAdRequest build() {
            return new SearchAdRequest(this);
        }

        public Builder setAnchorTextColor(int anchorTextColor) {
            this.jj = anchorTextColor;
            return this;
        }

        public Builder setBackgroundColor(int backgroundColor) {
            this.jk = backgroundColor;
            this.jl = Color.argb(0, 0, 0, 0);
            this.jm = Color.argb(0, 0, 0, 0);
            return this;
        }

        public Builder setBackgroundGradient(int top, int bottom) {
            this.jk = Color.argb(0, 0, 0, 0);
            this.jl = bottom;
            this.jm = top;
            return this;
        }

        public Builder setBorderColor(int borderColor) {
            this.jn = borderColor;
            return this;
        }

        public Builder setBorderThickness(int borderThickness) {
            this.jo = borderThickness;
            return this;
        }

        public Builder setBorderType(int borderType) {
            this.jp = borderType;
            return this;
        }

        public Builder setCallButtonColor(int callButtonColor) {
            this.jq = callButtonColor;
            return this;
        }

        public Builder setCustomChannels(String channelIds) {
            this.jr = channelIds;
            return this;
        }

        public Builder setDescriptionTextColor(int descriptionTextColor) {
            this.js = descriptionTextColor;
            return this;
        }

        public Builder setFontFace(String fontFace) {
            this.jt = fontFace;
            return this;
        }

        public Builder setHeaderTextColor(int headerTextColor) {
            this.ju = headerTextColor;
            return this;
        }

        public Builder setHeaderTextSize(int headerTextSize) {
            this.jv = headerTextSize;
            return this;
        }

        public Builder setLocation(Location location) {
            this.dX.a(location);
            return this;
        }

        public Builder setQuery(String query) {
            this.jw = query;
            return this;
        }

        public Builder tagForChildDirectedTreatment(boolean tagForChildDirectedTreatment) {
            this.dX.e(tagForChildDirectedTreatment);
            return this;
        }
    }

    private SearchAdRequest(Builder builder) {
        this.jj = builder.jj;
        this.jk = builder.jk;
        this.jl = builder.jl;
        this.jm = builder.jm;
        this.jn = builder.jn;
        this.jo = builder.jo;
        this.jp = builder.jp;
        this.jq = builder.jq;
        this.jr = builder.jr;
        this.js = builder.js;
        this.jt = builder.jt;
        this.ju = builder.ju;
        this.jv = builder.jv;
        this.jw = builder.jw;
        this.dW = new af(builder.dX, this);
    }

    public int getAnchorTextColor() {
        return this.jj;
    }

    public int getBackgroundColor() {
        return this.jk;
    }

    public int getBackgroundGradientBottom() {
        return this.jl;
    }

    public int getBackgroundGradientTop() {
        return this.jm;
    }

    public int getBorderColor() {
        return this.jn;
    }

    public int getBorderThickness() {
        return this.jo;
    }

    public int getBorderType() {
        return this.jp;
    }

    public int getCallButtonColor() {
        return this.jq;
    }

    public String getCustomChannels() {
        return this.jr;
    }

    public int getDescriptionTextColor() {
        return this.js;
    }

    public String getFontFace() {
        return this.jt;
    }

    public int getHeaderTextColor() {
        return this.ju;
    }

    public int getHeaderTextSize() {
        return this.jv;
    }

    public Location getLocation() {
        return this.dW.getLocation();
    }

    public <T extends NetworkExtras> T getNetworkExtras(Class<T> networkExtrasClass) {
        return (T) this.dW.getNetworkExtras(networkExtrasClass);
    }

    public String getQuery() {
        return this.jw;
    }

    public boolean isTestDevice(Context context) {
        return this.dW.isTestDevice(context);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public af v() {
        return this.dW;
    }
}
