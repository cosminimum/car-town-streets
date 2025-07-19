package com.google.android.gms.drive.metadata;

import com.google.android.gms.common.data.DataHolder;
import java.util.Collection;
/* loaded from: classes.dex */
public abstract class CollectionMetadataField<T> extends MetadataField<Collection<T>> {
    /* JADX INFO: Access modifiers changed from: protected */
    public CollectionMetadataField(String fieldName) {
        super(fieldName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: a */
    public Collection<T> b(DataHolder dataHolder, int i, int i2) {
        throw new UnsupportedOperationException("Cannot read collections from a dataHolder.");
    }
}
