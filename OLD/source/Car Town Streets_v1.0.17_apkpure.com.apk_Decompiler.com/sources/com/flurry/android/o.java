package com.flurry.android;

import android.content.Context;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.Arrays;
import java.util.List;

final class o extends RelativeLayout {
    private u a;
    private Context b;
    private String c;
    private int d;
    private boolean e;
    private boolean f;

    o(u uVar, Context context, String str, int i) {
        super(context);
        this.a = uVar;
        this.b = context;
        this.c = str;
        this.d = i;
    }

    /* access modifiers changed from: package-private */
    public final void a() {
        if (!this.e) {
            y c2 = c();
            if (c2 != null) {
                removeAllViews();
                addView(c2, b());
                c2.a().a(new f((byte) 3, this.a.k()));
                this.e = true;
            } else if (!this.f) {
                TextView textView = new TextView(this.b);
                textView.setText(u.b);
                textView.setTextSize(1, 20.0f);
                addView(textView, b());
            }
            this.f = true;
        }
    }

    private static RelativeLayout.LayoutParams b() {
        return new RelativeLayout.LayoutParams(-1, -1);
    }

    private synchronized y c() {
        y yVar;
        List a2 = this.a.a(this.b, Arrays.asList(new String[]{this.c}), (Long) null, this.d, false);
        if (!a2.isEmpty()) {
            yVar = (y) a2.get(0);
            yVar.setOnClickListener(this.a);
        } else {
            yVar = null;
        }
        return yVar;
    }
}
