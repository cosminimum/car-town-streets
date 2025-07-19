package com.google.android.gms.drive.internal;

import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;

/* renamed from: com.google.android.gms.drive.internal.g */
public final class C0691g extends Metadata {

    /* renamed from: qN */
    private final MetadataBundle f1496qN;

    public C0691g(MetadataBundle metadataBundle) {
        this.f1496qN = metadataBundle;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public <T> T mo6085a(MetadataField<T> metadataField) {
        return this.f1496qN.mo6290a(metadataField);
    }

    /* renamed from: cK */
    public Metadata freeze() {
        return new C0691g(MetadataBundle.m1618a(this.f1496qN));
    }

    public boolean isDataValid() {
        return this.f1496qN != null;
    }

    public String toString() {
        return "Metadata [mImpl=" + this.f1496qN + "]";
    }
}
