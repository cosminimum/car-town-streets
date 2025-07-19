package com.google.android.gms.internal;

import android.content.Context;
import android.net.Uri;
import android.view.MotionEvent;
import com.getjar.sdk.utilities.Utility;

/* renamed from: com.google.android.gms.internal.h */
public class C1332h {

    /* renamed from: dK */
    private String f3141dK = "googleads.g.doubleclick.net";

    /* renamed from: dL */
    private String f3142dL = "/pagead/ads";

    /* renamed from: dM */
    private String[] f3143dM = {".doubleclick.net", ".googleadservices.com", ".googlesyndication.com"};

    /* renamed from: dN */
    private C1021d f3144dN;

    /* renamed from: dO */
    private final C0974c f3145dO = new C0974c();

    public C1332h(C1021d dVar) {
        this.f3144dN = dVar;
    }

    /* renamed from: a */
    private Uri m3545a(Uri uri, Context context, String str, boolean z) throws C1393i {
        try {
            if (uri.getQueryParameter("ms") != null) {
                throw new C1393i("Query parameter already exists: ms");
            }
            return m3546a(uri, "ms", z ? this.f3144dN.mo7287a(context, str) : this.f3144dN.mo7286a(context));
        } catch (UnsupportedOperationException e) {
            throw new C1393i("Provided Uri is not in a valid state");
        }
    }

    /* renamed from: a */
    private Uri m3546a(Uri uri, String str, String str2) throws UnsupportedOperationException {
        String uri2 = uri.toString();
        int indexOf = uri2.indexOf("&adurl");
        if (indexOf == -1) {
            indexOf = uri2.indexOf("?adurl");
        }
        return indexOf != -1 ? Uri.parse(uri2.substring(0, indexOf + 1) + str + "=" + str2 + Utility.QUERY_APPENDIX + uri2.substring(indexOf + 1)) : uri.buildUpon().appendQueryParameter(str, str2).build();
    }

    /* renamed from: a */
    public Uri mo8160a(Uri uri, Context context) throws C1393i {
        try {
            return m3545a(uri, context, uri.getQueryParameter("ai"), true);
        } catch (UnsupportedOperationException e) {
            throw new C1393i("Provided Uri is not in a valid state");
        }
    }

    /* renamed from: a */
    public void mo8161a(MotionEvent motionEvent) {
        this.f3144dN.mo7289a(motionEvent);
    }

    /* renamed from: a */
    public boolean mo8162a(Uri uri) {
        if (uri == null) {
            throw new NullPointerException();
        }
        try {
            String host = uri.getHost();
            for (String endsWith : this.f3143dM) {
                if (host.endsWith(endsWith)) {
                    return true;
                }
            }
            return false;
        } catch (NullPointerException e) {
            return false;
        }
    }

    /* renamed from: g */
    public C1021d mo8163g() {
        return this.f3144dN;
    }
}
