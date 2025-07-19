package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.query.Filter;

public class FieldOnlyFilter implements SafeParcelable, Filter {
    public static final Parcelable.Creator<FieldOnlyFilter> CREATOR = new b();
    final int kg;
    final MetadataBundle rS;
    private final MetadataField<?> rT;

    FieldOnlyFilter(int versionCode, MetadataBundle value) {
        this.kg = versionCode;
        this.rS = value;
        this.rT = d.b(value);
    }

    public FieldOnlyFilter(MetadataField<?> field) {
        this(1, MetadataBundle.a(field, null));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        b.a(this, out, flags);
    }
}
