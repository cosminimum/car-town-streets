package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.drive.DriveId;
/* loaded from: classes.dex */
public class x implements Parcelable.Creator<OpenFileIntentSenderRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(OpenFileIntentSenderRequest openFileIntentSenderRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, openFileIntentSenderRequest.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, openFileIntentSenderRequest.qL, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, openFileIntentSenderRequest.qW, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, (Parcelable) openFileIntentSenderRequest.qM, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: M */
    public OpenFileIntentSenderRequest createFromParcel(Parcel parcel) {
        DriveId driveId = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        String[] strArr = null;
        String str = null;
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
                    strArr = com.google.android.gms.common.internal.safeparcel.a.x(parcel, m);
                    break;
                case 4:
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
        return new OpenFileIntentSenderRequest(i, str, strArr, driveId);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: am */
    public OpenFileIntentSenderRequest[] newArray(int i) {
        return new OpenFileIntentSenderRequest[i];
    }
}
