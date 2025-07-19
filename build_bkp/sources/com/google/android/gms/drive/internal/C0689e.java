package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.internal.e */
public class C0689e implements Parcelable.Creator<CreateFileRequest> {
    /* renamed from: a */
    static void m1456a(CreateFileRequest createFileRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, createFileRequest.f1464kg);
        C0677b.m1399a(parcel, 2, (Parcelable) createFileRequest.f1467ra, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) createFileRequest.f1466qZ, i, false);
        C0677b.m1399a(parcel, 4, (Parcelable) createFileRequest.f1465qX, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: D */
    public CreateFileRequest createFromParcel(Parcel parcel) {
        Contents contents;
        MetadataBundle metadataBundle;
        DriveId driveId;
        int i;
        Contents contents2 = null;
        int n = C0675a.m1375n(parcel);
        int i2 = 0;
        MetadataBundle metadataBundle2 = null;
        DriveId driveId2 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    Contents contents3 = contents2;
                    metadataBundle = metadataBundle2;
                    driveId = driveId2;
                    i = C0675a.m1367g(parcel, m);
                    contents = contents3;
                    break;
                case 2:
                    i = i2;
                    MetadataBundle metadataBundle3 = metadataBundle2;
                    driveId = (DriveId) C0675a.m1356a(parcel, m, DriveId.CREATOR);
                    contents = contents2;
                    metadataBundle = metadataBundle3;
                    break;
                case 3:
                    driveId = driveId2;
                    i = i2;
                    Contents contents4 = contents2;
                    metadataBundle = (MetadataBundle) C0675a.m1356a(parcel, m, MetadataBundle.CREATOR);
                    contents = contents4;
                    break;
                case 4:
                    contents = (Contents) C0675a.m1356a(parcel, m, Contents.CREATOR);
                    metadataBundle = metadataBundle2;
                    driveId = driveId2;
                    i = i2;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    contents = contents2;
                    metadataBundle = metadataBundle2;
                    driveId = driveId2;
                    i = i2;
                    break;
            }
            i2 = i;
            driveId2 = driveId;
            metadataBundle2 = metadataBundle;
            contents2 = contents;
        }
        if (parcel.dataPosition() == n) {
            return new CreateFileRequest(i2, driveId2, metadataBundle2, contents2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ad */
    public CreateFileRequest[] newArray(int i) {
        return new CreateFileRequest[i];
    }
}
