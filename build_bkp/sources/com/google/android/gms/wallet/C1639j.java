package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.wallet.j */
public class C1639j implements Parcelable.Creator<NotifyTransactionStatusRequest> {
    /* renamed from: a */
    static void m4367a(NotifyTransactionStatusRequest notifyTransactionStatusRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, notifyTransactionStatusRequest.f3886kg);
        C0677b.m1401a(parcel, 2, notifyTransactionStatusRequest.f3885Gn, false);
        C0677b.m1412c(parcel, 3, notifyTransactionStatusRequest.status);
        C0677b.m1401a(parcel, 4, notifyTransactionStatusRequest.f3884GV, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: aN */
    public NotifyTransactionStatusRequest createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    str = C0675a.m1374m(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new NotifyTransactionStatusRequest(i2, str2, i, str);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: bF */
    public NotifyTransactionStatusRequest[] newArray(int i) {
        return new NotifyTransactionStatusRequest[i];
    }
}
