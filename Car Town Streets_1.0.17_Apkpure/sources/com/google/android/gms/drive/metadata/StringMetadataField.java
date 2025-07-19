package com.google.android.gms.drive.metadata;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class StringMetadataField extends MetadataField<String> {
    public StringMetadataField(String fieldName) {
        super(fieldName);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    public void a(Bundle bundle, String str) {
        bundle.putString(getName(), str);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: d */
    public String b(DataHolder dataHolder, int i, int i2) {
        return dataHolder.getString(getName(), i, i2);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: f */
    public String e(Bundle bundle) {
        return bundle.getString(getName());
    }
}
