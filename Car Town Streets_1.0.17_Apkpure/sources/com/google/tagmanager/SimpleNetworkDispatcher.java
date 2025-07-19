package com.google.tagmanager;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.os.Build;
import com.getjar.sdk.comm.ServiceProxyBase;
import com.google.android.gms.common.util.VisibleForTesting;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.List;
import java.util.Locale;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpHost;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.message.BasicHttpEntityEnclosingRequest;
/* loaded from: classes.dex */
class SimpleNetworkDispatcher implements Dispatcher {
    private static final String USER_AGENT_TEMPLATE = "%s/%s (Linux; U; Android %s; %s; %s Build/%s)";
    private final Context ctx;
    private DispatchListener dispatchListener;
    private final HttpClient httpClient;
    private final String userAgent = createUserAgentString("GoogleTagManager", "3.01", Build.VERSION.RELEASE, getUserAgentLanguage(Locale.getDefault()), Build.MODEL, Build.ID);

    /* loaded from: classes.dex */
    public interface DispatchListener {
        void onHitDispatched(Hit hit);

        void onHitPermanentDispatchFailure(Hit hit);

        void onHitTransientDispatchFailure(Hit hit);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @VisibleForTesting
    public SimpleNetworkDispatcher(HttpClient httpClient, Context ctx, DispatchListener dispatchListener) {
        this.ctx = ctx.getApplicationContext();
        this.httpClient = httpClient;
        this.dispatchListener = dispatchListener;
    }

    @Override // com.google.tagmanager.Dispatcher
    public boolean okToDispatch() {
        ConnectivityManager cm = (ConnectivityManager) this.ctx.getSystemService("connectivity");
        NetworkInfo network = cm.getActiveNetworkInfo();
        if (network == null || !network.isConnected()) {
            Log.v("...no network connectivity");
            return false;
        }
        return true;
    }

    @Override // com.google.tagmanager.Dispatcher
    public void dispatchHits(List<Hit> hits) {
        int maxHits = Math.min(hits.size(), 40);
        boolean firstSend = true;
        for (int i = 0; i < maxHits; i++) {
            Hit hit = hits.get(i);
            URL url = getUrl(hit);
            if (url == null) {
                Log.w("No destination: discarding hit.");
                this.dispatchListener.onHitPermanentDispatchFailure(hit);
            } else {
                HttpEntityEnclosingRequest request = constructGtmRequest(url);
                if (request == null) {
                    this.dispatchListener.onHitPermanentDispatchFailure(hit);
                } else {
                    HttpHost targetHost = new HttpHost(url.getHost(), url.getPort(), url.getProtocol());
                    request.addHeader("Host", targetHost.toHostString());
                    logDebugInformation(request);
                    if (firstSend) {
                        try {
                            NetworkReceiver.sendRadioPoweredBroadcast(this.ctx);
                            firstSend = false;
                        } catch (IOException e) {
                            Log.w("Exception sending hit: " + e.getClass().getSimpleName());
                            Log.w(e.getMessage());
                            this.dispatchListener.onHitTransientDispatchFailure(hit);
                        } catch (ClientProtocolException e2) {
                            Log.w("ClientProtocolException sending hit; discarding hit...");
                            this.dispatchListener.onHitPermanentDispatchFailure(hit);
                        }
                    }
                    HttpResponse response = this.httpClient.execute(targetHost, request);
                    int statusCode = response.getStatusLine().getStatusCode();
                    HttpEntity entity = response.getEntity();
                    if (entity != null) {
                        entity.consumeContent();
                    }
                    if (statusCode != 200) {
                        Log.w("Bad response: " + response.getStatusLine().getStatusCode());
                        this.dispatchListener.onHitTransientDispatchFailure(hit);
                    } else {
                        this.dispatchListener.onHitDispatched(hit);
                    }
                }
            }
        }
    }

    @Override // com.google.tagmanager.Dispatcher
    public void close() {
        this.httpClient.getConnectionManager().shutdown();
    }

    private HttpEntityEnclosingRequest constructGtmRequest(URL url) {
        HttpEntityEnclosingRequest request = null;
        try {
            HttpEntityEnclosingRequest request2 = new BasicHttpEntityEnclosingRequest("GET", url.toURI().toString());
            try {
                request2.addHeader(ServiceProxyBase.USER_AGENT_HEADER, this.userAgent);
                return request2;
            } catch (URISyntaxException e) {
                e = e;
                request = request2;
                Log.w("Exception sending hit: " + e.getClass().getSimpleName());
                Log.w(e.getMessage());
                return request;
            }
        } catch (URISyntaxException e2) {
            e = e2;
        }
    }

    private void logDebugInformation(HttpEntityEnclosingRequest request) {
        int avail;
        StringBuffer httpHeaders = new StringBuffer();
        Header[] arr$ = request.getAllHeaders();
        for (Header header : arr$) {
            httpHeaders.append(header.toString()).append("\n");
        }
        httpHeaders.append(request.getRequestLine().toString()).append("\n");
        if (request.getEntity() != null) {
            try {
                InputStream is = request.getEntity().getContent();
                if (is != null && (avail = is.available()) > 0) {
                    byte[] b = new byte[avail];
                    is.read(b);
                    httpHeaders.append("POST:\n");
                    httpHeaders.append(new String(b)).append("\n");
                }
            } catch (IOException e) {
                Log.v("Error Writing hit to log...");
            }
        }
        Log.v(httpHeaders.toString());
    }

    String createUserAgentString(String product, String version, String release, String language, String model, String id) {
        return String.format(USER_AGENT_TEMPLATE, product, version, release, language, model, id);
    }

    static String getUserAgentLanguage(Locale locale) {
        if (locale == null || locale.getLanguage() == null || locale.getLanguage().length() == 0) {
            return null;
        }
        StringBuilder lang = new StringBuilder();
        lang.append(locale.getLanguage().toLowerCase());
        if (locale.getCountry() != null && locale.getCountry().length() != 0) {
            lang.append("-").append(locale.getCountry().toLowerCase());
        }
        return lang.toString();
    }

    @VisibleForTesting
    URL getUrl(Hit hit) {
        String hitUrl = hit.getHitUrl();
        try {
            return new URL(hitUrl);
        } catch (MalformedURLException e) {
            Log.e("Error trying to parse the GTM url.");
            return null;
        }
    }
}
