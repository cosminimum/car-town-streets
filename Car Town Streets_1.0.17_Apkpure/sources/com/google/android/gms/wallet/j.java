package com.google.android.gms.wallet;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class j implements Parcelable.Creator<NotifyTransactionStatusRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(NotifyTransactionStatusRequest notifyTransactionStatusRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, notifyTransactionStatusRequest.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, notifyTransactionStatusRequest.Gn, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, notifyTransactionStatusRequest.status);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, notifyTransactionStatusRequest.GV, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aN */
    public NotifyTransactionStatusRequest createFromParcel(Parcel parcel) {
        String str = null;
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str2 = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str2 = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new NotifyTransactionStatusRequest(i2, str2, i, str);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: bF */
    public NotifyTransactionStatusRequest[] newArray(int i) {
        return new NotifyTransactionStatusRequest[i];
    }
}
