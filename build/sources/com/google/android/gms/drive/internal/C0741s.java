package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.drive.internal.s */
public class C0741s implements Parcelable.Creator<OnDownloadProgressResponse> {
    /* renamed from: a */
    static void m1579a(OnDownloadProgressResponse onDownloadProgressResponse, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, onDownloadProgressResponse.f1475kg);
        C0677b.m1395a(parcel, 2, onDownloadProgressResponse.f1476rx);
        C0677b.m1395a(parcel, 3, onDownloadProgressResponse.f1477ry);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: H */
    public OnDownloadProgressResponse createFromParcel(Parcel parcel) {
        long j = 0;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        long j2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 3:
                    j = C0675a.m1368h(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new OnDownloadProgressResponse(i, j2, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ah */
    public OnDownloadProgressResponse[] newArray(int i) {
        return new OnDownloadProgressResponse[i];
    }
}
