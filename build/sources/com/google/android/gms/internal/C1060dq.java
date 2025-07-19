package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.support.p000v4.view.MotionEventCompat;

/* renamed from: com.google.android.gms.internal.dq */
public final class C1060dq extends Drawable implements Drawable.Callback {

    /* renamed from: oB */
    private int f2538oB;

    /* renamed from: oC */
    private long f2539oC;

    /* renamed from: oD */
    private int f2540oD;

    /* renamed from: oE */
    private int f2541oE;

    /* renamed from: oF */
    private int f2542oF;

    /* renamed from: oG */
    private int f2543oG;

    /* renamed from: oH */
    private int f2544oH;

    /* renamed from: oI */
    private boolean f2545oI;

    /* renamed from: oJ */
    private C1064b f2546oJ;

    /* renamed from: oK */
    private Drawable f2547oK;

    /* renamed from: oL */
    private Drawable f2548oL;

    /* renamed from: oM */
    private boolean f2549oM;

    /* renamed from: oN */
    private boolean f2550oN;

    /* renamed from: oO */
    private boolean f2551oO;

    /* renamed from: oP */
    private int f2552oP;

    /* renamed from: oy */
    private boolean f2553oy;

    /* renamed from: com.google.android.gms.internal.dq$a */
    private static final class C1062a extends Drawable {
        /* access modifiers changed from: private */

        /* renamed from: oQ */
        public static final C1062a f2554oQ = new C1062a();

        /* renamed from: oR */
        private static final C1063a f2555oR = new C1063a();

        /* renamed from: com.google.android.gms.internal.dq$a$a */
        private static final class C1063a extends Drawable.ConstantState {
            private C1063a() {
            }

            public int getChangingConfigurations() {
                return 0;
            }

            public Drawable newDrawable() {
                return C1062a.f2554oQ;
            }
        }

        private C1062a() {
        }

        public void draw(Canvas canvas) {
        }

        public Drawable.ConstantState getConstantState() {
            return f2555oR;
        }

        public int getOpacity() {
            return -2;
        }

        public void setAlpha(int alpha) {
        }

        public void setColorFilter(ColorFilter cf) {
        }
    }

    /* renamed from: com.google.android.gms.internal.dq$b */
    static final class C1064b extends Drawable.ConstantState {

        /* renamed from: oS */
        int f2556oS;

        /* renamed from: oT */
        int f2557oT;

        C1064b(C1064b bVar) {
            if (bVar != null) {
                this.f2556oS = bVar.f2556oS;
                this.f2557oT = bVar.f2557oT;
            }
        }

        public int getChangingConfigurations() {
            return this.f2556oS;
        }

        public Drawable newDrawable() {
            return new C1060dq(this);
        }
    }

    public C1060dq(Drawable drawable, Drawable drawable2) {
        this((C1064b) null);
        drawable = drawable == null ? C1062a.f2554oQ : drawable;
        this.f2547oK = drawable;
        drawable.setCallback(this);
        this.f2546oJ.f2557oT |= drawable.getChangingConfigurations();
        drawable2 = drawable2 == null ? C1062a.f2554oQ : drawable2;
        this.f2548oL = drawable2;
        drawable2.setCallback(this);
        this.f2546oJ.f2557oT |= drawable2.getChangingConfigurations();
    }

    C1060dq(C1064b bVar) {
        this.f2538oB = 0;
        this.f2542oF = MotionEventCompat.ACTION_MASK;
        this.f2544oH = 0;
        this.f2553oy = true;
        this.f2546oJ = new C1064b(bVar);
    }

    /* renamed from: bC */
    public Drawable mo7404bC() {
        return this.f2548oL;
    }

    public boolean canConstantState() {
        if (!this.f2549oM) {
            this.f2550oN = (this.f2547oK.getConstantState() == null || this.f2548oL.getConstantState() == null) ? false : true;
            this.f2549oM = true;
        }
        return this.f2550oN;
    }

    public void draw(Canvas canvas) {
        boolean z = true;
        boolean z2 = false;
        switch (this.f2538oB) {
            case 1:
                this.f2539oC = SystemClock.uptimeMillis();
                this.f2538oB = 2;
                break;
            case 2:
                if (this.f2539oC >= 0) {
                    float uptimeMillis = ((float) (SystemClock.uptimeMillis() - this.f2539oC)) / ((float) this.f2543oG);
                    if (uptimeMillis < 1.0f) {
                        z = false;
                    }
                    if (z) {
                        this.f2538oB = 0;
                    }
                    this.f2544oH = (int) ((Math.min(uptimeMillis, 1.0f) * ((float) (this.f2541oE - this.f2540oD))) + ((float) this.f2540oD));
                    break;
                }
                break;
        }
        z2 = z;
        int i = this.f2544oH;
        boolean z3 = this.f2553oy;
        Drawable drawable = this.f2547oK;
        Drawable drawable2 = this.f2548oL;
        if (z2) {
            if (!z3 || i == 0) {
                drawable.draw(canvas);
            }
            if (i == this.f2542oF) {
                drawable2.setAlpha(this.f2542oF);
                drawable2.draw(canvas);
                return;
            }
            return;
        }
        if (z3) {
            drawable.setAlpha(this.f2542oF - i);
        }
        drawable.draw(canvas);
        if (z3) {
            drawable.setAlpha(this.f2542oF);
        }
        if (i > 0) {
            drawable2.setAlpha(i);
            drawable2.draw(canvas);
            drawable2.setAlpha(this.f2542oF);
        }
        invalidateSelf();
    }

    public int getChangingConfigurations() {
        return super.getChangingConfigurations() | this.f2546oJ.f2556oS | this.f2546oJ.f2557oT;
    }

    public Drawable.ConstantState getConstantState() {
        if (!canConstantState()) {
            return null;
        }
        this.f2546oJ.f2556oS = getChangingConfigurations();
        return this.f2546oJ;
    }

    public int getIntrinsicHeight() {
        return Math.max(this.f2547oK.getIntrinsicHeight(), this.f2548oL.getIntrinsicHeight());
    }

    public int getIntrinsicWidth() {
        return Math.max(this.f2547oK.getIntrinsicWidth(), this.f2548oL.getIntrinsicWidth());
    }

    public int getOpacity() {
        if (!this.f2551oO) {
            this.f2552oP = Drawable.resolveOpacity(this.f2547oK.getOpacity(), this.f2548oL.getOpacity());
            this.f2551oO = true;
        }
        return this.f2552oP;
    }

    public void invalidateDrawable(Drawable who) {
        Drawable.Callback callback;
        if (C1135fg.m2765cD() && (callback = getCallback()) != null) {
            callback.invalidateDrawable(this);
        }
    }

    public Drawable mutate() {
        if (!this.f2545oI && super.mutate() == this) {
            if (!canConstantState()) {
                throw new IllegalStateException("One or more children of this LayerDrawable does not have constant state; this drawable cannot be mutated.");
            }
            this.f2547oK.mutate();
            this.f2548oL.mutate();
            this.f2545oI = true;
        }
        return this;
    }

    /* access modifiers changed from: protected */
    public void onBoundsChange(Rect bounds) {
        this.f2547oK.setBounds(bounds);
        this.f2548oL.setBounds(bounds);
    }

    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        Drawable.Callback callback;
        if (C1135fg.m2765cD() && (callback = getCallback()) != null) {
            callback.scheduleDrawable(this, what, when);
        }
    }

    public void setAlpha(int alpha) {
        if (this.f2544oH == this.f2542oF) {
            this.f2544oH = alpha;
        }
        this.f2542oF = alpha;
        invalidateSelf();
    }

    public void setColorFilter(ColorFilter cf) {
        this.f2547oK.setColorFilter(cf);
        this.f2548oL.setColorFilter(cf);
    }

    public void startTransition(int durationMillis) {
        this.f2540oD = 0;
        this.f2541oE = this.f2542oF;
        this.f2544oH = 0;
        this.f2543oG = durationMillis;
        this.f2538oB = 1;
        invalidateSelf();
    }

    public void unscheduleDrawable(Drawable who, Runnable what) {
        Drawable.Callback callback;
        if (C1135fg.m2765cD() && (callback = getCallback()) != null) {
            callback.unscheduleDrawable(this, what);
        }
    }
}
