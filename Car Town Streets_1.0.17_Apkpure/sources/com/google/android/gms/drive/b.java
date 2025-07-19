package com.google.android.gms.drive;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
/* loaded from: classes.dex */
public final class b extends Metadata {
    private final MetadataBundle qN;

    public b(MetadataBundle metadataBundle) {
        this.qN = metadataBundle;
    }

    @Override // com.google.android.gms.drive.Metadata
    protected <T> T a(MetadataField<T> metadataField) {
        return (T) this.qN.a(metadataField);
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: cK */
    public Metadata mo358freeze() {
        return new b(MetadataBundle.a(this.qN));
    }

    @Override // com.google.android.gms.common.data.Freezable
    public boolean isDataValid() {
        return this.qN != null;
    }

    public String toString() {
        return "Metadata [mImpl=" + this.qN + "]";
    }
}
