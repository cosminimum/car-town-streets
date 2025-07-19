package com.google.android.gms.drive.metadata;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.eg;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class MetadataField<T> {
    private final String rC;
    private final Set<String> rD;

    /* JADX INFO: Access modifiers changed from: protected */
    public MetadataField(String fieldName) {
        this.rC = (String) eg.b(fieldName, "fieldName");
        this.rD = Collections.singleton(fieldName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public MetadataField(String fieldName, Collection<String> dataHolderFieldNames) {
        this.rC = (String) eg.b(fieldName, "fieldName");
        this.rD = Collections.unmodifiableSet(new HashSet(dataHolderFieldNames));
    }

    protected abstract void a(Bundle bundle, T t);

    public final void a(DataHolder dataHolder, MetadataBundle metadataBundle, int i, int i2) {
        eg.b(dataHolder, "dataHolder");
        eg.b(metadataBundle, "bundle");
        metadataBundle.b(this, c(dataHolder, i, i2));
    }

    public final void a(T t, Bundle bundle) {
        eg.b(bundle, "bundle");
        if (t == null) {
            bundle.putString(getName(), null);
        } else {
            a(bundle, (Bundle) t);
        }
    }

    protected abstract T b(DataHolder dataHolder, int i, int i2);

    public final T c(DataHolder dataHolder, int i, int i2) {
        for (String str : this.rD) {
            if (dataHolder.hasNull(str, i, i2)) {
                return null;
            }
        }
        return b(dataHolder, i, i2);
    }

    public final Collection<String> cV() {
        return this.rD;
    }

    public final T d(Bundle bundle) {
        eg.b(bundle, "bundle");
        if (bundle.get(getName()) != null) {
            return e(bundle);
        }
        return null;
    }

    protected abstract T e(Bundle bundle);

    public final String getName() {
        return this.rC;
    }

    public String toString() {
        return this.rC;
    }
}
