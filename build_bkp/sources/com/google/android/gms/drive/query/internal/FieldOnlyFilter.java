package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.query.Filter;

public class FieldOnlyFilter implements SafeParcelable, Filter {
    public static final Parcelable.Creator<FieldOnlyFilter> CREATOR = new C0757b();

    /* renamed from: kg */
    final int f1574kg;

    /* renamed from: rS */
    final MetadataBundle f1575rS;

    /* renamed from: rT */
    private final MetadataField<?> f1576rT;

    FieldOnlyFilter(int versionCode, MetadataBundle value) {
        this.f1574kg = versionCode;
        this.f1575rS = value;
        this.f1576rT = C0759d.m1665b(value);
    }

    public FieldOnlyFilter(MetadataField<?> field) {
        this(1, MetadataBundle.m1617a(field, null));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0757b.m1659a(this, out, flags);
    }
}
