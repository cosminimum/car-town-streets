package com.google.android.gms.common.images;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

/* renamed from: com.google.android.gms.common.images.b */
public class C0674b implements Parcelable.Creator<WebImage> {
    /* renamed from: a */
    static void m1350a(WebImage webImage, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, webImage.getVersionCode());
        C0677b.m1399a(parcel, 2, (Parcelable) webImage.getUrl(), i, false);
        C0677b.m1412c(parcel, 3, webImage.getWidth());
        C0677b.m1412c(parcel, 4, webImage.getHeight());
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: G */
    public WebImage[] newArray(int i) {
        return new WebImage[i];
    }

    /* renamed from: k */
    public WebImage createFromParcel(Parcel parcel) {
        int g;
        int i;
        Uri uri;
        int i2;
        int i3 = 0;
        int n = C0675a.m1375n(parcel);
        Uri uri2 = null;
        int i4 = 0;
        int i5 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    int i6 = i3;
                    i = i4;
                    uri = uri2;
                    i2 = C0675a.m1367g(parcel, m);
                    g = i6;
                    break;
                case 2:
                    i2 = i5;
                    int i7 = i4;
                    uri = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    g = i3;
                    i = i7;
                    break;
                case 3:
                    uri = uri2;
                    i2 = i5;
                    int i8 = i3;
                    i = C0675a.m1367g(parcel, m);
                    g = i8;
                    break;
                case 4:
                    g = C0675a.m1367g(parcel, m);
                    i = i4;
                    uri = uri2;
                    i2 = i5;
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    g = i3;
                    i = i4;
                    uri = uri2;
                    i2 = i5;
                    break;
            }
            i5 = i2;
            uri2 = uri;
            i4 = i;
            i3 = g;
        }
        if (parcel.dataPosition() == n) {
            return new WebImage(i5, uri2, i4, i3);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }
}
