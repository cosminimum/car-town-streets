package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.query.Filter;
/* loaded from: classes.dex */
public class NotFilter implements SafeParcelable, Filter {
    public static final Parcelable.Creator<NotFilter> CREATOR = new g();
    final int kg;
    final FilterHolder sc;

    /* JADX INFO: Access modifiers changed from: package-private */
    public NotFilter(int versionCode, FilterHolder toNegate) {
        this.kg = versionCode;
        this.sc = toNegate;
    }

    public NotFilter(Filter toNegate) {
        this(1, new FilterHolder(toNegate));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        g.a(this, out, flags);
    }
}
