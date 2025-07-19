package com.flurry.android;

import android.content.Context;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.Arrays;
import java.util.List;

/* renamed from: com.flurry.android.o */
final class C0317o extends RelativeLayout {

    /* renamed from: a */
    private C0323u f603a;

    /* renamed from: b */
    private Context f604b;

    /* renamed from: c */
    private String f605c;

    /* renamed from: d */
    private int f606d;

    /* renamed from: e */
    private boolean f607e;

    /* renamed from: f */
    private boolean f608f;

    C0317o(C0323u uVar, Context context, String str, int i) {
        super(context);
        this.f603a = uVar;
        this.f604b = context;
        this.f605c = str;
        this.f606d = i;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public final void mo2417a() {
        if (!this.f607e) {
            C0327y c = m552c();
            if (c != null) {
                removeAllViews();
                addView(c, m551b());
                c.mo2465a().mo2419a(new C0308f((byte) 3, this.f603a.mo2453k()));
                this.f607e = true;
            } else if (!this.f608f) {
                TextView textView = new TextView(this.f604b);
                textView.setText(C0323u.f618b);
                textView.setTextSize(1, 20.0f);
                addView(textView, m551b());
            }
            this.f608f = true;
        }
    }

    /* renamed from: b */
    private static RelativeLayout.LayoutParams m551b() {
        return new RelativeLayout.LayoutParams(-1, -1);
    }

    /* renamed from: c */
    private synchronized C0327y m552c() {
        C0327y yVar;
        List a = this.f603a.mo2428a(this.f604b, Arrays.asList(new String[]{this.f605c}), (Long) null, this.f606d, false);
        if (!a.isEmpty()) {
            yVar = (C0327y) a.get(0);
            yVar.setOnClickListener(this.f603a);
        } else {
            yVar = null;
        }
        return yVar;
    }
}
