package com.chartboost.sdk.impl;

import android.content.Context;
import android.graphics.Typeface;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.CBOrientation;
import com.chartboost.sdk.impl.C0204s;

/* renamed from: com.chartboost.sdk.impl.r */
public class C0203r extends LinearLayout implements C0204s.C0207a {

    /* renamed from: d */
    private static /* synthetic */ int[] f355d;

    /* renamed from: a */
    private TextView f356a;

    /* renamed from: b */
    private C0208t f357b;

    /* renamed from: c */
    private C0209u f358c;

    /* renamed from: b */
    static /* synthetic */ int[] m441b() {
        int[] iArr = f355d;
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
            f355d = iArr;
        }
        return iArr;
    }

    public C0203r(Context context) {
        super(context);
        m440a(context);
    }

    /* renamed from: a */
    private void m440a(Context context) {
        setGravity(17);
        this.f356a = new TextView(getContext());
        this.f356a.setTextColor(-1);
        this.f356a.setTextSize(2, 16.0f);
        this.f356a.setTypeface((Typeface) null, 1);
        this.f356a.setText("Loading...");
        this.f356a.setGravity(17);
        this.f357b = new C0208t(context, this.f356a);
        this.f358c = new C0209u(getContext());
        addView(this.f357b);
        addView(this.f358c);
        mo1242a();
    }

    /* renamed from: a */
    public void mo1242a() {
        removeView(this.f357b);
        removeView(this.f358c);
        float f = getContext().getResources().getDisplayMetrics().density;
        int round = Math.round(20.0f * f);
        switch (m441b()[C0038Chartboost.sharedChartboost().getForcedOrientationDifference().ordinal()]) {
            case 2:
                setOrientation(0);
                LinearLayout.LayoutParams layoutParams = new LinearLayout.LayoutParams(Math.round(f * 32.0f), -1);
                layoutParams.setMargins(round, round, 0, round);
                addView(this.f358c, layoutParams);
                LinearLayout.LayoutParams layoutParams2 = new LinearLayout.LayoutParams(-2, -1);
                layoutParams2.setMargins(round, round, round, round);
                addView(this.f357b, layoutParams2);
                return;
            case 3:
                setOrientation(1);
                LinearLayout.LayoutParams layoutParams3 = new LinearLayout.LayoutParams(-1, Math.round(f * 32.0f));
                layoutParams3.setMargins(round, round, round, 0);
                addView(this.f358c, layoutParams3);
                LinearLayout.LayoutParams layoutParams4 = new LinearLayout.LayoutParams(-1, -2);
                layoutParams4.setMargins(round, round, round, round);
                addView(this.f357b, layoutParams4);
                return;
            case 4:
                setOrientation(0);
                LinearLayout.LayoutParams layoutParams5 = new LinearLayout.LayoutParams(-2, -1);
                layoutParams5.setMargins(round, round, 0, round);
                addView(this.f357b, layoutParams5);
                LinearLayout.LayoutParams layoutParams6 = new LinearLayout.LayoutParams(Math.round(f * 32.0f), -1);
                layoutParams6.setMargins(round, round, round, round);
                addView(this.f358c, layoutParams6);
                return;
            default:
                setOrientation(1);
                LinearLayout.LayoutParams layoutParams7 = new LinearLayout.LayoutParams(-1, -2);
                layoutParams7.setMargins(round, round, round, 0);
                addView(this.f357b, layoutParams7);
                LinearLayout.LayoutParams layoutParams8 = new LinearLayout.LayoutParams(-1, Math.round(f * 32.0f));
                layoutParams8.setMargins(round, round, round, round);
                addView(this.f358c, layoutParams8);
                return;
        }
    }
}
