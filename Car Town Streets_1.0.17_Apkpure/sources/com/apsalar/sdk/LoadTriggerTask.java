package com.apsalar.sdk;

import android.content.Context;
import android.content.Intent;
import android.os.AsyncTask;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApLoader.java */
/* loaded from: classes.dex */
public class LoadTriggerTask extends AsyncTask<String, Void, String[]> {
    private Context context;
    private ApsalarSessionInfo info;
    private Boolean ready = null;
    private String triggerName = null;

    public LoadTriggerTask(ApsalarSessionInfo apsalarSessionInfo, Context context) {
        this.info = null;
        this.context = null;
        this.info = apsalarSessionInfo;
        this.context = context;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public String[] doInBackground(String... strArr) {
        ApsalarTrigger apsalarTrigger;
        if (this.info == null || strArr.length <= 0 || Apsalar.triggerActive.booleanValue()) {
            return null;
        }
        Apsalar.triggerActive = true;
        if (strArr.length == 1) {
            apsalarTrigger = new ApsalarTrigger(strArr[0], this.info);
        } else {
            apsalarTrigger = new ApsalarTrigger(strArr[0], strArr[1], this.info);
        }
        int REST = apsalarTrigger.REST(false);
        if (REST != 1) {
            return new String[]{String.valueOf(REST), null};
        }
        this.triggerName = strArr[0];
        return new String[]{String.valueOf(REST), apsalarTrigger.returnData};
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public void onPostExecute(String[] strArr) {
        if (strArr == null || strArr.length != 2) {
            Apsalar.triggerActive = false;
            return;
        }
        int parseInt = Integer.parseInt(strArr[0]);
        String str = strArr[1];
        if (parseInt == 1) {
            if (str.startsWith("callback:")) {
                if (this.info != null) {
                    CallbackURL callbackURL = new CallbackURL(str);
                    if (Apsalar.registered_callbacks.containsKey(callbackURL.signature)) {
                        Apsalar.eventJSON("__click__", callbackURL.clickParams);
                        ((ApCallback) Apsalar.registered_callbacks.get(callbackURL.signature).val).executeCallback(callbackURL.argValsJSON);
                    }
                }
                Apsalar.triggerActive = false;
            } else if (this.info != null) {
                Intent intent = new Intent(this.context, Activity.class);
                intent.putExtra("op", "ad");
                intent.putExtra("content", str);
                this.context.startActivity(intent);
            }
        } else {
            Apsalar.triggerActive = false;
        }
        if (this.triggerName != null) {
            Apsalar.executed_triggers.add(this.triggerName);
        }
    }
}
