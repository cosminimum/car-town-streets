package com.chartboost.sdk.Libraries;

import android.content.Context;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.widget.ImageView;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.C0049a;
import java.io.File;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;

/* renamed from: com.chartboost.sdk.Libraries.e */
public class C0054e {

    /* renamed from: a */
    private static C0054e f63a = null;

    /* renamed from: b */
    private C0058d f64b = new C0058d(C0038Chartboost.sharedChartboost().getContext());
    /* access modifiers changed from: private */

    /* renamed from: c */
    public C0049a f65c = new C0049a();

    /* renamed from: com.chartboost.sdk.Libraries.e$b */
    public interface C0056b {
        /* renamed from: a */
        void mo1216a(C0049a.C0050a aVar, Bundle bundle);
    }

    /* renamed from: a */
    public static synchronized C0054e m94a() {
        C0054e eVar;
        synchronized (C0054e.class) {
            if (f63a == null) {
                f63a = new C0054e();
            }
            eVar = f63a;
        }
        return eVar;
    }

    private C0054e() {
    }

    /* renamed from: b */
    public void mo1211b() {
        this.f64b.mo1219a();
        this.f65c.mo1198a();
    }

    /* renamed from: a */
    public void mo1209a(String str, String str2, C0056b bVar, ImageView imageView, Bundle bundle) {
        boolean z;
        C0049a.C0050a aVar = null;
        boolean z2 = bundle != null ? bundle.getBoolean("paramNoMemoryCache") : false;
        if (!z2) {
            try {
                aVar = this.f65c.mo1197a(str2);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (aVar == null && (aVar = mo1208a(str2)) != null) {
            if (z2) {
                z = false;
            } else {
                z = true;
            }
            aVar.mo1204a(z);
            if (!z2) {
                this.f65c.mo1200a(str2, aVar);
            }
        }
        if (aVar != null) {
            if (imageView != null) {
                imageView.setImageBitmap(aVar.mo1205b());
            }
            if (bVar != null) {
                bVar.mo1216a(aVar, bundle);
                return;
            }
            return;
        }
        new C0055a(imageView, bVar, str2, bundle).execute(new String[]{str});
    }

    /* renamed from: com.chartboost.sdk.Libraries.e$a */
    class C0055a extends AsyncTask<String, Void, C0049a.C0050a> {

        /* renamed from: b */
        private String f67b;

        /* renamed from: c */
        private final WeakReference<ImageView> f68c;

        /* renamed from: d */
        private C0056b f69d;

        /* renamed from: e */
        private String f70e;

        /* renamed from: f */
        private Bundle f71f;

        public C0055a(ImageView imageView, C0056b bVar, String str, Bundle bundle) {
            this.f68c = new WeakReference<>(imageView);
            C0057c cVar = new C0057c(this);
            if (imageView != null) {
                imageView.setImageDrawable(cVar);
            }
            this.f70e = str;
            this.f69d = bVar;
            this.f71f = bundle;
        }

        /* access modifiers changed from: protected */
        /* JADX WARNING: Removed duplicated region for block: B:18:0x0032  */
        /* JADX WARNING: Removed duplicated region for block: B:36:0x00a4 A[SYNTHETIC, Splitter:B:36:0x00a4] */
        /* JADX WARNING: Removed duplicated region for block: B:66:? A[ORIG_RETURN, RETURN, SYNTHETIC] */
        /* renamed from: a */
        /* Code decompiled incorrectly, please refer to instructions dump. */
        public com.chartboost.sdk.Libraries.C0049a.C0050a doInBackground(java.lang.String... r11) {
            /*
                r10 = this;
                r5 = 1
                r3 = 0
                r1 = 0
                r0 = r11[r1]
                r10.f67b = r0
                android.os.Bundle r0 = r10.f71f
                if (r0 == 0) goto L_0x0027
                android.os.Bundle r0 = r10.f71f
                java.lang.String r2 = "paramNoMemoryCache"
                boolean r0 = r0.getBoolean(r2)
            L_0x0013:
                com.chartboost.sdk.Libraries.e r2 = com.chartboost.sdk.Libraries.C0054e.this     // Catch:{ Exception -> 0x002b }
                java.lang.String r4 = r10.f70e     // Catch:{ Exception -> 0x002b }
                com.chartboost.sdk.Libraries.a$a r4 = r2.mo1208a((java.lang.String) r4)     // Catch:{ Exception -> 0x002b }
                if (r4 == 0) goto L_0x0030
                if (r0 == 0) goto L_0x0029
                r2 = r1
            L_0x0020:
                r4.mo1204a((boolean) r2)     // Catch:{ Exception -> 0x011b }
                r2 = r4
            L_0x0024:
                if (r2 == 0) goto L_0x0032
            L_0x0026:
                return r2
            L_0x0027:
                r0 = r1
                goto L_0x0013
            L_0x0029:
                r2 = r5
                goto L_0x0020
            L_0x002b:
                r2 = move-exception
                r4 = r3
            L_0x002d:
                r2.printStackTrace()
            L_0x0030:
                r2 = r4
                goto L_0x0024
            L_0x0032:
                org.apache.http.client.HttpClient r4 = com.chartboost.sdk.impl.C0181j.m384b()
                org.apache.http.client.methods.HttpGet r6 = new org.apache.http.client.methods.HttpGet
                java.lang.String r7 = r10.f67b
                r6.<init>(r7)
                org.apache.http.HttpResponse r4 = r4.execute(r6)     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                org.apache.http.StatusLine r7 = r4.getStatusLine()     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                int r7 = r7.getStatusCode()     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                r8 = 200(0xc8, float:2.8E-43)
                if (r7 == r8) goto L_0x006f
                java.lang.String r0 = "ImageDownloader"
                java.lang.StringBuilder r1 = new java.lang.StringBuilder     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                java.lang.String r4 = "Error "
                r1.<init>(r4)     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                java.lang.StringBuilder r1 = r1.append(r7)     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                java.lang.String r4 = " while retrieving bitmap from "
                java.lang.StringBuilder r1 = r1.append(r4)     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                java.lang.String r4 = r10.f67b     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                java.lang.StringBuilder r1 = r1.append(r4)     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                java.lang.String r1 = r1.toString()     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                android.util.Log.w(r0, r1)     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                r2 = r3
                goto L_0x0026
            L_0x006f:
                org.apache.http.HttpEntity r4 = r4.getEntity()     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                if (r4 == 0) goto L_0x0120
                java.io.InputStream r3 = r4.getContent()     // Catch:{ all -> 0x00b5 }
                com.chartboost.sdk.Libraries.e r7 = com.chartboost.sdk.Libraries.C0054e.this     // Catch:{ all -> 0x00b5 }
                java.lang.String r8 = r10.f70e     // Catch:{ all -> 0x00b5 }
                com.chartboost.sdk.Libraries.e$e r9 = new com.chartboost.sdk.Libraries.e$e     // Catch:{ all -> 0x00b5 }
                r9.<init>(r3)     // Catch:{ all -> 0x00b5 }
                r7.mo1210a(r8, r9)     // Catch:{ all -> 0x00b5 }
                com.chartboost.sdk.Libraries.e r7 = com.chartboost.sdk.Libraries.C0054e.this     // Catch:{ Exception -> 0x00af }
                java.lang.String r8 = r10.f70e     // Catch:{ Exception -> 0x00af }
                com.chartboost.sdk.Libraries.a$a r2 = r7.mo1208a((java.lang.String) r8)     // Catch:{ Exception -> 0x00af }
                if (r2 == 0) goto L_0x011e
                if (r0 == 0) goto L_0x00ad
            L_0x0091:
                r2.mo1204a((boolean) r1)     // Catch:{ Exception -> 0x00af }
                if (r0 != 0) goto L_0x011e
                com.chartboost.sdk.Libraries.e r0 = com.chartboost.sdk.Libraries.C0054e.this     // Catch:{ Exception -> 0x00af }
                com.chartboost.sdk.Libraries.a r0 = r0.f65c     // Catch:{ Exception -> 0x00af }
                java.lang.String r1 = r10.f70e     // Catch:{ Exception -> 0x00af }
                r0.mo1200a(r1, r2)     // Catch:{ Exception -> 0x00af }
                r0 = r2
            L_0x00a2:
                if (r3 == 0) goto L_0x00a7
                r3.close()     // Catch:{ IOException -> 0x0119, IllegalStateException -> 0x0117, Exception -> 0x0115 }
            L_0x00a7:
                r4.consumeContent()     // Catch:{ IOException -> 0x0119, IllegalStateException -> 0x0117, Exception -> 0x0115 }
            L_0x00aa:
                r2 = r0
                goto L_0x0026
            L_0x00ad:
                r1 = r5
                goto L_0x0091
            L_0x00af:
                r0 = move-exception
                r0.printStackTrace()     // Catch:{ all -> 0x00b5 }
                r0 = r2
                goto L_0x00a2
            L_0x00b5:
                r0 = move-exception
                if (r3 == 0) goto L_0x00bb
                r3.close()     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
            L_0x00bb:
                r4.consumeContent()     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
                throw r0     // Catch:{ IOException -> 0x00bf, IllegalStateException -> 0x00dc, Exception -> 0x00f8 }
            L_0x00bf:
                r0 = move-exception
                r1 = r0
                r0 = r2
            L_0x00c2:
                r6.abort()
                java.lang.String r2 = "CBWebImageCache"
                java.lang.StringBuilder r3 = new java.lang.StringBuilder
                java.lang.String r4 = "I/O error while retrieving bitmap from "
                r3.<init>(r4)
                java.lang.String r4 = r10.f67b
                java.lang.StringBuilder r3 = r3.append(r4)
                java.lang.String r3 = r3.toString()
                android.util.Log.w(r2, r3, r1)
                goto L_0x00aa
            L_0x00dc:
                r0 = move-exception
                r0 = r2
            L_0x00de:
                r6.abort()
                java.lang.String r1 = "CBWebImageCache"
                java.lang.StringBuilder r2 = new java.lang.StringBuilder
                java.lang.String r3 = "Incorrect URL: "
                r2.<init>(r3)
                java.lang.String r3 = r10.f67b
                java.lang.StringBuilder r2 = r2.append(r3)
                java.lang.String r2 = r2.toString()
                android.util.Log.w(r1, r2)
                goto L_0x00aa
            L_0x00f8:
                r0 = move-exception
                r1 = r0
                r0 = r2
            L_0x00fb:
                r6.abort()
                java.lang.String r2 = "CBWebImageCache"
                java.lang.StringBuilder r3 = new java.lang.StringBuilder
                java.lang.String r4 = "Error while retrieving bitmap from "
                r3.<init>(r4)
                java.lang.String r4 = r10.f67b
                java.lang.StringBuilder r3 = r3.append(r4)
                java.lang.String r3 = r3.toString()
                android.util.Log.w(r2, r3, r1)
                goto L_0x00aa
            L_0x0115:
                r1 = move-exception
                goto L_0x00fb
            L_0x0117:
                r1 = move-exception
                goto L_0x00de
            L_0x0119:
                r1 = move-exception
                goto L_0x00c2
            L_0x011b:
                r2 = move-exception
                goto L_0x002d
            L_0x011e:
                r0 = r2
                goto L_0x00a2
            L_0x0120:
                r0 = r2
                goto L_0x00aa
            */
            throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.Libraries.C0054e.C0055a.doInBackground(java.lang.String[]):com.chartboost.sdk.Libraries.a$a");
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void onPostExecute(C0049a.C0050a aVar) {
            if (!isCancelled()) {
                if (aVar != null) {
                    try {
                        C0054e.this.f65c.mo1200a(this.f70e, aVar);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (this.f68c != null) {
                    ImageView imageView = (ImageView) this.f68c.get();
                    if (this == C0054e.m95b(imageView)) {
                        imageView.setImageBitmap(aVar.mo1205b());
                    }
                }
                if (this.f69d != null) {
                    this.f69d.mo1216a(aVar, this.f71f);
                }
            }
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public static C0055a m95b(ImageView imageView) {
        if (imageView != null) {
            Drawable drawable = imageView.getDrawable();
            if (drawable instanceof C0057c) {
                return ((C0057c) drawable).mo1217a();
            }
        }
        return null;
    }

    /* renamed from: com.chartboost.sdk.Libraries.e$c */
    static class C0057c extends BitmapDrawable {

        /* renamed from: a */
        private final WeakReference<C0055a> f72a;

        public C0057c(C0055a aVar) {
            this.f72a = new WeakReference<>(aVar);
        }

        /* renamed from: a */
        public C0055a mo1217a() {
            return (C0055a) this.f72a.get();
        }
    }

    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v0, resolved type: com.chartboost.sdk.Libraries.a$a} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v1, resolved type: com.chartboost.sdk.Libraries.a$a} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v5, resolved type: android.graphics.Bitmap} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v8, resolved type: android.graphics.Bitmap} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v9, resolved type: com.chartboost.sdk.Libraries.a$a} */
    /* JADX DEBUG: Multi-variable search result rejected for TypeSearchVarInfo{r0v10, resolved type: android.graphics.Bitmap} */
    /* access modifiers changed from: protected */
    /* JADX WARNING: Multi-variable type inference failed */
    /* renamed from: a */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public com.chartboost.sdk.Libraries.C0049a.C0050a mo1208a(java.lang.String r10) throws java.io.IOException {
        /*
            r9 = this;
            r0 = 0
            r8 = 1
            r7 = 0
            com.chartboost.sdk.Libraries.e$d r1 = r9.f64b
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r3 = java.lang.String.valueOf(r10)
            r2.<init>(r3)
            java.lang.String r3 = ".png"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            java.io.File r1 = r1.mo1218a(r2)
            boolean r2 = r1.exists()
            if (r2 != 0) goto L_0x0023
        L_0x0022:
            return r0
        L_0x0023:
            java.io.BufferedInputStream r2 = new java.io.BufferedInputStream
            java.io.FileInputStream r3 = new java.io.FileInputStream
            r3.<init>(r1)
            r2.<init>(r3)
            long r3 = r1.length()
            r5 = 2147483647(0x7fffffff, double:1.060997895E-314)
            int r1 = (r3 > r5 ? 1 : (r3 == r5 ? 0 : -1))
            if (r1 <= 0) goto L_0x0040
            java.io.IOException r0 = new java.io.IOException
            java.lang.String r1 = "Cannot read files larger than 2147483647 bytes"
            r0.<init>(r1)
            throw r0
        L_0x0040:
            int r1 = (int) r3
            byte[] r3 = new byte[r1]
            r2.read(r3, r7, r1)
            r2.close()
            android.graphics.BitmapFactory$Options r1 = new android.graphics.BitmapFactory$Options
            r1.<init>()
            r1.inJustDecodeBounds = r8
            int r2 = r3.length
            android.graphics.BitmapFactory.decodeByteArray(r3, r7, r2, r1)
            android.graphics.BitmapFactory$Options r2 = new android.graphics.BitmapFactory$Options
            r2.<init>()
            r2.inJustDecodeBounds = r7
            r2.inDither = r7
            r2.inPurgeable = r8
            r2.inInputShareable = r8
            r1 = 32768(0x8000, float:4.5918E-41)
            byte[] r1 = new byte[r1]
            r2.inTempStorage = r1
            r2.inSampleSize = r8
        L_0x006a:
            int r1 = r2.inSampleSize
            r4 = 64
            if (r1 < r4) goto L_0x0079
        L_0x0070:
            com.chartboost.sdk.Libraries.a$a r1 = new com.chartboost.sdk.Libraries.a$a
            int r2 = r2.inSampleSize
            r1.<init>(r0, r2)
            r0 = r1
            goto L_0x0022
        L_0x0079:
            r1 = 0
            int r4 = r3.length     // Catch:{ OutOfMemoryError -> 0x0080, Exception -> 0x0088 }
            android.graphics.Bitmap r0 = android.graphics.BitmapFactory.decodeByteArray(r3, r1, r4, r2)     // Catch:{ OutOfMemoryError -> 0x0080, Exception -> 0x0088 }
            goto L_0x0070
        L_0x0080:
            r1 = move-exception
            int r1 = r2.inSampleSize
            int r1 = r1 * 2
            r2.inSampleSize = r1
            goto L_0x006a
        L_0x0088:
            r1 = move-exception
            goto L_0x0022
        */
        throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.Libraries.C0054e.mo1208a(java.lang.String):com.chartboost.sdk.Libraries.a$a");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Removed duplicated region for block: B:24:0x0044 A[SYNTHETIC, Splitter:B:24:0x0044] */
    /* renamed from: a */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public boolean mo1210a(java.lang.String r6, com.chartboost.sdk.Libraries.C0054e.C0059e r7) throws java.io.IOException {
        /*
            r5 = this;
            r0 = 0
            com.chartboost.sdk.Libraries.e$d r1 = r5.f64b
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            java.lang.String r3 = java.lang.String.valueOf(r6)
            r2.<init>(r3)
            java.lang.String r3 = ".png"
            java.lang.StringBuilder r2 = r2.append(r3)
            java.lang.String r2 = r2.toString()
            java.io.File r3 = r1.mo1218a(r2)
            r2 = 0
            java.io.FileOutputStream r1 = new java.io.FileOutputStream     // Catch:{ Exception -> 0x004e, all -> 0x0040 }
            r1.<init>(r3)     // Catch:{ Exception -> 0x004e, all -> 0x0040 }
            r2 = 4096(0x1000, float:5.74E-42)
            byte[] r2 = new byte[r2]     // Catch:{ Exception -> 0x0037, all -> 0x004c }
        L_0x0024:
            int r3 = r7.read(r2)     // Catch:{ Exception -> 0x0037, all -> 0x004c }
            r4 = -1
            if (r3 != r4) goto L_0x0032
            if (r1 == 0) goto L_0x0030
            r1.close()     // Catch:{ Exception -> 0x0048 }
        L_0x0030:
            r0 = 1
        L_0x0031:
            return r0
        L_0x0032:
            r4 = 0
            r1.write(r2, r4, r3)     // Catch:{ Exception -> 0x0037, all -> 0x004c }
            goto L_0x0024
        L_0x0037:
            r2 = move-exception
        L_0x0038:
            if (r1 == 0) goto L_0x0031
            r1.close()     // Catch:{ Exception -> 0x003e }
            goto L_0x0031
        L_0x003e:
            r1 = move-exception
            goto L_0x0031
        L_0x0040:
            r0 = move-exception
            r1 = r2
        L_0x0042:
            if (r1 == 0) goto L_0x0047
            r1.close()     // Catch:{ Exception -> 0x004a }
        L_0x0047:
            throw r0
        L_0x0048:
            r0 = move-exception
            goto L_0x0030
        L_0x004a:
            r1 = move-exception
            goto L_0x0047
        L_0x004c:
            r0 = move-exception
            goto L_0x0042
        L_0x004e:
            r1 = move-exception
            r1 = r2
            goto L_0x0038
        */
        throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.Libraries.C0054e.mo1210a(java.lang.String, com.chartboost.sdk.Libraries.e$e):boolean");
    }

    /* renamed from: com.chartboost.sdk.Libraries.e$e */
    static class C0059e extends FilterInputStream {
        public C0059e(InputStream inputStream) {
            super(inputStream);
        }

        public long skip(long n) throws IOException {
            long j = 0;
            while (j < n) {
                long skip = this.in.skip(n - j);
                if (skip == 0) {
                    if (read() < 0) {
                        break;
                    }
                    skip = 1;
                }
                j = skip + j;
            }
            return j;
        }
    }

    /* renamed from: com.chartboost.sdk.Libraries.e$d */
    private static class C0058d {

        /* renamed from: a */
        private File f73a = null;

        public C0058d(Context context) {
            try {
                if ((context.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0) && Environment.getExternalStorageState().equals("mounted")) {
                    this.f73a = context.getExternalFilesDir("cache");
                }
                if (this.f73a != null && !this.f73a.exists()) {
                    this.f73a.mkdirs();
                }
            } catch (Exception e) {
                this.f73a = null;
            }
            if (this.f73a == null) {
                this.f73a = context.getCacheDir();
                if (!this.f73a.exists()) {
                    this.f73a.mkdirs();
                }
            }
        }

        /* renamed from: a */
        public File mo1218a(String str) {
            return new File(this.f73a, str);
        }

        /* renamed from: a */
        public void mo1219a() {
            try {
                File[] listFiles = this.f73a.listFiles();
                if (listFiles != null) {
                    for (File delete : listFiles) {
                        delete.delete();
                    }
                }
            } catch (Exception e) {
            }
        }
    }
}
