package com.millennialmedia.android;

import android.content.Context;
import com.millennialmedia.android.AdCache;
import java.lang.ref.WeakReference;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AdCacheThreadPool {
    private static AdCacheThreadPool sharedThreadPool;
    private ThreadPoolExecutor executor;
    private PriorityBlockingQueue queue;

    private AdCacheThreadPool() {
        TimeUnit timeUnit = TimeUnit.SECONDS;
        PriorityBlockingQueue priorityBlockingQueue = new PriorityBlockingQueue(32);
        this.queue = priorityBlockingQueue;
        this.executor = new ThreadPoolExecutor(1, 2, 30L, timeUnit, priorityBlockingQueue);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static synchronized AdCacheThreadPool sharedThreadPool() {
        AdCacheThreadPool adCacheThreadPool;
        synchronized (AdCacheThreadPool.class) {
            if (sharedThreadPool == null) {
                sharedThreadPool = new AdCacheThreadPool();
            }
            adCacheThreadPool = sharedThreadPool;
        }
        return adCacheThreadPool;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void startDownloadTask(Context context, String adName, CachedAd ad, AdCache.AdCacheTaskListener listener) {
        if (context != null && ad != null) {
            AdCacheTask task = new AdCacheTask(context, adName, ad, listener);
            if (!this.queue.contains(task) && !ad.isOnDisk(context)) {
                this.executor.execute(task);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class AdCacheTask implements Runnable, Comparable<AdCacheTask> {
        private CachedAd ad;
        private String adName;
        private WeakReference<Context> contextRef;
        private WeakReference<AdCache.AdCacheTaskListener> listenerRef;

        AdCacheTask(Context context, String adName, CachedAd ad, AdCache.AdCacheTaskListener listener) {
            this.contextRef = new WeakReference<>(context.getApplicationContext());
            this.adName = adName;
            this.ad = ad;
            if (listener != null) {
                this.listenerRef = new WeakReference<>(listener);
            }
        }

        @Override // java.lang.Runnable
        public void run() {
            String str = null;
            AdCache.AdCacheTaskListener listener = null;
            HandShake.sharedHandShake(this.contextRef.get()).lockAdTypeDownload(this.adName);
            boolean success = this.ad.download(this.contextRef.get());
            HandShake.sharedHandShake(this.contextRef.get()).unlockAdTypeDownload(this.adName);
            if (!success) {
                String incompleteId = AdCache.getIncompleteDownload(this.contextRef.get(), this.adName);
                if (incompleteId != null && this.ad.id.equals(incompleteId)) {
                    this.ad.delete(this.contextRef.get());
                    AdCache.setIncompleteDownload(this.contextRef.get(), this.adName, null);
                } else {
                    Context context = this.contextRef.get();
                    String str2 = this.adName;
                    if (!this.ad.downloadAllOrNothing) {
                        str = this.ad.id;
                    }
                    AdCache.setIncompleteDownload(context, str2, str);
                }
            } else {
                AdCache.setIncompleteDownload(this.contextRef.get(), this.adName, null);
            }
            if (this.listenerRef != null) {
                AdCache.AdCacheTaskListener listener2 = this.listenerRef.get();
                listener = listener2;
            }
            if (listener != null) {
                listener.downloadCompleted(this.ad, success);
            }
        }

        public boolean equals(Object task) {
            if (this == task) {
                return true;
            }
            return this.ad.equals(((AdCacheTask) task).ad);
        }

        @Override // java.lang.Comparable
        public int compareTo(AdCacheTask another) {
            return this.ad.downloadPriority - another.ad.downloadPriority;
        }
    }
}
