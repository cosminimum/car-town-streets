package com.google.android.gms.cast;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.cast.b */
public class C0644b implements Parcelable.Creator<CastDevice> {
    /* renamed from: a */
    static void m1220a(CastDevice castDevice, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, castDevice.getVersionCode());
        C0677b.m1401a(parcel, 2, castDevice.getDeviceId(), false);
        C0677b.m1401a(parcel, 3, castDevice.f1228kA, false);
        C0677b.m1401a(parcel, 4, castDevice.getFriendlyName(), false);
        C0677b.m1401a(parcel, 5, castDevice.getModelName(), false);
        C0677b.m1401a(parcel, 6, castDevice.getDeviceVersion(), false);
        C0677b.m1412c(parcel, 7, castDevice.getServicePort());
        C0677b.m1411b(parcel, 8, castDevice.getIcons(), false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: j */
    public CastDevice createFromParcel(Parcel parcel) {
        int i = 0;
        ArrayList<WebImage> arrayList = null;
        int n = C0675a.m1375n(parcel);
        String str = null;
        String str2 = null;
        String str3 = null;
        String str4 = null;
        String str5 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str5 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str4 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 6:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 8:
                    arrayList = C0675a.m1362c(parcel, m, WebImage.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CastDevice(i2, str5, str4, str3, str2, str, i, arrayList);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: s */
    public CastDevice[] newArray(int i) {
        return new CastDevice[i];
    }
}
