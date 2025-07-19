package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class DetectedActivityCreator implements Parcelable.Creator<DetectedActivity> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4085a(DetectedActivity detectedActivity, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, detectedActivity.f3495xp);
        C0677b.m1412c(parcel, 1000, detectedActivity.getVersionCode());
        C0677b.m1412c(parcel, 2, detectedActivity.f3496xq);
        C0677b.m1391D(parcel, o);
    }

    public DetectedActivity createFromParcel(Parcel parcel) {
        int i = 0;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 1000:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new DetectedActivity(i3, i2, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public DetectedActivity[] newArray(int size) {
        return new DetectedActivity[size];
    }
}
