package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.internal.aa */
public class C0685aa implements Parcelable.Creator<UpdateMetadataRequest> {
    /* renamed from: a */
    static void m1444a(UpdateMetadataRequest updateMetadataRequest, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, updateMetadataRequest.f1493kg);
        C0677b.m1399a(parcel, 2, (Parcelable) updateMetadataRequest.f1495rr, i, false);
        C0677b.m1399a(parcel, 3, (Parcelable) updateMetadataRequest.f1494rB, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: O */
    public UpdateMetadataRequest createFromParcel(Parcel parcel) {
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
            return new UpdateMetadataRequest(i2, driveId2, metadataBundle2);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ao */
    public UpdateMetadataRequest[] newArray(int i) {
        return new UpdateMetadataRequest[i];
    }
}
