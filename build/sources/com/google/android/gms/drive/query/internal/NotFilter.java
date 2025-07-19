package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Filter;

public class NotFilter implements SafeParcelable, Filter {
    public static final Parcelable.Creator<NotFilter> CREATOR = new C0762g();

    /* renamed from: kg */
    final int f1591kg;

    /* renamed from: sc */
    final FilterHolder f1592sc;

    NotFilter(int versionCode, FilterHolder toNegate) {
        this.f1591kg = versionCode;
        this.f1592sc = toNegate;
    }

    public NotFilter(Filter toNegate) {
        this(1, new FilterHolder(toNegate));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0762g.m1672a(this, out, flags);
    }
}
