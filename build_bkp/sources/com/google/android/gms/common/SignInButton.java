package com.google.android.gms.common;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import com.google.android.gms.dynamic.C0777e;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1103eh;
import com.google.android.gms.internal.C1104ei;

public final class SignInButton extends FrameLayout implements View.OnClickListener {
    public static final int COLOR_DARK = 0;
    public static final int COLOR_LIGHT = 1;
    public static final int SIZE_ICON_ONLY = 2;
    public static final int SIZE_STANDARD = 0;
    public static final int SIZE_WIDE = 1;

    /* renamed from: mP */
    private int f1315mP;

    /* renamed from: mQ */
    private View f1316mQ;

    /* renamed from: mR */
    private View.OnClickListener f1317mR;
    private int mSize;

    public SignInButton(Context context) {
        this(context, (AttributeSet) null);
    }

    public SignInButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SignInButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.f1317mR = null;
        setStyle(0, 0);
    }

    /* renamed from: c */
    private static Button m1241c(Context context, int i, int i2) {
        C1104ei eiVar = new C1104ei(context);
        eiVar.mo7542a(context.getResources(), i, i2);
        return eiVar;
    }

    /* renamed from: p */
    private void m1242p(Context context) {
        if (this.f1316mQ != null) {
            removeView(this.f1316mQ);
        }
        try {
            this.f1316mQ = C1103eh.m2619d(context, this.mSize, this.f1315mP);
        } catch (C0777e.C0778a e) {
            Log.w("SignInButton", "Sign in button not found, using placeholder instead");
            this.f1316mQ = m1241c(context, this.mSize, this.f1315mP);
        }
        addView(this.f1316mQ);
        this.f1316mQ.setEnabled(isEnabled());
        this.f1316mQ.setOnClickListener(this);
    }

    public void onClick(View view) {
        if (this.f1317mR != null && view == this.f1316mQ) {
            this.f1317mR.onClick(this);
        }
    }

    public void setColorScheme(int colorScheme) {
        setStyle(this.mSize, colorScheme);
    }

    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        this.f1316mQ.setEnabled(enabled);
    }

    public void setOnClickListener(View.OnClickListener listener) {
        this.f1317mR = listener;
        if (this.f1316mQ != null) {
            this.f1316mQ.setOnClickListener(this);
        }
    }

    public void setSize(int buttonSize) {
        setStyle(buttonSize, this.f1315mP);
    }

    public void setStyle(int buttonSize, int colorScheme) {
        boolean z = true;
        C1102eg.m2612a(buttonSize >= 0 && buttonSize < 3, "Unknown button size " + buttonSize);
        if (colorScheme < 0 || colorScheme >= 2) {
            z = false;
        }
        C1102eg.m2612a(z, "Unknown color scheme " + colorScheme);
        this.mSize = buttonSize;
        this.f1315mP = colorScheme;
        m1242p(getContext());
    }
}
