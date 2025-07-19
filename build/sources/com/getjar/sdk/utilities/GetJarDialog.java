package com.getjar.sdk.utilities;

import android.app.Dialog;
import android.content.Context;
import android.view.View;
import com.facebook.widget.WebDialog;

public class GetJarDialog extends Dialog implements View.OnClickListener {
    public GetJarDialog(Context context, View v) {
        super(context, WebDialog.DEFAULT_THEME);
        if (context == null) {
            throw new IllegalArgumentException("'context' can not be null");
        } else if (v == null) {
            throw new IllegalArgumentException("'v' can not be null");
        } else {
            requestWindowFeature(1);
            setContentView(v);
        }
    }

    public void onClick(View v) {
    }
}
