package com.google.android.gms.cast;

import android.net.Uri;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.images.WebImage;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.cast.a */
public class C0643a implements Parcelable.Creator<ApplicationMetadata> {
    /* renamed from: a */
    static void m1217a(ApplicationMetadata applicationMetadata, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, applicationMetadata.getVersionCode());
        C0677b.m1401a(parcel, 2, applicationMetadata.getApplicationId(), false);
        C0677b.m1401a(parcel, 3, applicationMetadata.getName(), false);
        C0677b.m1411b(parcel, 4, applicationMetadata.getImages(), false);
        C0677b.m1402a(parcel, 5, applicationMetadata.f1198kj, false);
        C0677b.m1401a(parcel, 6, applicationMetadata.getSenderAppIdentifier(), false);
        C0677b.m1399a(parcel, 7, (Parcelable) applicationMetadata.mo5664aN(), i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: i */
    public ApplicationMetadata createFromParcel(Parcel parcel) {
        Uri uri = null;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        String str = null;
        ArrayList<String> arrayList = null;
        ArrayList<WebImage> arrayList2 = null;
        String str2 = null;
        String str3 = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str3 = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    str2 = C0675a.m1374m(parcel, m);
                    break;
                case 4:
                    arrayList2 = C0675a.m1362c(parcel, m, WebImage.CREATOR);
                    break;
                case 5:
                    arrayList = C0675a.m1387y(parcel, m);
                    break;
                case 6:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 7:
                    uri = (Uri) C0675a.m1356a(parcel, m, Uri.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new ApplicationMetadata(i, str3, str2, arrayList2, arrayList, str, uri);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: q */
    public ApplicationMetadata[] newArray(int i) {
        return new ApplicationMetadata[i];
    }
}
