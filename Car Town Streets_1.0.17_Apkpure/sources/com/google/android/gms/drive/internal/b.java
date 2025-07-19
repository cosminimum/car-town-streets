package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.drive.Contents;
/* loaded from: classes.dex */
public class b implements Parcelable.Creator<CloseContentsRequest> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(CloseContentsRequest closeContentsRequest, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1, closeContentsRequest.kg);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, (Parcelable) closeContentsRequest.qX, i, false);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, closeContentsRequest.qY, false);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: A */
    public CloseContentsRequest createFromParcel(Parcel parcel) {
        Boolean d;
        Contents contents;
        int i;
        Boolean bool = null;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i2 = 0;
        Contents contents2 = null;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    Boolean bool2 = bool;
                    contents = contents2;
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    d = bool2;
                    break;
                case 2:
                    Contents contents3 = (Contents) com.google.android.gms.common.internal.safeparcel.a.a(parcel, m, Contents.CREATOR);
                    i = i2;
                    d = bool;
                    contents = contents3;
                    break;
                case 3:
                    d = com.google.android.gms.common.internal.safeparcel.a.d(parcel, m);
                    contents = contents2;
                    i = i2;
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    d = bool;
                    contents = contents2;
                    i = i2;
                    break;
            }
            i2 = i;
            contents2 = contents;
            bool = d;
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new CloseContentsRequest(i2, contents2, bool);
    }

    @Override // android.os.Parcelable.Creator
    /* renamed from: aa */
    public CloseContentsRequest[] newArray(int i) {
        return new CloseContentsRequest[i];
    }
}
