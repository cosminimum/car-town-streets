package com.google.android.gms.internal;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.Typeface;
import android.util.AttributeSet;
import android.widget.Button;
import com.google.android.gms.C0585R;

/* renamed from: com.google.android.gms.internal.ei */
public final class C1104ei extends Button {
    public C1104ei(Context context) {
        this(context, (AttributeSet) null);
    }

    public C1104ei(Context context, AttributeSet attributeSet) {
        super(context, attributeSet, 16842824);
    }

    /* renamed from: b */
    private int m2623b(int i, int i2, int i3) {
        switch (i) {
            case 0:
                return i2;
            case 1:
                return i3;
            default:
                throw new IllegalStateException("Unknown color scheme: " + i);
        }
    }

    /* renamed from: b */
    private void m2624b(Resources resources, int i, int i2) {
        int b;
        switch (i) {
            case 0:
            case 1:
                b = m2623b(i2, C0585R.drawable.common_signin_btn_text_dark, C0585R.drawable.common_signin_btn_text_light);
                break;
            case 2:
                b = m2623b(i2, C0585R.drawable.common_signin_btn_icon_dark, C0585R.drawable.common_signin_btn_icon_light);
                break;
            default:
                throw new IllegalStateException("Unknown button size: " + i);
        }
        if (b == -1) {
            throw new IllegalStateException("Could not find background resource!");
        }
        setBackgroundDrawable(resources.getDrawable(b));
    }

    /* renamed from: c */
    private void m2625c(Resources resources) {
        setTypeface(Typeface.DEFAULT_BOLD);
        setTextSize(14.0f);
        float f = resources.getDisplayMetrics().density;
        setMinHeight((int) ((f * 48.0f) + 0.5f));
        setMinWidth((int) ((f * 48.0f) + 0.5f));
    }

    /* renamed from: c */
    private void m2626c(Resources resources, int i, int i2) {
        setTextColor(resources.getColorStateList(m2623b(i2, C0585R.color.common_signin_btn_text_dark, C0585R.color.common_signin_btn_text_light)));
        switch (i) {
            case 0:
                setText(resources.getString(C0585R.string.common_signin_button_text));
                return;
            case 1:
                setText(resources.getString(C0585R.string.common_signin_button_text_long));
                return;
            case 2:
                setText((CharSequence) null);
                return;
            default:
                throw new IllegalStateException("Unknown button size: " + i);
        }
    }

    /* renamed from: a */
    public void mo7542a(Resources resources, int i, int i2) {
        boolean z = true;
        C1102eg.m2612a(i >= 0 && i < 3, "Unknown button size " + i);
        if (i2 < 0 || i2 >= 2) {
            z = false;
        }
        C1102eg.m2612a(z, "Unknown color scheme " + i2);
        m2625c(resources);
        m2624b(resources, i, i2);
        m2626c(resources, i, i2);
    }
}
