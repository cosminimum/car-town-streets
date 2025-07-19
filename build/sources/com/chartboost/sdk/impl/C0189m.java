package com.chartboost.sdk.impl;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import com.chartboost.sdk.C0038Chartboost;
import com.google.android.gms.drive.DriveFile;
import java.net.URI;
import java.net.URISyntaxException;

/* renamed from: com.chartboost.sdk.impl.m */
public class C0189m {

    /* renamed from: a */
    public C0191a f314a;

    /* renamed from: com.chartboost.sdk.impl.m$a */
    public interface C0191a {
        /* renamed from: a */
        void mo1160a(String str);
    }

    public C0189m(C0191a aVar) {
        this.f314a = aVar;
    }

    /* renamed from: a */
    public void mo1473a(final String str, final Context context) {
        try {
            String scheme = new URI(str).getScheme();
            if (scheme != null) {
                if (scheme.equals("http") || scheme.equals("https")) {
                    new AsyncTask<Void, Void, String>() {
                        /* JADX WARNING: Removed duplicated region for block: B:13:0x0026  */
                        /* JADX WARNING: Removed duplicated region for block: B:17:0x002e  */
                        /* renamed from: a */
                        /* Code decompiled incorrectly, please refer to instructions dump. */
                        public java.lang.String doInBackground(java.lang.Void... r4) {
                            /*
                                r3 = this;
                                r2 = 0
                                java.net.URL r0 = new java.net.URL     // Catch:{ Exception -> 0x0022, all -> 0x002b }
                                java.lang.String r1 = r3     // Catch:{ Exception -> 0x0022, all -> 0x002b }
                                r0.<init>(r1)     // Catch:{ Exception -> 0x0022, all -> 0x002b }
                                java.net.URLConnection r0 = r0.openConnection()     // Catch:{ Exception -> 0x0022, all -> 0x002b }
                                java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch:{ Exception -> 0x0022, all -> 0x002b }
                                r1 = 0
                                r0.setInstanceFollowRedirects(r1)     // Catch:{ Exception -> 0x0036, all -> 0x0032 }
                                java.lang.String r1 = "Location"
                                java.lang.String r1 = r0.getHeaderField(r1)     // Catch:{ Exception -> 0x0036, all -> 0x0032 }
                                if (r1 != 0) goto L_0x001c
                                java.lang.String r1 = r3     // Catch:{ Exception -> 0x0036, all -> 0x0032 }
                            L_0x001c:
                                if (r0 == 0) goto L_0x0021
                                r0.disconnect()
                            L_0x0021:
                                return r1
                            L_0x0022:
                                r0 = move-exception
                                r0 = r2
                            L_0x0024:
                                if (r0 == 0) goto L_0x0029
                                r0.disconnect()
                            L_0x0029:
                                r1 = r2
                                goto L_0x0021
                            L_0x002b:
                                r0 = move-exception
                            L_0x002c:
                                if (r2 == 0) goto L_0x0031
                                r2.disconnect()
                            L_0x0031:
                                throw r0
                            L_0x0032:
                                r1 = move-exception
                                r2 = r0
                                r0 = r1
                                goto L_0x002c
                            L_0x0036:
                                r1 = move-exception
                                goto L_0x0024
                            */
                            throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.impl.C0189m.C01901.doInBackground(java.lang.Void[]):java.lang.String");
                        }

                        /* renamed from: a */
                        public void onPostExecute(String str) {
                            C0189m.this.m407b(str, context);
                        }
                    }.execute(new Void[0]);
                } else {
                    m407b(str, context);
                }
            }
        } catch (URISyntaxException e) {
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public void m407b(String str, Context context) {
        if (this.f314a != null) {
            this.f314a.mo1160a(str);
        }
        if (context == null) {
            context = C0038Chartboost.sharedChartboost().getContext();
        }
        if (context != null) {
            try {
                Intent intent = new Intent("android.intent.action.VIEW");
                if (!(context instanceof Activity)) {
                    intent.addFlags(DriveFile.MODE_READ_ONLY);
                }
                intent.setData(Uri.parse(str));
                context.startActivity(intent);
            } catch (Exception e) {
                try {
                    if (str.startsWith("market://")) {
                        String str2 = "http://market.android.com/" + str.substring(9);
                        Intent intent2 = new Intent("android.intent.action.VIEW");
                        if (!(context instanceof Activity)) {
                            intent2.addFlags(DriveFile.MODE_READ_ONLY);
                        }
                        intent2.setData(Uri.parse(str2));
                        context.startActivity(intent2);
                    }
                } catch (Exception e2) {
                }
            }
        }
    }
}
