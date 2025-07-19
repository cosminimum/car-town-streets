package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.DriveId;

/* renamed from: com.google.android.gms.drive.internal.x */
public class C0746x implements Parcelable.Creator<OpenFileIntentSenderRequest> {
    /* renamed from: a */
    static void m1594a(OpenFileIntentSenderRequest openFileIntentSenderRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, openFileIntentSenderRequest.f1487kg);
        C0677b.m1401a(parcel, 2, openFileIntentSenderRequest.f1488qL, false);
        C0677b.m1408a(parcel, 3, openFileIntentSenderRequest.f1490qW, false);
        C0677b.m1399a(parcel, 4, (Parcelable) openFileIntentSenderRequest.f1489qM, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: M */
    public OpenFileIntentSenderRequest createFromParcel(Parcel parcel) {
        DriveId driveId = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String[] strArr = null;
        String str = null;
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
                    strArr = C0675a.m1386x(parcel, m);
                    break;
                case 4:
                    driveId = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new OpenFileIntentSenderRequest(i, str, strArr, driveId);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: am */
    public OpenFileIntentSenderRequest[] newArray(int i) {
        return new OpenFileIntentSenderRequest[i];
    }
}
