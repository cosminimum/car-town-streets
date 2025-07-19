package com.google.android.gms.drive.metadata;

import java.lang.Comparable;
import java.util.Collection;

public abstract class OrderedMetadataField<T extends Comparable<T>> extends MetadataField<T> {
    protected OrderedMetadataField(String fieldName) {
        super(fieldName);
    }

    protected OrderedMetadataField(String fieldName, Collection<String> dataHolderFieldNames) {
        super(fieldName, dataHolderFieldNames);
    }
}
