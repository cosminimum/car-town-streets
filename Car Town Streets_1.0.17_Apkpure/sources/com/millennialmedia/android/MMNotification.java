package com.millennialmedia.android;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Vibrator;
import com.google.android.gms.plus.PlusShare;
import java.util.HashMap;
/* loaded from: classes.dex */
class MMNotification extends MMJSObject implements DialogInterface.OnClickListener {
    private int index;

    MMNotification() {
    }

    @Override // android.content.DialogInterface.OnClickListener
    public synchronized void onClick(DialogInterface dialog, int which) {
        if (which == -2) {
            this.index = 0;
        }
        if (which == -3) {
            this.index = 1;
        }
        if (which == -1) {
            this.index = 2;
        }
        dialog.cancel();
        notify();
    }

    public synchronized MMJSResponse alert(final HashMap<String, String> arguments) {
        MMJSResponse response;
        final Context context = this.contextRef.get();
        if (context != null) {
            MMAdViewSDK.runOnUiThread(new Runnable() { // from class: com.millennialmedia.android.MMNotification.1
                @Override // java.lang.Runnable
                public void run() {
                    AlertDialog alertDialog = new AlertDialog.Builder(context).create();
                    if (arguments.containsKey(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE)) {
                        alertDialog.setTitle((CharSequence) arguments.get(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE));
                    }
                    if (arguments.containsKey("message")) {
                        alertDialog.setMessage((CharSequence) arguments.get("message"));
                    }
                    if (arguments.containsKey("cancelButton")) {
                        alertDialog.setButton(-2, (CharSequence) arguments.get("cancelButton"), MMNotification.this);
                    }
                    if (arguments.containsKey("buttons")) {
                        String[] buttons = ((String) arguments.get("buttons")).split(",");
                        if (buttons.length > 0) {
                            alertDialog.setButton(-3, buttons[0], MMNotification.this);
                        }
                        if (buttons.length > 1) {
                            alertDialog.setButton(-1, buttons[1], MMNotification.this);
                        }
                    }
                    alertDialog.show();
                }
            });
            try {
                wait();
                response = new MMJSResponse();
                response.result = 1;
                response.response = new Integer(this.index);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        response = null;
        return response;
    }

    public MMJSResponse vibrate(HashMap<String, String> arguments) {
        Context context = this.contextRef.get();
        long time = 0;
        if (arguments.containsKey("duration")) {
            time = (long) (Float.parseFloat(arguments.get("duration")) * 1000.0d);
        }
        if (context != null && time > 0) {
            if (context.getPackageManager().checkPermission("android.permission.VIBRATE", context.getPackageName()) == 0) {
                Vibrator vibrator = (Vibrator) context.getSystemService("vibrator");
                vibrator.vibrate(time);
                return MMJSResponse.responseWithSuccess();
            }
            return MMJSResponse.responseWithError("The required permissions to vibrate are not set.");
        }
        return null;
    }
}
