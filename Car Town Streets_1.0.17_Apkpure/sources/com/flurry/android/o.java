package com.flurry.android;

import android.content.Context;
import android.widget.RelativeLayout;
import android.widget.TextView;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
final class o extends RelativeLayout {
    private u a;
    private Context b;
    private String c;
    private int d;
    private boolean e;
    private boolean f;

    /* JADX INFO: Access modifiers changed from: package-private */
    public o(u uVar, Context context, String str, int i) {
        super(context);
        this.a = uVar;
        this.b = context;
        this.c = str;
        this.d = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public final void a() {
        if (!this.e) {
            y c = c();
            if (c != null) {
                removeAllViews();
                addView(c, b());
                c.a().a(new f((byte) 3, this.a.k()));
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
        List a = this.a.a(this.b, Arrays.asList(this.c), null, this.d, false);
        if (!a.isEmpty()) {
            yVar = (y) a.get(0);
            yVar.setOnClickListener(this.a);
        } else {
            yVar = null;
        }
        return yVar;
    }
}
