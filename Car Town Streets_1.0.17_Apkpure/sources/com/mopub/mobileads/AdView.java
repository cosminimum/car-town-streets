package com.mopub.mobileads;

import android.app.Activity;
import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.location.Location;
import android.location.LocationManager;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Handler;
import android.provider.Settings;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.WindowManager;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import com.getjar.sdk.comm.ServiceProxyBase;
import com.google.ads.AdActivity;
import com.google.android.gms.drive.DriveFile;
import com.mopub.mobileads.MoPubView;
import com.tapjoy.TapjoyConstants;
import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.TimeZone;
import org.apache.http.Header;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpConnectionParams;
/* loaded from: classes.dex */
public class AdView extends WebView {
    public static final String AD_ORIENTATION_BOTH = "b";
    public static final String AD_ORIENTATION_LANDSCAPE_ONLY = "l";
    public static final String AD_ORIENTATION_PORTRAIT_ONLY = "p";
    public static final String DEVICE_ORIENTATION_LANDSCAPE = "l";
    public static final String DEVICE_ORIENTATION_PORTRAIT = "p";
    public static final String DEVICE_ORIENTATION_SQUARE = "s";
    public static final String DEVICE_ORIENTATION_UNKNOWN = "u";
    public static final String EXTRA_AD_CLICK_DATA = "com.mopub.intent.extra.AD_CLICK_DATA";
    private static final int HTTP_CLIENT_TIMEOUT_MILLISECONDS = 10000;
    private static final int MINIMUM_REFRESH_TIME_MILLISECONDS = 10000;
    private String mAdOrientation;
    private String mAdUnitId;
    private String mClickthroughUrl;
    private String mFailUrl;
    private int mHeight;
    private String mImpressionUrl;
    private boolean mIsDestroyed;
    private boolean mIsLoading;
    private String mKeywords;
    private LoadUrlTask mLoadUrlTask;
    private Location mLocation;
    protected MoPubView mMoPubView;
    private String mRedirectUrl;
    private String mResponseString;
    private String mUrl;
    private int mWidth;
    private int mRefreshTimeMilliseconds = 60000;
    private int mTimeoutMilliseconds = 10000;
    private final Handler mHandler = new Handler();
    private Handler mRefreshHandler = new Handler();
    private Runnable mRefreshRunnable = new Runnable() { // from class: com.mopub.mobileads.AdView.4
        @Override // java.lang.Runnable
        public void run() {
            AdView.this.loadAd();
        }
    };
    private boolean mAutorefreshEnabled = true;
    private String mUserAgent = getSettings().getUserAgentString();

    public AdView(Context context, MoPubView view) {
        super(context.getApplicationContext());
        this.mMoPubView = view;
        disableScrollingAndZoom();
        getSettings().setJavaScriptEnabled(true);
        getSettings().setPluginsEnabled(true);
        setBackgroundColor(0);
        setWebViewClient(new AdWebViewClient());
        addMoPubUriJavascriptInterface();
    }

    private void disableScrollingAndZoom() {
        setHorizontalScrollBarEnabled(false);
        setHorizontalScrollbarOverlay(false);
        setVerticalScrollBarEnabled(false);
        setVerticalScrollbarOverlay(false);
        getSettings().setSupportZoom(false);
    }

    private void addMoPubUriJavascriptInterface() {
        addJavascriptInterface(new Object() { // from class: com.mopub.mobileads.AdView.1MoPubUriJavascriptInterface
            public boolean fireFinishLoad() {
                AdView.this.postHandlerRunnable(new Runnable() { // from class: com.mopub.mobileads.AdView.1MoPubUriJavascriptInterface.1
                    @Override // java.lang.Runnable
                    public void run() {
                        AdView.this.adDidLoad();
                    }
                });
                return true;
            }
        }, "mopubUriInterface");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void postHandlerRunnable(Runnable r) {
        this.mHandler.post(r);
    }

    /* loaded from: classes.dex */
    private class AdWebViewClient extends WebViewClient {
        private AdWebViewClient() {
        }

        @Override // android.webkit.WebViewClient
        public boolean shouldOverrideUrlLoading(WebView view, String url) {
            AdView adView = (AdView) view;
            if (url.startsWith("mopub://")) {
                Uri uri = Uri.parse(url);
                String host = uri.getHost();
                if (host.equals("finishLoad")) {
                    adView.adDidLoad();
                } else if (host.equals("close")) {
                    adView.adDidClose();
                } else if (host.equals("failLoad")) {
                    adView.loadFailUrl();
                } else if (host.equals("custom")) {
                    adView.handleCustomIntentFromUri(uri);
                }
            } else if (url.startsWith("tel:") || url.startsWith("voicemail:") || url.startsWith("sms:") || url.startsWith("mailto:") || url.startsWith("geo:") || url.startsWith("google.streetview:")) {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(url));
                intent.addFlags(DriveFile.MODE_READ_ONLY);
                try {
                    AdView.this.getContext().startActivity(intent);
                    AdView.this.registerClick();
                } catch (ActivityNotFoundException e) {
                    Log.w("MoPub", "Could not handle intent with URI: " + url + ". Is this intent unsupported on your phone?");
                }
            } else {
                String url2 = urlWithClickTrackingRedirect(adView, url);
                Log.d("MoPub", "Ad clicked. Click URL: " + url2);
                AdView.this.mMoPubView.adClicked();
                AdView.this.showBrowserForUrl(url2);
            }
            return true;
        }

        @Override // android.webkit.WebViewClient
        public void onPageStarted(WebView view, String url, Bitmap favicon) {
            AdView adView = (AdView) view;
            String redirectUrl = adView.getRedirectUrl();
            if (redirectUrl != null && url.startsWith(redirectUrl)) {
                String url2 = urlWithClickTrackingRedirect(adView, url);
                view.stopLoading();
                AdView.this.showBrowserForUrl(url2);
            }
        }

        private String urlWithClickTrackingRedirect(AdView adView, String url) {
            String clickthroughUrl = adView.getClickthroughUrl();
            if (clickthroughUrl != null) {
                String encodedUrl = Uri.encode(url);
                return clickthroughUrl + "&r=" + encodedUrl;
            }
            return url;
        }
    }

    public void loadAd() {
        if (this.mAdUnitId == null) {
            Log.d("MoPub", "Can't load an ad in this ad view because the ad unit ID is null. Did you forget to call setAdUnitId()?");
        } else if (!isNetworkAvailable()) {
            Log.d("MoPub", "Can't load an ad because there is no network connectivity.");
            scheduleRefreshTimerIfEnabled();
        } else {
            if (this.mLocation == null) {
                this.mLocation = getLastKnownLocation();
            }
            String adUrl = generateAdUrl();
            this.mMoPubView.adWillLoad(adUrl);
            loadUrl(adUrl);
        }
    }

    private boolean isNetworkAvailable() {
        Context context = getContext();
        int result = context.checkCallingPermission("android.permission.ACCESS_NETWORK_STATE");
        if (result == -1) {
            return true;
        }
        ConnectivityManager cm = (ConnectivityManager) getContext().getSystemService("connectivity");
        NetworkInfo networkInfo = cm.getActiveNetworkInfo();
        return networkInfo != null && networkInfo.isConnected();
    }

    private Location getLastKnownLocation() {
        Location result;
        MoPubView.LocationAwareness locationAwareness = this.mMoPubView.getLocationAwareness();
        int locationPrecision = this.mMoPubView.getLocationPrecision();
        if (locationAwareness == MoPubView.LocationAwareness.LOCATION_AWARENESS_DISABLED) {
            return null;
        }
        LocationManager lm = (LocationManager) getContext().getSystemService("location");
        Location gpsLocation = null;
        try {
            gpsLocation = lm.getLastKnownLocation("gps");
        } catch (IllegalArgumentException e) {
            Log.d("MoPub", "Failed to retrieve GPS location: device has no GPS provider.");
        } catch (SecurityException e2) {
            Log.d("MoPub", "Failed to retrieve GPS location: access appears to be disabled.");
        }
        Location networkLocation = null;
        try {
            networkLocation = lm.getLastKnownLocation("network");
        } catch (IllegalArgumentException e3) {
            Log.d("MoPub", "Failed to retrieve network location: device has no network provider.");
        } catch (SecurityException e4) {
            Log.d("MoPub", "Failed to retrieve network location: access appears to be disabled.");
        }
        if (gpsLocation == null && networkLocation == null) {
            return null;
        }
        if (gpsLocation != null && networkLocation != null) {
            result = gpsLocation.getTime() > networkLocation.getTime() ? gpsLocation : networkLocation;
        } else {
            result = gpsLocation != null ? gpsLocation : networkLocation;
        }
        if (locationAwareness == MoPubView.LocationAwareness.LOCATION_AWARENESS_TRUNCATED) {
            double lat = result.getLatitude();
            double truncatedLat = BigDecimal.valueOf(lat).setScale(locationPrecision, 5).doubleValue();
            result.setLatitude(truncatedLat);
            double lon = result.getLongitude();
            double truncatedLon = BigDecimal.valueOf(lon).setScale(locationPrecision, 5).doubleValue();
            result.setLongitude(truncatedLon);
        }
        return result;
    }

    private String generateAdUrl() {
        StringBuilder sz = new StringBuilder("http://ads.mopub.com/m/ad");
        sz.append("?v=6&id=" + this.mAdUnitId);
        sz.append("&nv=1.4.0.0");
        String udid = Settings.Secure.getString(getContext().getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
        String udidDigest = udid == null ? "" : Utils.sha1(udid);
        sz.append("&udid=sha:" + udidDigest);
        if (this.mKeywords != null) {
            sz.append("&q=" + Uri.encode(this.mKeywords));
        }
        if (this.mLocation != null) {
            sz.append("&ll=" + this.mLocation.getLatitude() + "," + this.mLocation.getLongitude());
        }
        sz.append("&z=" + getTimeZoneOffsetString());
        int orientation = getResources().getConfiguration().orientation;
        String orString = "u";
        if (orientation == 1) {
            orString = "p";
        } else if (orientation == 2) {
            orString = "l";
        } else if (orientation == 3) {
            orString = DEVICE_ORIENTATION_SQUARE;
        }
        sz.append("&o=" + orString);
        DisplayMetrics metrics = new DisplayMetrics();
        ((WindowManager) getContext().getSystemService("window")).getDefaultDisplay().getMetrics(metrics);
        sz.append("&sc_a=" + metrics.density);
        boolean mraid = true;
        try {
            Class.forName("com.mopub.mraid.MraidView", false, ClassLoader.getSystemClassLoader());
        } catch (ClassNotFoundException e) {
            mraid = false;
        }
        if (mraid) {
            sz.append("&mr=1");
        }
        return sz.toString();
    }

    private String getTimeZoneOffsetString() {
        SimpleDateFormat format = new SimpleDateFormat("Z");
        format.setTimeZone(TimeZone.getDefault());
        return format.format(new Date());
    }

    @Override // android.webkit.WebView
    public void loadUrl(String url) {
        if (url.startsWith("javascript:")) {
            super.loadUrl(url);
        } else if (this.mIsLoading) {
            Log.i("MoPub", "Already loading an ad for " + this.mAdUnitId + ", wait to finish.");
        } else {
            this.mUrl = url;
            this.mIsLoading = true;
            if (this.mLoadUrlTask != null) {
                this.mLoadUrlTask.releaseResources();
            }
            this.mLoadUrlTask = new LoadUrlTask();
            this.mLoadUrlTask.execute(this.mUrl);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class LoadUrlTask extends AsyncTask<String, Void, LoadUrlTaskResult> {
        private AdView mAdView;
        private Exception mException;
        private HttpClient mHttpClient;
        private String mUserAgent;

        private LoadUrlTask(AdView adView) {
            String str;
            this.mAdView = adView;
            if (adView.mUserAgent != null) {
                str = new String(adView.mUserAgent);
            } else {
                str = "";
            }
            this.mUserAgent = str;
            this.mHttpClient = adView.getAdViewHttpClient();
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public LoadUrlTaskResult doInBackground(String... urls) {
            try {
                LoadUrlTaskResult result = loadAdFromNetwork(urls[0]);
                return result;
            } catch (Exception e) {
                this.mException = e;
                return null;
            }
        }

        private LoadUrlTaskResult loadAdFromNetwork(String url) throws Exception {
            LoadUrlTaskResult loadUrlTaskResult;
            HttpGet httpget = new HttpGet(url);
            httpget.addHeader(ServiceProxyBase.USER_AGENT_HEADER, this.mUserAgent);
            synchronized (this) {
                if (this.mAdView == null || this.mAdView.isDestroyed()) {
                    Log.d("MoPub", "Error loading ad: AdView has already been GCed or destroyed.");
                    loadUrlTaskResult = null;
                } else {
                    HttpResponse response = this.mHttpClient.execute(httpget);
                    HttpEntity entity = response.getEntity();
                    if (response != null && entity != null && response.getStatusLine().getStatusCode() == 200) {
                        this.mAdView.configureAdViewUsingHeadersFromHttpResponse(response);
                        Header atHeader = response.getFirstHeader("X-Adtype");
                        if (atHeader == null || atHeader.getValue().equals("clear")) {
                            Log.d("MoPub", "MoPub server returned no ad.");
                            loadUrlTaskResult = null;
                        } else if (atHeader.getValue().equals("custom")) {
                            Log.i("MoPub", "Performing custom event.");
                            Header cmHeader = response.getFirstHeader("X-Customselector");
                            loadUrlTaskResult = new PerformCustomEventTaskResult(this.mAdView, cmHeader);
                        } else if (atHeader.getValue().equals("mraid")) {
                            HashMap<String, String> paramsHash = new HashMap<>();
                            paramsHash.put("X-Adtype", atHeader.getValue());
                            InputStream is = entity.getContent();
                            StringBuffer out = new StringBuffer();
                            byte[] b = new byte[4096];
                            while (true) {
                                int n = is.read(b);
                                if (n == -1) {
                                    break;
                                }
                                out.append(new String(b, 0, n));
                            }
                            paramsHash.put("X-Nativeparams", out.toString());
                            loadUrlTaskResult = new LoadNativeAdTaskResult(paramsHash);
                        } else if (!atHeader.getValue().equals(AdActivity.HTML_PARAM)) {
                            Log.i("MoPub", "Loading native ad");
                            HashMap<String, String> paramsHash2 = new HashMap<>();
                            paramsHash2.put("X-Adtype", atHeader.getValue());
                            Header npHeader = response.getFirstHeader("X-Nativeparams");
                            paramsHash2.put("X-Nativeparams", "{}");
                            if (npHeader != null) {
                                paramsHash2.put("X-Nativeparams", npHeader.getValue());
                            }
                            Header ftHeader = response.getFirstHeader("X-Fulladtype");
                            if (ftHeader != null) {
                                paramsHash2.put("X-Fulladtype", ftHeader.getValue());
                            }
                            loadUrlTaskResult = new LoadNativeAdTaskResult(paramsHash2);
                        } else {
                            InputStream is2 = entity.getContent();
                            StringBuffer out2 = new StringBuffer();
                            byte[] b2 = new byte[4096];
                            while (true) {
                                int n2 = is2.read(b2);
                                if (n2 == -1) {
                                    break;
                                }
                                out2.append(new String(b2, 0, n2));
                            }
                            is2.close();
                            loadUrlTaskResult = new LoadHtmlAdTaskResult(out2.toString());
                        }
                    } else {
                        Log.d("MoPub", "MoPub server returned invalid response.");
                        loadUrlTaskResult = null;
                    }
                }
            }
            return loadUrlTaskResult;
        }

        protected void releaseResources() {
            synchronized (this) {
                this.mAdView = null;
                if (this.mHttpClient != null) {
                    ClientConnectionManager manager = this.mHttpClient.getConnectionManager();
                    if (manager != null) {
                        manager.shutdown();
                    }
                    this.mHttpClient = null;
                }
            }
            this.mException = null;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // android.os.AsyncTask
        public void onPostExecute(LoadUrlTaskResult result) {
            if (this.mAdView == null || this.mAdView.isDestroyed()) {
                if (result != null) {
                    result.cleanup();
                }
                releaseResources();
                return;
            }
            if (result == null) {
                if (this.mException != null) {
                    Log.d("MoPub", "Exception caught while loading ad: " + this.mException);
                }
                this.mAdView.adDidFail();
            } else {
                result.execute();
                result.cleanup();
            }
            releaseResources();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public DefaultHttpClient getAdViewHttpClient() {
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        if (this.mTimeoutMilliseconds > 0) {
            HttpConnectionParams.setConnectionTimeout(basicHttpParams, this.mTimeoutMilliseconds);
            HttpConnectionParams.setSoTimeout(basicHttpParams, this.mTimeoutMilliseconds);
        }
        HttpConnectionParams.setSocketBufferSize(basicHttpParams, 8192);
        return new DefaultHttpClient(basicHttpParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void configureAdViewUsingHeadersFromHttpResponse(HttpResponse response) {
        Header ntHeader = response.getFirstHeader("X-Networktype");
        if (ntHeader != null) {
            Log.i("MoPub", "Fetching ad network type: " + ntHeader.getValue());
        }
        Header rdHeader = response.getFirstHeader("X-Launchpage");
        if (rdHeader != null) {
            this.mRedirectUrl = rdHeader.getValue();
        } else {
            this.mRedirectUrl = null;
        }
        Header ctHeader = response.getFirstHeader("X-Clickthrough");
        if (ctHeader != null) {
            this.mClickthroughUrl = ctHeader.getValue();
        } else {
            this.mClickthroughUrl = null;
        }
        Header flHeader = response.getFirstHeader("X-Failurl");
        if (flHeader != null) {
            this.mFailUrl = flHeader.getValue();
        } else {
            this.mFailUrl = null;
        }
        Header imHeader = response.getFirstHeader("X-Imptracker");
        if (imHeader != null) {
            this.mImpressionUrl = imHeader.getValue();
        } else {
            this.mImpressionUrl = null;
        }
        Header scHeader = response.getFirstHeader("X-Scrollable");
        boolean enabled = false;
        if (scHeader != null) {
            enabled = scHeader.getValue().equals("1");
        }
        setWebViewScrollingEnabled(enabled);
        Header wHeader = response.getFirstHeader("X-Width");
        Header hHeader = response.getFirstHeader("X-Height");
        if (wHeader != null && hHeader != null) {
            this.mWidth = Integer.parseInt(wHeader.getValue().trim());
            this.mHeight = Integer.parseInt(hHeader.getValue().trim());
        } else {
            this.mWidth = 0;
            this.mHeight = 0;
        }
        Header rtHeader = response.getFirstHeader("X-Refreshtime");
        if (rtHeader != null) {
            this.mRefreshTimeMilliseconds = Integer.valueOf(rtHeader.getValue()).intValue() * 1000;
            if (this.mRefreshTimeMilliseconds < 10000) {
                this.mRefreshTimeMilliseconds = 10000;
            }
        } else {
            this.mRefreshTimeMilliseconds = 0;
        }
        Header orHeader = response.getFirstHeader("X-Orientation");
        this.mAdOrientation = orHeader != null ? orHeader.getValue() : null;
    }

    private void setWebViewScrollingEnabled(boolean enabled) {
        if (enabled) {
            setOnTouchListener(null);
        } else {
            setOnTouchListener(new View.OnTouchListener() { // from class: com.mopub.mobileads.AdView.1
                @Override // android.view.View.OnTouchListener
                public boolean onTouch(View v, MotionEvent event) {
                    return event.getAction() == 2;
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void adDidLoad() {
        Log.i("MoPub", "Ad successfully loaded.");
        this.mIsLoading = false;
        scheduleRefreshTimerIfEnabled();
        setAdContentView(this);
        this.mMoPubView.adLoaded();
    }

    public void setAdContentView(View view) {
        this.mMoPubView.removeAllViews();
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-2, -2, 17);
        this.mMoPubView.addView(view, layoutParams);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void adDidFail() {
        Log.i("MoPub", "Ad failed to load.");
        this.mIsLoading = false;
        scheduleRefreshTimerIfEnabled();
        this.mMoPubView.adFailed();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void adDidClose() {
        this.mMoPubView.adClosed();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleCustomIntentFromUri(Uri uri) {
        registerClick();
        String action = uri.getQueryParameter("fnc");
        String adData = uri.getQueryParameter("data");
        Intent customIntent = new Intent(action);
        customIntent.addFlags(DriveFile.MODE_READ_ONLY);
        if (adData != null) {
            customIntent.putExtra(EXTRA_AD_CLICK_DATA, adData);
        }
        try {
            getContext().startActivity(customIntent);
        } catch (ActivityNotFoundException e) {
            Log.w("MoPub", "Could not handle custom intent: " + action + ". Is your intent spelled correctly?");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void showBrowserForUrl(String url) {
        if (!isDestroyed()) {
            if (url == null || url.equals("")) {
                url = "about:blank";
            }
            Log.d("MoPub", "Final URI to show in browser: " + url);
            Intent actionIntent = new Intent("android.intent.action.VIEW", Uri.parse(url));
            actionIntent.setFlags(DriveFile.MODE_READ_ONLY);
            try {
                getContext().startActivity(actionIntent);
            } catch (ActivityNotFoundException e) {
                String action = actionIntent.getAction();
                if (action.startsWith("market://")) {
                    Log.w("MoPub", "Could not handle market action: " + action + ". Perhaps you're running in the emulator, which does not have the Android Market?");
                } else {
                    Log.w("MoPub", "Could not handle intent action: " + action);
                }
                getContext().startActivity(new Intent("android.intent.action.VIEW", Uri.parse("about:blank")).addFlags(DriveFile.MODE_READ_ONLY));
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static abstract class LoadUrlTaskResult {
        WeakReference<AdView> mWeakAdView;

        abstract void cleanup();

        abstract void execute();

        public LoadUrlTaskResult(AdView adView) {
            this.mWeakAdView = new WeakReference<>(adView);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class PerformCustomEventTaskResult extends LoadUrlTaskResult {
        protected Header mHeader;

        public PerformCustomEventTaskResult(AdView adView, Header header) {
            super(adView);
            this.mHeader = header;
        }

        @Override // com.mopub.mobileads.AdView.LoadUrlTaskResult
        public void execute() {
            AdView adView = this.mWeakAdView.get();
            if (adView != null && !adView.isDestroyed()) {
                adView.mIsLoading = false;
                MoPubView mpv = adView.mMoPubView;
                if (this.mHeader == null) {
                    Log.i("MoPub", "Couldn't call custom method because the server did not specify one.");
                    mpv.adFailed();
                    return;
                }
                String methodName = this.mHeader.getValue();
                Log.i("MoPub", "Trying to call method named " + methodName);
                Activity userActivity = mpv.getActivity();
                try {
                    Method method = userActivity.getClass().getMethod(methodName, MoPubView.class);
                    method.invoke(userActivity, mpv);
                } catch (NoSuchMethodException e) {
                    Log.d("MoPub", "Couldn't perform custom method named " + methodName + "(MoPubView view) because your activity class has no such method");
                } catch (Exception e2) {
                    Log.d("MoPub", "Couldn't perform custom method named " + methodName);
                }
            }
        }

        @Override // com.mopub.mobileads.AdView.LoadUrlTaskResult
        public void cleanup() {
            this.mHeader = null;
        }
    }

    public void customEventDidLoadAd() {
        this.mIsLoading = false;
        trackImpression();
        scheduleRefreshTimerIfEnabled();
    }

    public void customEventDidFailToLoadAd() {
        adDidFail();
    }

    public void customEventActionWillBegin() {
        registerClick();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class LoadNativeAdTaskResult extends LoadUrlTaskResult {
        protected HashMap<String, String> mParamsHash;

        private LoadNativeAdTaskResult(AdView adView, HashMap<String, String> hash) {
            super(adView);
            this.mParamsHash = hash;
        }

        @Override // com.mopub.mobileads.AdView.LoadUrlTaskResult
        public void execute() {
            AdView adView = this.mWeakAdView.get();
            if (adView != null && !adView.isDestroyed()) {
                adView.mIsLoading = false;
                MoPubView mpv = adView.mMoPubView;
                mpv.loadNativeSDK(this.mParamsHash);
            }
        }

        @Override // com.mopub.mobileads.AdView.LoadUrlTaskResult
        public void cleanup() {
            this.mParamsHash = null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class LoadHtmlAdTaskResult extends LoadUrlTaskResult {
        protected String mData;

        private LoadHtmlAdTaskResult(AdView adView, String data) {
            super(adView);
            this.mData = data;
        }

        @Override // com.mopub.mobileads.AdView.LoadUrlTaskResult
        public void execute() {
            AdView adView;
            if (this.mData != null && (adView = this.mWeakAdView.get()) != null && !adView.isDestroyed()) {
                adView.mResponseString = this.mData;
                adView.loadDataWithBaseURL("http://ads.mopub.com/", this.mData, "text/html", "utf-8", null);
            }
        }

        @Override // com.mopub.mobileads.AdView.LoadUrlTaskResult
        public void cleanup() {
            this.mData = null;
        }
    }

    protected boolean isDestroyed() {
        return this.mIsDestroyed;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void cleanup() {
        setAutorefreshEnabled(false);
        cancelRefreshTimer();
        destroy();
        if (this.mLoadUrlTask != null) {
            this.mLoadUrlTask.releaseResources();
            this.mLoadUrlTask = null;
        }
        this.mResponseString = null;
        this.mMoPubView.removeView(this);
        this.mMoPubView = null;
        this.mIsDestroyed = true;
    }

    @Override // android.webkit.WebView
    public void reload() {
        Log.d("MoPub", "Reload ad: " + this.mUrl);
        loadUrl(this.mUrl);
    }

    public void loadFailUrl() {
        this.mIsLoading = false;
        if (this.mFailUrl != null) {
            Log.d("MoPub", "Loading failover url: " + this.mFailUrl);
            loadUrl(this.mFailUrl);
            return;
        }
        adDidFail();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void loadResponseString(String responseString) {
        loadDataWithBaseURL("http://ads.mopub.com/", responseString, "text/html", "utf-8", null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void trackImpression() {
        if (this.mImpressionUrl != null) {
            new Thread(new Runnable() { // from class: com.mopub.mobileads.AdView.2
                @Override // java.lang.Runnable
                public void run() {
                    DefaultHttpClient httpclient = new DefaultHttpClient();
                    HttpGet httpget = new HttpGet(AdView.this.mImpressionUrl);
                    httpget.addHeader(ServiceProxyBase.USER_AGENT_HEADER, AdView.this.mUserAgent);
                    try {
                        try {
                            try {
                                httpclient.execute(httpget);
                                httpclient.getConnectionManager().shutdown();
                            } catch (ClientProtocolException e) {
                                Log.i("MoPub", "Impression tracking failed: " + AdView.this.mImpressionUrl);
                                httpclient.getConnectionManager().shutdown();
                            }
                        } catch (IOException e2) {
                            Log.i("MoPub", "Impression tracking failed: " + AdView.this.mImpressionUrl);
                            httpclient.getConnectionManager().shutdown();
                        }
                    } catch (Throwable th) {
                        httpclient.getConnectionManager().shutdown();
                        throw th;
                    }
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void registerClick() {
        if (this.mClickthroughUrl != null) {
            new Thread(new Runnable() { // from class: com.mopub.mobileads.AdView.3
                @Override // java.lang.Runnable
                public void run() {
                    DefaultHttpClient httpclient = new DefaultHttpClient();
                    HttpGet httpget = new HttpGet(AdView.this.mClickthroughUrl);
                    httpget.addHeader(ServiceProxyBase.USER_AGENT_HEADER, AdView.this.mUserAgent);
                    try {
                        try {
                            try {
                                httpclient.execute(httpget);
                                httpclient.getConnectionManager().shutdown();
                            } catch (ClientProtocolException e) {
                                Log.i("MoPub", "Click tracking failed: " + AdView.this.mClickthroughUrl);
                                httpclient.getConnectionManager().shutdown();
                            }
                        } catch (IOException e2) {
                            Log.i("MoPub", "Click tracking failed: " + AdView.this.mClickthroughUrl);
                            httpclient.getConnectionManager().shutdown();
                        }
                    } catch (Throwable th) {
                        httpclient.getConnectionManager().shutdown();
                        throw th;
                    }
                }
            }).start();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void adAppeared() {
        loadUrl("javascript:webviewDidAppear();");
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void scheduleRefreshTimerIfEnabled() {
        cancelRefreshTimer();
        if (this.mAutorefreshEnabled && this.mRefreshTimeMilliseconds > 0) {
            this.mRefreshHandler.postDelayed(this.mRefreshRunnable, this.mRefreshTimeMilliseconds);
        }
    }

    protected void cancelRefreshTimer() {
        this.mRefreshHandler.removeCallbacks(this.mRefreshRunnable);
    }

    public String getKeywords() {
        return this.mKeywords;
    }

    public void setKeywords(String keywords) {
        this.mKeywords = keywords;
    }

    public Location getLocation() {
        return this.mLocation;
    }

    public void setLocation(Location location) {
        this.mLocation = location;
    }

    public String getAdUnitId() {
        return this.mAdUnitId;
    }

    public void setAdUnitId(String adUnitId) {
        this.mAdUnitId = adUnitId;
    }

    public void setTimeout(int milliseconds) {
        this.mTimeoutMilliseconds = milliseconds;
    }

    public int getAdWidth() {
        return this.mWidth;
    }

    public int getAdHeight() {
        return this.mHeight;
    }

    public String getAdOrientation() {
        return this.mAdOrientation;
    }

    public String getClickthroughUrl() {
        return this.mClickthroughUrl;
    }

    public void setClickthroughUrl(String url) {
        this.mClickthroughUrl = url;
    }

    public String getRedirectUrl() {
        return this.mRedirectUrl;
    }

    public String getResponseString() {
        return this.mResponseString;
    }

    public void setAutorefreshEnabled(boolean enabled) {
        this.mAutorefreshEnabled = enabled;
        Log.d("MoPub", "Automatic refresh for " + this.mAdUnitId + " set to: " + enabled + ".");
        if (this.mAutorefreshEnabled) {
            scheduleRefreshTimerIfEnabled();
        } else {
            cancelRefreshTimer();
        }
    }

    public boolean getAutorefreshEnabled() {
        return this.mAutorefreshEnabled;
    }

    public void resetRefreshTime() {
        this.mRefreshTimeMilliseconds = 10000;
    }
}
