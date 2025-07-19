package com.google.android.gms.cast;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1046dh;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class CastDevice implements SafeParcelable {
    public static final Parcelable.Creator<CastDevice> CREATOR = new C0644b();

    /* renamed from: kA */
    String f1228kA;

    /* renamed from: kB */
    private Inet4Address f1229kB;

    /* renamed from: kC */
    private String f1230kC;

    /* renamed from: kD */
    private String f1231kD;

    /* renamed from: kE */
    private String f1232kE;

    /* renamed from: kF */
    private int f1233kF;

    /* renamed from: kG */
    private List<WebImage> f1234kG;

    /* renamed from: kg */
    private final int f1235kg;

    /* renamed from: kz */
    private String f1236kz;

    private CastDevice() {
        this(1, (String) null, (String) null, (String) null, (String) null, (String) null, -1, new ArrayList());
    }

    CastDevice(int versionCode, String deviceId, String hostAddress, String friendlyName, String modelName, String deviceVersion, int servicePort, List<WebImage> icons) {
        this.f1235kg = versionCode;
        this.f1236kz = deviceId;
        this.f1228kA = hostAddress;
        if (this.f1228kA != null) {
            try {
                InetAddress byName = InetAddress.getByName(this.f1228kA);
                if (byName instanceof Inet4Address) {
                    this.f1229kB = (Inet4Address) byName;
                }
            } catch (UnknownHostException e) {
                this.f1229kB = null;
            }
        }
        this.f1230kC = friendlyName;
        this.f1231kD = modelName;
        this.f1232kE = deviceVersion;
        this.f1233kF = servicePort;
        this.f1234kG = icons;
    }

    public static CastDevice getFromBundle(Bundle extras) {
        if (extras == null) {
            return null;
        }
        extras.setClassLoader(CastDevice.class.getClassLoader());
        return (CastDevice) extras.getParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE");
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof CastDevice)) {
            return false;
        }
        CastDevice castDevice = (CastDevice) obj;
        return getDeviceId() == null ? castDevice.getDeviceId() == null : C1046dh.m2369a(this.f1236kz, castDevice.f1236kz) && C1046dh.m2369a(this.f1229kB, castDevice.f1229kB) && C1046dh.m2369a(this.f1231kD, castDevice.f1231kD) && C1046dh.m2369a(this.f1230kC, castDevice.f1230kC) && C1046dh.m2369a(this.f1232kE, castDevice.f1232kE) && this.f1233kF == castDevice.f1233kF && C1046dh.m2369a(this.f1234kG, castDevice.f1234kG);
    }

    public String getDeviceId() {
        return this.f1236kz;
    }

    public String getDeviceVersion() {
        return this.f1232kE;
    }

    public String getFriendlyName() {
        return this.f1230kC;
    }

    public WebImage getIcon(int preferredWidth, int preferredHeight) {
        WebImage webImage;
        WebImage webImage2 = null;
        if (this.f1234kG.isEmpty()) {
            return null;
        }
        if (preferredWidth <= 0 || preferredHeight <= 0) {
            return this.f1234kG.get(0);
        }
        WebImage webImage3 = null;
        for (WebImage next : this.f1234kG) {
            int width = next.getWidth();
            int height = next.getHeight();
            if (width < preferredWidth || height < preferredHeight) {
                if (width < preferredWidth && height < preferredHeight && (webImage2 == null || (webImage2.getWidth() < width && webImage2.getHeight() < height))) {
                    webImage = webImage3;
                }
                next = webImage2;
                webImage = webImage3;
            } else {
                if (webImage3 == null || (webImage3.getWidth() > width && webImage3.getHeight() > height)) {
                    WebImage webImage4 = webImage2;
                    webImage = next;
                    next = webImage4;
                }
                next = webImage2;
                webImage = webImage3;
            }
            webImage3 = webImage;
            webImage2 = next;
        }
        if (webImage3 == null) {
            webImage3 = webImage2 != null ? webImage2 : this.f1234kG.get(0);
        }
        return webImage3;
    }

    public List<WebImage> getIcons() {
        return Collections.unmodifiableList(this.f1234kG);
    }

    public Inet4Address getIpAddress() {
        return this.f1229kB;
    }

    public String getModelName() {
        return this.f1231kD;
    }

    public int getServicePort() {
        return this.f1233kF;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f1235kg;
    }

    public boolean hasIcons() {
        return !this.f1234kG.isEmpty();
    }

    public int hashCode() {
        if (this.f1236kz == null) {
            return 0;
        }
        return this.f1236kz.hashCode();
    }

    public boolean isSameDevice(CastDevice castDevice) {
        if (castDevice == null) {
            return false;
        }
        if (getDeviceId() == null) {
            return castDevice.getDeviceId() == null;
        }
        return C1046dh.m2369a(getDeviceId(), castDevice.getDeviceId());
    }

    public void putInBundle(Bundle bundle) {
        if (bundle != null) {
            bundle.putParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE", this);
        }
    }

    public String toString() {
        return String.format("\"%s\" (%s)", new Object[]{this.f1230kC, this.f1236kz});
    }

    public void writeToParcel(Parcel out, int flags) {
        C0644b.m1220a(this, out, flags);
    }
}
