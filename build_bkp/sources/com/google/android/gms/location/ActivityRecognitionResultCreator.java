package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import java.util.ArrayList;

public class ActivityRecognitionResultCreator implements Parcelable.Creator<ActivityRecognitionResult> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m4083a(ActivityRecognitionResult activityRecognitionResult, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1411b(parcel, 1, activityRecognitionResult.f3491xm, false);
        C0677b.m1412c(parcel, 1000, activityRecognitionResult.getVersionCode());
        C0677b.m1395a(parcel, 2, activityRecognitionResult.f3492xn);
        C0677b.m1395a(parcel, 3, activityRecognitionResult.f3493xo);
        C0677b.m1391D(parcel, o);
    }

    public ActivityRecognitionResult createFromParcel(Parcel parcel) {
        long j = 0;
        int n = C0675a.m1375n(parcel);
        int i = 0;
        ArrayList arrayList = null;
        long j2 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    arrayList = C0675a.m1362c(parcel, m, DetectedActivity.CREATOR);
                    break;
                case 2:
                    j2 = C0675a.m1368h(parcel, m);
                    break;
                case 3:
                    j = C0675a.m1368h(parcel, m);
                    break;
                case 1000:
                    i = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new ActivityRecognitionResult(i, arrayList, j2, j);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public ActivityRecognitionResult[] newArray(int size) {
        return new ActivityRecognitionResult[size];
    }
}
