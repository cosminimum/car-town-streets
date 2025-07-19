package com.millennialmedia.android;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.view.WindowManager;
import android.widget.Toast;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.millennialmedia.android.MMAdViewSDK;
import java.lang.ref.WeakReference;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;
import org.apache.http.HttpResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

class HandShake {
    private static final String HANDSHAKE_URL = "http://ads.mp.mydas.mobi/";
    private static final String HANDSHAKE_URL_PARMS = "appConfigServlet?apid=";
    static String apid;
    private static boolean forceRefresh;
    /* access modifiers changed from: private */
    public static String overrideHandShakeURL;
    private static HandShake sharedInstance;
    private LinkedHashMap<String, AdTypeHandShake> adTypeHandShakes = new LinkedHashMap<>();
    /* access modifiers changed from: private */
    public WeakReference<Context> appContextRef;
    private String[] cachedVideos;
    /* access modifiers changed from: private */
    public WeakReference<Context> contextRef;
    long creativeCacheTimeout = 259200000;
    /* access modifiers changed from: private */
    public long deferredViewTimeout = 3600000;
    /* access modifiers changed from: private */
    public long handShakeCallback = 86400000;
    /* access modifiers changed from: private */
    public final Handler handler = new Handler(Looper.getMainLooper());
    boolean hdid = true;
    boolean kill = false;
    private long lastHandShake;
    String mmdid;
    private ArrayList<Scheme> schemes = new ArrayList<>();
    private String schemesList;
    /* access modifiers changed from: private */
    public Runnable updateHandShakeRunnable = new Runnable() {
        public void run() {
            Context context = (Context) HandShake.this.contextRef.get();
            if (context == null) {
                context = (Context) HandShake.this.appContextRef.get();
            }
            if (context != null) {
                HandShake.sharedHandShake(context);
            }
        }
    };

    static synchronized HandShake sharedHandShake(Context context) {
        HandShake handShake;
        synchronized (HandShake.class) {
            if (apid == null) {
                MMAdViewSDK.Log.e("No apid set for the handshake.");
                handShake = null;
            } else {
                if (sharedInstance == null) {
                    sharedInstance = new HandShake(context);
                } else if (System.currentTimeMillis() - sharedInstance.lastHandShake > sharedInstance.handShakeCallback) {
                    MMAdViewSDK.Log.d("Handshake expired, requesting new handshake from the server.");
                    sharedInstance = new HandShake(context);
                }
                handShake = sharedInstance;
            }
        }
        return handShake;
    }

    static synchronized void setHandShakeURL(Context context, String url) {
        synchronized (HandShake.class) {
            if (url != null) {
                overrideHandShakeURL = url + HANDSHAKE_URL_PARMS;
            } else {
                overrideHandShakeURL = "http://ads.mp.mydas.mobi/appConfigServlet?apid=";
            }
            forceRefresh = true;
            sharedInstance = new HandShake(context);
        }
    }

    /* access modifiers changed from: package-private */
    public synchronized boolean canRequestVideo(Context context, String adType) {
        boolean z;
        AdTypeHandShake adTypeHandShake = this.adTypeHandShakes.get(adType);
        if (adTypeHandShake != null) {
            z = adTypeHandShake.canRequestVideo(context, adType);
        } else {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: package-private */
    public synchronized boolean canDisplayCachedAd(String adType, long cachedTime) {
        boolean z;
        AdTypeHandShake adTypeHandShake = this.adTypeHandShakes.get(adType);
        if (adTypeHandShake != null) {
            z = adTypeHandShake.canDisplayCachedAd(cachedTime);
        } else {
            z = true;
        }
        return z;
    }

    /* access modifiers changed from: package-private */
    public synchronized void updateLastVideoViewedTime(Context context, String adType) {
        AdTypeHandShake adTypeHandShake = this.adTypeHandShakes.get(adType);
        if (adTypeHandShake != null) {
            adTypeHandShake.updateLastVideoViewedTime(context, adType);
        }
    }

    /* access modifiers changed from: package-private */
    public synchronized boolean isAdTypeDownloading(String adType) {
        boolean z;
        AdTypeHandShake adTypeHandShake = this.adTypeHandShakes.get(adType);
        if (adTypeHandShake != null) {
            z = adTypeHandShake.downloading;
        } else {
            z = false;
        }
        return z;
    }

    /* access modifiers changed from: package-private */
    public synchronized void lockAdTypeDownload(String adType) {
        AdTypeHandShake adTypeHandShake = this.adTypeHandShakes.get(adType);
        if (adTypeHandShake != null) {
            adTypeHandShake.downloading = true;
        }
    }

    /* access modifiers changed from: package-private */
    public synchronized void unlockAdTypeDownload(String adType) {
        AdTypeHandShake adTypeHandShake = this.adTypeHandShakes.get(adType);
        if (adTypeHandShake != null) {
            adTypeHandShake.downloading = false;
        }
    }

    /* access modifiers changed from: package-private */
    public void overrideAdRefresh(MMAdView adView) {
        AdTypeHandShake adTypeHandShake;
        if (adView.adType != null && (adTypeHandShake = this.adTypeHandShakes.get(adView.adType)) != null && adTypeHandShake.refreshInterval != null) {
            adView.refreshInterval = Integer.parseInt(adTypeHandShake.refreshInterval);
        }
    }

    /* access modifiers changed from: package-private */
    public void setMMdid(Context context, String newMMdid) {
        setMMdid(context, newMMdid, true);
    }

    /* access modifiers changed from: package-private */
    /* JADX WARNING: Removed duplicated region for block: B:10:0x001b  */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public synchronized void setMMdid(android.content.Context r5, java.lang.String r6, boolean r7) {
        /*
            r4 = this;
            monitor-enter(r4)
            if (r6 == 0) goto L_0x0032
            int r2 = r6.length()     // Catch:{ all -> 0x0035 }
            if (r2 == 0) goto L_0x0011
            java.lang.String r2 = "NULL"
            boolean r2 = r6.equals(r2)     // Catch:{ all -> 0x0035 }
            if (r2 == 0) goto L_0x0032
        L_0x0011:
            r2 = 0
            r4.mmdid = r2     // Catch:{ all -> 0x0035 }
        L_0x0014:
            java.lang.String r2 = r4.mmdid     // Catch:{ all -> 0x0035 }
            com.millennialmedia.android.MMAdViewSDK.setMMdid(r2)     // Catch:{ all -> 0x0035 }
            if (r7 == 0) goto L_0x0030
            java.lang.String r2 = "MillennialMediaSettings"
            r3 = 0
            android.content.SharedPreferences r1 = r5.getSharedPreferences(r2, r3)     // Catch:{ all -> 0x0035 }
            android.content.SharedPreferences$Editor r0 = r1.edit()     // Catch:{ all -> 0x0035 }
            java.lang.String r2 = "handshake_mmdid"
            java.lang.String r3 = r4.mmdid     // Catch:{ all -> 0x0035 }
            r0.putString(r2, r3)     // Catch:{ all -> 0x0035 }
            r0.commit()     // Catch:{ all -> 0x0035 }
        L_0x0030:
            monitor-exit(r4)
            return
        L_0x0032:
            r4.mmdid = r6     // Catch:{ all -> 0x0035 }
            goto L_0x0014
        L_0x0035:
            r2 = move-exception
            monitor-exit(r4)
            throw r2
        */
        throw new UnsupportedOperationException("Method not decompiled: com.millennialmedia.android.HandShake.setMMdid(android.content.Context, java.lang.String, boolean):void");
    }

    private HandShake() {
    }

    private HandShake(Context context) {
        this.contextRef = new WeakReference<>(context);
        this.appContextRef = new WeakReference<>(context.getApplicationContext());
        if (forceRefresh || !loadHandShake(context) || System.currentTimeMillis() - this.lastHandShake > this.handShakeCallback) {
            forceRefresh = false;
            this.lastHandShake = System.currentTimeMillis();
            new Thread(new Runnable() {
                public void run() {
                    HttpGetRequest getRequest = new HttpGetRequest();
                    Context tempContext = (Context) HandShake.this.contextRef.get();
                    if (tempContext == null) {
                        tempContext = (Context) HandShake.this.appContextRef.get();
                    }
                    if (tempContext != null) {
                        try {
                            StringBuilder handshakeUrlBuilder = new StringBuilder();
                            TreeMap<String, String> deviceValuesMap = new TreeMap<>();
                            deviceValuesMap.put("ua", "Android:" + Build.MODEL);
                            MMAdViewController.getUrlCommonValues(tempContext, deviceValuesMap);
                            for (Map.Entry<String, String> entry : deviceValuesMap.entrySet()) {
                                handshakeUrlBuilder.append(String.format("&%s=%s", new Object[]{entry.getKey(), URLEncoder.encode(entry.getValue(), "UTF-8")}));
                            }
                            String handshakeUrl = (HandShake.overrideHandShakeURL == null ? "http://ads.mp.mydas.mobi/appConfigServlet?apid=" : HandShake.overrideHandShakeURL) + HandShake.apid + handshakeUrlBuilder.toString();
                            MMAdViewSDK.Log.v("Performing handshake: %s", handshakeUrl);
                            HttpResponse httpResponse = getRequest.get(handshakeUrl);
                            if (httpResponse != null) {
                                HandShake.this.deserializeFromObj(HandShake.this.parseJson(HttpGetRequest.convertStreamToString(httpResponse.getEntity().getContent())));
                                HandShake.this.saveHandShake(tempContext);
                                HandShake.this.handler.postDelayed(HandShake.this.updateHandShakeRunnable, HandShake.this.handShakeCallback);
                            }
                        } catch (Exception e) {
                            MMAdViewSDK.Log.e("Could not get a handshake. %s", e.getMessage());
                        }
                    }
                }
            }).start();
        }
    }

    /* access modifiers changed from: package-private */
    public synchronized String getSchemesList(Context context) {
        if (this.schemesList == null && this.schemes.size() > 0) {
            StringBuilder stringBuilder = new StringBuilder();
            Iterator i$ = this.schemes.iterator();
            while (i$.hasNext()) {
                Scheme scheme = i$.next();
                if (scheme.checkAvailability(context)) {
                    if (stringBuilder.length() > 0) {
                        stringBuilder.append("," + scheme.id);
                    } else {
                        stringBuilder.append(Integer.toString(scheme.id));
                    }
                }
            }
            if (stringBuilder.length() > 0) {
                this.schemesList = stringBuilder.toString();
            }
        }
        return this.schemesList;
    }

    /* access modifiers changed from: package-private */
    public synchronized JSONArray getSchemesJSONArray(Context context) {
        JSONArray array;
        array = new JSONArray();
        if (this.schemes.size() > 0) {
            Iterator i$ = this.schemes.iterator();
            while (i$.hasNext()) {
                Scheme scheme = i$.next();
                if (scheme.checkAvailability(context)) {
                    try {
                        JSONObject schemeObject = new JSONObject();
                        schemeObject.put("scheme", scheme.scheme);
                        schemeObject.put("schemeid", scheme.id);
                        array.put(schemeObject);
                    } catch (JSONException e) {
                    }
                }
            }
        }
        return array;
    }

    private class Scheme {
        int id;
        String scheme;

        Scheme() {
        }

        Scheme(String scheme2, int id2) {
            this.scheme = scheme2;
            this.id = id2;
        }

        /* access modifiers changed from: package-private */
        public boolean checkAvailability(Context context) {
            Intent intent;
            if (this.scheme.contains("://")) {
                intent = new Intent("android.intent.action.VIEW", Uri.parse(this.scheme));
            } else {
                intent = new Intent("android.intent.action.VIEW", Uri.parse(this.scheme + "://"));
            }
            return context.getPackageManager().queryIntentActivities(intent, 65536).size() > 0;
        }

        /* access modifiers changed from: package-private */
        public void deserializeFromObj(JSONObject schemeObject) {
            if (schemeObject != null) {
                this.scheme = schemeObject.optString("scheme", (String) null);
                this.id = schemeObject.optInt("schemeid");
            }
        }
    }

    private class AdTypeHandShake {
        boolean downloading;
        long lastVideo = 0;
        String refreshInterval;
        long videoInterval = 0;

        AdTypeHandShake() {
        }

        /* access modifiers changed from: package-private */
        public boolean canRequestVideo(Context context, String adType) {
            MMAdViewSDK.Log.d("canRequestVideo() Current Time: %d Last Video: %d  Diff: %d  Video interval: %d", Long.valueOf(System.currentTimeMillis()), Long.valueOf(this.lastVideo / 1000), Long.valueOf((System.currentTimeMillis() - this.lastVideo) / 1000), Long.valueOf(this.videoInterval / 1000));
            if (System.currentTimeMillis() - this.lastVideo > this.videoInterval) {
                return true;
            }
            return false;
        }

        /* access modifiers changed from: package-private */
        public boolean canDisplayCachedAd(long cachedTime) {
            return System.currentTimeMillis() - cachedTime < HandShake.this.deferredViewTimeout;
        }

        /* access modifiers changed from: package-private */
        public void updateLastVideoViewedTime(Context context, String adType) {
            this.lastVideo = System.currentTimeMillis();
            save(context, adType);
        }

        /* access modifiers changed from: package-private */
        public void deserializeFromObj(JSONObject adTypeObject) {
            if (adTypeObject != null) {
                this.videoInterval = adTypeObject.optLong("videointerval") * 1000;
                this.refreshInterval = adTypeObject.optString("adrefresh", (String) null);
                if (this.refreshInterval != null && this.refreshInterval.equalsIgnoreCase("sdk")) {
                    this.refreshInterval = null;
                }
            }
        }

        /* access modifiers changed from: package-private */
        public boolean load(SharedPreferences settings, String adType) {
            boolean settingsFound = false;
            if (settings.contains("handshake_lastvideo_" + adType)) {
                this.lastVideo = settings.getLong("handshake_lastvideo_" + adType, this.lastVideo);
                settingsFound = true;
            }
            if (settings.contains("handshake_videointerval_" + adType)) {
                this.videoInterval = settings.getLong("handshake_videointerval_" + adType, this.videoInterval);
                settingsFound = true;
            }
            if (!settings.contains("handshake_adrefresh_" + adType)) {
                return settingsFound;
            }
            this.refreshInterval = settings.getString("handshake_adrefresh_" + adType, (String) null);
            return true;
        }

        /* access modifiers changed from: package-private */
        public void loadLastVideo(Context context, String adType) {
            SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
            if (settings != null && settings.contains("handshake_lastvideo_" + adType)) {
                this.lastVideo = settings.getLong("handshake_lastvideo_" + adType, this.lastVideo);
            }
        }

        /* access modifiers changed from: package-private */
        public void save(SharedPreferences.Editor editor, String adType) {
            editor.putLong("handshake_lastvideo_" + adType, this.lastVideo);
            editor.putLong("handshake_videointerval_" + adType, this.videoInterval);
            if (this.refreshInterval != null) {
                editor.putString("handshake_adrefresh_" + adType, this.refreshInterval);
            }
        }

        /* access modifiers changed from: package-private */
        public void save(Context context, String adType) {
            SharedPreferences.Editor editor = context.getSharedPreferences("MillennialMediaSettings", 0).edit();
            save(editor, adType);
            editor.commit();
        }
    }

    /* access modifiers changed from: private */
    public JSONObject parseJson(String jsonString) {
        MMAdViewSDK.Log.d("JSON String: %s", jsonString);
        if (jsonString != null) {
            try {
                JSONObject jsonObject = new JSONObject(jsonString);
                MMAdViewSDK.Log.v(jsonObject.toString());
                if (jsonObject.has("mmishake")) {
                    return jsonObject.getJSONObject("mmishake");
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
        return null;
    }

    /* access modifiers changed from: private */
    public void deserializeFromObj(JSONObject handShakeObject) {
        final Context context = (Context) this.contextRef.get();
        if (handShakeObject != null) {
            try {
                JSONArray jsonArray = handShakeObject.optJSONArray("errors");
                if (jsonArray != null) {
                    for (int i = 0; i < jsonArray.length(); i++) {
                        JSONObject jsonObject = jsonArray.optJSONObject(i);
                        if (jsonObject != null) {
                            final String message = jsonObject.optString("message", (String) null);
                            String type = jsonObject.optString(ServerProtocol.DIALOG_PARAM_TYPE, (String) null);
                            if (!(message == null || type == null)) {
                                if (type.equalsIgnoreCase("log")) {
                                    MMAdViewSDK.Log.e(message);
                                } else if (type.equalsIgnoreCase("prompt")) {
                                    this.handler.post(new Runnable() {
                                        public void run() {
                                            try {
                                                Toast.makeText(context, "Error: " + message, 1).show();
                                            } catch (WindowManager.BadTokenException e) {
                                                e.printStackTrace();
                                            }
                                        }
                                    });
                                }
                            }
                        }
                    }
                }
                JSONObject jsonObject2 = handShakeObject.optJSONObject("adtypes");
                if (jsonObject2 != null) {
                    String[] adTypes = MMAdView.getAdTypes();
                    for (int i2 = 0; i2 < adTypes.length; i2++) {
                        JSONObject adTypeObject = jsonObject2.optJSONObject(adTypes[i2]);
                        if (adTypeObject != null) {
                            AdTypeHandShake adTypeHandShake = new AdTypeHandShake();
                            adTypeHandShake.deserializeFromObj(adTypeObject);
                            adTypeHandShake.loadLastVideo(context, adTypes[i2]);
                            this.adTypeHandShakes.put(adTypes[i2], adTypeHandShake);
                        }
                    }
                }
                synchronized (this) {
                    JSONArray jsonArray2 = handShakeObject.optJSONArray("schemes");
                    if (jsonArray2 != null) {
                        if (this.schemes != null && this.schemes.size() > 0) {
                            this.schemes.removeAll(this.schemes);
                        }
                        for (int i3 = 0; i3 < jsonArray2.length(); i3++) {
                            JSONObject jsonObject3 = jsonArray2.optJSONObject(i3);
                            if (jsonObject3 != null) {
                                Scheme scheme = new Scheme();
                                scheme.deserializeFromObj(jsonObject3);
                                this.schemes.add(scheme);
                            }
                        }
                    }
                }
                this.deferredViewTimeout = handShakeObject.optLong("deferredviewtimeout", 3600) * 1000;
                this.kill = handShakeObject.optBoolean("kill");
                this.handShakeCallback = handShakeObject.optLong("handshakecallback", Constants.LICENSE_REFRESH_INTERVAL) * 1000;
                this.hdid = handShakeObject.optBoolean("hdid", true);
                this.creativeCacheTimeout = handShakeObject.optLong("creativeCacheTimeout", 259200) * 1000;
                JSONArray jsonArray3 = handShakeObject.optJSONArray("cachedVideos");
                if (jsonArray3 != null) {
                    this.cachedVideos = new String[jsonArray3.length()];
                    for (int i4 = 0; i4 < jsonArray3.length(); i4++) {
                        this.cachedVideos[i4] = jsonArray3.optString(i4);
                    }
                } else {
                    this.cachedVideos = new String[0];
                }
                if (this.cachedVideos.length > 0) {
                    PreCacheWorker.preCacheVideos(this.cachedVideos, context);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    private boolean loadHandShake(Context context) {
        boolean settingsFound = false;
        SharedPreferences settings = context.getSharedPreferences("MillennialMediaSettings", 0);
        if (settings == null) {
            return false;
        }
        if (settings.contains("handshake_deferredviewtimeout")) {
            this.deferredViewTimeout = settings.getLong("handshake_deferredviewtimeout", this.deferredViewTimeout);
            settingsFound = true;
        }
        if (settings.contains("handshake_kill")) {
            this.kill = settings.getBoolean("handshake_kill", this.kill);
            settingsFound = true;
        }
        if (settings.contains("handshake_callback")) {
            this.handShakeCallback = settings.getLong("handshake_callback", this.handShakeCallback);
            settingsFound = true;
        }
        if (settings.contains("handshake_hdid")) {
            this.hdid = settings.getBoolean("handshake_hdid", this.hdid);
            settingsFound = true;
        }
        if (settings.contains("handshake_mmdid")) {
            setMMdid(context, settings.getString("handshake_mmdid", this.mmdid), false);
            settingsFound = true;
        }
        if (settings.contains("handshake_creativecachetimeout")) {
            this.creativeCacheTimeout = settings.getLong("handshake_creativecachetimeout", this.creativeCacheTimeout);
            settingsFound = true;
        }
        String[] adTypes = MMAdView.getAdTypes();
        for (int i = 0; i < adTypes.length; i++) {
            AdTypeHandShake adTypeHandShake = new AdTypeHandShake();
            if (adTypeHandShake.load(settings, adTypes[i])) {
                settingsFound = true;
                this.adTypeHandShakes.put(adTypes[i], adTypeHandShake);
            }
        }
        synchronized (this) {
            if (settings.contains("handshake_schemes")) {
                String schemesStr = settings.getString("handshake_schemes", "");
                if (schemesStr.length() > 0) {
                    for (String str : schemesStr.split("\n")) {
                        String[] parts = str.split("\t");
                        if (parts.length >= 2) {
                            this.schemes.add(new Scheme(parts[0], Integer.parseInt(parts[1])));
                        }
                    }
                    settingsFound = true;
                }
            }
        }
        if (settings.contains("handshake_cachedvideos")) {
            String videos = settings.getString("handshake_cachedvideos", "");
            if (videos.length() > 0) {
                this.cachedVideos = videos.split("\n");
            }
        }
        if (this.cachedVideos == null) {
            this.cachedVideos = new String[0];
        }
        if (settings.contains("handshake_lasthandshake")) {
            this.lastHandShake = settings.getLong("handshake_lasthandshake", this.lastHandShake);
            settingsFound = true;
        }
        if (settingsFound) {
            MMAdViewSDK.Log.d("Handshake successfully loaded from shared preferences.");
            if (System.currentTimeMillis() - this.lastHandShake < this.handShakeCallback) {
                this.handler.postDelayed(this.updateHandShakeRunnable, this.handShakeCallback - (System.currentTimeMillis() - this.lastHandShake));
            }
            if (this.cachedVideos.length > 0) {
                PreCacheWorker.preCacheVideos(this.cachedVideos, context);
            }
        }
        return settingsFound;
    }

    /* access modifiers changed from: private */
    public void saveHandShake(Context context) {
        SharedPreferences.Editor editor = context.getSharedPreferences("MillennialMediaSettings", 0).edit();
        editor.putLong("handshake_deferredviewtimeout", this.deferredViewTimeout);
        editor.putBoolean("handshake_kill", this.kill);
        editor.putLong("handshake_callback", this.handShakeCallback);
        editor.putBoolean("handshake_hdid", this.hdid);
        editor.putLong("handshake_creativecaetimeout", this.creativeCacheTimeout);
        for (String adType : this.adTypeHandShakes.keySet()) {
            this.adTypeHandShakes.get(adType).save(editor, adType);
        }
        synchronized (this) {
            StringBuilder stringBuilder = new StringBuilder();
            for (int i = 0; i < this.schemes.size(); i++) {
                Scheme scheme = this.schemes.get(i);
                if (i > 0) {
                    stringBuilder.append("\n");
                }
                stringBuilder.append(scheme.scheme + "\t" + scheme.id);
            }
            editor.putString("handshake_schemes", stringBuilder.toString());
        }
        StringBuilder stringBuilder2 = new StringBuilder();
        for (int i2 = 0; i2 < this.cachedVideos.length; i2++) {
            if (i2 > 0) {
                stringBuilder2.append("\n");
            }
            stringBuilder2.append(this.cachedVideos[i2]);
        }
        if (stringBuilder2.length() > 0) {
            editor.putString("handshake_cachedvideos", stringBuilder2.toString());
        }
        editor.putLong("handshake_lasthandshake", this.lastHandShake);
        editor.commit();
    }
}
