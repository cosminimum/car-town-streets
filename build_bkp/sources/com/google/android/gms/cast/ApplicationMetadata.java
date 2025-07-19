package com.google.android.gms.cast;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.List;

public final class ApplicationMetadata implements SafeParcelable {
    public static final Parcelable.Creator<ApplicationMetadata> CREATOR = new C0643a();

    /* renamed from: kg */
    private final int f1195kg;

    /* renamed from: kh */
    String f1196kh;

    /* renamed from: ki */
    List<WebImage> f1197ki;

    /* renamed from: kj */
    List<String> f1198kj;

    /* renamed from: kk */
    String f1199kk;

    /* renamed from: kl */
    Uri f1200kl;
    String mName;

    private ApplicationMetadata() {
        this.f1195kg = 1;
        this.f1197ki = new ArrayList();
        this.f1198kj = new ArrayList();
    }

    ApplicationMetadata(int versionCode, String applicationId, String name, List<WebImage> images, List<String> namespaces, String senderAppIdentifier, Uri senderAppLaunchUrl) {
        this.f1195kg = versionCode;
        this.f1196kh = applicationId;
        this.mName = name;
        this.f1197ki = images;
        this.f1198kj = namespaces;
        this.f1199kk = senderAppIdentifier;
        this.f1200kl = senderAppLaunchUrl;
    }

    /* renamed from: aN */
    public Uri mo5664aN() {
        return this.f1200kl;
    }

    public boolean areNamespacesSupported(List<String> namespaces) {
        return this.f1198kj != null && this.f1198kj.containsAll(namespaces);
    }

    public int describeContents() {
        return 0;
    }

    public String getApplicationId() {
        return this.f1196kh;
    }

    public List<WebImage> getImages() {
        return this.f1197ki;
    }

    public String getName() {
        return this.mName;
    }

    public String getSenderAppIdentifier() {
        return this.f1199kk;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f1195kg;
    }

    public boolean isNamespaceSupported(String namespace) {
        return this.f1198kj != null && this.f1198kj.contains(namespace);
    }

    public String toString() {
        return this.mName;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0643a.m1217a(this, out, flags);
    }
}
