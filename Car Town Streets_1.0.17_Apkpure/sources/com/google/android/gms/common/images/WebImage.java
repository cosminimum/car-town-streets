package com.google.android.gms.common.images;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.dh;
import com.google.android.gms.internal.ee;
import com.google.android.gms.plus.PlusShare;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class WebImage implements SafeParcelable {
    public static final Parcelable.Creator<WebImage> CREATOR = new b();
    private final int kg;
    private final Uri oA;
    private final int v;
    private final int w;

    /* JADX INFO: Access modifiers changed from: package-private */
    public WebImage(int versionCode, Uri url, int width, int height) {
        this.kg = versionCode;
        this.oA = url;
        this.w = width;
        this.v = height;
    }

    public WebImage(Uri url) throws IllegalArgumentException {
        this(url, 0, 0);
    }

    public WebImage(Uri url, int width, int height) throws IllegalArgumentException {
        this(1, url, width, height);
        if (url == null) {
            throw new IllegalArgumentException("url cannot be null");
        }
        if (width >= 0 && height >= 0) {
            return;
        }
        throw new IllegalArgumentException("width and height must not be negative");
    }

    public WebImage(JSONObject json) throws IllegalArgumentException {
        this(f(json), json.optInt("width", 0), json.optInt("height", 0));
    }

    private static Uri f(JSONObject jSONObject) {
        if (jSONObject.has(PlusShare.KEY_CALL_TO_ACTION_URL)) {
            try {
                return Uri.parse(jSONObject.getString(PlusShare.KEY_CALL_TO_ACTION_URL));
            } catch (JSONException e) {
                return null;
            }
        }
        return null;
    }

    public JSONObject aP() {
        JSONObject jSONObject = new JSONObject();
        try {
            jSONObject.put(PlusShare.KEY_CALL_TO_ACTION_URL, this.oA.toString());
            jSONObject.put("width", this.w);
            jSONObject.put("height", this.v);
        } catch (JSONException e) {
        }
        return jSONObject;
    }

    @Override // android.os.Parcelable
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
        return dh.a(this.oA, webImage.oA) && this.w == webImage.w && this.v == webImage.v;
    }

    public int getHeight() {
        return this.v;
    }

    public Uri getUrl() {
        return this.oA;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public int getWidth() {
        return this.w;
    }

    public int hashCode() {
        return ee.hashCode(this.oA, Integer.valueOf(this.w), Integer.valueOf(this.v));
    }

    public String toString() {
        return String.format("Image %dx%d %s", Integer.valueOf(this.w), Integer.valueOf(this.v), this.oA.toString());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        b.a(this, out, flags);
    }
}
