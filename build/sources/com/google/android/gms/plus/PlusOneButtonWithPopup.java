package com.google.android.gms.plus;

import android.app.PendingIntent;
import android.content.Context;
import android.os.IBinder;
import android.os.RemoteException;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1362hq;
import com.google.android.gms.internal.C1375ht;

public final class PlusOneButtonWithPopup extends ViewGroup {

    /* renamed from: DB */
    private View f3745DB;

    /* renamed from: DC */
    private int f3746DC;

    /* renamed from: DH */
    private View.OnClickListener f3747DH;

    /* renamed from: iH */
    private String f3748iH;

    /* renamed from: jG */
    private String f3749jG;
    private int mSize;

    public PlusOneButtonWithPopup(Context context) {
        this(context, (AttributeSet) null);
    }

    public PlusOneButtonWithPopup(Context context, AttributeSet attrs) {
        super(context, attrs);
        this.mSize = PlusOneButton.getSize(context, attrs);
        this.f3746DC = PlusOneButton.getAnnotation(context, attrs);
        this.f3745DB = new PlusOneDummyView(context, this.mSize);
        addView(this.f3745DB);
    }

    /* renamed from: c */
    private int m4317c(int i, int i2) {
        int mode = View.MeasureSpec.getMode(i);
        switch (mode) {
            case Integer.MIN_VALUE:
            case 1073741824:
                return View.MeasureSpec.makeMeasureSpec(View.MeasureSpec.getSize(i) - i2, mode);
            default:
                return i;
        }
    }

    /* renamed from: eL */
    private void m4318eL() {
        if (this.f3745DB != null) {
            removeView(this.f3745DB);
        }
        this.f3745DB = C1375ht.m3700a(getContext(), this.mSize, this.f3746DC, this.f3748iH, this.f3749jG);
        if (this.f3747DH != null) {
            setOnClickListener(this.f3747DH);
        }
        addView(this.f3745DB);
    }

    /* renamed from: eM */
    private C1362hq m4319eM() throws RemoteException {
        C1362hq aw = C1362hq.C1363a.m3640aw((IBinder) this.f3745DB.getTag());
        if (aw != null) {
            return aw;
        }
        if (Log.isLoggable("PlusOneButtonWithPopup", 5)) {
            Log.w("PlusOneButtonWithPopup", "Failed to get PlusOneDelegate");
        }
        throw new RemoteException();
    }

    public void cancelClick() {
        if (this.f3745DB != null) {
            try {
                m4319eM().cancelClick();
            } catch (RemoteException e) {
            }
        }
    }

    public PendingIntent getResolution() {
        if (this.f3745DB != null) {
            try {
                return m4319eM().getResolution();
            } catch (RemoteException e) {
            }
        }
        return null;
    }

    public void initialize(String url, String accountName) {
        C1102eg.m2614b(url, (Object) "Url must not be null");
        this.f3748iH = url;
        this.f3749jG = accountName;
        m4318eL();
    }

    /* access modifiers changed from: protected */
    public void onLayout(boolean changed, int left, int top, int right, int bottom) {
        this.f3745DB.layout(getPaddingLeft(), getPaddingTop(), (right - left) - getPaddingRight(), (bottom - top) - getPaddingBottom());
    }

    /* access modifiers changed from: protected */
    public void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        int paddingLeft = getPaddingLeft() + getPaddingRight();
        int paddingTop = getPaddingTop() + getPaddingBottom();
        this.f3745DB.measure(m4317c(widthMeasureSpec, paddingLeft), m4317c(heightMeasureSpec, paddingTop));
        setMeasuredDimension(paddingLeft + this.f3745DB.getMeasuredWidth(), paddingTop + this.f3745DB.getMeasuredHeight());
    }

    public void reinitialize() {
        if (this.f3745DB != null) {
            try {
                m4319eM().reinitialize();
            } catch (RemoteException e) {
            }
        }
    }

    public void setAnnotation(int annotation) {
        this.f3746DC = annotation;
        m4318eL();
    }

    public void setOnClickListener(View.OnClickListener onClickListener) {
        this.f3747DH = onClickListener;
        this.f3745DB.setOnClickListener(onClickListener);
    }

    public void setSize(int size) {
        this.mSize = size;
        m4318eL();
    }
}
