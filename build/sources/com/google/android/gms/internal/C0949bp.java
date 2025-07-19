package com.google.android.gms.internal;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import android.widget.ImageButton;

/* renamed from: com.google.android.gms.internal.bp */
public final class C0949bp extends FrameLayout implements View.OnClickListener {

    /* renamed from: gZ */
    private final ImageButton f2276gZ;

    /* renamed from: gs */
    private final Activity f2277gs;

    public C0949bp(Activity activity, int i) {
        super(activity);
        this.f2277gs = activity;
        setOnClickListener(this);
        this.f2276gZ = new ImageButton(activity);
        this.f2276gZ.setImageResource(17301527);
        this.f2276gZ.setBackgroundColor(0);
        this.f2276gZ.setOnClickListener(this);
        this.f2276gZ.setPadding(0, 0, 0, 0);
        int a = C1003cs.m2202a((Context) activity, i);
        addView(this.f2276gZ, new FrameLayout.LayoutParams(a, a, 17));
    }

    /* renamed from: g */
    public void mo7176g(boolean z) {
        this.f2276gZ.setVisibility(z ? 4 : 0);
    }

    public void onClick(View view) {
        this.f2277gs.finish();
    }
}
