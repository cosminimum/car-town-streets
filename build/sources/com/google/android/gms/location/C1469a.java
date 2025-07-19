package com.google.android.gms.location;

import android.app.PendingIntent;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.location.a */
public class C1469a implements SafeParcelable {
    public static final C1470b CREATOR = new C1470b();

    /* renamed from: kg */
    private final int f3514kg;

    /* renamed from: xr */
    private final PendingIntent f3515xr;

    public C1469a(int i, PendingIntent pendingIntent) {
        this.f3514kg = i;
        this.f3515xr = pendingIntent;
    }

    /* renamed from: dB */
    public PendingIntent mo8906dB() {
        return this.f3515xr;
    }

    public int describeContents() {
        C1470b bVar = CREATOR;
        return 0;
    }

    public int getVersionCode() {
        return this.f3514kg;
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1470b bVar = CREATOR;
        C1470b.m4093a(this, dest, flags);
    }
}
