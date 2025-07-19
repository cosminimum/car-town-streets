package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Point;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.C0064b;
import com.chartboost.sdk.Libraries.C0049a;
import com.chartboost.sdk.Libraries.C0053d;
import com.chartboost.sdk.Libraries.C0054e;
import com.getjar.sdk.utilities.Constants;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.b */
public class C0128b extends C0064b {

    /* renamed from: h */
    public C0049a.C0050a f191h = null;

    /* renamed from: i */
    public C0049a.C0050a f192i = null;

    /* renamed from: j */
    public C0049a.C0050a f193j = null;

    /* renamed from: k */
    public C0049a.C0050a f194k = null;

    /* renamed from: l */
    public C0049a.C0050a f195l = null;

    /* renamed from: com.chartboost.sdk.impl.b$a */
    public class C0134a extends C0064b.C0066b {

        /* renamed from: c */
        public ImageView f201c;

        /* renamed from: d */
        public ImageView f202d;

        /* renamed from: e */
        public Button f203e;

        /* renamed from: f */
        public C0208t f204f;

        private C0134a(Context context) {
            super(context);
            setBackgroundColor(0);
            setLayoutParams(new RelativeLayout.LayoutParams(-1, -1));
            this.f204f = new C0208t(context);
            this.f202d = new ImageView(context);
            this.f203e = new Button(context);
            this.f201c = new ImageView(context);
            this.f203e.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    if (C0128b.this.f88a != null) {
                        C0128b.this.f88a.mo1241a();
                    }
                }
            });
            this.f202d.setClickable(true);
            this.f202d.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    if (C0128b.this.f89b != null) {
                        C0128b.this.f89b.mo1248a((String) null, (JSONObject) null);
                    }
                }
            });
            this.f204f.mo1503a(this.f201c);
            this.f204f.mo1503a(this.f202d);
            this.f204f.mo1503a(this.f203e);
            addView(this.f204f, new RelativeLayout.LayoutParams(-1, -1));
        }

        /* synthetic */ C0134a(C0128b bVar, Context context, C0134a aVar) {
            this(context);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo1243a(int i, int i2) {
            boolean isPortrait = C0038Chartboost.sharedChartboost().orientation().isPortrait();
            C0049a.C0050a aVar = isPortrait ? C0128b.this.f191h : C0128b.this.f192i;
            C0049a.C0050a aVar2 = isPortrait ? C0128b.this.f193j : C0128b.this.f194k;
            RelativeLayout.LayoutParams layoutParams = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
            float max = isPortrait ? Math.max(320.0f / ((float) i), 480.0f / ((float) i2)) : Math.max(320.0f / ((float) i2), 480.0f / ((float) i));
            layoutParams.width = (int) (((float) aVar2.mo1206c()) / max);
            layoutParams.height = (int) (((float) aVar2.mo1207d()) / max);
            Point a = m280a(isPortrait ? "frame-portrait" : "frame-landscape");
            layoutParams.leftMargin = Math.round((((float) (i - layoutParams.width)) / 2.0f) + (((float) a.x) / max));
            layoutParams.topMargin = Math.round((((float) a.y) / max) + (((float) (i2 - layoutParams.height)) / 2.0f));
            this.f202d.setId(100);
            layoutParams2.width = (int) (((float) aVar.mo1206c()) / max);
            layoutParams2.height = (int) (((float) aVar.mo1207d()) / max);
            Point a2 = m280a(isPortrait ? "ad-portrait" : "ad-landscape");
            layoutParams2.leftMargin = Math.round((((float) (i - layoutParams2.width)) / 2.0f) + (((float) a2.x) / max));
            layoutParams2.topMargin = Math.round((((float) a2.y) / max) + (((float) (i2 - layoutParams2.height)) / 2.0f));
            layoutParams3.width = (int) (((float) C0128b.this.f195l.mo1206c()) / max);
            layoutParams3.height = (int) (((float) C0128b.this.f195l.mo1207d()) / max);
            Point a3 = m280a("close");
            layoutParams3.leftMargin = layoutParams2.leftMargin + layoutParams2.width + Math.round((((float) a3.x) / max) - C0053d.m85b(10, getContext()));
            layoutParams3.topMargin = Math.round((((float) a3.y) / max) - C0053d.m85b(10, getContext())) + (layoutParams2.topMargin - layoutParams3.height);
            this.f201c.setLayoutParams(layoutParams);
            this.f202d.setLayoutParams(layoutParams2);
            this.f203e.setLayoutParams(layoutParams3);
            BitmapDrawable bitmapDrawable = new BitmapDrawable(aVar2.mo1205b());
            this.f201c.setScaleType(ImageView.ScaleType.FIT_CENTER);
            this.f201c.setImageDrawable(bitmapDrawable);
            BitmapDrawable bitmapDrawable2 = new BitmapDrawable(aVar.mo1205b());
            this.f202d.setScaleType(ImageView.ScaleType.FIT_CENTER);
            this.f202d.setImageDrawable(bitmapDrawable2);
            this.f203e.setBackgroundDrawable(new BitmapDrawable(C0128b.this.f195l.mo1205b()));
        }

        /* renamed from: b */
        public void mo1245b() {
            super.mo1245b();
            this.f202d = null;
            this.f201c = null;
            this.f203e = null;
        }

        /* renamed from: a */
        private Point m280a(String str) {
            JSONObject optJSONObject;
            JSONObject optJSONObject2 = C0128b.this.f93f.optJSONObject(str);
            if (optJSONObject2 == null || (optJSONObject = optJSONObject2.optJSONObject("offset")) == null) {
                return new Point(0, 0);
            }
            return new Point(optJSONObject.optInt(Constants.f677X, 0), optJSONObject.optInt(Constants.f678Y, 0));
        }
    }

    public C0128b(C0069a aVar) {
        super(aVar);
        this.f92e = 5;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public C0064b.C0066b mo1230a(Context context) {
        return new C0134a(this, context, (C0134a) null);
    }

    /* renamed from: a */
    public void mo1234a(JSONObject jSONObject) {
        super.mo1234a(jSONObject);
        C01291 r0 = new C0054e.C0056b() {
            /* renamed from: a */
            public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                C0128b.this.f192i = aVar;
                C0128b.this.mo1231a(aVar);
            }
        };
        C01302 r1 = new C0054e.C0056b() {
            /* renamed from: a */
            public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                C0128b.this.f191h = aVar;
                C0128b.this.mo1231a(aVar);
            }
        };
        C01313 r2 = new C0054e.C0056b() {
            /* renamed from: a */
            public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                C0128b.this.f194k = aVar;
                C0128b.this.mo1231a(aVar);
            }
        };
        C01324 r3 = new C0054e.C0056b() {
            /* renamed from: a */
            public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                C0128b.this.f193j = aVar;
                C0128b.this.mo1231a(aVar);
            }
        };
        C01335 r4 = new C0054e.C0056b() {
            /* renamed from: a */
            public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                C0128b.this.f195l = aVar;
                C0128b.this.mo1231a(aVar);
            }
        };
        mo1233a("ad-landscape", r0, true);
        mo1233a("ad-portrait", r1, true);
        mo1232a("frame-landscape", r2);
        mo1232a("frame-portrait", r3);
        mo1232a("close", r4);
    }

    /* renamed from: c */
    public void mo1238c() {
        super.mo1238c();
        if (this.f192i != null) {
            this.f192i.mo1201a();
            this.f192i = null;
        }
        if (this.f191h != null) {
            this.f191h.mo1201a();
            this.f191h = null;
        }
        this.f194k = null;
        this.f193j = null;
        this.f195l = null;
    }
}
