package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.CollectionMetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.drive.query.Filter;
import java.util.Collections;

public class InFilter<T> implements SafeParcelable, Filter {
    public static final C0760e CREATOR = new C0760e();

    /* renamed from: kg */
    final int f1584kg;

    /* renamed from: rS */
    final MetadataBundle f1585rS;

    /* renamed from: sa */
    private final CollectionMetadataField<T> f1586sa;

    InFilter(int versionCode, MetadataBundle value) {
        this.f1584kg = versionCode;
        this.f1585rS = value;
        this.f1586sa = (CollectionMetadataField) C0759d.m1665b(value);
    }

    public InFilter(CollectionMetadataField<T> field, T value) {
        this(1, MetadataBundle.m1617a(field, Collections.singleton(value)));
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        C0760e.m1666a(this, out, flags);
    }
}
