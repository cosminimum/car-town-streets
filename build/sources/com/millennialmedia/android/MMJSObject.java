package com.millennialmedia.android;

import android.content.Context;
import java.lang.ref.WeakReference;

class MMJSObject {
    protected WeakReference<Context> contextRef;

    MMJSObject() {
    }

    /* access modifiers changed from: package-private */
    public void setContext(Context context) {
        this.contextRef = new WeakReference<>(context);
    }
}
