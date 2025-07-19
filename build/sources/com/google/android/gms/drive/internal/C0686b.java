package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.Contents;

/* renamed from: com.google.android.gms.drive.internal.b */
public class C0686b implements Parcelable.Creator<CloseContentsRequest> {
    /* renamed from: a */
    static void m1447a(CloseContentsRequest closeContentsRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, closeContentsRequest.f1455kg);
        C0677b.m1399a(parcel, 2, (Parcelable) closeContentsRequest.f1456qX, i, false);
        C0677b.m1400a(parcel, 3, closeContentsRequest.f1457qY, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: A */
    public CloseContentsRequest createFromParcel(Parcel parcel) {
        Boolean d;
        Contents contents;
        int i;
        Boolean bool = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        Contents contents2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    Boolean bool2 = bool;
                    contents = contents2;
                    i = C0675a.m1367g(parcel, m);
                    d = bool2;
                    break;
                case 2:
                    i = i2;
                    Contents contents3 = (Contents) C0675a.m1356a(parcel, m, Contents.CREATOR);
                    d = bool;
                    contents = contents3;
                    break;
                case 3:
                    d = C0675a.m1364d(parcel, m);
                    contents = contents2;
                    i = i2;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    d = bool;
                    contents = contents2;
                    i = i2;
                    break;
            }
            i2 = i;
            contents2 = contents;
            bool = d;
        }
        if (parcel.dataPosition() == n) {
            return new CloseContentsRequest(i2, contents2, bool);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: aa */
    public CloseContentsRequest[] newArray(int i) {
        return new CloseContentsRequest[i];
    }
}
