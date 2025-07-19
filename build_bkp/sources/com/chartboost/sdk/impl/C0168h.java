package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Shader;
import android.graphics.drawable.BitmapDrawable;
import android.os.Bundle;
import android.util.SparseArray;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AbsListView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.C0064b;
import com.chartboost.sdk.Libraries.C0049a;
import com.chartboost.sdk.Libraries.C0053d;
import com.chartboost.sdk.Libraries.C0054e;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.facebook.internal.ServerProtocol;
import com.flurry.android.CallbackEvent;
import com.getjar.sdk.utilities.Constants;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;

/* renamed from: com.chartboost.sdk.impl.h */
public class C0168h extends C0064b {
    /* access modifiers changed from: private */

    /* renamed from: h */
    public static int f260h = 50;
    /* access modifiers changed from: private */

    /* renamed from: i */
    public static int f261i = 50;
    /* access modifiers changed from: private */

    /* renamed from: j */
    public static int f262j = 30;
    /* access modifiers changed from: private */

    /* renamed from: k */
    public List<JSONObject> f263k = new ArrayList();
    /* access modifiers changed from: private */

    /* renamed from: l */
    public C0049a.C0050a f264l;
    /* access modifiers changed from: private */

    /* renamed from: m */
    public C0049a.C0050a f265m;
    /* access modifiers changed from: private */

    /* renamed from: n */
    public C0049a.C0050a f266n;
    /* access modifiers changed from: private */

    /* renamed from: o */
    public SparseArray<C0049a.C0050a> f267o;

    /* renamed from: com.chartboost.sdk.impl.h$b */
    public interface C0178b {
        /* renamed from: a */
        int mo1438a();

        /* renamed from: a */
        void mo1439a(JSONObject jSONObject, int i);
    }

    /* renamed from: com.chartboost.sdk.impl.h$a */
    public class C0173a extends C0064b.C0066b {

        /* renamed from: k */
        private static /* synthetic */ int[] f272k;

        /* renamed from: d */
        private ImageView f274d;

        /* renamed from: e */
        private ImageView f275e;

        /* renamed from: f */
        private FrameLayout f276f;
        /* access modifiers changed from: private */

        /* renamed from: g */
        public C0200q f277g;

        /* renamed from: h */
        private C0208t f278h;

        /* renamed from: i */
        private C0208t f279i;

        /* renamed from: j */
        private C0176a f280j;

        /* renamed from: c */
        static /* synthetic */ int[] m371c() {
            int[] iArr = f272k;
            if (iArr == null) {
                iArr = new int[CBOrientation.Difference.values().length];
                try {
                    iArr[CBOrientation.Difference.ANGLE_0.ordinal()] = 1;
                } catch (NoSuchFieldError e) {
                }
                try {
                    iArr[CBOrientation.Difference.ANGLE_180.ordinal()] = 3;
                } catch (NoSuchFieldError e2) {
                }
                try {
                    iArr[CBOrientation.Difference.ANGLE_270.ordinal()] = 4;
                } catch (NoSuchFieldError e3) {
                }
                try {
                    iArr[CBOrientation.Difference.ANGLE_90.ordinal()] = 2;
                } catch (NoSuchFieldError e4) {
                }
                f272k = iArr;
            }
            return iArr;
        }

        private C0173a(Context context) {
            super(context);
            setBackgroundColor(-1842205);
            this.f276f = new FrameLayout(context);
            this.f275e = new ImageView(context);
            this.f274d = new ImageView(context);
            this.f277g = new C0200q(context, C0038Chartboost.sharedChartboost().getForcedOrientationDifference().isOdd() ? 0 : 1);
            this.f277g.mo1492b().setBackgroundColor(-1842205);
            this.f276f.setFocusable(false);
            this.f275e.setFocusable(false);
            this.f274d.setFocusable(false);
            this.f274d.setClickable(true);
            this.f278h = new C0208t(context, this.f274d);
            this.f279i = new C0208t(context, this.f276f);
            addView(this.f279i);
            this.f276f.addView(this.f275e);
            addView(this.f278h);
            m368a((View) this.f275e);
            m368a((View) this.f276f);
            m368a((View) this.f274d);
            m368a((View) this.f279i);
            m368a((View) this.f278h);
            this.f274d.setOnClickListener(new View.OnClickListener() {
                public void onClick(View v) {
                    if (C0168h.this.f88a != null) {
                        C0168h.this.f88a.mo1241a();
                    }
                }
            });
            this.f280j = new C0176a(context);
        }

        /* synthetic */ C0173a(C0168h hVar, Context context, C0173a aVar) {
            this(context);
        }

        /* renamed from: a */
        private void m368a(View view) {
            int i = 200;
            if (200 == getId()) {
                i = CallbackEvent.ADS_LOADED_FROM_CACHE;
            }
            int i2 = i;
            View findViewById = findViewById(i);
            while (findViewById != null) {
                i2++;
                findViewById = findViewById(i2);
            }
            view.setId(i2);
            view.setSaveEnabled(false);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo1243a(int i, int i2) {
            if (this.f277g.mo1489a() != null) {
                removeView(this.f277g.mo1489a());
            }
            FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 17);
            RelativeLayout.LayoutParams layoutParams2 = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams layoutParams3 = new RelativeLayout.LayoutParams(-2, -2);
            RelativeLayout.LayoutParams layoutParams4 = new RelativeLayout.LayoutParams(-2, -2);
            final CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
            layoutParams2.width = forcedOrientationDifference.isOdd() ? C0053d.m78a(C0168h.f260h, getContext()) : -1;
            layoutParams2.height = forcedOrientationDifference.isOdd() ? -1 : C0053d.m78a(C0168h.f260h, getContext());
            switch (m371c()[forcedOrientationDifference.ordinal()]) {
                case 2:
                    layoutParams2.addRule(11);
                    break;
                case 3:
                    layoutParams2.addRule(12);
                    break;
            }
            BitmapDrawable bitmapDrawable = new BitmapDrawable(C0168h.this.f266n.mo1205b());
            bitmapDrawable.setTileModeX(Shader.TileMode.REPEAT);
            bitmapDrawable.setTileModeY(Shader.TileMode.CLAMP);
            this.f276f.setBackgroundDrawable(bitmapDrawable);
            if (C0168h.this.f265m != null) {
                this.f275e.setImageBitmap(C0168h.this.f265m.mo1205b());
                layoutParams.width = C0053d.m78a(C0168h.this.f265m.mo1206c(), getContext());
                layoutParams.height = C0053d.m78a(Math.min(C0168h.f260h, C0168h.this.f265m.mo1207d()), getContext());
            }
            this.f274d.setImageBitmap(C0168h.this.f264l.mo1205b());
            layoutParams3.width = C0053d.m78a(forcedOrientationDifference.isOdd() ? C0168h.f262j : C0168h.f261i, getContext());
            layoutParams3.height = C0053d.m78a(forcedOrientationDifference.isOdd() ? C0168h.f261i : C0168h.f262j, getContext());
            switch (m371c()[forcedOrientationDifference.ordinal()]) {
                case 2:
                    layoutParams3.bottomMargin = C0053d.m78a(10, getContext());
                    layoutParams3.rightMargin = C0053d.m78a((C0168h.f260h - C0168h.f262j) / 2, getContext());
                    layoutParams3.addRule(11);
                    layoutParams3.addRule(12);
                    break;
                case 3:
                    layoutParams3.leftMargin = C0053d.m78a(10, getContext());
                    layoutParams3.bottomMargin = C0053d.m78a((C0168h.f260h - C0168h.f262j) / 2, getContext());
                    layoutParams3.addRule(12);
                    break;
                case 4:
                    layoutParams3.topMargin = C0053d.m78a(10, getContext());
                    layoutParams3.leftMargin = C0053d.m78a((C0168h.f260h - C0168h.f262j) / 2, getContext());
                    break;
                default:
                    layoutParams3.rightMargin = C0053d.m78a(10, getContext());
                    layoutParams3.topMargin = C0053d.m78a((C0168h.f260h - C0168h.f262j) / 2, getContext());
                    layoutParams3.addRule(11);
                    break;
            }
            layoutParams4.width = -1;
            layoutParams4.height = -1;
            switch (m371c()[forcedOrientationDifference.ordinal()]) {
                case 2:
                    layoutParams4.addRule(0, this.f279i.getId());
                    break;
                case 3:
                    layoutParams4.addRule(2, this.f279i.getId());
                    break;
                case 4:
                    layoutParams4.addRule(1, this.f279i.getId());
                    break;
                default:
                    layoutParams4.addRule(3, this.f279i.getId());
                    break;
            }
            this.f277g.mo1490a(forcedOrientationDifference.isOdd() ? 0 : 1);
            m368a((View) this.f277g.mo1489a());
            this.f277g.mo1491a((BaseAdapter) this.f280j);
            addView(this.f277g.mo1489a(), layoutParams4);
            if (forcedOrientationDifference == CBOrientation.Difference.ANGLE_180) {
                this.f277g.mo1492b().setGravity(80);
            } else if (forcedOrientationDifference == CBOrientation.Difference.ANGLE_90) {
                this.f277g.mo1492b().setGravity(5);
            } else {
                this.f277g.mo1492b().setGravity(0);
            }
            this.f279i.setLayoutParams(layoutParams2);
            this.f275e.setLayoutParams(layoutParams);
            this.f275e.setScaleType(ImageView.ScaleType.FIT_CENTER);
            this.f278h.setLayoutParams(layoutParams3);
            this.f274d.setScaleType(ImageView.ScaleType.FIT_CENTER);
            post(new Runnable() {
                public void run() {
                    try {
                        C0173a.this.f99a = true;
                        C0173a.this.requestLayout();
                        C0173a.this.f277g.mo1489a().requestLayout();
                        C0173a.this.f277g.mo1492b().requestLayout();
                        C0173a.this.f99a = false;
                        if (forcedOrientationDifference == CBOrientation.Difference.ANGLE_180 || forcedOrientationDifference == CBOrientation.Difference.ANGLE_90) {
                            C0173a.this.f277g.mo1493c();
                        }
                    } catch (Exception e) {
                    }
                }
            });
        }

        /* renamed from: b */
        public void mo1245b() {
            super.mo1245b();
            this.f274d = null;
            this.f275e = null;
            this.f277g = null;
        }

        /* renamed from: com.chartboost.sdk.impl.h$a$a */
        public class C0176a extends ArrayAdapter<JSONObject> {

            /* renamed from: a */
            Context f284a;

            public C0176a(Context context) {
                super(context, 0, C0168h.this.f263k);
                this.f284a = context;
            }

            public View getView(int position, View convertView, ViewGroup parent) {
                C0208t tVar;
                CBOrientation.Difference forcedOrientationDifference = C0038Chartboost.sharedChartboost().getForcedOrientationDifference();
                if (forcedOrientationDifference.isReverse()) {
                    position = (getCount() - 1) - position;
                }
                final JSONObject a = getItem(position);
                String optString = a.optString(ServerProtocol.DIALOG_PARAM_TYPE, "");
                C0178b bVar = null;
                if (convertView == null) {
                    if (optString.equals("featured")) {
                        bVar = new C0163d(this.f284a);
                    } else if (optString.equals("regular")) {
                        bVar = new C0164e(this.f284a);
                    } else if (optString.equals("webview")) {
                        bVar = new C0179i(this.f284a);
                    }
                    tVar = new C0208t(this.f284a, (View) bVar);
                } else {
                    tVar = (C0208t) convertView;
                    bVar = (C0178b) tVar.mo1502a();
                }
                bVar.mo1439a(a, position);
                C0162c cVar = (C0162c) bVar;
                if (forcedOrientationDifference.isOdd()) {
                    tVar.setLayoutParams(new AbsListView.LayoutParams(bVar.mo1438a(), -1));
                } else {
                    tVar.setLayoutParams(new AbsListView.LayoutParams(-1, bVar.mo1438a()));
                }
                C01771 r2 = new View.OnClickListener() {
                    public void onClick(View v) {
                        String optString = a.optString("deep-link");
                        if (optString == null || optString.equals("")) {
                            optString = a.optString("link");
                        }
                        if (C0168h.this.f89b != null) {
                            C0168h.this.f89b.mo1248a(optString, a);
                        }
                    }
                };
                cVar.f233a = r2;
                cVar.setOnClickListener(r2);
                if (bVar instanceof C0164e) {
                    ((C0164e) bVar).f243b.setOnClickListener(r2);
                }
                return tVar;
            }

            public int getCount() {
                return C0168h.this.f263k.size();
            }

            /* renamed from: a */
            public JSONObject getItem(int i) {
                return (JSONObject) C0168h.this.f263k.get(i);
            }
        }
    }

    public C0168h(C0069a aVar) {
        super(aVar);
        this.f92e = 3;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public C0064b.C0066b mo1230a(Context context) {
        return new C0173a(this, context, (C0173a) null);
    }

    /* renamed from: a */
    public void mo1234a(JSONObject jSONObject) {
        super.mo1234a(jSONObject);
        JSONArray optJSONArray = jSONObject.optJSONArray("cells");
        if (optJSONArray != null) {
            this.f267o = new SparseArray<>();
            C01691 r2 = new C0054e.C0056b() {
                /* renamed from: a */
                public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                    C0168h.this.f267o.put(bundle.getInt("index"), aVar);
                    C0168h.this.mo1231a(aVar);
                }
            };
            for (int i = 0; i < optJSONArray.length(); i++) {
                JSONObject optJSONObject = optJSONArray.optJSONObject(i);
                this.f263k.add(optJSONObject);
                String optString = optJSONObject.optString(ServerProtocol.DIALOG_PARAM_TYPE, "");
                if (optString.equals("regular")) {
                    JSONObject optJSONObject2 = optJSONObject.optJSONObject("assets");
                    if (optJSONObject2 != null) {
                        this.f92e++;
                        Bundle bundle = new Bundle();
                        bundle.putInt("index", i);
                        mo1235a(optJSONObject2, "icon", r2, bundle);
                    }
                } else if (optString.equals("featured")) {
                    JSONObject optJSONObject3 = optJSONObject.optJSONObject("assets");
                    if (optJSONObject3 != null) {
                        this.f92e++;
                        Bundle bundle2 = new Bundle();
                        bundle2.putInt("index", i);
                        mo1235a(optJSONObject3, Constants.PORTRAIT, r2, bundle2);
                        this.f92e++;
                        Bundle bundle3 = new Bundle();
                        bundle3.putInt("index", i);
                        mo1235a(optJSONObject3, Constants.LANDSCAPE, r2, bundle3);
                    }
                } else {
                    optString.equals("webview");
                }
            }
            C01702 r0 = new C0054e.C0056b() {
                /* renamed from: a */
                public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                    C0168h.this.f264l = aVar;
                    C0168h.this.mo1231a(aVar);
                }
            };
            C01713 r1 = new C0054e.C0056b() {
                /* renamed from: a */
                public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                    C0168h.this.f265m = aVar;
                    C0168h.this.mo1231a(aVar);
                }
            };
            C01724 r22 = new C0054e.C0056b() {
                /* renamed from: a */
                public void mo1216a(C0049a.C0050a aVar, Bundle bundle) {
                    C0168h.this.f266n = aVar;
                    C0168h.this.mo1231a(aVar);
                }
            };
            mo1232a("close", r0);
            mo1232a("header-center", r1);
            mo1232a("header-tile", r22);
        } else if (this.f91d != null) {
            this.f91d.mo1241a();
        }
    }

    /* renamed from: c */
    public void mo1238c() {
        super.mo1238c();
        this.f263k = null;
        this.f264l = null;
        this.f266n = null;
        this.f265m = null;
    }
}
