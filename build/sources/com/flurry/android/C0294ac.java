package com.flurry.android;

import android.view.View;
import android.widget.TextView;

/* renamed from: com.flurry.android.ac */
final class C0294ac implements View.OnFocusChangeListener {

    /* renamed from: a */
    private /* synthetic */ TextView f496a;

    /* renamed from: b */
    private /* synthetic */ C0293ab f497b;

    C0294ac(C0293ab abVar, TextView textView) {
        this.f497b = abVar;
        this.f496a = textView;
    }

    public final void onFocusChange(View view, boolean z) {
        this.f496a.setText(z ? this.f497b.f495b : this.f497b.f494a);
    }
}
