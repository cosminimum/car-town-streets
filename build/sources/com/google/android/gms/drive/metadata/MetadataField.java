package com.google.android.gms.drive.metadata;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.C1102eg;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

public abstract class MetadataField<T> {

    /* renamed from: rC */
    private final String f1559rC;

    /* renamed from: rD */
    private final Set<String> f1560rD;

    protected MetadataField(String fieldName) {
        this.f1559rC = (String) C1102eg.m2614b(fieldName, (Object) "fieldName");
        this.f1560rD = Collections.singleton(fieldName);
    }

    protected MetadataField(String fieldName, Collection<String> dataHolderFieldNames) {
        this.f1559rC = (String) C1102eg.m2614b(fieldName, (Object) "fieldName");
        this.f1560rD = Collections.unmodifiableSet(new HashSet(dataHolderFieldNames));
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public abstract void mo6278a(Bundle bundle, T t);

    /* renamed from: a */
    public final void mo6279a(DataHolder dataHolder, MetadataBundle metadataBundle, int i, int i2) {
        C1102eg.m2614b(dataHolder, (Object) "dataHolder");
        C1102eg.m2614b(metadataBundle, (Object) "bundle");
        metadataBundle.mo6291b(this, mo6281c(dataHolder, i, i2));
    }

    /* renamed from: a */
    public final void mo6280a(T t, Bundle bundle) {
        C1102eg.m2614b(bundle, (Object) "bundle");
        if (t == null) {
            bundle.putString(getName(), (String) null);
        } else {
            mo6278a(bundle, t);
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public abstract T mo6277b(DataHolder dataHolder, int i, int i2);

    /* renamed from: c */
    public final T mo6281c(DataHolder dataHolder, int i, int i2) {
        for (String hasNull : this.f1560rD) {
            if (dataHolder.hasNull(hasNull, i, i2)) {
                return null;
            }
        }
        return mo6277b(dataHolder, i, i2);
    }

    /* renamed from: cV */
    public final Collection<String> mo6282cV() {
        return this.f1560rD;
    }

    /* renamed from: d */
    public final T mo6283d(Bundle bundle) {
        C1102eg.m2614b(bundle, (Object) "bundle");
        if (bundle.get(getName()) != null) {
            return mo6284e(bundle);
        }
        return null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: e */
    public abstract T mo6284e(Bundle bundle);

    public final String getName() {
        return this.f1559rC;
    }

    public String toString() {
        return this.f1559rC;
    }
}
