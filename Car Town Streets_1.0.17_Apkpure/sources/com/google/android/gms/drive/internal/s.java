package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class s implements Parcelable.Creator<OnDownloadProgressResponse> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(OnDownloadProgressResponse onDownloadProgressResponse, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, onDownloadProgressResponse.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, onDownloadProgressResponse.rx);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, onDownloadProgressResponse.ry);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: H */
    public OnDownloadProgressResponse createFromParcel(Parcel parcel) {
        long j = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        long j2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 2:
                    j2 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 3:
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
        return new OnDownloadProgressResponse(i, j2, j);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: ah */
    public OnDownloadProgressResponse[] newArray(int i) {
        return new OnDownloadProgressResponse[i];
    }
}
