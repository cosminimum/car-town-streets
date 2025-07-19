package com.google.android.gms.drive;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.b */
public final class C0682b extends Metadata {

    /* renamed from: qN */
    private final MetadataBundle f1454qN;

    public C0682b(MetadataBundle metadataBundle) {
        this.f1454qN = metadataBundle;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public <T> T mo6085a(MetadataField<T> metadataField) {
        return this.f1454qN.mo6290a(metadataField);
    }

    /* renamed from: cK */
    public Metadata freeze() {
        return new C0682b(MetadataBundle.m1618a(this.f1454qN));
    }

    public boolean isDataValid() {
        return this.f1454qN != null;
    }

    public String toString() {
        return "Metadata [mImpl=" + this.f1454qN + "]";
    }
}
