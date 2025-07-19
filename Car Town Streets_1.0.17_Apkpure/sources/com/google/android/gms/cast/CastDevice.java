package com.google.android.gms.cast;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.dh;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class CastDevice implements SafeParcelable {
    public static final Parcelable.Creator<CastDevice> CREATOR = new b();
    String kA;
    private Inet4Address kB;
    private String kC;
    private String kD;
    private String kE;
    private int kF;
    private List<WebImage> kG;
    private final int kg;
    private String kz;

    private CastDevice() {
        this(1, null, null, null, null, null, -1, new ArrayList());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public CastDevice(int versionCode, String deviceId, String hostAddress, String friendlyName, String modelName, String deviceVersion, int servicePort, List<WebImage> icons) {
        this.kg = versionCode;
        this.kz = deviceId;
        this.kA = hostAddress;
        if (this.kA != null) {
            try {
                InetAddress byName = InetAddress.getByName(this.kA);
                if (byName instanceof Inet4Address) {
                    this.kB = (Inet4Address) byName;
                }
            } catch (UnknownHostException e) {
                this.kB = null;
            }
        }
        this.kC = friendlyName;
        this.kD = modelName;
        this.kE = deviceVersion;
        this.kF = servicePort;
        this.kG = icons;
    }

    public static CastDevice getFromBundle(Bundle extras) {
        if (extras == null) {
            return null;
        }
        extras.setClassLoader(CastDevice.class.getClassLoader());
        return (CastDevice) extras.getParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE");
    }

    @Override // android.os.Parcelable
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
        return getDeviceId() == null ? castDevice.getDeviceId() == null : dh.a(this.kz, castDevice.kz) && dh.a(this.kB, castDevice.kB) && dh.a(this.kD, castDevice.kD) && dh.a(this.kC, castDevice.kC) && dh.a(this.kE, castDevice.kE) && this.kF == castDevice.kF && dh.a(this.kG, castDevice.kG);
    }

    public String getDeviceId() {
        return this.kz;
    }

    public String getDeviceVersion() {
        return this.kE;
    }

    public String getFriendlyName() {
        return this.kC;
    }

    public WebImage getIcon(int preferredWidth, int preferredHeight) {
        WebImage webImage;
        WebImage webImage2 = null;
        if (this.kG.isEmpty()) {
            return null;
        }
        if (preferredWidth <= 0 || preferredHeight <= 0) {
            return this.kG.get(0);
        }
        WebImage webImage3 = null;
        for (WebImage webImage4 : this.kG) {
            int width = webImage4.getWidth();
            int height = webImage4.getHeight();
            if (width < preferredWidth || height < preferredHeight) {
                if (width < preferredWidth && height < preferredHeight && (webImage2 == null || (webImage2.getWidth() < width && webImage2.getHeight() < height))) {
                    webImage = webImage3;
                    webImage3 = webImage;
                    webImage2 = webImage4;
                }
                webImage4 = webImage2;
                webImage = webImage3;
                webImage3 = webImage;
                webImage2 = webImage4;
            } else {
                if (webImage3 == null || (webImage3.getWidth() > width && webImage3.getHeight() > height)) {
                    WebImage webImage5 = webImage2;
                    webImage = webImage4;
                    webImage4 = webImage5;
                    webImage3 = webImage;
                    webImage2 = webImage4;
                }
                webImage4 = webImage2;
                webImage = webImage3;
                webImage3 = webImage;
                webImage2 = webImage4;
            }
        }
        if (webImage3 == null) {
            webImage3 = webImage2 != null ? webImage2 : this.kG.get(0);
        }
        return webImage3;
    }

    public List<WebImage> getIcons() {
        return Collections.unmodifiableList(this.kG);
    }

    public Inet4Address getIpAddress() {
        return this.kB;
    }

    public String getModelName() {
        return this.kD;
    }

    public int getServicePort() {
        return this.kF;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    public boolean hasIcons() {
        return !this.kG.isEmpty();
    }

    public int hashCode() {
        if (this.kz == null) {
            return 0;
        }
        return this.kz.hashCode();
    }

    public boolean isSameDevice(CastDevice castDevice) {
        if (castDevice == null) {
            return false;
        }
        return getDeviceId() == null ? castDevice.getDeviceId() == null : dh.a(getDeviceId(), castDevice.getDeviceId());
    }

    public void putInBundle(Bundle bundle) {
        if (bundle == null) {
            return;
        }
        bundle.putParcelable("com.google.android.gms.cast.EXTRA_CAST_DEVICE", this);
    }

    public String toString() {
        return String.format("\"%s\" (%s)", this.kC, this.kz);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        b.a(this, out, flags);
    }
}
