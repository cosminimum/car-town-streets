package com.facebook.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import com.facebook.internal.Utility;
import com.facebook.widget.WorkQueue;
import java.io.InputStream;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

class ImageDownloader {
    private static final int CACHE_READ_QUEUE_MAX_CONCURRENT = 2;
    private static final int DOWNLOAD_QUEUE_MAX_CONCURRENT = 8;
    private static WorkQueue cacheReadQueue = new WorkQueue(2);
    private static WorkQueue downloadQueue = new WorkQueue(8);
    private static final Handler handler = new Handler();
    private static final Map<RequestKey, DownloaderContext> pendingRequests = new HashMap();

    ImageDownloader() {
    }

    static void downloadAsync(ImageRequest request) {
        if (request != null) {
            RequestKey key = new RequestKey(request.getImageUrl(), request.getCallerTag());
            synchronized (pendingRequests) {
                DownloaderContext downloaderContext = pendingRequests.get(key);
                if (downloaderContext != null) {
                    downloaderContext.request = request;
                    downloaderContext.isCancelled = false;
                    downloaderContext.workItem.moveToFront();
                } else {
                    enqueueCacheRead(request, key, request.isCachedRedirectAllowed());
                }
            }
        }
    }

    static boolean cancelRequest(ImageRequest request) {
        boolean cancelled = false;
        RequestKey key = new RequestKey(request.getImageUrl(), request.getCallerTag());
        synchronized (pendingRequests) {
            DownloaderContext downloaderContext = pendingRequests.get(key);
            if (downloaderContext != null) {
                cancelled = true;
                if (downloaderContext.workItem.cancel()) {
                    pendingRequests.remove(key);
                } else {
                    downloaderContext.isCancelled = true;
                }
            }
        }
        return cancelled;
    }

    static void prioritizeRequest(ImageRequest request) {
        RequestKey key = new RequestKey(request.getImageUrl(), request.getCallerTag());
        synchronized (pendingRequests) {
            DownloaderContext downloaderContext = pendingRequests.get(key);
            if (downloaderContext != null) {
                downloaderContext.workItem.moveToFront();
            }
        }
    }

    private static void enqueueCacheRead(ImageRequest request, RequestKey key, boolean allowCachedRedirects) {
        enqueueRequest(request, key, cacheReadQueue, new CacheReadWorkItem(request.getContext(), key, allowCachedRedirects));
    }

    private static void enqueueDownload(ImageRequest request, RequestKey key) {
        enqueueRequest(request, key, downloadQueue, new DownloadImageWorkItem(request.getContext(), key));
    }

    private static void enqueueRequest(ImageRequest request, RequestKey key, WorkQueue workQueue, Runnable workItem) {
        synchronized (pendingRequests) {
            DownloaderContext downloaderContext = new DownloaderContext();
            downloaderContext.request = request;
            pendingRequests.put(key, downloaderContext);
            downloaderContext.workItem = workQueue.addActiveWorkItem(workItem);
        }
    }

    /* JADX WARNING: Code restructure failed: missing block: B:4:0x000a, code lost:
        r1 = r6.request;
        r5 = r1.getCallback();
     */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    private static void issueResponse(com.facebook.widget.ImageDownloader.RequestKey r8, java.lang.Exception r9, android.graphics.Bitmap r10, boolean r11) {
        /*
            com.facebook.widget.ImageDownloader$DownloaderContext r6 = removePendingRequest(r8)
            if (r6 == 0) goto L_0x001f
            boolean r0 = r6.isCancelled
            if (r0 != 0) goto L_0x001f
            com.facebook.widget.ImageRequest r1 = r6.request
            com.facebook.widget.ImageRequest$Callback r5 = r1.getCallback()
            if (r5 == 0) goto L_0x001f
            android.os.Handler r7 = handler
            com.facebook.widget.ImageDownloader$1 r0 = new com.facebook.widget.ImageDownloader$1
            r2 = r9
            r3 = r11
            r4 = r10
            r0.<init>(r1, r2, r3, r4, r5)
            r7.post(r0)
        L_0x001f:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.widget.ImageDownloader.issueResponse(com.facebook.widget.ImageDownloader$RequestKey, java.lang.Exception, android.graphics.Bitmap, boolean):void");
    }

    /* access modifiers changed from: private */
    public static void readFromCache(RequestKey key, Context context, boolean allowCachedRedirects) {
        URL redirectUrl;
        InputStream cachedStream = null;
        boolean isCachedRedirect = false;
        if (allowCachedRedirects && (redirectUrl = UrlRedirectCache.getRedirectedUrl(context, key.url)) != null) {
            cachedStream = ImageResponseCache.getCachedImageStream(redirectUrl, context);
            isCachedRedirect = cachedStream != null;
        }
        if (!isCachedRedirect) {
            cachedStream = ImageResponseCache.getCachedImageStream(key.url, context);
        }
        if (cachedStream != null) {
            Bitmap bitmap = BitmapFactory.decodeStream(cachedStream);
            Utility.closeQuietly(cachedStream);
            issueResponse(key, (Exception) null, bitmap, isCachedRedirect);
            return;
        }
        DownloaderContext downloaderContext = removePendingRequest(key);
        if (downloaderContext != null && !downloaderContext.isCancelled) {
            enqueueDownload(downloaderContext.request, key);
        }
    }

    /* JADX WARNING: type inference failed for: r14v3, types: [java.net.URLConnection] */
    /* access modifiers changed from: private */
    /* JADX WARNING: Multi-variable type inference failed */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public static void download(com.facebook.widget.ImageDownloader.RequestKey r17, android.content.Context r18) {
        /*
            r4 = 0
            r13 = 0
            r7 = 0
            r1 = 0
            r9 = 1
            r0 = r17
            java.net.URL r14 = r0.url     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            java.net.URLConnection r14 = r14.openConnection()     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r0 = r14
            java.net.HttpURLConnection r0 = (java.net.HttpURLConnection) r0     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r4 = r0
            r14 = 0
            r4.setInstanceFollowRedirects(r14)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            int r14 = r4.getResponseCode()     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            switch(r14) {
                case 200: goto L_0x008c;
                case 301: goto L_0x004c;
                case 302: goto L_0x004c;
                default: goto L_0x001c;
            }     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
        L_0x001c:
            java.io.InputStream r13 = r4.getErrorStream()     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            java.io.InputStreamReader r10 = new java.io.InputStreamReader     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r10.<init>(r13)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r14 = 128(0x80, float:1.794E-43)
            char[] r2 = new char[r14]     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            java.lang.StringBuilder r8 = new java.lang.StringBuilder     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r8.<init>()     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
        L_0x002e:
            r14 = 0
            int r15 = r2.length     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            int r3 = r10.read(r2, r14, r15)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            if (r3 <= 0) goto L_0x0097
            r14 = 0
            r8.append(r2, r14, r3)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            goto L_0x002e
        L_0x003b:
            r6 = move-exception
            r7 = r6
            com.facebook.internal.Utility.closeQuietly(r13)
            com.facebook.internal.Utility.disconnectQuietly(r4)
        L_0x0043:
            if (r9 == 0) goto L_0x004b
            r14 = 0
            r0 = r17
            issueResponse(r0, r7, r1, r14)
        L_0x004b:
            return
        L_0x004c:
            r9 = 0
            java.lang.String r14 = "location"
            java.lang.String r11 = r4.getHeaderField(r14)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            boolean r14 = com.facebook.internal.Utility.isNullOrEmpty((java.lang.String) r11)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            if (r14 != 0) goto L_0x0085
            java.net.URL r12 = new java.net.URL     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r12.<init>(r11)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r0 = r17
            java.net.URL r14 = r0.url     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r0 = r18
            com.facebook.widget.UrlRedirectCache.cacheUrlRedirect(r0, r14, r12)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            com.facebook.widget.ImageDownloader$DownloaderContext r5 = removePendingRequest(r17)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            if (r5 == 0) goto L_0x0085
            boolean r14 = r5.isCancelled     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            if (r14 != 0) goto L_0x0085
            com.facebook.widget.ImageRequest r14 = r5.request     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            com.facebook.widget.ImageDownloader$RequestKey r15 = new com.facebook.widget.ImageDownloader$RequestKey     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r0 = r17
            java.lang.Object r0 = r0.tag     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r16 = r0
            r0 = r16
            r15.<init>(r12, r0)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r16 = 0
            enqueueCacheRead(r14, r15, r16)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
        L_0x0085:
            com.facebook.internal.Utility.closeQuietly(r13)
            com.facebook.internal.Utility.disconnectQuietly(r4)
            goto L_0x0043
        L_0x008c:
            r0 = r18
            java.io.InputStream r13 = com.facebook.widget.ImageResponseCache.interceptAndCacheImageStream(r0, r4)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            android.graphics.Bitmap r1 = android.graphics.BitmapFactory.decodeStream(r13)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            goto L_0x0085
        L_0x0097:
            com.facebook.internal.Utility.closeQuietly(r10)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            com.facebook.FacebookException r7 = new com.facebook.FacebookException     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            java.lang.String r14 = r8.toString()     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            r7.<init>((java.lang.String) r14)     // Catch:{ IOException -> 0x003b, all -> 0x00a4 }
            goto L_0x0085
        L_0x00a4:
            r14 = move-exception
            com.facebook.internal.Utility.closeQuietly(r13)
            com.facebook.internal.Utility.disconnectQuietly(r4)
            throw r14
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.widget.ImageDownloader.download(com.facebook.widget.ImageDownloader$RequestKey, android.content.Context):void");
    }

    private static DownloaderContext removePendingRequest(RequestKey key) {
        DownloaderContext remove;
        synchronized (pendingRequests) {
            remove = pendingRequests.remove(key);
        }
        return remove;
    }

    private static class RequestKey {
        private static final int HASH_MULTIPLIER = 37;
        private static final int HASH_SEED = 29;
        Object tag;
        URL url;

        RequestKey(URL url2, Object tag2) {
            this.url = url2;
            this.tag = tag2;
        }

        public int hashCode() {
            return ((this.url.hashCode() + 1073) * HASH_MULTIPLIER) + this.tag.hashCode();
        }

        public boolean equals(Object o) {
            if (o == null || !(o instanceof RequestKey)) {
                return false;
            }
            RequestKey compareTo = (RequestKey) o;
            return compareTo.url == this.url && compareTo.tag == this.tag;
        }
    }

    private static class DownloaderContext {
        boolean isCancelled;
        ImageRequest request;
        WorkQueue.WorkItem workItem;

        private DownloaderContext() {
        }
    }

    private static class CacheReadWorkItem implements Runnable {
        private boolean allowCachedRedirects;
        private Context context;
        private RequestKey key;

        CacheReadWorkItem(Context context2, RequestKey key2, boolean allowCachedRedirects2) {
            this.context = context2;
            this.key = key2;
            this.allowCachedRedirects = allowCachedRedirects2;
        }

        public void run() {
            ImageDownloader.readFromCache(this.key, this.context, this.allowCachedRedirects);
        }
    }

    private static class DownloadImageWorkItem implements Runnable {
        private Context context;
        private RequestKey key;

        DownloadImageWorkItem(Context context2, RequestKey key2) {
            this.context = context2;
            this.key = key2;
        }

        public void run() {
            ImageDownloader.download(this.key, this.context);
        }
    }
}
