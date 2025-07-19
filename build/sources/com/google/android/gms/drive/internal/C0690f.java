package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.internal.f */
public class C0690f implements Parcelable.Creator<CreateFolderRequest> {
    /* renamed from: a */
    static void m1459a(CreateFolderRequest createFolderRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, createFolderRequest.f1468kg);
        C0677b.m1399a(parcel, 2, (Parcelable) createFolderRequest.f1470ra, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) createFolderRequest.f1469qZ, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: E */
    public CreateFolderRequest createFromParcel(Parcel parcel) {
        MetadataBundle metadataBundle;
        DriveId driveId;
        int i;
        MetadataBundle metadataBundle2 = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        DriveId driveId2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    MetadataBundle metadataBundle3 = metadataBundle2;
                    driveId = driveId2;
                    i = C0675a.m1367g(parcel, m);
                    metadataBundle = metadataBundle3;
                    break;
                case 2:
                    i = i2;
                    DriveId driveId3 = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    metadataBundle = metadataBundle2;
                    driveId = driveId3;
                    break;
                case 3:
                    metadataBundle = (MetadataBundle) C0675a.m1356a(parcel, m, MetadataBundle.CREATOR);
                    driveId = driveId2;
                    i = i2;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    metadataBundle = metadataBundle2;
                    driveId = driveId2;
                    i = i2;
                    break;
            }
            i2 = i;
            driveId2 = driveId;
            metadataBundle2 = metadataBundle;
        }
        if (parcel.dataPosition() == n) {
            return new CreateFolderRequest(i2, driveId2, metadataBundle2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ae */
    public CreateFolderRequest[] newArray(int i) {
        return new CreateFolderRequest[i];
    }
}
