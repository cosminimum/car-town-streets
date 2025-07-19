package com.google.android.gms.internal;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.DialogInterface;
import android.content.Intent;
import android.util.Log;

/* renamed from: com.google.android.gms.internal.du */
public class C1069du implements DialogInterface.OnClickListener {

    /* renamed from: gs */
    private final Activity f2568gs;
    private final Intent mIntent;

    /* renamed from: oZ */
    private final int f2569oZ;

    public C1069du(Activity activity, Intent intent, int i) {
        this.f2568gs = activity;
        this.mIntent = intent;
        this.f2569oZ = i;
    }

    public void onClick(DialogInterface dialog, int which) {
        try {
            if (this.mIntent != null) {
                this.f2568gs.startActivityForResult(this.mIntent, this.f2569oZ);
            }
            dialog.dismiss();
        } catch (ActivityNotFoundException e) {
            Log.e("SettingsRedirect", "Can't redirect to app settings for Google Play services");
        }
    }
}
