package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.drive.metadata.CollectionMetadataField;
import java.util.ArrayList;
import java.util.Collection;

/* renamed from: com.google.android.gms.drive.metadata.internal.e */
public class C0753e<T extends Parcelable> extends CollectionMetadataField<T> {
    public C0753e(String str) {
        super(str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6278a(Bundle bundle, Collection<T> collection) {
        bundle.putParcelableArrayList(getName(), new ArrayList(collection));
    }

    /* access modifiers changed from: protected */
    /* renamed from: i */
    public Collection<T> mo6284e(Bundle bundle) {
        return bundle.getParcelableArrayList(getName());
    }
}
