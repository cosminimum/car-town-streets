package com.flurry.android;

import android.view.View;
import android.widget.TextView;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ac implements View.OnFocusChangeListener {
    private /* synthetic */ TextView a;
    private /* synthetic */ ab b;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ac(ab abVar, TextView textView) {
        this.b = abVar;
        this.a = textView;
    }

    @Override // android.view.View.OnFocusChangeListener
    public final void onFocusChange(View view, boolean z) {
        this.a.setText(z ? this.b.b : this.b.a);
    }
}
