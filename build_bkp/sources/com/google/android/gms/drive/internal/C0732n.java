package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.DriveId;

/* renamed from: com.google.android.gms.drive.internal.n */
public class C0732n implements Parcelable.Creator<GetMetadataRequest> {
    /* renamed from: a */
    static void m1532a(GetMetadataRequest getMetadataRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, getMetadataRequest.f1471kg);
        C0677b.m1399a(parcel, 2, (Parcelable) getMetadataRequest.f1472rr, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: F */
    public GetMetadataRequest createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        DriveId driveId = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    driveId = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new GetMetadataRequest(i, driveId);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: af */
    public GetMetadataRequest[] newArray(int i) {
        return new GetMetadataRequest[i];
    }
}
