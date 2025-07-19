package com.google.android.gms.internal;

import android.view.View;
import android.webkit.WebChromeClient;
/* loaded from: classes.dex */
public final class da extends cy {
    public da(cw cwVar) {
        super(cwVar);
    }

    @Override // android.webkit.WebChromeClient
    public void onShowCustomView(View view, int requestedOrientation, WebChromeClient.CustomViewCallback customViewCallback) {
        a(view, requestedOrientation, customViewCallback);
    }
}
