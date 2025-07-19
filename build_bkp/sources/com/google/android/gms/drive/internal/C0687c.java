package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.internal.c */
public class C0687c implements Parcelable.Creator<CreateContentsRequest> {
    /* renamed from: a */
    static void m1450a(CreateContentsRequest createContentsRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, createContentsRequest.f1458kg);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: B */
    public CreateContentsRequest createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CreateContentsRequest(i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ab */
    public CreateContentsRequest[] newArray(int i) {
        return new CreateContentsRequest[i];
    }
}
