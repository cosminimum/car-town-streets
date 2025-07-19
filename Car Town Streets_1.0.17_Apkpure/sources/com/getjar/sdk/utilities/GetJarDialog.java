package com.getjar.sdk.utilities;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import com.facebook.widget.WebDialog;
/* loaded from: classes.dex */
public class GetJarDialog extends Dialog implements View.OnClickListener {
    public GetJarDialog(Context context, View v) {
        super(context, WebDialog.DEFAULT_THEME);
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be null");
        }
        if (v == null) {
            throw new IllegalArgumentException("'v' can not be null");
        }
        requestWindowFeature(1);
        setContentView(v);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
    }
}
