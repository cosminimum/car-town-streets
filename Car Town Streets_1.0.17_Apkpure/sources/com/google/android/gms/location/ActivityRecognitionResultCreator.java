package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class ActivityRecognitionResultCreator implements Parcelable.Creator<ActivityRecognitionResult> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ActivityRecognitionResult activityRecognitionResult, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.b(parcel, 1, activityRecognitionResult.xm, false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, activityRecognitionResult.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 2, activityRecognitionResult.xn);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 3, activityRecognitionResult.xo);
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public ActivityRecognitionResult mo360createFromParcel(Parcel parcel) {
        long j = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        int i = 0;
        ArrayList arrayList = null;
        long j2 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    arrayList = com.google.android.gms.common.internal.safeparcel.a.c(parcel, m, DetectedActivity.CREATOR);
                    break;
                case 2:
                    j2 = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 3:
                    j = com.google.android.gms.common.internal.safeparcel.a.h(parcel, m);
                    break;
                case 1000:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ActivityRecognitionResult(i, arrayList, j2, j);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public ActivityRecognitionResult[] mo361newArray(int size) {
        return new ActivityRecognitionResult[size];
    }
}
