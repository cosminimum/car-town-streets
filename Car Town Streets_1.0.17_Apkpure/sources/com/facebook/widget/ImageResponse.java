package com.facebook.widget;

import android.graphics.Bitmap;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class ImageResponse {
    private Bitmap bitmap;
    private Exception error;
    private boolean isCachedRedirect;
    private ImageRequest request;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ImageResponse(ImageRequest request, Exception error, boolean isCachedRedirect, Bitmap bitmap) {
        this.request = request;
        this.error = error;
        this.bitmap = bitmap;
        this.isCachedRedirect = isCachedRedirect;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ImageRequest getRequest() {
        return this.request;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Exception getError() {
        return this.error;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Bitmap getBitmap() {
        return this.bitmap;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isCachedRedirect() {
        return this.isCachedRedirect;
    }
}
