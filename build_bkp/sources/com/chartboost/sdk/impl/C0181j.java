package com.chartboost.sdk.impl;

import android.app.Application;
import android.content.Context;
import android.content.SharedPreferences;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.os.Build;
import android.util.Log;
import android.util.SparseArray;
import com.chartboost.sdk.C0038Chartboost;
import com.chartboost.sdk.Libraries.C0053d;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.util.Locale;
import java.util.Map;
import org.apache.http.HttpResponse;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.scheme.PlainSocketFactory;
import org.apache.http.conn.scheme.Scheme;
import org.apache.http.conn.scheme.SchemeRegistry;
import org.apache.http.conn.scheme.SocketFactory;
import org.apache.http.conn.ssl.SSLSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.impl.conn.tsccm.ThreadSafeClientConnManager;
import org.apache.http.message.BasicHeader;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;

/* renamed from: com.chartboost.sdk.impl.j */
public class C0181j {
    /* access modifiers changed from: private */

    /* renamed from: g */
    public static int f290g = 0;

    /* renamed from: h */
    private static HttpClient f291h = null;

    /* renamed from: a */
    public String f292a;

    /* renamed from: b */
    public C0185c f293b;

    /* renamed from: c */
    public String f294c;

    /* renamed from: d */
    public SparseArray<C0184b> f295d;

    /* renamed from: e */
    public int f296e = 1;

    /* renamed from: f */
    public String f297f = "Loading...";

    /* renamed from: com.chartboost.sdk.impl.j$c */
    public interface C0185c {
        /* renamed from: a */
        void mo1166a(C0186k kVar);

        /* renamed from: a */
        void mo1167a(JSONObject jSONObject, C0186k kVar);
    }

    /* renamed from: com.chartboost.sdk.impl.j$b */
    protected class C0184b implements Serializable {

        /* renamed from: a */
        public C0186k f300a;

        /* renamed from: b */
        public JSONObject f301b;

        /* renamed from: c */
        public Integer f302c;

        public C0184b(C0186k kVar, JSONObject jSONObject) {
            this.f300a = kVar;
            this.f301b = jSONObject;
        }
    }

    public C0181j(String str, C0185c cVar, String str2) {
        this.f292a = str == null ? "https://www.chartboost.com" : str;
        this.f293b = cVar;
        this.f294c = str2;
        this.f295d = new SparseArray<>();
    }

    /* renamed from: a */
    public void mo1457a(C0186k kVar) {
        if (!C0188l.m405a()) {
            m385b(kVar);
            return;
        }
        int i = this.f296e;
        this.f296e = i + 1;
        C0184b bVar = new C0184b(kVar, (JSONObject) null);
        bVar.f302c = Integer.valueOf(i);
        this.f295d.put(i, bVar);
        new C0183a().execute(new C0184b[]{bVar});
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public void m385b(C0186k kVar) {
        JSONArray jSONArray;
        if (kVar.f312i && this.f294c != null) {
            SharedPreferences a = C0053d.m79a();
            String str = "CBQueuedRequests-" + this.f294c;
            try {
                JSONObject d = kVar.mo1472d();
                if (d != null) {
                    String string = a.getString(str, (String) null);
                    if (string != null) {
                        try {
                            jSONArray = new JSONArray(new JSONTokener(string));
                        } catch (Exception e) {
                            Log.w("Chartboost", "Failure reading saved request list");
                            jSONArray = new JSONArray();
                        }
                    } else {
                        jSONArray = new JSONArray();
                    }
                    jSONArray.put(d);
                    SharedPreferences.Editor edit = a.edit();
                    edit.putString(str, jSONArray.toString());
                    edit.commit();
                }
            } catch (Exception e2) {
                Log.w("Chartboost", "Unable to save failed request");
            }
        } else if (this.f293b != null) {
            this.f293b.mo1166a(kVar);
        }
    }

    /* renamed from: a */
    public void mo1456a() {
        SharedPreferences a;
        String str;
        String string;
        if (C0188l.m405a() && (string = a.getString(str, (String) null)) != null) {
            SharedPreferences.Editor edit = (a = C0053d.m79a()).edit();
            edit.putString((str = "CBQueuedRequests-" + this.f294c), (String) null);
            edit.commit();
            try {
                JSONArray jSONArray = new JSONArray(new JSONTokener(string));
                for (int i = 0; i < jSONArray.length(); i++) {
                    try {
                        C0186k a2 = C0186k.m394a(jSONArray.getJSONObject(i));
                        if (a2 != null) {
                            mo1457a(a2);
                        }
                    } catch (Exception e) {
                        Log.w("Chartboost", "Retrying request failed");
                    }
                }
            } catch (Exception e2) {
                Log.w("Chartboost", "Retrying request list failed");
            }
        }
    }

    /* renamed from: com.chartboost.sdk.impl.j$a */
    protected class C0183a extends AsyncTask<C0184b, Void, C0184b> {
        protected C0183a() {
        }

        /* access modifiers changed from: protected */
        public void onPreExecute() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public C0184b doInBackground(C0184b... bVarArr) {
            int c;
            C0184b bVar = bVarArr[0];
            C0186k kVar = bVar.f300a;
            HttpPost httpPost = new HttpPost(String.valueOf(C0181j.this.f292a) + kVar.mo1465a());
            httpPost.setHeader("Content-Type", "application/json; charset=UTF-8");
            httpPost.setHeader("Accept", "application/json; charset=UTF-8");
            httpPost.setHeader("X-Chartboost-Client", "Chartboost-Android-SDK 3.1.5");
            httpPost.setHeader("X-Chartboost-API", "3.1.5");
            Map<String, String> c2 = kVar.mo1470c();
            if (c2 != null) {
                for (String next : c2.keySet()) {
                    httpPost.setHeader(next, c2.get(next));
                }
            }
            synchronized (C0181j.this) {
                c = C0181j.f290g + 1;
                C0181j.f290g = c;
            }
            HttpResponse httpResponse = null;
            try {
                if (kVar.f308e != null) {
                    StringEntity stringEntity = new StringEntity(kVar.f308e.toString());
                    stringEntity.setContentType(new BasicHeader("Content-Type", "application/json"));
                    httpPost.setEntity(stringEntity);
                } else {
                    Log.i("HTTP Request Body " + c + " " + kVar.f305b, "<empty>");
                }
                httpResponse = C0181j.m384b().execute(httpPost);
                int statusCode = httpResponse.getStatusLine().getStatusCode();
                if (statusCode >= 300 || statusCode < 200) {
                    Log.w("Chartboost", "Request failed. Response code: " + statusCode + ", body: " + httpResponse);
                    httpResponse.getEntity().consumeContent();
                    return bVar;
                }
                BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(httpResponse.getEntity().getContent(), "UTF-8"), 2048);
                StringBuilder sb = new StringBuilder();
                while (true) {
                    String readLine = bufferedReader.readLine();
                    if (readLine == null) {
                        bufferedReader.close();
                        kVar.f313j = new JSONObject(new JSONTokener(sb.toString()));
                        httpResponse.getEntity().consumeContent();
                        return bVar;
                    }
                    sb.append(readLine).append("\n");
                }
            } catch (Exception e) {
                Log.e("Chartboost", "Exception on http request: " + e.getLocalizedMessage());
                if (httpResponse != null) {
                    try {
                        if (httpResponse.getEntity() != null) {
                            httpResponse.getEntity().consumeContent();
                        }
                    } catch (Exception e2) {
                    }
                }
                return bVar;
            }
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void onPostExecute(C0184b bVar) {
            C0181j.this.f295d.remove(bVar.f302c.intValue());
            if (bVar.f300a.f313j == null) {
                C0181j.this.m385b(bVar.f300a);
            } else if (C0181j.this.f293b != null) {
                C0181j.this.f293b.mo1167a(bVar.f300a.f313j, bVar.f300a);
            }
        }
    }

    /* renamed from: b */
    public static HttpClient m384b() {
        if (f291h != null) {
            return f291h;
        }
        try {
            final Application application = (Application) C0038Chartboost.sharedChartboost().getContext().getApplicationContext();
            f291h = new DefaultHttpClient() {
                /* access modifiers changed from: protected */
                public ClientConnectionManager createClientConnectionManager() {
                    SchemeRegistry schemeRegistry = new SchemeRegistry();
                    schemeRegistry.register(new Scheme("http", PlainSocketFactory.getSocketFactory(), 80));
                    schemeRegistry.register(new Scheme("https", mo1458a(), 443));
                    HttpParams params = getParams();
                    HttpConnectionParams.setConnectionTimeout(params, C0038Chartboost.sharedChartboost().getTimeout());
                    HttpConnectionParams.setSoTimeout(params, C0038Chartboost.sharedChartboost().getTimeout());
                    HttpProtocolParams.setUserAgent(params, C0181j.m383b(application, HttpProtocolParams.getUserAgent(params)));
                    return new ThreadSafeClientConnManager(params, schemeRegistry);
                }

                /* access modifiers changed from: protected */
                /* renamed from: a */
                public SocketFactory mo1458a() {
                    try {
                        Class<?> cls = Class.forName("android.net.SSLSessionCache");
                        Object newInstance = cls.getConstructor(new Class[]{Context.class}).newInstance(new Object[]{application});
                        return (SocketFactory) Class.forName("android.net.SSLCertificateSocketFactory").getMethod("getHttpSocketFactory", new Class[]{Integer.TYPE, cls}).invoke((Object) null, new Object[]{Integer.valueOf(C0038Chartboost.sharedChartboost().getTimeout()), newInstance});
                    } catch (Exception e) {
                        return SSLSocketFactory.getSocketFactory();
                    }
                }
            };
            return f291h;
        } catch (Exception e) {
            try {
                DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
                ClientConnectionManager connectionManager = defaultHttpClient.getConnectionManager();
                HttpParams params = defaultHttpClient.getParams();
                f291h = new DefaultHttpClient(new ThreadSafeClientConnManager(params, connectionManager.getSchemeRegistry()), params);
                return f291h;
            } catch (Exception e2) {
                f291h = new DefaultHttpClient();
                return f291h;
            }
        }
    }

    /* access modifiers changed from: private */
    /* renamed from: b */
    public static String m383b(Application application, String str) {
        try {
            String str2 = application.getPackageManager().getPackageInfo(application.getPackageName(), 0).versionName;
            StringBuilder sb = new StringBuilder();
            sb.append(application.getPackageName());
            sb.append("/");
            sb.append(str2);
            sb.append(" (");
            sb.append("Linux; U; Android ");
            sb.append(Build.VERSION.RELEASE);
            sb.append("; ");
            sb.append(Locale.getDefault());
            sb.append("; ");
            sb.append(Build.PRODUCT);
            sb.append(")");
            if (str != null) {
                sb.append(" ");
                sb.append(str);
            }
            return sb.toString();
        } catch (PackageManager.NameNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}
