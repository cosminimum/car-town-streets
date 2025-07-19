package com.google.android.gms.common.images;

import android.app.ActivityManager;
import android.content.ComponentCallbacks2;
import android.content.Context;
import android.content.Intent;
import android.content.res.Configuration;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.ParcelFileDescriptor;
import android.os.ResultReceiver;
import android.util.Log;
import android.widget.ImageView;
import com.google.android.gms.common.images.C0672a;
import com.google.android.gms.internal.C1066ds;
import com.google.android.gms.internal.C1106ek;
import com.google.android.gms.internal.C1135fg;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public final class ImageManager {
    /* access modifiers changed from: private */

    /* renamed from: ob */
    public static final Object f1393ob = new Object();
    /* access modifiers changed from: private */

    /* renamed from: oc */
    public static HashSet<Uri> f1394oc = new HashSet<>();

    /* renamed from: od */
    private static ImageManager f1395od;

    /* renamed from: oe */
    private static ImageManager f1396oe;
    /* access modifiers changed from: private */
    public final Context mContext;
    /* access modifiers changed from: private */
    public final Handler mHandler = new Handler(Looper.getMainLooper());
    /* access modifiers changed from: private */

    /* renamed from: of */
    public final ExecutorService f1397of = Executors.newFixedThreadPool(4);
    /* access modifiers changed from: private */

    /* renamed from: og */
    public final C0667b f1398og;
    /* access modifiers changed from: private */

    /* renamed from: oh */
    public final Map<C0672a, ImageReceiver> f1399oh;
    /* access modifiers changed from: private */

    /* renamed from: oi */
    public final Map<Uri, ImageReceiver> f1400oi;

    private final class ImageReceiver extends ResultReceiver {
        private final Uri mUri;
        /* access modifiers changed from: private */

        /* renamed from: oj */
        public final ArrayList<C0672a> f1401oj;

        /* renamed from: ok */
        boolean f1402ok = false;

        ImageReceiver(Uri uri) {
            super(new Handler(Looper.getMainLooper()));
            this.mUri = uri;
            this.f1401oj = new ArrayList<>();
        }

        /* renamed from: bB */
        public void mo5994bB() {
            Intent intent = new Intent("com.google.android.gms.common.images.LOAD_IMAGE");
            intent.putExtra("com.google.android.gms.extras.uri", this.mUri);
            intent.putExtra("com.google.android.gms.extras.resultReceiver", this);
            intent.putExtra("com.google.android.gms.extras.priority", 3);
            ImageManager.this.mContext.sendBroadcast(intent);
        }

        /* renamed from: c */
        public void mo5995c(C0672a aVar) {
            C1066ds.m2457a(!this.f1402ok, "Cannot add an ImageRequest when mHandlingRequests is true");
            C1066ds.m2455N("ImageReceiver.addImageRequest() must be called in the main thread");
            this.f1401oj.add(aVar);
        }

        /* renamed from: d */
        public void mo5996d(C0672a aVar) {
            C1066ds.m2457a(!this.f1402ok, "Cannot remove an ImageRequest when mHandlingRequests is true");
            C1066ds.m2455N("ImageReceiver.removeImageRequest() must be called in the main thread");
            this.f1401oj.remove(aVar);
        }

        public void onReceiveResult(int resultCode, Bundle resultData) {
            ImageManager.this.f1397of.execute(new C0668c(this.mUri, (ParcelFileDescriptor) resultData.getParcelable("com.google.android.gms.extra.fileDescriptor")));
        }
    }

    public interface OnImageLoadedListener {
        void onImageLoaded(Uri uri, Drawable drawable, boolean z);
    }

    /* renamed from: com.google.android.gms.common.images.ImageManager$a */
    private static final class C0666a {
        /* renamed from: a */
        static int m1332a(ActivityManager activityManager) {
            return activityManager.getLargeMemoryClass();
        }
    }

    /* renamed from: com.google.android.gms.common.images.ImageManager$b */
    private static final class C0667b extends C1106ek<C0672a.C0673a, Bitmap> {
        public C0667b(Context context) {
            super(m1333q(context));
        }

        /* renamed from: q */
        private static int m1333q(Context context) {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            return (int) (((float) (((!((context.getApplicationInfo().flags & 1048576) != 0) || !C1135fg.m2765cD()) ? activityManager.getMemoryClass() : C0666a.m1332a(activityManager)) * 1048576)) * 0.33f);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public int sizeOf(C0672a.C0673a aVar, Bitmap bitmap) {
            return bitmap.getHeight() * bitmap.getRowBytes();
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void entryRemoved(boolean z, C0672a.C0673a aVar, Bitmap bitmap, Bitmap bitmap2) {
            super.entryRemoved(z, aVar, bitmap, bitmap2);
        }
    }

    /* renamed from: com.google.android.gms.common.images.ImageManager$c */
    private final class C0668c implements Runnable {
        private final Uri mUri;

        /* renamed from: om */
        private final ParcelFileDescriptor f1405om;

        public C0668c(Uri uri, ParcelFileDescriptor parcelFileDescriptor) {
            this.mUri = uri;
            this.f1405om = parcelFileDescriptor;
        }

        public void run() {
            C1066ds.m2456O("LoadBitmapFromDiskRunnable can't be executed in the main thread");
            boolean z = false;
            Bitmap bitmap = null;
            if (this.f1405om != null) {
                try {
                    bitmap = BitmapFactory.decodeFileDescriptor(this.f1405om.getFileDescriptor());
                } catch (OutOfMemoryError e) {
                    Log.e("ImageManager", "OOM while loading bitmap for uri: " + this.mUri, e);
                    z = true;
                }
                try {
                    this.f1405om.close();
                } catch (IOException e2) {
                    Log.e("ImageManager", "closed failed", e2);
                }
            }
            CountDownLatch countDownLatch = new CountDownLatch(1);
            ImageManager.this.mHandler.post(new C0671f(this.mUri, bitmap, z, countDownLatch));
            try {
                countDownLatch.await();
            } catch (InterruptedException e3) {
                Log.w("ImageManager", "Latch interrupted while posting " + this.mUri);
            }
        }
    }

    /* renamed from: com.google.android.gms.common.images.ImageManager$d */
    private final class C0669d implements Runnable {

        /* renamed from: on */
        private final C0672a f1407on;

        public C0669d(C0672a aVar) {
            this.f1407on = aVar;
        }

        public void run() {
            C1066ds.m2455N("LoadImageRunnable must be executed on the main thread");
            boolean unused = ImageManager.this.m1320b(this.f1407on);
            C0672a.C0673a aVar = this.f1407on.f1416op;
            if (aVar.uri == null) {
                this.f1407on.mo6023b(ImageManager.this.mContext, true);
                return;
            }
            Bitmap a = ImageManager.this.m1315a(aVar);
            if (a != null) {
                this.f1407on.mo6020a(ImageManager.this.mContext, a, true);
                return;
            }
            this.f1407on.mo6026r(ImageManager.this.mContext);
            ImageReceiver imageReceiver = (ImageReceiver) ImageManager.this.f1400oi.get(aVar.uri);
            if (imageReceiver == null) {
                imageReceiver = new ImageReceiver(aVar.uri);
                ImageManager.this.f1400oi.put(aVar.uri, imageReceiver);
            }
            imageReceiver.mo5995c(this.f1407on);
            if (this.f1407on.f1419os != 1) {
                ImageManager.this.f1399oh.put(this.f1407on, imageReceiver);
            }
            synchronized (ImageManager.f1393ob) {
                if (!ImageManager.f1394oc.contains(aVar.uri)) {
                    ImageManager.f1394oc.add(aVar.uri);
                    imageReceiver.mo5994bB();
                }
            }
        }
    }

    /* renamed from: com.google.android.gms.common.images.ImageManager$e */
    private static final class C0670e implements ComponentCallbacks2 {

        /* renamed from: og */
        private final C0667b f1408og;

        public C0670e(C0667b bVar) {
            this.f1408og = bVar;
        }

        public void onConfigurationChanged(Configuration newConfig) {
        }

        public void onLowMemory() {
            this.f1408og.evictAll();
        }

        public void onTrimMemory(int level) {
            if (level >= 60) {
                this.f1408og.evictAll();
            } else if (level >= 20) {
                this.f1408og.trimToSize(this.f1408og.size() / 2);
            }
        }
    }

    /* renamed from: com.google.android.gms.common.images.ImageManager$f */
    private final class C0671f implements Runnable {
        private final Bitmap mBitmap;
        private final Uri mUri;

        /* renamed from: mX */
        private final CountDownLatch f1409mX;

        /* renamed from: oo */
        private boolean f1411oo;

        public C0671f(Uri uri, Bitmap bitmap, boolean z, CountDownLatch countDownLatch) {
            this.mUri = uri;
            this.mBitmap = bitmap;
            this.f1411oo = z;
            this.f1409mX = countDownLatch;
        }

        /* renamed from: a */
        private void m1336a(ImageReceiver imageReceiver, boolean z) {
            imageReceiver.f1402ok = true;
            ArrayList a = imageReceiver.f1401oj;
            int size = a.size();
            for (int i = 0; i < size; i++) {
                C0672a aVar = (C0672a) a.get(i);
                if (z) {
                    aVar.mo6020a(ImageManager.this.mContext, this.mBitmap, false);
                } else {
                    aVar.mo6023b(ImageManager.this.mContext, false);
                }
                if (aVar.f1419os != 1) {
                    ImageManager.this.f1399oh.remove(aVar);
                }
            }
            imageReceiver.f1402ok = false;
        }

        public void run() {
            C1066ds.m2455N("OnBitmapLoadedRunnable must be executed in the main thread");
            boolean z = this.mBitmap != null;
            if (ImageManager.this.f1398og != null) {
                if (this.f1411oo) {
                    ImageManager.this.f1398og.evictAll();
                    System.gc();
                    this.f1411oo = false;
                    ImageManager.this.mHandler.post(this);
                    return;
                } else if (z) {
                    ImageManager.this.f1398og.put(new C0672a.C0673a(this.mUri), this.mBitmap);
                }
            }
            ImageReceiver imageReceiver = (ImageReceiver) ImageManager.this.f1400oi.remove(this.mUri);
            if (imageReceiver != null) {
                m1336a(imageReceiver, z);
            }
            this.f1409mX.countDown();
            synchronized (ImageManager.f1393ob) {
                ImageManager.f1394oc.remove(this.mUri);
            }
        }
    }

    private ImageManager(Context context, boolean withMemoryCache) {
        this.mContext = context.getApplicationContext();
        if (withMemoryCache) {
            this.f1398og = new C0667b(this.mContext);
            if (C1135fg.m2768cG()) {
                m1322bz();
            }
        } else {
            this.f1398og = null;
        }
        this.f1399oh = new HashMap();
        this.f1400oi = new HashMap();
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public Bitmap m1315a(C0672a.C0673a aVar) {
        if (this.f1398og == null) {
            return null;
        }
        return (Bitmap) this.f1398og.get(aVar);
    }

    /* renamed from: a */
    public static ImageManager m1316a(Context context, boolean z) {
        if (z) {
            if (f1396oe == null) {
                f1396oe = new ImageManager(context, true);
            }
            return f1396oe;
        }
        if (f1395od == null) {
            f1395od = new ImageManager(context, false);
        }
        return f1395od;
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public boolean m1320b(C0672a aVar) {
        C1066ds.m2455N("ImageManager.cleanupHashMaps() must be called in the main thread");
        if (aVar.f1419os == 1) {
            return true;
        }
        ImageReceiver imageReceiver = this.f1399oh.get(aVar);
        if (imageReceiver == null) {
            return true;
        }
        if (imageReceiver.f1402ok) {
            return false;
        }
        this.f1399oh.remove(aVar);
        imageReceiver.mo5996d(aVar);
        return true;
    }

    /* renamed from: bz */
    private void m1322bz() {
        this.mContext.registerComponentCallbacks(new C0670e(this.f1398og));
    }

    public static ImageManager create(Context context) {
        return m1316a(context, false);
    }

    /* renamed from: a */
    public void mo5988a(C0672a aVar) {
        C1066ds.m2455N("ImageManager.loadImage() must be called in the main thread");
        boolean b = m1320b(aVar);
        C0669d dVar = new C0669d(aVar);
        if (b) {
            dVar.run();
        } else {
            this.mHandler.post(dVar);
        }
    }

    public void loadImage(ImageView imageView, int resId) {
        C0672a aVar = new C0672a(resId);
        aVar.mo6021a(imageView);
        mo5988a(aVar);
    }

    public void loadImage(ImageView imageView, Uri uri) {
        C0672a aVar = new C0672a(uri);
        aVar.mo6021a(imageView);
        mo5988a(aVar);
    }

    public void loadImage(ImageView imageView, Uri uri, int defaultResId) {
        C0672a aVar = new C0672a(uri);
        aVar.mo6019F(defaultResId);
        aVar.mo6021a(imageView);
        mo5988a(aVar);
    }

    public void loadImage(OnImageLoadedListener listener, Uri uri) {
        C0672a aVar = new C0672a(uri);
        aVar.mo6022a(listener);
        mo5988a(aVar);
    }

    public void loadImage(OnImageLoadedListener listener, Uri uri, int defaultResId) {
        C0672a aVar = new C0672a(uri);
        aVar.mo6019F(defaultResId);
        aVar.mo6022a(listener);
        mo5988a(aVar);
    }
}
