package com.google.android.gms.drive.internal;

import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public final class g extends Metadata {
    private final MetadataBundle qN;

    public g(MetadataBundle metadataBundle) {
        this.qN = metadataBundle;
    }

    @Override // com.google.android.gms.drive.Metadata
    protected <T> T a(MetadataField<T> metadataField) {
        return (T) this.qN.a(metadataField);
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: cK */
    public Metadata mo358freeze() {
        return new g(MetadataBundle.a(this.qN));
    }

    @Override // com.google.android.gms.common.data.Freezable
    public boolean isDataValid() {
        return this.qN != null;
    }

    public String toString() {
        return "Metadata [mImpl=" + this.qN + "]";
    }
}
