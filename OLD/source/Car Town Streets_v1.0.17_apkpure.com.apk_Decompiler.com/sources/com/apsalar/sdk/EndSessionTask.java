package com.apsalar.sdk;

import android.os.AsyncTask;

/* compiled from: Apsalar */
class EndSessionTask extends AsyncTask<ApsalarEvent, Void, Integer> {
    Integer status = -1;

    EndSessionTask() {
    }

    /* access modifiers changed from: protected */
    public Integer doInBackground(ApsalarEvent... apsalarEventArr) {
        this.status = Integer.valueOf(apsalarEventArr[0].REST());
        return this.status;
    }

    /* access modifiers changed from: protected */
    public void onPostExcute(Integer num) {
    }
}
