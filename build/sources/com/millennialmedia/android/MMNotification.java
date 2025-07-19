package com.millennialmedia.android;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.os.Vibrator;
import com.google.android.gms.plus.PlusShare;
import java.util.HashMap;

class MMNotification extends MMJSObject implements DialogInterface.OnClickListener {
    private int index;

    MMNotification() {
    }

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

    public synchronized MMJSResponse alert(HashMap<String, String> arguments) {
        MMJSResponse response;
        final Context context = (Context) this.contextRef.get();
        final HashMap<String, String> finalArguments = arguments;
        if (context != null) {
            MMAdViewSDK.runOnUiThread(new Runnable() {
                public void run() {
                    AlertDialog alertDialog = new AlertDialog.Builder(context).create();
                    if (finalArguments.containsKey(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE)) {
                        alertDialog.setTitle((CharSequence) finalArguments.get(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE));
                    }
                    if (finalArguments.containsKey("message")) {
                        alertDialog.setMessage((CharSequence) finalArguments.get("message"));
                    }
                    if (finalArguments.containsKey("cancelButton")) {
                        alertDialog.setButton(-2, (CharSequence) finalArguments.get("cancelButton"), MMNotification.this);
                    }
                    if (finalArguments.containsKey("buttons")) {
                        String[] buttons = ((String) finalArguments.get("buttons")).split(",");
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
        Context context = (Context) this.contextRef.get();
        long time = 0;
        if (arguments.containsKey("duration")) {
            time = (long) (((double) Float.parseFloat(arguments.get("duration"))) * 1000.0d);
        }
        if (context == null || time <= 0) {
            return null;
        }
        if (context.getPackageManager().checkPermission("android.permission.VIBRATE", context.getPackageName()) != 0) {
            return MMJSResponse.responseWithError("The required permissions to vibrate are not set.");
        }
        ((Vibrator) context.getSystemService("vibrator")).vibrate(time);
        return MMJSResponse.responseWithSuccess();
    }
}
