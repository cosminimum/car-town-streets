package com.google.android.gms.internal;

import android.content.Context;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
/* loaded from: classes.dex */
public final class cr extends cm {
    private final String iG;
    private final String iH;
    private final Context mContext;

    public cr(Context context, String str, String str2) {
        this.mContext = context;
        this.iG = str;
        this.iH = str2;
    }

    @Override // com.google.android.gms.internal.cm
    public void ai() {
        try {
            ct.u("Pinging URL: " + this.iH);
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(this.iH).openConnection();
            co.a(this.mContext, this.iG, true, httpURLConnection);
            int responseCode = httpURLConnection.getResponseCode();
            if (responseCode < 200 || responseCode >= 300) {
                ct.v("Received non-success response code " + responseCode + " from pinging URL: " + this.iH);
            }
            httpURLConnection.disconnect();
        } catch (IOException e) {
            ct.v("Error while pinging URL: " + this.iH + ". " + e.getMessage());
        }
    }

    @Override // com.google.android.gms.internal.cm
    public void onStop() {
    }
}
