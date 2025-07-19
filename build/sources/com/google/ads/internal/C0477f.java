package com.google.ads.internal;

import android.content.Context;
import android.preference.PreferenceManager;
import android.text.TextUtils;
import com.getjar.sdk.utilities.Constants;
import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.util.AdUtil;
import com.google.ads.util.C0508b;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

/* renamed from: com.google.ads.internal.f */
public final class C0477f implements Runnable {

    /* renamed from: a */
    private final C0467c f922a;

    /* renamed from: b */
    private final C0475d f923b;

    /* renamed from: c */
    private final C0479a f924c;

    /* renamed from: d */
    private volatile boolean f925d;

    /* renamed from: e */
    private boolean f926e;

    /* renamed from: f */
    private String f927f;

    /* renamed from: g */
    private Thread f928g;

    /* renamed from: com.google.ads.internal.f$a */
    public interface C0479a {
        /* renamed from: a */
        HttpURLConnection mo3734a(URL url) throws IOException;
    }

    C0477f(C0467c cVar, C0475d dVar) {
        this(cVar, dVar, new C0479a() {
            /* renamed from: a */
            public HttpURLConnection mo3734a(URL url) throws IOException {
                return (HttpURLConnection) url.openConnection();
            }
        });
    }

    C0477f(C0467c cVar, C0475d dVar, C0479a aVar) {
        this.f928g = null;
        this.f922a = cVar;
        this.f923b = dVar;
        this.f924c = aVar;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public void mo3730a() {
        this.f925d = true;
    }

    /* renamed from: a */
    private void m891a(HttpURLConnection httpURLConnection) {
        m894b(httpURLConnection);
        m898f(httpURLConnection);
        m899g(httpURLConnection);
        m900h(httpURLConnection);
        m897e(httpURLConnection);
        m901i(httpURLConnection);
        m902j(httpURLConnection);
        m903k(httpURLConnection);
        m896d(httpURLConnection);
        m895c(httpURLConnection);
        m904l(httpURLConnection);
    }

    /* renamed from: b */
    private void m894b(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Debug-Dialog");
        if (!TextUtils.isEmpty(headerField)) {
            this.f922a.mo3674e(headerField);
        }
    }

    /* renamed from: c */
    private void m895c(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("Content-Type");
        if (!TextUtils.isEmpty(headerField)) {
            this.f922a.mo3667b(headerField);
        }
    }

    /* renamed from: d */
    private void m896d(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Mediation");
        if (!TextUtils.isEmpty(headerField)) {
            this.f922a.mo3665a(Boolean.valueOf(headerField).booleanValue());
        }
    }

    /* renamed from: e */
    private void m897e(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Interstitial-Timeout");
        if (!TextUtils.isEmpty(headerField)) {
            try {
                this.f923b.mo3686a((long) (Float.parseFloat(headerField) * 1000.0f));
            } catch (NumberFormatException e) {
                C0508b.m1035d("Could not get timeout value: " + headerField, e);
            }
        }
    }

    /* renamed from: f */
    private void m898f(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Tracking-Urls");
        if (!TextUtils.isEmpty(headerField)) {
            for (String b : headerField.trim().split("\\s+")) {
                this.f923b.mo3701b(b);
            }
        }
    }

    /* renamed from: g */
    private void m899g(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Click-Tracking-Urls");
        if (!TextUtils.isEmpty(headerField)) {
            for (String a : headerField.trim().split("\\s+")) {
                this.f922a.mo3663a(a);
            }
        }
    }

    /* renamed from: h */
    private void m900h(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Refresh-Rate");
        if (!TextUtils.isEmpty(headerField)) {
            try {
                float parseFloat = Float.parseFloat(headerField);
                if (parseFloat > BitmapDescriptorFactory.HUE_RED) {
                    this.f923b.mo3684a(parseFloat);
                    if (!this.f923b.mo3719s()) {
                        this.f923b.mo3706f();
                    }
                } else if (this.f923b.mo3719s()) {
                    this.f923b.mo3705e();
                }
            } catch (NumberFormatException e) {
                C0508b.m1035d("Could not get refresh value: " + headerField, e);
            }
        }
    }

    /* renamed from: i */
    private void m901i(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Orientation");
        if (TextUtils.isEmpty(headerField)) {
            return;
        }
        if (headerField.equals(Constants.PORTRAIT)) {
            this.f922a.mo3657a(AdUtil.m998b());
        } else if (headerField.equals(Constants.LANDSCAPE)) {
            this.f922a.mo3657a(AdUtil.m982a());
        }
    }

    /* renamed from: j */
    private void m902j(HttpURLConnection httpURLConnection) {
        if (!TextUtils.isEmpty(httpURLConnection.getHeaderField("X-Afma-Doritos-Cache-Life"))) {
            try {
                this.f923b.mo3699b(Long.parseLong(httpURLConnection.getHeaderField("X-Afma-Doritos-Cache-Life")));
            } catch (NumberFormatException e) {
                C0508b.m1036e("Got bad value of Doritos cookie cache life from header: " + httpURLConnection.getHeaderField("X-Afma-Doritos-Cache-Life") + ". Using default value instead.");
            }
        }
    }

    /* renamed from: a */
    public void mo3732a(boolean z) {
        this.f926e = z;
    }

    /* renamed from: k */
    private void m903k(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("Cache-Control");
        if (!TextUtils.isEmpty(headerField)) {
            this.f922a.mo3670c(headerField);
        }
    }

    /* renamed from: l */
    private void m904l(HttpURLConnection httpURLConnection) {
        String headerField = httpURLConnection.getHeaderField("X-Afma-Ad-Size");
        if (!TextUtils.isEmpty(headerField)) {
            try {
                String[] split = headerField.split(Constants.f677X, 2);
                if (split.length != 2) {
                    C0508b.m1036e("Could not parse size header: " + headerField);
                    return;
                }
                this.f922a.mo3661a(new AdSize(Integer.parseInt(split[0]), Integer.parseInt(split[1])));
            } catch (NumberFormatException e) {
                C0508b.m1036e("Could not parse size header: " + headerField);
            }
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public synchronized void mo3731a(String str) {
        if (this.f928g == null) {
            this.f927f = str;
            this.f925d = false;
            this.f928g = new Thread(this);
            this.f928g.start();
        }
    }

    /* renamed from: a */
    private void m892a(HttpURLConnection httpURLConnection, int i) throws IOException {
        if (300 <= i && i < 400) {
            String headerField = httpURLConnection.getHeaderField("Location");
            if (headerField == null) {
                C0508b.m1032c("Could not get redirect location from a " + i + " redirect.");
                this.f922a.mo3658a(AdRequest.ErrorCode.INTERNAL_ERROR);
                mo3730a();
                return;
            }
            m891a(httpURLConnection);
            this.f927f = headerField;
        } else if (i == 200) {
            m891a(httpURLConnection);
            String trim = AdUtil.m988a((Readable) new InputStreamReader(httpURLConnection.getInputStream())).trim();
            C0508b.m1026a("Response content is: " + trim);
            if (TextUtils.isEmpty(trim)) {
                C0508b.m1026a("Response message is null or zero length: " + trim);
                this.f922a.mo3658a(AdRequest.ErrorCode.NO_FILL);
                mo3730a();
                return;
            }
            this.f922a.mo3664a(trim, this.f927f);
            mo3730a();
        } else if (i == 400) {
            C0508b.m1032c("Bad request");
            this.f922a.mo3658a(AdRequest.ErrorCode.INVALID_REQUEST);
            mo3730a();
        } else {
            C0508b.m1032c("Invalid response code: " + i);
            this.f922a.mo3658a(AdRequest.ErrorCode.INTERNAL_ERROR);
            mo3730a();
        }
    }

    public void run() {
        try {
            m893b();
        } catch (MalformedURLException e) {
            C0508b.m1031b("Received malformed ad url from javascript.", e);
            this.f922a.mo3658a(AdRequest.ErrorCode.INTERNAL_ERROR);
        } catch (IOException e2) {
            C0508b.m1035d("IOException connecting to ad url.", e2);
            this.f922a.mo3658a(AdRequest.ErrorCode.NETWORK_ERROR);
        } catch (Throwable th) {
            C0508b.m1031b("An unknown error occurred in AdResponseLoader.", th);
            this.f922a.mo3658a(AdRequest.ErrorCode.INTERNAL_ERROR);
        }
    }

    /* renamed from: b */
    private void m893b() throws MalformedURLException, IOException {
        while (!this.f925d) {
            HttpURLConnection a = this.f924c.mo3734a(new URL(this.f927f));
            try {
                m890a(this.f923b.mo3708h().f985f.mo3874a(), a);
                AdUtil.m992a(a, this.f923b.mo3708h().f985f.mo3874a());
                a.setInstanceFollowRedirects(false);
                a.connect();
                m892a(a, a.getResponseCode());
            } finally {
                a.disconnect();
            }
        }
    }

    /* renamed from: a */
    private void m890a(Context context, HttpURLConnection httpURLConnection) {
        String string = PreferenceManager.getDefaultSharedPreferences(context).getString("drt", "");
        if (this.f926e && !TextUtils.isEmpty(string)) {
            if (AdUtil.f1033a == 8) {
                httpURLConnection.addRequestProperty("X-Afma-drt-Cookie", string);
            } else {
                httpURLConnection.addRequestProperty("Cookie", string);
            }
        }
    }
}
