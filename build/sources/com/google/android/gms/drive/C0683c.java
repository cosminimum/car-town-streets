package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.c */
public class C0683c implements Parcelable.Creator<DriveId> {
    /* renamed from: a */
    static void m1430a(DriveId driveId, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, driveId.f1439kg);
        C0677b.m1401a(parcel, 2, driveId.f1440qO, false);
        C0677b.m1395a(parcel, 3, driveId.f1441qP);
        C0677b.m1395a(parcel, 4, driveId.f1442qQ);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: Z */
    public DriveId[] newArray(int i) {
        return new DriveId[i];
    }

    /* renamed from: z */
    public DriveId createFromParcel(Parcel parcel) {
        long j = 0;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        long j2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 4:
                    j = C0675a.m1368h(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new DriveId(i, str, j2, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
