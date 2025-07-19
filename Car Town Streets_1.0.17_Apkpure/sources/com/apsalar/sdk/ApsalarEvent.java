package com.apsalar.sdk;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import org.apache.http.HttpVersion;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.impl.client.BasicResponseHandler;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.params.BasicHttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.json.JSONException;
import org.json.JSONObject;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: ApEvent.java */
/* loaded from: classes.dex */
public class ApsalarEvent implements ApsalarAPI, ApsalarJSON {
    protected static HttpClient client;
    protected String eventData;
    protected String eventName;
    protected long eventTime;
    protected int eventType;
    protected ApsalarSessionInfo info;
    protected String returnData;
    protected JSONObject returnDataJSON;
    protected String url;
    protected String urlbase;

    static {
        BasicHttpParams basicHttpParams = new BasicHttpParams();
        HttpProtocolParams.setVersion(basicHttpParams, HttpVersion.HTTP_1_1);
        HttpProtocolParams.setContentCharset(basicHttpParams, "ISO-8859-1");
        HttpProtocolParams.setUseExpectContinue(basicHttpParams, false);
        HttpProtocolParams.setUserAgent(basicHttpParams, "SDK/4.0.0");
        basicHttpParams.setParameter("http.connection.timeout", new Integer(3000));
        basicHttpParams.setParameter("http.socket.timeout", new Integer(3000));
        SchemeRegistry schemeRegistry = new SchemeRegistry();
        schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
        schemeRegistry.register(new Scheme("https", SSLSocketFactory.getSocketFactory(), 443));
        client = new DefaultHttpClient(new ThreadSafeClientConnManager(basicHttpParams, schemeRegistry), basicHttpParams);
    }

    protected void init() {
        this.urlbase = "http://e.apsalar.com/api/v1/event";
        this.eventType = 3;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarEvent() {
        this.urlbase = "http://e.apsalar.com/api/v1";
        this.info = null;
        this.url = "";
        this.eventTime = System.currentTimeMillis();
        this.eventName = "";
        this.eventData = "";
        this.eventType = 0;
        this.returnData = null;
        this.returnDataJSON = null;
        init();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarEvent(ApsalarSessionInfo apsalarSessionInfo) {
        this.urlbase = "http://e.apsalar.com/api/v1";
        this.info = null;
        this.url = "";
        this.eventTime = System.currentTimeMillis();
        this.eventName = "";
        this.eventData = "";
        this.eventType = 0;
        this.returnData = null;
        this.returnDataJSON = null;
        init();
        this.info = apsalarSessionInfo;
    }

    protected ApsalarEvent(ApsalarSessionInfo apsalarSessionInfo, String str) {
        this.urlbase = "http://e.apsalar.com/api/v1";
        this.info = null;
        this.url = "";
        this.eventTime = System.currentTimeMillis();
        this.eventName = "";
        this.eventData = "";
        this.eventType = 0;
        this.returnData = null;
        this.returnDataJSON = null;
        init();
        this.info = apsalarSessionInfo;
        this.eventName = str;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarEvent(ApsalarSessionInfo apsalarSessionInfo, String str, String str2) {
        this.urlbase = "http://e.apsalar.com/api/v1";
        this.info = null;
        this.url = "";
        this.eventTime = System.currentTimeMillis();
        this.eventName = "";
        this.eventData = "";
        this.eventType = 0;
        this.returnData = null;
        this.returnDataJSON = null;
        init();
        this.info = apsalarSessionInfo;
        this.eventName = str;
        this.eventData = str2;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ApsalarEvent(ApsalarSessionInfo apsalarSessionInfo, JSONObject jSONObject) {
        this.urlbase = "http://e.apsalar.com/api/v1";
        this.info = null;
        this.url = "";
        this.eventTime = System.currentTimeMillis();
        this.eventName = "";
        this.eventData = "";
        this.eventType = 0;
        this.returnData = null;
        this.returnDataJSON = null;
        init();
        this.info = apsalarSessionInfo;
        try {
            this.eventType = jSONObject.getInt("eventType");
            this.eventTime = jSONObject.getLong("eventTime");
            this.eventName = jSONObject.getString("eventName");
            this.eventData = jSONObject.getString("eventData");
        } catch (JSONException e) {
        }
    }

    protected void makeURL() {
        String str = "";
        try {
            str = "?a=" + URLEncoder.encode(this.info.apiKey, "UTF-8") + "&av=" + URLEncoder.encode(this.info.appVersion, "UTF-8") + "&e=" + URLEncoder.encode(this.eventData, "UTF-8") + "&i=" + URLEncoder.encode(this.info.clsPackage, "UTF-8") + "&n=" + URLEncoder.encode(this.eventName, "UTF-8") + "&p=" + URLEncoder.encode(this.info.platform, "UTF-8") + "&rt=" + URLEncoder.encode(this.info.retType, "UTF-8") + "&s=" + URLEncoder.encode(this.info.sessionId, "UTF-8") + "&sdk=" + URLEncoder.encode(this.info.sdkVersion, "UTF-8") + "&t=" + ((this.eventTime - this.info.sessionStart) * 0.001d) + "&u=" + URLEncoder.encode(this.info.deviceId, "UTF-8");
        } catch (UnsupportedEncodingException e) {
        }
        this.url = str;
    }

    @Override // com.apsalar.sdk.ApsalarAPI
    public int REST() {
        return REST(true);
    }

    public int REST(Boolean bool) {
        makeURL();
        String str = this.url + "&lag=" + ((System.currentTimeMillis() - this.eventTime) * 0.001d);
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-1");
            messageDigest.update(this.info.secret.getBytes("UTF-8"));
            messageDigest.update(str.getBytes("UTF-8"));
            try {
                try {
                    this.returnData = (String) client.execute(new HttpGet(this.urlbase + str + "&h=" + Apsalar.hexDigest(messageDigest.digest())), new BasicResponseHandler());
                    if (bool.booleanValue()) {
                        try {
                            this.returnDataJSON = new JSONObject(this.returnData);
                            if (!this.returnDataJSON.getString("status").toLowerCase().equals("ok")) {
                                return 0;
                            }
                        } catch (Throwable th) {
                            return 0;
                        }
                    }
                    return 1;
                } catch (ClientProtocolException e) {
                    return 0;
                } catch (IOException e2) {
                    return 0;
                }
            } catch (IllegalArgumentException e3) {
                return 0;
            }
        } catch (UnsupportedEncodingException e4) {
            return -1;
        } catch (NoSuchAlgorithmException e5) {
            return -1;
        }
    }

    public JSONObject getRestResult() {
        return this.returnDataJSON;
    }

    public ApsalarSessionInfo getInfo() {
        return this.info;
    }

    @Override // com.apsalar.sdk.ApsalarJSON
    public JSONObject toJSON() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put("eventType", this.eventType);
            jSONObject.put("eventTime", this.eventTime);
            jSONObject.put("eventName", this.eventName);
            jSONObject.put("eventData", this.eventData);
        } catch (JSONException e) {
        }
        return jSONObject;
    }
}
