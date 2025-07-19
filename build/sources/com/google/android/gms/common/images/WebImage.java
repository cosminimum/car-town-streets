package com.google.android.gms.common.images;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1046dh;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.plus.PlusShare;
import org.json.JSONException;
import org.json.JSONObject;

public final class WebImage implements SafeParcelable {
    public static final Parcelable.Creator<WebImage> CREATOR = new C0674b();

    /* renamed from: kg */
    private final int f1412kg;

    /* renamed from: oA */
    private final Uri f1413oA;

    /* renamed from: v */
    private final int f1414v;

    /* renamed from: w */
    private final int f1415w;

    WebImage(int versionCode, Uri url, int width, int height) {
        this.f1412kg = versionCode;
        this.f1413oA = url;
        this.f1415w = width;
        this.f1414v = height;
    }

    public WebImage(Uri url) throws IllegalArgumentException {
        this(url, 0, 0);
    }

    public WebImage(Uri url, int width, int height) throws IllegalArgumentException {
        this(1, url, width, height);
        if (url == null) {
            throw new IllegalArgumentException("url cannot be null");
        } else if (width < 0 || height < 0) {
            throw new IllegalArgumentException("width and height must not be negative");
        }
    }

    public WebImage(JSONObject json) throws IllegalArgumentException {
        this(m1337f(json), json.optInt("width", 0), json.optInt("height", 0));
    }

    /* renamed from: f */
    private static Uri m1337f(JSONObject jSONObject) {
        if (!jSONObject.has(PlusShare.KEY_CALL_TO_ACTION_URL)) {
            return null;
        }
        try {
            return Uri.parse(jSONObject.getString(PlusShare.KEY_CALL_TO_ACTION_URL));
        } catch (JSONException e) {
            return null;
        }
    }

    /* renamed from: aP */
    public JSONObject mo6009aP() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(PlusShare.KEY_CALL_TO_ACTION_URL, this.f1413oA.toString());
            jSONObject.put("width", this.f1415w);
            jSONObject.put("height", this.f1414v);
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object other) {
        if (this == other) {
            return true;
        }
        if (other == null || !(other instanceof WebImage)) {
            return false;
        }
        WebImage webImage = (WebImage) other;
        return C1046dh.m2369a(this.f1413oA, webImage.f1413oA) && this.f1415w == webImage.f1415w && this.f1414v == webImage.f1414v;
    }

    public int getHeight() {
        return this.f1414v;
    }

    public Uri getUrl() {
        return this.f1413oA;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f1412kg;
    }

    public int getWidth() {
        return this.f1415w;
    }

    public int hashCode() {
        return C1098ee.hashCode(this.f1413oA, Integer.valueOf(this.f1415w), Integer.valueOf(this.f1414v));
    }

    public String toString() {
        return String.format("Image %dx%d %s", new Object[]{Integer.valueOf(this.f1415w), Integer.valueOf(this.f1414v), this.f1413oA.toString()});
    }

    public void writeToParcel(Parcel out, int flags) {
        C0674b.m1350a(this, out, flags);
    }
}
