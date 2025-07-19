package com.google.android.gms.common;

import android.content.Context;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import com.google.android.gms.dynamic.e;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.eh;
import com.google.android.gms.internal.ei;

public final class SignInButton extends FrameLayout implements View.OnClickListener {
    public static final int COLOR_DARK = 0;
    public static final int COLOR_LIGHT = 1;
    public static final int SIZE_ICON_ONLY = 2;
    public static final int SIZE_STANDARD = 0;
    public static final int SIZE_WIDE = 1;
    private int mP;
    private View mQ;
    private View.OnClickListener mR;
    private int mSize;

    public SignInButton(Context context) {
        this(context, (AttributeSet) null);
    }

    public SignInButton(Context context, AttributeSet attrs) {
        this(context, attrs, 0);
    }

    public SignInButton(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        this.mR = null;
        setStyle(0, 0);
    }

    private static Button c(Context context, int i, int i2) {
        ei eiVar = new ei(context);
        eiVar.a(context.getResources(), i, i2);
        return eiVar;
    }

    private void p(Context context) {
        if (this.mQ != null) {
            removeView(this.mQ);
        }
        try {
            this.mQ = eh.d(context, this.mSize, this.mP);
        } catch (e.a e) {
            Log.w("SignInButton", "Sign in button not found, using placeholder instead");
            this.mQ = c(context, this.mSize, this.mP);
        }
        addView(this.mQ);
        this.mQ.setEnabled(isEnabled());
        this.mQ.setOnClickListener(this);
    }

    public void onClick(View view) {
        if (this.mR != null && view == this.mQ) {
            this.mR.onClick(this);
        }
    }

    public void setColorScheme(int colorScheme) {
        setStyle(this.mSize, colorScheme);
    }

    public void setEnabled(boolean enabled) {
        super.setEnabled(enabled);
        this.mQ.setEnabled(enabled);
    }

    public void setOnClickListener(View.OnClickListener listener) {
        this.mR = listener;
        if (this.mQ != null) {
            this.mQ.setOnClickListener(this);
        }
    }

    public void setSize(int buttonSize) {
        setStyle(buttonSize, this.mP);
    }

    public void setStyle(int buttonSize, int colorScheme) {
        boolean z = true;
        eg.a(buttonSize >= 0 && buttonSize < 3, "Unknown button size " + buttonSize);
        if (colorScheme < 0 || colorScheme >= 2) {
            z = false;
        }
        eg.a(z, "Unknown color scheme " + colorScheme);
        this.mSize = buttonSize;
        this.mP = colorScheme;
        p(getContext());
    }
}
