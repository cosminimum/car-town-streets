package com.chartboost.sdk.impl;

import android.content.Intent;
import android.net.Uri;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.C0064b;
import com.facebook.internal.ServerProtocol;
import com.tapjoy.TapjoyConstants;
import java.util.Date;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.a */
public class C0069a {

    /* renamed from: a */
    public JSONObject f102a;

    /* renamed from: b */
    public Date f103b;

    /* renamed from: c */
    public C0075b f104c;

    /* renamed from: d */
    public C0076c f105d;

    /* renamed from: e */
    public String f106e;

    /* renamed from: f */
    public C0064b f107f;

    /* renamed from: g */
    public C0074a f108g;

    /* renamed from: h */
    public C0204s f109h;

    /* renamed from: i */
    public boolean f110i;

    /* renamed from: j */
    public boolean f111j;

    /* renamed from: k */
    public boolean f112k;

    /* renamed from: com.chartboost.sdk.impl.a$a */
    public interface C0074a {
        /* renamed from: a */
        void mo1161a(C0069a aVar);

        /* renamed from: a */
        void mo1162a(C0069a aVar, String str, JSONObject jSONObject);

        /* renamed from: b */
        void mo1163b(C0069a aVar);

        /* renamed from: c */
        void mo1164c(C0069a aVar);
    }

    /* renamed from: com.chartboost.sdk.impl.a$b */
    public enum C0075b {
        CBImpressionStateOther,
        CBImpressionStateWaitingForDisplay,
        CBImpressionStateDisplayedByDefaultController,
        CBImpressionStateWaitingForDismissal,
        CBImpressionStateWaitingForCaching,
        CBImpressionStateCached
    }

    /* renamed from: com.chartboost.sdk.impl.a$c */
    public enum C0076c {
        CBImpressionTypeOther,
        CBImpressionTypeInterstitial,
        CBImpressionTypeMoreApps
    }

    public C0069a(JSONObject jSONObject, C0076c cVar, C0074a aVar, C0075b bVar, String str) {
        jSONObject = jSONObject == null ? new JSONObject() : jSONObject;
        this.f104c = bVar;
        this.f106e = str;
        this.f102a = jSONObject;
        this.f103b = new Date();
        this.f108g = aVar;
        this.f105d = cVar;
        this.f110i = false;
        this.f111j = false;
        this.f112k = false;
        boolean equals = jSONObject.optString(ServerProtocol.DIALOG_PARAM_TYPE, "").equals(TapjoyConstants.TJC_PLUGIN_NATIVE);
        if (equals && this.f105d == C0076c.CBImpressionTypeInterstitial) {
            this.f107f = new C0128b(this);
        } else if (!equals || this.f105d != C0076c.CBImpressionTypeMoreApps) {
            this.f107f = new C0211v(this);
        } else {
            this.f107f = new C0168h(this);
        }
        this.f107f.f90c = new C0064b.C0065a() {
            /* renamed from: a */
            public void mo1241a() {
                if (this.f108g != null) {
                    this.f108g.mo1161a(this);
                }
            }
        };
        this.f107f.f88a = new C0064b.C0065a() {
            /* renamed from: a */
            public void mo1241a() {
                if (this.f108g != null) {
                    this.f108g.mo1163b(this);
                }
            }
        };
        this.f107f.f89b = new C0064b.C0068c() {
            /* renamed from: a */
            public void mo1248a(String str, JSONObject jSONObject) {
                if (str == null) {
                    str = this.f102a.optString("link");
                }
                String optString = this.f102a.optString("deep-link");
                if (optString != null && !optString.equals("")) {
                    try {
                        if (C0038Chartboost.sharedChartboost().getContext().getPackageManager().queryIntentActivities(new Intent("android.intent.action.VIEW", Uri.parse(optString)), 65536).size() > 0) {
                            str = optString;
                        }
                    } catch (Exception e) {
                    }
                }
                this.f108g.mo1162a(this, str, jSONObject);
            }
        };
        this.f107f.f91d = new C0064b.C0065a() {
            /* renamed from: a */
            public void mo1241a() {
                this.f108g.mo1164c(this);
            }
        };
        this.f107f.mo1234a(jSONObject);
    }

    /* renamed from: a */
    public boolean mo1249a() {
        this.f110i = true;
        this.f111j = true;
        this.f112k = true;
        this.f107f.mo1236a();
        if (this.f107f.mo1239d() != null) {
            return true;
        }
        this.f110i = false;
        this.f111j = false;
        this.f112k = false;
        return false;
    }

    /* renamed from: b */
    public void mo1250b() {
        if (this.f109h != null) {
            this.f109h.mo1496a();
            try {
                if (this.f107f.mo1239d().getParent() != null) {
                    this.f109h.removeView(this.f107f.mo1239d());
                }
            } catch (Exception e) {
            }
        }
        if (this.f107f != null) {
            this.f107f.mo1238c();
        }
        this.f102a = null;
        this.f103b = null;
        this.f108g = null;
        this.f107f = null;
        this.f109h = null;
    }

    /* renamed from: c */
    public void mo1251c() {
        if (this.f109h != null) {
            this.f109h.mo1496a();
            try {
                if (this.f107f.mo1239d().getParent() != null) {
                    this.f109h.removeView(this.f107f.mo1239d());
                }
            } catch (Exception e) {
            }
        }
        if (this.f107f != null) {
            this.f107f.mo1240e();
        }
    }
}
