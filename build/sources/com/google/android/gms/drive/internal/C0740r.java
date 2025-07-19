package com.google.android.gms.drive.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.drive.Contents;

/* renamed from: com.google.android.gms.drive.internal.r */
public class C0740r implements Parcelable.Creator<OnContentsResponse> {
    /* renamed from: a */
    static void m1576a(OnContentsResponse onContentsResponse, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, onContentsResponse.f1473kg);
        C0677b.m1399a(parcel, 2, (Parcelable) onContentsResponse.f1474qK, i, false);
        C0677b.m1391D(parcel, o);
    }

    /* renamed from: G */
    public OnContentsResponse createFromParcel(Parcel parcel) {
        int n = C0675a.m1375n(parcel);
        int i = 0;
        Contents contents = null;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    contents = (Contents) C0675a.m1356a(parcel, m, Contents.CREATOR);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new OnContentsResponse(i, contents);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    /* renamed from: ag */
    public OnContentsResponse[] newArray(int i) {
        return new OnContentsResponse[i];
    }
}
