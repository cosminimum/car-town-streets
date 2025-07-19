package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class c implements Parcelable.Creator<DriveId> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(DriveId driveId, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, driveId.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, driveId.qO, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, driveId.qP);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, driveId.qQ);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: Z */
    public DriveId[] newArray(int i) {
        return new DriveId[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: z */
    public DriveId createFromParcel(Parcel parcel) {
        long j = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String str = null;
        long j2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 3:
                    j2 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 4:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new DriveId(i, str, j2, j);
    }
}
