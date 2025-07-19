package com.google.ads.searchads;

import android.content.Context;
import android.graphics.Color;
import com.google.ads.AdRequest;
import com.google.ads.mediation.admob.AdMobAdapterExtras;
import java.util.Locale;
import java.util.Map;

public class SearchAdRequest extends AdRequest {

    /* renamed from: a */
    private String f1017a;

    /* renamed from: b */
    private int f1018b;

    /* renamed from: c */
    private int f1019c;

    /* renamed from: d */
    private int f1020d;

    /* renamed from: e */
    private int f1021e;

    /* renamed from: f */
    private int f1022f;

    /* renamed from: g */
    private int f1023g;

    /* renamed from: h */
    private String f1024h;

    /* renamed from: i */
    private int f1025i;

    /* renamed from: j */
    private int f1026j;

    /* renamed from: k */
    private BorderType f1027k;

    /* renamed from: l */
    private int f1028l;

    /* renamed from: m */
    private String f1029m;

    public enum BorderType {
        NONE("none"),
        DASHED("dashed"),
        DOTTED("dotted"),
        SOLID("solid");
        

        /* renamed from: a */
        private String f1031a;

        private BorderType(String param) {
            this.f1031a = param;
        }

        public String toString() {
            return this.f1031a;
        }
    }

    public void setQuery(String query) {
        this.f1017a = query;
    }

    public void setBackgroundColor(int backgroundColor) {
        if (Color.alpha(backgroundColor) == 255) {
            this.f1018b = backgroundColor;
            this.f1019c = 0;
            this.f1020d = 0;
        }
    }

    public void setBackgroundGradient(int from, int to) {
        if (Color.alpha(from) == 255 && Color.alpha(to) == 255) {
            this.f1018b = Color.argb(0, 0, 0, 0);
            this.f1019c = from;
            this.f1020d = to;
        }
    }

    public void setHeaderTextColor(int headerTextColor) {
        this.f1021e = headerTextColor;
    }

    public void setDescriptionTextColor(int descriptionTextColor) {
        this.f1022f = descriptionTextColor;
    }

    public void setAnchorTextColor(int anchorTextColor) {
        this.f1023g = anchorTextColor;
    }

    public void setFontFace(String fontFace) {
        this.f1024h = fontFace;
    }

    public void setHeaderTextSize(int headerTextSize) {
        this.f1025i = headerTextSize;
    }

    public void setBorderColor(int borderColor) {
        this.f1026j = borderColor;
    }

    public void setBorderType(BorderType borderType) {
        this.f1027k = borderType;
    }

    public void setBorderThickness(int borderThickness) {
        this.f1028l = borderThickness;
    }

    public void setCustomChannels(String channelIds) {
        this.f1029m = channelIds;
    }

    public Map<String, Object> getRequestMap(Context context) {
        AdMobAdapterExtras adMobAdapterExtras = (AdMobAdapterExtras) getNetworkExtras(AdMobAdapterExtras.class);
        if (adMobAdapterExtras == null) {
            adMobAdapterExtras = new AdMobAdapterExtras();
            setNetworkExtras(adMobAdapterExtras);
        }
        if (this.f1017a != null) {
            adMobAdapterExtras.getExtras().put("q", this.f1017a);
        }
        if (Color.alpha(this.f1018b) != 0) {
            adMobAdapterExtras.getExtras().put("bgcolor", m978a(this.f1018b));
        }
        if (Color.alpha(this.f1019c) == 255 && Color.alpha(this.f1020d) == 255) {
            adMobAdapterExtras.getExtras().put("gradientfrom", m978a(this.f1019c));
            adMobAdapterExtras.getExtras().put("gradientto", m978a(this.f1020d));
        }
        if (Color.alpha(this.f1021e) != 0) {
            adMobAdapterExtras.getExtras().put("hcolor", m978a(this.f1021e));
        }
        if (Color.alpha(this.f1022f) != 0) {
            adMobAdapterExtras.getExtras().put("dcolor", m978a(this.f1022f));
        }
        if (Color.alpha(this.f1023g) != 0) {
            adMobAdapterExtras.getExtras().put("acolor", m978a(this.f1023g));
        }
        if (this.f1024h != null) {
            adMobAdapterExtras.getExtras().put("font", this.f1024h);
        }
        adMobAdapterExtras.getExtras().put("headersize", Integer.toString(this.f1025i));
        if (Color.alpha(this.f1026j) != 0) {
            adMobAdapterExtras.getExtras().put("bcolor", m978a(this.f1026j));
        }
        if (this.f1027k != null) {
            adMobAdapterExtras.getExtras().put("btype", this.f1027k.toString());
        }
        adMobAdapterExtras.getExtras().put("bthick", Integer.toString(this.f1028l));
        if (this.f1029m != null) {
            adMobAdapterExtras.getExtras().put("channel", this.f1029m);
        }
        return super.getRequestMap(context);
    }

    /* renamed from: a */
    private String m978a(int i) {
        return String.format(Locale.US, "#%06x", new Object[]{Integer.valueOf(16777215 & i)});
    }
}
