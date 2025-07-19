package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.MetadataField;
/* loaded from: classes.dex */
public class a extends MetadataField<Boolean> {
    public a(String str) {
        super(str);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    public void a(Bundle bundle, Boolean bool) {
        bundle.putBoolean(getName(), bool.booleanValue());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: e */
    public Boolean b(DataHolder dataHolder, int i, int i2) {
        return Boolean.valueOf(dataHolder.getBoolean(getName(), i, i2));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: g */
    public Boolean e(Bundle bundle) {
        return Boolean.valueOf(bundle.getBoolean(getName()));
    }
}
