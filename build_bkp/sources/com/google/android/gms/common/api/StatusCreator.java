package com.google.android.gms.common.api;

import android.app.PendingIntent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class StatusCreator implements Parcelable.Creator<Status> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m1279a(Status status, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1412c(parcel, 1, status.getStatusCode());
        C0677b.m1412c(parcel, 1000, status.getVersionCode());
        C0677b.m1401a(parcel, 2, status.mo5907bt(), false);
        C0677b.m1399a(parcel, 3, (Parcelable) status.mo5906bs(), i, false);
        C0677b.m1391D(parcel, o);
    }

    public Status createFromParcel(Parcel parcel) {
        PendingIntent pendingIntent = null;
        int i = 0;
        int n = C0675a.m1375n(parcel);
        String str = null;
        int i2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 2:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 3:
                    pendingIntent = (PendingIntent) C0675a.m1356a(parcel, m, PendingIntent.CREATOR);
                    break;
                case 1000:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new Status(i2, i, str, pendingIntent);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public Status[] newArray(int size) {
        return new Status[size];
    }
}
