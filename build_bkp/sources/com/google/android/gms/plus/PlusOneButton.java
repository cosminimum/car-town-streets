package com.google.android.gms.plus;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.util.AttributeSet;
import android.view.View;
import android.widget.FrameLayout;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1105ej;
import com.google.android.gms.internal.C1375ht;
import com.tapjoy.TapjoyConstants;

public final class PlusOneButton extends FrameLayout {
    public static final int ANNOTATION_BUBBLE = 1;
    public static final int ANNOTATION_INLINE = 2;
    public static final int ANNOTATION_NONE = 0;
    public static final int DEFAULT_ACTIVITY_REQUEST_CODE = -1;
    public static final int SIZE_MEDIUM = 1;
    public static final int SIZE_SMALL = 0;
    public static final int SIZE_STANDARD = 3;
    public static final int SIZE_TALL = 2;
    /* access modifiers changed from: private */

    /* renamed from: DB */
    public View f3738DB;

    /* renamed from: DC */
    private int f3739DC;
    /* access modifiers changed from: private */

    /* renamed from: DD */
    public int f3740DD;

    /* renamed from: DE */
    private OnPlusOneClickListener f3741DE;

    /* renamed from: iH */
    private String f3742iH;
    private int mSize;

    protected class DefaultOnPlusOneClickListener implements View.OnClickListener, OnPlusOneClickListener {

        /* renamed from: DF */
        private final OnPlusOneClickListener f3743DF;

        public DefaultOnPlusOneClickListener(OnPlusOneClickListener proxy) {
            this.f3743DF = proxy;
        }

        public void onClick(View view) {
            Intent intent = (Intent) PlusOneButton.this.f3738DB.getTag();
            if (this.f3743DF != null) {
                this.f3743DF.onPlusOneClick(intent);
            } else {
                onPlusOneClick(intent);
            }
        }

        public void onPlusOneClick(Intent intent) {
            Context context = PlusOneButton.this.getContext();
            if ((context instanceof Activity) && intent != null) {
                ((Activity) context).startActivityForResult(intent, PlusOneButton.this.f3740DD);
            }
        }
    }

    public interface OnPlusOneClickListener {
        void onPlusOneClick(Intent intent);
    }

    public PlusOneButton(Context context) {
        this(context, (AttributeSet) null);
    }

    public PlusOneButton(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mSize = getSize(context, attrs);
        this.f3739DC = getAnnotation(context, attrs);
        this.f3740DD = -1;
        m4316p(getContext());
        if (isInEditMode()) {
        }
    }

    protected static int getAnnotation(Context context, AttributeSet attrs) {
        String a = C1105ej.m2628a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", "annotation", context, attrs, true, false, "PlusOneButton");
        if ("INLINE".equalsIgnoreCase(a)) {
            return 2;
        }
        return !"NONE".equalsIgnoreCase(a) ? 1 : 0;
    }

    protected static int getSize(Context context, AttributeSet attrs) {
        String a = C1105ej.m2628a("http://schemas.android.com/apk/lib/com.google.android.gms.plus", TapjoyConstants.TJC_DISPLAY_AD_SIZE, context, attrs, true, false, "PlusOneButton");
        if ("SMALL".equalsIgnoreCase(a)) {
            return 0;
        }
        if ("MEDIUM".equalsIgnoreCase(a)) {
            return 1;
        }
        return "TALL".equalsIgnoreCase(a) ? 2 : 3;
    }

    /* renamed from: p */
    private void m4316p(Context context) {
        if (this.f3738DB != null) {
            removeView(this.f3738DB);
        }
        this.f3738DB = C1375ht.m3699a(context, this.mSize, this.f3739DC, this.f3742iH, this.f3740DD);
        setOnPlusOneClickListener(this.f3741DE);
        addView(this.f3738DB);
    }

    public void initialize(String url, int activityRequestCode) {
        C1102eg.m2612a(getContext() instanceof Activity, "To use this method, the PlusOneButton must be placed in an Activity. Use initialize(PlusClient, String, OnPlusOneClickListener).");
        this.f3742iH = url;
        this.f3740DD = activityRequestCode;
        m4316p(getContext());
    }

    public void initialize(String url, OnPlusOneClickListener plusOneClickListener) {
        this.f3742iH = url;
        this.f3740DD = 0;
        m4316p(getContext());
        setOnPlusOneClickListener(plusOneClickListener);
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        this.f3738DB.layout(0, 0, right - left, bottom - top);
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        View view = this.f3738DB;
        measureChild(view, widthMeasureSpec, heightMeasureSpec);
        setMeasuredDimension(view.getMeasuredWidth(), view.getMeasuredHeight());
    }

    public void setAnnotation(int annotation) {
        this.f3739DC = annotation;
        m4316p(getContext());
    }

    public void setOnPlusOneClickListener(OnPlusOneClickListener listener) {
        this.f3741DE = listener;
        this.f3738DB.setOnClickListener(new DefaultOnPlusOneClickListener(listener));
    }

    public void setSize(int size) {
        this.mSize = size;
        m4316p(getContext());
    }
}
