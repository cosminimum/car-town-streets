package com.apsalar.sdk;

import android.os.AsyncTask;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: Apsalar.java */
/* loaded from: classes.dex */
public class EndSessionTask extends AsyncTask<ApsalarEvent, Void, Integer> {
    Integer status = -1;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // android.os.AsyncTask
    public Integer doInBackground(ApsalarEvent... apsalarEventArr) {
        this.status = Integer.valueOf(apsalarEventArr[0].REST());
        return this.status;
    }

    protected void onPostExcute(Integer num) {
    }
}
