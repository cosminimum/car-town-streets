package google.android.gms.cast;

import android.net.Uri;
import android.os.Parcel;

import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

import java.util.ArrayList;
import java.util.List;

public final class ApplicationMetadata implements SafeParcelable {
    public static final Creator<ApplicationMetadata> CREATOR = new a();
    private final int kg;
    String kh;
    List<WebImage> ki;
    List<String> kj;
    String kk;
    Uri kl;
    String mName;

    private ApplicationMetadata() {
        this.kg = 1;
        this.ki = new ArrayList();
        this.kj = new ArrayList();
    }

    ApplicationMetadata(int versionCode, String applicationId, String name, List<WebImage> images, List<String> namespaces, String senderAppIdentifier, Uri senderAppLaunchUrl) {
        this.kg = versionCode;
        this.kh = applicationId;
        this.mName = name;
        this.ki = images;
        this.kj = namespaces;
        this.kk = senderAppIdentifier;
        this.kl = senderAppLaunchUrl;
    }

    public Uri aN() {
        return this.kl;
    }

    public boolean areNamespacesSupported(List<String> namespaces) {
        return this.kj != null && this.kj.containsAll(namespaces);
    }

    public int describeContents() {
        return 0;
    }

    public String getApplicationId() {
        return this.kh;
    }

    public List<WebImage> getImages() {
        return this.ki;
    }

    public String getName() {
        return this.mName;
    }

    public String getSenderAppIdentifier() {
        return this.kk;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public boolean isNamespaceSupported(String namespace) {
        return this.kj != null && this.kj.contains(namespace);
    }

    public String toString() {
        return this.mName;
    }

    public void writeToParcel(Parcel out, int flags) {
        a.a(this, out, flags);
    }
}
