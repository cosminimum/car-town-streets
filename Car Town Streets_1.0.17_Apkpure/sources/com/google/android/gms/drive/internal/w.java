package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.drive.DriveId;
/* loaded from: classes.dex */
public class w implements Parcelable.Creator<OpenContentsRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(OpenContentsRequest openContentsRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, openContentsRequest.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) openContentsRequest.rr, i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, openContentsRequest.qF);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: L */
    public OpenContentsRequest createFromParcel(Parcel parcel) {
        int g;
        DriveId driveId;
        int i;
        int i2 = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        DriveId driveId2 = null;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    int i4 = i2;
                    driveId = driveId2;
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    g = i4;
                    break;
                case 2:
                    DriveId driveId3 = (DriveId) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, DriveId.CREATOR);
                    i = i3;
                    g = i2;
                    driveId = driveId3;
                    break;
                case 3:
                    g = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    driveId = driveId2;
                    i = i3;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    g = i2;
                    driveId = driveId2;
                    i = i3;
                    break;
            }
            i3 = i;
            driveId2 = driveId;
            i2 = g;
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new OpenContentsRequest(i3, driveId2, i2);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: al */
    public OpenContentsRequest[] newArray(int i) {
        return new OpenContentsRequest[i];
    }
}
