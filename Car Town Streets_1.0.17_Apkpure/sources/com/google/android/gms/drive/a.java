package com.google.android.gms.drive;

import android.os.Parcel;
import android.os.ParcelFileDescriptor;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class a implements Parcelable.Creator<Contents> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(Contents contents, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, contents.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) contents.om, i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, contents.qE);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 4, contents.qF);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, (Parcelable) contents.qG, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: Y */
    public Contents[] newArray(int i) {
        return new Contents[i];
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: y */
    public Contents createFromParcel(Parcel parcel) {
        DriveId driveId = null;
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        ParcelFileDescriptor parcelFileDescriptor = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    parcelFileDescriptor = (ParcelFileDescriptor) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, ParcelFileDescriptor.CREATOR);
                    break;
                case 3:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 5:
                    driveId = (DriveId) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, DriveId.CREATOR);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new Contents(i3, parcelFileDescriptor, i2, i, driveId);
    }
}
