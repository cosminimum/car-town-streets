package com.chartboost.sdk.Libraries;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.os.AsyncTask;
import android.os.Bundle;
import android.os.Environment;
import android.widget.ImageView;
import com.chartboost.sdk.Chartboost;
import com.chartboost.sdk.Libraries.a;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilterInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public class e {
    private static e a = null;
    private d b = new d(Chartboost.sharedChartboost().getContext());
    private com.chartboost.sdk.Libraries.a c = new com.chartboost.sdk.Libraries.a();

    /* loaded from: classes.dex */
    public interface b {
        void a(a.C0000a c0000a, Bundle bundle);
    }

    public static synchronized e a() {
        e eVar;
        synchronized (e.class) {
            if (a == null) {
                a = new e();
            }
            eVar = a;
        }
        return eVar;
    }

    private e() {
    }

    public void b() {
        this.b.a();
        this.c.a();
    }

    public void a(String str, String str2, b bVar, ImageView imageView, Bundle bundle) {
        a.C0000a c0000a = null;
        boolean z = bundle != null ? bundle.getBoolean("paramNoMemoryCache") : false;
        if (!z) {
            try {
                c0000a = this.c.a(str2);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (c0000a == null && (c0000a = a(str2)) != null) {
            c0000a.a(!z);
            if (!z) {
                this.c.a(str2, c0000a);
            }
        }
        if (c0000a != null) {
            if (imageView != null) {
                imageView.setImageBitmap(c0000a.b());
            }
            if (bVar != null) {
                bVar.a(c0000a, bundle);
                return;
            }
            return;
        }
        new a(imageView, bVar, str2, bundle).execute(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public class a extends AsyncTask<String, Void, a.C0000a> {
        private String b;
        private final WeakReference<ImageView> c;
        private b d;
        private String e;
        private Bundle f;

        public a(ImageView imageView, b bVar, String str, Bundle bundle) {
            this.c = new WeakReference<>(imageView);
            c cVar = new c(this);
            if (imageView != null) {
                imageView.setImageDrawable(cVar);
            }
            this.e = str;
            this.d = bVar;
            this.f = bundle;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        /* JADX WARN: Removed duplicated region for block: B:13:0x0026 A[ORIG_RETURN, RETURN] */
        /* JADX WARN: Removed duplicated region for block: B:15:0x0032  */
        /* JADX WARN: Removed duplicated region for block: B:45:0x00a4 A[EXC_TOP_SPLITTER, SYNTHETIC] */
        @Override // android.os.AsyncTask
        /* renamed from: a */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public com.chartboost.sdk.Libraries.a.C0000a doInBackground(java.lang.String... r11) {
            /*
                Method dump skipped, instructions count: 290
                To view this dump add '--comments-level debug' option
            */
            throw new UnsupportedOperationException("Method not decompiled: com.chartboost.sdk.Libraries.e.a.doInBackground(java.lang.String[]):com.chartboost.sdk.Libraries.a$a");
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        /* renamed from: a */
        public void onPostExecute(a.C0000a c0000a) {
            if (!isCancelled()) {
                if (c0000a != null) {
                    try {
                        e.this.c.a(this.e, c0000a);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                if (this.c != null) {
                    ImageView imageView = this.c.get();
                    if (this == e.b(imageView)) {
                        imageView.setImageBitmap(c0000a.b());
                    }
                }
                if (this.d != null) {
                    this.d.a(c0000a, this.f);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static a b(ImageView imageView) {
        if (imageView != null) {
            Drawable drawable = imageView.getDrawable();
            if (drawable instanceof c) {
                return ((c) drawable).a();
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class c extends BitmapDrawable {
        private final WeakReference<a> a;

        public c(a aVar) {
            this.a = new WeakReference<>(aVar);
        }

        public a a() {
            return this.a.get();
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v1, types: [com.chartboost.sdk.Libraries.a$a] */
    /* JADX WARN: Type inference failed for: r0v6, types: [android.graphics.Bitmap] */
    /* JADX WARN: Type inference failed for: r0v8 */
    protected a.C0000a a(String str) throws IOException {
        Bitmap bitmap = 0;
        File a2 = this.b.a(String.valueOf(str) + ".png");
        if (!a2.exists()) {
            return null;
        }
        BufferedInputStream bufferedInputStream = new BufferedInputStream(new FileInputStream(a2));
        long length = a2.length();
        if (length > 2147483647L) {
            throw new IOException("Cannot read files larger than 2147483647 bytes");
        }
        int i = (int) length;
        byte[] bArr = new byte[i];
        bufferedInputStream.read(bArr, 0, i);
        bufferedInputStream.close();
        BitmapFactory.Options options = new BitmapFactory.Options();
        options.inJustDecodeBounds = true;
        BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options);
        BitmapFactory.Options options2 = new BitmapFactory.Options();
        options2.inJustDecodeBounds = false;
        options2.inDither = false;
        options2.inPurgeable = true;
        options2.inInputShareable = true;
        options2.inTempStorage = new byte[32768];
        options2.inSampleSize = 1;
        while (options2.inSampleSize < 64) {
            try {
                bitmap = BitmapFactory.decodeByteArray(bArr, 0, bArr.length, options2);
                break;
            } catch (Exception e) {
                return bitmap;
            } catch (OutOfMemoryError e2) {
                options2.inSampleSize *= 2;
                bitmap = bitmap;
            }
        }
        return new a.C0000a(bitmap, options2.inSampleSize);
    }

    protected boolean a(String str, C0001e c0001e) throws IOException {
        FileOutputStream fileOutputStream;
        try {
            fileOutputStream = new FileOutputStream(this.b.a(String.valueOf(str) + ".png"));
        } catch (Exception e) {
            fileOutputStream = null;
        } catch (Throwable th) {
            th = th;
            fileOutputStream = null;
        }
        try {
            byte[] bArr = new byte[4096];
            while (true) {
                int read = c0001e.read(bArr);
                if (read == -1) {
                    break;
                }
                fileOutputStream.write(bArr, 0, read);
            }
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (Exception e2) {
                }
            }
            return true;
        } catch (Exception e3) {
            if (fileOutputStream == null) {
                return false;
            }
            try {
                fileOutputStream.close();
                return false;
            } catch (Exception e4) {
                return false;
            }
        } catch (Throwable th2) {
            th = th2;
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (Exception e5) {
                }
            }
            throw th;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.chartboost.sdk.Libraries.e$e  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    public static class C0001e extends FilterInputStream {
        public C0001e(InputStream inputStream) {
            super(inputStream);
        }

        @Override // java.io.FilterInputStream, java.io.InputStream
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

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class d {
        private File a;

        public d(Context context) {
            this.a = null;
            try {
                if ((context.checkCallingOrSelfPermission("android.permission.WRITE_EXTERNAL_STORAGE") == 0) && Environment.getExternalStorageState().equals("mounted")) {
                    this.a = context.getExternalFilesDir("cache");
                }
                if (this.a != null && !this.a.exists()) {
                    this.a.mkdirs();
                }
            } catch (Exception e) {
                this.a = null;
            }
            if (this.a == null) {
                this.a = context.getCacheDir();
                if (!this.a.exists()) {
                    this.a.mkdirs();
                }
            }
        }

        public File a(String str) {
            return new File(this.a, str);
        }

        public void a() {
            try {
                File[] listFiles = this.a.listFiles();
                if (listFiles != null) {
                    for (File file : listFiles) {
                        file.delete();
                    }
                }
            } catch (Exception e) {
            }
        }
    }
}
