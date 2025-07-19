package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.DriveId;

/* renamed from: com.google.android.gms.drive.internal.w */
public class C0745w implements Parcelable.Creator<OpenContentsRequest> {
    /* renamed from: a */
    static void m1591a(OpenContentsRequest openContentsRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, openContentsRequest.f1484kg);
        C0677b.m1399a(parcel, 2, (Parcelable) openContentsRequest.f1486rr, i, false);
        C0677b.m1412c(parcel, 3, openContentsRequest.f1485qF);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: L */
    public OpenContentsRequest createFromParcel(Parcel parcel) {
        int g;
        DriveId driveId;
        int i;
        int i2 = 0;
        int n = C0675a.m1375n(parcel);
        DriveId driveId2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    int i4 = i2;
                    driveId = driveId2;
                    i = C0675a.m1367g(parcel, m);
                    g = i4;
                    break;
                case 2:
                    i = i3;
                    DriveId driveId3 = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    g = i2;
                    driveId = driveId3;
                    break;
                case 3:
                    g = C0675a.m1367g(parcel, m);
                    driveId = driveId2;
                    i = i3;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    g = i2;
                    driveId = driveId2;
                    i = i3;
                    break;
            }
            i3 = i;
            driveId2 = driveId;
            i2 = g;
        }
        if (parcel.dataPosition() == n) {
            return new OpenContentsRequest(i3, driveId2, i2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: al */
    public OpenContentsRequest[] newArray(int i) {
        return new OpenContentsRequest[i];
    }
}
