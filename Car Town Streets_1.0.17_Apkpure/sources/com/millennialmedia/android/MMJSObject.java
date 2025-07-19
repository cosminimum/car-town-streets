package com.millennialmedia.android;

import android.content.Context;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
class MMJSObject {
    protected WeakReference<Context> contextRef;

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setContext(Context context) {
        this.contextRef = new WeakReference<>(context);
    }
}
