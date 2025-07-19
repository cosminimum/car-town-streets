package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.Rect;
import android.graphics.drawable.Drawable;
import android.os.SystemClock;
import android.support.v4.view.MotionEventCompat;
/* loaded from: classes.dex */
public final class dq extends Drawable implements Drawable.Callback {
    private int oB;
    private long oC;
    private int oD;
    private int oE;
    private int oF;
    private int oG;
    private int oH;
    private boolean oI;
    private b oJ;
    private Drawable oK;
    private Drawable oL;
    private boolean oM;
    private boolean oN;
    private boolean oO;
    private int oP;
    private boolean oy;

    /* loaded from: classes.dex */
    private static final class a extends Drawable {
        private static final a oQ = new a();
        private static final C0034a oR = new C0034a();

        /* renamed from: com.google.android.gms.internal.dq$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        private static final class C0034a extends Drawable.ConstantState {
            private C0034a() {
            }

            @Override // android.graphics.drawable.Drawable.ConstantState
            public int getChangingConfigurations() {
                return 0;
            }

            @Override // android.graphics.drawable.Drawable.ConstantState
            public Drawable newDrawable() {
                return a.oQ;
            }
        }

        private a() {
        }

        @Override // android.graphics.drawable.Drawable
        public void draw(Canvas canvas) {
        }

        @Override // android.graphics.drawable.Drawable
        public Drawable.ConstantState getConstantState() {
            return oR;
        }

        @Override // android.graphics.drawable.Drawable
        public int getOpacity() {
            return -2;
        }

        @Override // android.graphics.drawable.Drawable
        public void setAlpha(int alpha) {
        }

        @Override // android.graphics.drawable.Drawable
        public void setColorFilter(ColorFilter cf) {
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static final class b extends Drawable.ConstantState {
        int oS;
        int oT;

        b(b bVar) {
            if (bVar != null) {
                this.oS = bVar.oS;
                this.oT = bVar.oT;
            }
        }

        @Override // android.graphics.drawable.Drawable.ConstantState
        public int getChangingConfigurations() {
            return this.oS;
        }

        @Override // android.graphics.drawable.Drawable.ConstantState
        public Drawable newDrawable() {
            return new dq(this);
        }
    }

    public dq(Drawable drawable, Drawable drawable2) {
        this(null);
        drawable = drawable == null ? a.oQ : drawable;
        this.oK = drawable;
        drawable.setCallback(this);
        this.oJ.oT |= drawable.getChangingConfigurations();
        drawable2 = drawable2 == null ? a.oQ : drawable2;
        this.oL = drawable2;
        drawable2.setCallback(this);
        this.oJ.oT |= drawable2.getChangingConfigurations();
    }

    dq(b bVar) {
        this.oB = 0;
        this.oF = MotionEventCompat.ACTION_MASK;
        this.oH = 0;
        this.oy = true;
        this.oJ = new b(bVar);
    }

    public Drawable bC() {
        return this.oL;
    }

    public boolean canConstantState() {
        if (!this.oM) {
            this.oN = (this.oK.getConstantState() == null || this.oL.getConstantState() == null) ? false : true;
            this.oM = true;
        }
        return this.oN;
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(Canvas canvas) {
        boolean z = true;
        boolean z2 = false;
        switch (this.oB) {
            case 1:
                this.oC = SystemClock.uptimeMillis();
                this.oB = 2;
                break;
            case 2:
                if (this.oC >= 0) {
                    float uptimeMillis = ((float) (SystemClock.uptimeMillis() - this.oC)) / this.oG;
                    if (uptimeMillis < 1.0f) {
                        z = false;
                    }
                    if (z) {
                        this.oB = 0;
                    }
                    this.oH = (int) ((Math.min(uptimeMillis, 1.0f) * (this.oE - this.oD)) + this.oD);
                }
            default:
                z2 = z;
                break;
        }
        int i = this.oH;
        boolean z3 = this.oy;
        Drawable drawable = this.oK;
        Drawable drawable2 = this.oL;
        if (z2) {
            if (!z3 || i == 0) {
                drawable.draw(canvas);
            }
            if (i != this.oF) {
                return;
            }
            drawable2.setAlpha(this.oF);
            drawable2.draw(canvas);
            return;
        }
        if (z3) {
            drawable.setAlpha(this.oF - i);
        }
        drawable.draw(canvas);
        if (z3) {
            drawable.setAlpha(this.oF);
        }
        if (i > 0) {
            drawable2.setAlpha(i);
            drawable2.draw(canvas);
            drawable2.setAlpha(this.oF);
        }
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public int getChangingConfigurations() {
        return super.getChangingConfigurations() | this.oJ.oS | this.oJ.oT;
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable.ConstantState getConstantState() {
        if (canConstantState()) {
            this.oJ.oS = getChangingConfigurations();
            return this.oJ;
        }
        return null;
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicHeight() {
        return Math.max(this.oK.getIntrinsicHeight(), this.oL.getIntrinsicHeight());
    }

    @Override // android.graphics.drawable.Drawable
    public int getIntrinsicWidth() {
        return Math.max(this.oK.getIntrinsicWidth(), this.oL.getIntrinsicWidth());
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        if (!this.oO) {
            this.oP = Drawable.resolveOpacity(this.oK.getOpacity(), this.oL.getOpacity());
            this.oO = true;
        }
        return this.oP;
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void invalidateDrawable(Drawable who) {
        Drawable.Callback callback;
        if (!fg.cD() || (callback = getCallback()) == null) {
            return;
        }
        callback.invalidateDrawable(this);
    }

    @Override // android.graphics.drawable.Drawable
    public Drawable mutate() {
        if (!this.oI && super.mutate() == this) {
            if (!canConstantState()) {
                throw new IllegalStateException("One or more children of this LayerDrawable does not have constant state; this drawable cannot be mutated.");
            }
            this.oK.mutate();
            this.oL.mutate();
            this.oI = true;
        }
        return this;
    }

    @Override // android.graphics.drawable.Drawable
    protected void onBoundsChange(Rect bounds) {
        this.oK.setBounds(bounds);
        this.oL.setBounds(bounds);
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void scheduleDrawable(Drawable who, Runnable what, long when) {
        Drawable.Callback callback;
        if (!fg.cD() || (callback = getCallback()) == null) {
            return;
        }
        callback.scheduleDrawable(this, what, when);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        if (this.oH == this.oF) {
            this.oH = alpha;
        }
        this.oF = alpha;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter cf) {
        this.oK.setColorFilter(cf);
        this.oL.setColorFilter(cf);
    }

    public void startTransition(int durationMillis) {
        this.oD = 0;
        this.oE = this.oF;
        this.oH = 0;
        this.oG = durationMillis;
        this.oB = 1;
        invalidateSelf();
    }

    @Override // android.graphics.drawable.Drawable.Callback
    public void unscheduleDrawable(Drawable who, Runnable what) {
        Drawable.Callback callback;
        if (!fg.cD() || (callback = getCallback()) == null) {
            return;
        }
        callback.unscheduleDrawable(this, what);
    }
}
