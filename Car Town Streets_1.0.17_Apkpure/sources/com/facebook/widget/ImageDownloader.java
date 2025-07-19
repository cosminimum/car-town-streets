package com.facebook.widget;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import com.facebook.FacebookException;
import com.facebook.internal.Utility;
import com.facebook.widget.ImageRequest;
import com.facebook.widget.WorkQueue;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
class ImageDownloader {
    private static final int CACHE_READ_QUEUE_MAX_CONCURRENT = 2;
    private static final int DOWNLOAD_QUEUE_MAX_CONCURRENT = 8;
    private static final Handler handler = new Handler();
    private static WorkQueue downloadQueue = new WorkQueue(8);
    private static WorkQueue cacheReadQueue = new WorkQueue(2);
    private static final Map<RequestKey, DownloaderContext> pendingRequests = new HashMap();

    ImageDownloader() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void downloadAsync(ImageRequest request) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean cancelRequest(ImageRequest request) {
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

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void prioritizeRequest(ImageRequest request) {
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

    private static void issueResponse(RequestKey key, final Exception error, final Bitmap bitmap, final boolean isCachedRedirect) {
        final ImageRequest request;
        final ImageRequest.Callback callback;
        DownloaderContext completedRequestContext = removePendingRequest(key);
        if (completedRequestContext != null && !completedRequestContext.isCancelled && (callback = (request = completedRequestContext.request).getCallback()) != null) {
            handler.post(new Runnable() { // from class: com.facebook.widget.ImageDownloader.1
                @Override // java.lang.Runnable
                public void run() {
                    ImageResponse response = new ImageResponse(ImageRequest.this, error, isCachedRedirect, bitmap);
                    callback.onCompleted(response);
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
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
            issueResponse(key, null, bitmap, isCachedRedirect);
            return;
        }
        DownloaderContext downloaderContext = removePendingRequest(key);
        if (downloaderContext != null && !downloaderContext.isCancelled) {
            enqueueDownload(downloaderContext.request, key);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void download(RequestKey key, Context context) {
        HttpURLConnection connection = null;
        InputStream stream = null;
        Exception error = null;
        Bitmap bitmap = null;
        boolean issueResponse = true;
        try {
            connection = (HttpURLConnection) key.url.openConnection();
            connection.setInstanceFollowRedirects(false);
            switch (connection.getResponseCode()) {
                case 200:
                    stream = ImageResponseCache.interceptAndCacheImageStream(context, connection);
                    bitmap = BitmapFactory.decodeStream(stream);
                    break;
                case 301:
                case 302:
                    issueResponse = false;
                    String redirectLocation = connection.getHeaderField("location");
                    if (!Utility.isNullOrEmpty(redirectLocation)) {
                        URL redirectUrl = new URL(redirectLocation);
                        UrlRedirectCache.cacheUrlRedirect(context, key.url, redirectUrl);
                        DownloaderContext downloaderContext = removePendingRequest(key);
                        if (downloaderContext != null && !downloaderContext.isCancelled) {
                            enqueueCacheRead(downloaderContext.request, new RequestKey(redirectUrl, key.tag), false);
                            break;
                        }
                    }
                    break;
                default:
                    stream = connection.getErrorStream();
                    InputStreamReader reader = new InputStreamReader(stream);
                    char[] buffer = new char[128];
                    StringBuilder errorMessageBuilder = new StringBuilder();
                    while (true) {
                        int bufferLength = reader.read(buffer, 0, buffer.length);
                        if (bufferLength > 0) {
                            errorMessageBuilder.append(buffer, 0, bufferLength);
                        } else {
                            Utility.closeQuietly(reader);
                            error = new FacebookException(errorMessageBuilder.toString());
                            break;
                        }
                    }
            }
        } catch (IOException e) {
            error = e;
        } finally {
            Utility.closeQuietly(null);
            Utility.disconnectQuietly(connection);
        }
        if (issueResponse) {
            issueResponse(key, error, bitmap, false);
        }
    }

    private static DownloaderContext removePendingRequest(RequestKey key) {
        DownloaderContext remove;
        synchronized (pendingRequests) {
            remove = pendingRequests.remove(key);
        }
        return remove;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class RequestKey {
        private static final int HASH_MULTIPLIER = 37;
        private static final int HASH_SEED = 29;
        Object tag;
        URL url;

        RequestKey(URL url, Object tag) {
            this.url = url;
            this.tag = tag;
        }

        public int hashCode() {
            int result = this.url.hashCode() + 1073;
            return (result * HASH_MULTIPLIER) + this.tag.hashCode();
        }

        public boolean equals(Object o) {
            if (o == null || !(o instanceof RequestKey)) {
                return false;
            }
            RequestKey compareTo = (RequestKey) o;
            return compareTo.url == this.url && compareTo.tag == this.tag;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class DownloaderContext {
        boolean isCancelled;
        ImageRequest request;
        WorkQueue.WorkItem workItem;

        private DownloaderContext() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class CacheReadWorkItem implements Runnable {
        private boolean allowCachedRedirects;
        private Context context;
        private RequestKey key;

        CacheReadWorkItem(Context context, RequestKey key, boolean allowCachedRedirects) {
            this.context = context;
            this.key = key;
            this.allowCachedRedirects = allowCachedRedirects;
        }

        @Override // java.lang.Runnable
        public void run() {
            ImageDownloader.readFromCache(this.key, this.context, this.allowCachedRedirects);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class DownloadImageWorkItem implements Runnable {
        private Context context;
        private RequestKey key;

        DownloadImageWorkItem(Context context, RequestKey key) {
            this.context = context;
            this.key = key;
        }

        @Override // java.lang.Runnable
        public void run() {
            ImageDownloader.download(this.key, this.context);
        }
    }
}
