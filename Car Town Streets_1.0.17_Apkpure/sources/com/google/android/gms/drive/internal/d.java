package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public class d implements Parcelable.Creator<CreateFileIntentSenderRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(CreateFileIntentSenderRequest createFileIntentSenderRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, createFileIntentSenderRequest.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) createFileIntentSenderRequest.qZ, i, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, createFileIntentSenderRequest.qE);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 4, createFileIntentSenderRequest.qL, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 5, (Parcelable) createFileIntentSenderRequest.qM, i, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: C */
    public CreateFileIntentSenderRequest createFromParcel(Parcel parcel) {
        int i = 0;
        DriveId driveId = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str = null;
        MetadataBundle metadataBundle = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    metadataBundle = (MetadataBundle) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, MetadataBundle.CREATOR);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 4:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
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
        return new CreateFileIntentSenderRequest(i2, metadataBundle, i, str, driveId);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ac */
    public CreateFileIntentSenderRequest[] newArray(int i) {
        return new CreateFileIntentSenderRequest[i];
    }
}
