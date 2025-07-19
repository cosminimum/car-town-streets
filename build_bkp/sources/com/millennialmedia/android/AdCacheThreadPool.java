package com.millennialmedia.android;

import android.content.Context;
import com.millennialmedia.android.AdCache;
import java.lang.ref.WeakReference;
import java.util.concurrent.PriorityBlockingQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

final class AdCacheThreadPool {
    private static AdCacheThreadPool sharedThreadPool;
    private ThreadPoolExecutor executor;
    private PriorityBlockingQueue queue;

    private AdCacheThreadPool() {
        TimeUnit timeUnit = TimeUnit.SECONDS;
        PriorityBlockingQueue priorityBlockingQueue = new PriorityBlockingQueue(32);
        this.queue = priorityBlockingQueue;
        this.executor = new ThreadPoolExecutor(1, 2, 30, timeUnit, priorityBlockingQueue);
    }

    static synchronized AdCacheThreadPool sharedThreadPool() {
        AdCacheThreadPool adCacheThreadPool;
        synchronized (AdCacheThreadPool.class) {
            if (sharedThreadPool == null) {
                sharedThreadPool = new AdCacheThreadPool();
            }
            adCacheThreadPool = sharedThreadPool;
        }
        return adCacheThreadPool;
    }

    /* access modifiers changed from: package-private */
    public synchronized void startDownloadTask(Context context, String adName, CachedAd ad, AdCache.AdCacheTaskListener listener) {
        if (!(context == null || ad == null)) {
            AdCacheTask task = new AdCacheTask(context, adName, ad, listener);
            if (!this.queue.contains(task) && !ad.isOnDisk(context)) {
                this.executor.execute(task);
            }
        }
    }

    private class AdCacheTask implements Runnable, Comparable<AdCacheTask> {

        /* renamed from: ad */
        private CachedAd f3952ad;
        private String adName;
        private WeakReference<Context> contextRef;
        private WeakReference<AdCache.AdCacheTaskListener> listenerRef;

        AdCacheTask(Context context, String adName2, CachedAd ad, AdCache.AdCacheTaskListener listener) {
            this.contextRef = new WeakReference<>(context.getApplicationContext());
            this.adName = adName2;
            this.f3952ad = ad;
            if (listener != null) {
                this.listenerRef = new WeakReference<>(listener);
            }
        }

        public void run() {
            String str = null;
            AdCache.AdCacheTaskListener listener = null;
            HandShake.sharedHandShake((Context) this.contextRef.get()).lockAdTypeDownload(this.adName);
            boolean success = this.f3952ad.download((Context) this.contextRef.get());
            HandShake.sharedHandShake((Context) this.contextRef.get()).unlockAdTypeDownload(this.adName);
            if (!success) {
                String incompleteId = AdCache.getIncompleteDownload((Context) this.contextRef.get(), this.adName);
                if (incompleteId == null || !this.f3952ad.f3958id.equals(incompleteId)) {
                    Context context = (Context) this.contextRef.get();
                    String str2 = this.adName;
                    if (!this.f3952ad.downloadAllOrNothing) {
                        str = this.f3952ad.f3958id;
                    }
                    AdCache.setIncompleteDownload(context, str2, str);
                } else {
                    this.f3952ad.delete((Context) this.contextRef.get());
                    AdCache.setIncompleteDownload((Context) this.contextRef.get(), this.adName, (String) null);
                }
            } else {
                AdCache.setIncompleteDownload((Context) this.contextRef.get(), this.adName, (String) null);
            }
            if (this.listenerRef != null) {
                listener = (AdCache.AdCacheTaskListener) this.listenerRef.get();
            }
            if (listener != null) {
                listener.downloadCompleted(this.f3952ad, success);
            }
        }

        public boolean equals(Object task) {
            if (this == task) {
                return true;
            }
            return this.f3952ad.equals(((AdCacheTask) task).f3952ad);
        }

        public int compareTo(AdCacheTask another) {
            return this.f3952ad.downloadPriority - another.f3952ad.downloadPriority;
        }
    }
}
