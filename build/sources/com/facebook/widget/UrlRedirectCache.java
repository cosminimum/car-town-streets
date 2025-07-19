package com.facebook.widget;

import android.content.Context;
import com.facebook.internal.FileLruCache;
import com.facebook.internal.Utility;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;

class UrlRedirectCache {
    private static final String REDIRECT_CONTENT_TAG = (TAG + "_Redirect");
    static final String TAG = UrlRedirectCache.class.getSimpleName();
    private static volatile FileLruCache urlRedirectCache;

    UrlRedirectCache() {
    }

    static synchronized FileLruCache getCache(Context context) throws IOException {
        FileLruCache fileLruCache;
        synchronized (UrlRedirectCache.class) {
            if (urlRedirectCache == null) {
                urlRedirectCache = new FileLruCache(context.getApplicationContext(), TAG, new FileLruCache.Limits());
            }
            fileLruCache = urlRedirectCache;
        }
        return fileLruCache;
    }

    static URL getRedirectedUrl(Context context, URL url) {
        InputStreamReader reader;
        if (url == null) {
            return null;
        }
        String urlString = url.toString();
        URL finalUrl = null;
        InputStreamReader reader2 = null;
        try {
            FileLruCache cache = getCache(context);
            boolean redirectExists = false;
            while (true) {
                try {
                    reader = reader2;
                    InputStream stream = cache.get(urlString, REDIRECT_CONTENT_TAG);
                    if (stream == null) {
                        break;
                    }
                    redirectExists = true;
                    reader2 = new InputStreamReader(stream);
                    char[] buffer = new char[128];
                    StringBuilder urlBuilder = new StringBuilder();
                    while (true) {
                        int bufferLength = reader2.read(buffer, 0, buffer.length);
                        if (bufferLength <= 0) {
                            break;
                        }
                        urlBuilder.append(buffer, 0, bufferLength);
                    }
                    Utility.closeQuietly(reader2);
                    urlString = urlBuilder.toString();
                } catch (MalformedURLException e) {
                    reader2 = reader;
                    Utility.closeQuietly(reader2);
                    return null;
                } catch (IOException e2) {
                    reader2 = reader;
                    Utility.closeQuietly(reader2);
                    return null;
                } catch (Throwable th) {
                    th = th;
                    reader2 = reader;
                    Utility.closeQuietly(reader2);
                    throw th;
                }
            }
            if (redirectExists) {
                finalUrl = new URL(urlString);
            }
            Utility.closeQuietly(reader);
            InputStreamReader inputStreamReader = reader;
            return finalUrl;
        } catch (MalformedURLException e3) {
            Utility.closeQuietly(reader2);
            return null;
        } catch (IOException e4) {
            Utility.closeQuietly(reader2);
            return null;
        } catch (Throwable th2) {
            th = th2;
            Utility.closeQuietly(reader2);
            throw th;
        }
    }

    static void cacheUrlRedirect(Context context, URL fromUrl, URL toUrl) {
        if (fromUrl != null && toUrl != null) {
            OutputStream redirectStream = null;
            try {
                redirectStream = getCache(context).openPutStream(fromUrl.toString(), REDIRECT_CONTENT_TAG);
                redirectStream.write(toUrl.toString().getBytes());
            } catch (IOException e) {
            } finally {
                Utility.closeQuietly(redirectStream);
            }
        }
    }
}
