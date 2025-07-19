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
import com.google.android.gms.common.images.a;
import com.google.android.gms.internal.ds;
import com.google.android.gms.internal.ek;
import com.google.android.gms.internal.fg;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Map;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
/* loaded from: classes.dex */
public final class ImageManager {
    private static final Object ob = new Object();
    private static HashSet<Uri> oc = new HashSet<>();
    private static ImageManager od;
    private static ImageManager oe;
    private final Context mContext;
    private final Handler mHandler = new Handler(Looper.getMainLooper());
    private final ExecutorService of = Executors.newFixedThreadPool(4);
    private final b og;
    private final Map<com.google.android.gms.common.images.a, ImageReceiver> oh;
    private final Map<Uri, ImageReceiver> oi;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public final class ImageReceiver extends ResultReceiver {
        private final Uri mUri;
        boolean ok = false;
        private final ArrayList<com.google.android.gms.common.images.a> oj = new ArrayList<>();

        ImageReceiver(Uri uri) {
            super(new Handler(Looper.getMainLooper()));
            this.mUri = uri;
        }

        public void bB() {
            Intent intent = new Intent("com.google.android.gms.common.images.LOAD_IMAGE");
            intent.putExtra("com.google.android.gms.extras.uri", this.mUri);
            intent.putExtra("com.google.android.gms.extras.resultReceiver", this);
            intent.putExtra("com.google.android.gms.extras.priority", 3);
            ImageManager.this.mContext.sendBroadcast(intent);
        }

        public void c(com.google.android.gms.common.images.a aVar) {
            ds.a(!this.ok, "Cannot add an ImageRequest when mHandlingRequests is true");
            ds.N("ImageReceiver.addImageRequest() must be called in the main thread");
            this.oj.add(aVar);
        }

        public void d(com.google.android.gms.common.images.a aVar) {
            ds.a(!this.ok, "Cannot remove an ImageRequest when mHandlingRequests is true");
            ds.N("ImageReceiver.removeImageRequest() must be called in the main thread");
            this.oj.remove(aVar);
        }

        @Override // android.os.ResultReceiver
        public void onReceiveResult(int resultCode, Bundle resultData) {
            ImageManager.this.of.execute(new c(this.mUri, (ParcelFileDescriptor) resultData.getParcelable("com.google.android.gms.extra.fileDescriptor")));
        }
    }

    /* loaded from: classes.dex */
    public interface OnImageLoadedListener {
        void onImageLoaded(Uri uri, Drawable drawable, boolean z);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class a {
        static int a(ActivityManager activityManager) {
            return activityManager.getLargeMemoryClass();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class b extends ek<a.C0012a, Bitmap> {
        public b(Context context) {
            super(q(context));
        }

        private static int q(Context context) {
            ActivityManager activityManager = (ActivityManager) context.getSystemService("activity");
            return (int) (((!((context.getApplicationInfo().flags & 1048576) != 0) || !fg.cD()) ? activityManager.getMemoryClass() : a.a(activityManager)) * 1048576 * 0.33f);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.ek
        /* renamed from: a */
        public int sizeOf(a.C0012a c0012a, Bitmap bitmap) {
            return bitmap.getHeight() * bitmap.getRowBytes();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.internal.ek
        /* renamed from: a */
        public void entryRemoved(boolean z, a.C0012a c0012a, Bitmap bitmap, Bitmap bitmap2) {
            super.entryRemoved(z, c0012a, bitmap, bitmap2);
        }
    }

    /* loaded from: classes.dex */
    private final class c implements Runnable {
        private final Uri mUri;
        private final ParcelFileDescriptor om;

        public c(Uri uri, ParcelFileDescriptor parcelFileDescriptor) {
            this.mUri = uri;
            this.om = parcelFileDescriptor;
        }

        @Override // java.lang.Runnable
        public void run() {
            ds.O("LoadBitmapFromDiskRunnable can't be executed in the main thread");
            boolean z = false;
            Bitmap bitmap = null;
            if (this.om != null) {
                try {
                    bitmap = BitmapFactory.decodeFileDescriptor(this.om.getFileDescriptor());
                } catch (OutOfMemoryError e) {
                    Log.e("ImageManager", "OOM while loading bitmap for uri: " + this.mUri, e);
                    z = true;
                }
                try {
                    this.om.close();
                } catch (IOException e2) {
                    Log.e("ImageManager", "closed failed", e2);
                }
            }
            CountDownLatch countDownLatch = new CountDownLatch(1);
            ImageManager.this.mHandler.post(new f(this.mUri, bitmap, z, countDownLatch));
            try {
                countDownLatch.await();
            } catch (InterruptedException e3) {
                Log.w("ImageManager", "Latch interrupted while posting " + this.mUri);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public final class d implements Runnable {
        private final com.google.android.gms.common.images.a on;

        public d(com.google.android.gms.common.images.a aVar) {
            this.on = aVar;
        }

        @Override // java.lang.Runnable
        public void run() {
            ds.N("LoadImageRunnable must be executed on the main thread");
            ImageManager.this.b(this.on);
            a.C0012a c0012a = this.on.op;
            if (c0012a.uri == null) {
                this.on.b(ImageManager.this.mContext, true);
                return;
            }
            Bitmap a = ImageManager.this.a(c0012a);
            if (a != null) {
                this.on.a(ImageManager.this.mContext, a, true);
                return;
            }
            this.on.r(ImageManager.this.mContext);
            ImageReceiver imageReceiver = (ImageReceiver) ImageManager.this.oi.get(c0012a.uri);
            if (imageReceiver == null) {
                imageReceiver = new ImageReceiver(c0012a.uri);
                ImageManager.this.oi.put(c0012a.uri, imageReceiver);
            }
            imageReceiver.c(this.on);
            if (this.on.os != 1) {
                ImageManager.this.oh.put(this.on, imageReceiver);
            }
            synchronized (ImageManager.ob) {
                if (!ImageManager.oc.contains(c0012a.uri)) {
                    ImageManager.oc.add(c0012a.uri);
                    imageReceiver.bB();
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static final class e implements ComponentCallbacks2 {
        private final b og;

        public e(b bVar) {
            this.og = bVar;
        }

        @Override // android.content.ComponentCallbacks
        public void onConfigurationChanged(Configuration newConfig) {
        }

        @Override // android.content.ComponentCallbacks
        public void onLowMemory() {
            this.og.evictAll();
        }

        @Override // android.content.ComponentCallbacks2
        public void onTrimMemory(int level) {
            if (level >= 60) {
                this.og.evictAll();
            } else if (level < 20) {
            } else {
                this.og.trimToSize(this.og.size() / 2);
            }
        }
    }

    /* loaded from: classes.dex */
    private final class f implements Runnable {
        private final Bitmap mBitmap;
        private final Uri mUri;
        private final CountDownLatch mX;
        private boolean oo;

        public f(Uri uri, Bitmap bitmap, boolean z, CountDownLatch countDownLatch) {
            this.mUri = uri;
            this.mBitmap = bitmap;
            this.oo = z;
            this.mX = countDownLatch;
        }

        private void a(ImageReceiver imageReceiver, boolean z) {
            imageReceiver.ok = true;
            ArrayList arrayList = imageReceiver.oj;
            int size = arrayList.size();
            for (int i = 0; i < size; i++) {
                com.google.android.gms.common.images.a aVar = (com.google.android.gms.common.images.a) arrayList.get(i);
                if (z) {
                    aVar.a(ImageManager.this.mContext, this.mBitmap, false);
                } else {
                    aVar.b(ImageManager.this.mContext, false);
                }
                if (aVar.os != 1) {
                    ImageManager.this.oh.remove(aVar);
                }
            }
            imageReceiver.ok = false;
        }

        @Override // java.lang.Runnable
        public void run() {
            ds.N("OnBitmapLoadedRunnable must be executed in the main thread");
            boolean z = this.mBitmap != null;
            if (ImageManager.this.og != null) {
                if (this.oo) {
                    ImageManager.this.og.evictAll();
                    System.gc();
                    this.oo = false;
                    ImageManager.this.mHandler.post(this);
                    return;
                } else if (z) {
                    ImageManager.this.og.put(new a.C0012a(this.mUri), this.mBitmap);
                }
            }
            ImageReceiver imageReceiver = (ImageReceiver) ImageManager.this.oi.remove(this.mUri);
            if (imageReceiver != null) {
                a(imageReceiver, z);
            }
            this.mX.countDown();
            synchronized (ImageManager.ob) {
                ImageManager.oc.remove(this.mUri);
            }
        }
    }

    private ImageManager(Context context, boolean withMemoryCache) {
        this.mContext = context.getApplicationContext();
        if (withMemoryCache) {
            this.og = new b(this.mContext);
            if (fg.cG()) {
                bz();
            }
        } else {
            this.og = null;
        }
        this.oh = new HashMap();
        this.oi = new HashMap();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Bitmap a(a.C0012a c0012a) {
        if (this.og == null) {
            return null;
        }
        return this.og.get(c0012a);
    }

    public static ImageManager a(Context context, boolean z) {
        if (z) {
            if (oe == null) {
                oe = new ImageManager(context, true);
            }
            return oe;
        }
        if (od == null) {
            od = new ImageManager(context, false);
        }
        return od;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean b(com.google.android.gms.common.images.a aVar) {
        ImageReceiver imageReceiver;
        ds.N("ImageManager.cleanupHashMaps() must be called in the main thread");
        if (aVar.os != 1 && (imageReceiver = this.oh.get(aVar)) != null) {
            if (imageReceiver.ok) {
                return false;
            }
            this.oh.remove(aVar);
            imageReceiver.d(aVar);
            return true;
        }
        return true;
    }

    private void bz() {
        this.mContext.registerComponentCallbacks(new e(this.og));
    }

    public static ImageManager create(Context context) {
        return a(context, false);
    }

    public void a(com.google.android.gms.common.images.a aVar) {
        ds.N("ImageManager.loadImage() must be called in the main thread");
        boolean b2 = b(aVar);
        d dVar = new d(aVar);
        if (b2) {
            dVar.run();
        } else {
            this.mHandler.post(dVar);
        }
    }

    public void loadImage(ImageView imageView, int resId) {
        com.google.android.gms.common.images.a aVar = new com.google.android.gms.common.images.a(resId);
        aVar.a(imageView);
        a(aVar);
    }

    public void loadImage(ImageView imageView, Uri uri) {
        com.google.android.gms.common.images.a aVar = new com.google.android.gms.common.images.a(uri);
        aVar.a(imageView);
        a(aVar);
    }

    public void loadImage(ImageView imageView, Uri uri, int defaultResId) {
        com.google.android.gms.common.images.a aVar = new com.google.android.gms.common.images.a(uri);
        aVar.F(defaultResId);
        aVar.a(imageView);
        a(aVar);
    }

    public void loadImage(OnImageLoadedListener listener, Uri uri) {
        com.google.android.gms.common.images.a aVar = new com.google.android.gms.common.images.a(uri);
        aVar.a(listener);
        a(aVar);
    }

    public void loadImage(OnImageLoadedListener listener, Uri uri, int defaultResId) {
        com.google.android.gms.common.images.a aVar = new com.google.android.gms.common.images.a(uri);
        aVar.F(defaultResId);
        aVar.a(listener);
        a(aVar);
    }
}
