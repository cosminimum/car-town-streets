package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.internal.d */
public class C0688d implements Parcelable.Creator<CreateFileIntentSenderRequest> {
    /* renamed from: a */
    static void m1453a(CreateFileIntentSenderRequest createFileIntentSenderRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, createFileIntentSenderRequest.f1459kg);
        C0677b.m1399a(parcel, 2, (Parcelable) createFileIntentSenderRequest.f1463qZ, i, false);
        C0677b.m1412c(parcel, 3, createFileIntentSenderRequest.f1460qE);
        C0677b.m1401a(parcel, 4, createFileIntentSenderRequest.f1461qL, false);
        C0677b.m1399a(parcel, 5, (Parcelable) createFileIntentSenderRequest.f1462qM, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: C */
    public CreateFileIntentSenderRequest createFromParcel(Parcel parcel) {
        int i = 0;
        DriveId driveId = null;
        int n = C0675a.m1375n(parcel);
        String str = null;
        MetadataBundle metadataBundle = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    metadataBundle = (MetadataBundle) C0675a.m1356a(parcel, m, MetadataBundle.CREATOR);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 4:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 5:
                    driveId = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new CreateFileIntentSenderRequest(i2, metadataBundle, i, str, driveId);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ac */
    public CreateFileIntentSenderRequest[] newArray(int i) {
        return new CreateFileIntentSenderRequest[i];
    }
}
