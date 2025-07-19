package com.chartboost.sdk.impl;

import android.graphics.Camera;
import android.graphics.Matrix;
import android.view.animation.Animation;
import android.view.animation.Transformation;

/* renamed from: com.chartboost.sdk.impl.p */
public class C0199p extends Animation {

    /* renamed from: a */
    private final float f337a;

    /* renamed from: b */
    private final float f338b;

    /* renamed from: c */
    private final float f339c;

    /* renamed from: d */
    private final float f340d;

    /* renamed from: e */
    private boolean f341e = true;

    /* renamed from: f */
    private Camera f342f;

    public C0199p(float f, float f2, float f3, float f4, boolean z) {
        this.f337a = f;
        this.f338b = f2;
        this.f339c = f3;
        this.f340d = f4;
        this.f341e = z;
    }

    public void initialize(int width, int height, int parentWidth, int parentHeight) {
        super.initialize(width, height, parentWidth, parentHeight);
        this.f342f = new Camera();
    }

    /* access modifiers changed from: protected */
    public void applyTransformation(float interpolatedTime, Transformation t) {
        float f = this.f337a + ((this.f338b - this.f337a) * interpolatedTime);
        Camera camera = this.f342f;
        Matrix matrix = t.getMatrix();
        camera.save();
        if (this.f341e) {
            camera.rotateY(f);
        } else {
            camera.rotateX(f);
        }
        camera.getMatrix(matrix);
        camera.restore();
        matrix.preTranslate(-this.f339c, -this.f340d);
        matrix.postTranslate(this.f339c, this.f340d);
    }
}
