package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.a */
public class C0681a implements Parcelable.Creator<Contents> {
    /* renamed from: a */
    static void m1425a(Contents contents, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, contents.f1427kg);
        C0677b.m1399a(parcel, 2, (Parcelable) contents.f1428om, i, false);
        C0677b.m1412c(parcel, 3, contents.f1429qE);
        C0677b.m1412c(parcel, 4, contents.f1430qF);
        C0677b.m1399a(parcel, 5, (Parcelable) contents.f1431qG, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: Y */
    public Contents[] newArray(int i) {
        return new Contents[i];
    }

    /* renamed from: y */
    public Contents createFromParcel(Parcel parcel) {
        DriveId driveId = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        ParcelFileDescriptor parcelFileDescriptor = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    parcelFileDescriptor = (ParcelFileDescriptor) C0675a.m1356a(parcel, m, ParcelFileDescriptor.CREATOR);
                    break;
                case 3:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 5:
                    driveId = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new Contents(i3, parcelFileDescriptor, i2, i, driveId);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
