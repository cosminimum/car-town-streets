package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.query.Filter;
/* loaded from: classes.dex */
public class ComparisonFilter<T> implements SafeParcelable, Filter {
    public static final a CREATOR = new a();
    final int kg;
    final Operator rR;
    final MetadataBundle rS;
    final MetadataField<T> rT;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ComparisonFilter(int versionCode, Operator operator, MetadataBundle value) {
        this.kg = versionCode;
        this.rR = operator;
        this.rS = value;
        this.rT = (MetadataField<T>) d.b(value);
    }

    public ComparisonFilter(Operator operator, MetadataField<T> field, T value) {
        this(1, operator, MetadataBundle.a(field, value));
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        a.a(this, out, flags);
    }
}
