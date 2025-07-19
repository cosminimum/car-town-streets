package com.google.android.gms.internal;

import android.graphics.Canvas;
import android.net.Uri;
import android.widget.ImageView;
/* loaded from: classes.dex */
public final class dr extends ImageView {
    private Uri oU;
    private int oV;
    private int oW;

    public void H(int i) {
        this.oV = i;
    }

    public int bE() {
        return this.oV;
    }

    public void d(Uri uri) {
        this.oU = uri;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.oW != 0) {
            canvas.drawColor(this.oW);
        }
    }
}
