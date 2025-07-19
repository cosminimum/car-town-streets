package com.google.android.gms.drive.metadata;

import java.lang.Comparable;
import java.util.Collection;
/* loaded from: classes.dex */
public abstract class OrderedMetadataField<T extends Comparable<T>> extends MetadataField<T> {
    /* JADX INFO: Access modifiers changed from: protected */
    public OrderedMetadataField(String fieldName) {
        super(fieldName);
    }

    protected OrderedMetadataField(String fieldName, Collection<String> dataHolderFieldNames) {
        super(fieldName, dataHolderFieldNames);
    }
}
