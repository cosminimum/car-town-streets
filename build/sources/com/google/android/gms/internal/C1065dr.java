package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.net.Uri;
import android.widget.ImageView;

/* renamed from: com.google.android.gms.internal.dr */
public final class C1065dr extends ImageView {

    /* renamed from: oU */
    private Uri f2558oU;

    /* renamed from: oV */
    private int f2559oV;

    /* renamed from: oW */
    private int f2560oW;

    /* renamed from: H */
    public void mo7429H(int i) {
        this.f2559oV = i;
    }

    /* renamed from: bE */
    public int mo7430bE() {
        return this.f2559oV;
    }

    /* renamed from: d */
    public void mo7431d(Uri uri) {
        this.f2558oU = uri;
    }

    /* access modifiers changed from: protected */
    public void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.f2560oW != 0) {
            canvas.drawColor(this.f2560oW);
        }
    }
}
