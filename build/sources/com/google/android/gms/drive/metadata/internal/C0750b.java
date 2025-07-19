package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.OrderedMetadataField;
import java.util.Date;

/* renamed from: com.google.android.gms.drive.metadata.internal.b */
public class C0750b extends OrderedMetadataField<Date> {
    public C0750b(String str) {
        super(str);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6278a(Bundle bundle, Date date) {
        bundle.putLong(getName(), date.getTime());
    }

    /* access modifiers changed from: protected */
    /* renamed from: f */
    public Date mo6277b(DataHolder dataHolder, int i, int i2) {
        return new Date(dataHolder.getLong(getName(), i, i2));
    }

    /* access modifiers changed from: protected */
    /* renamed from: h */
    public Date mo6284e(Bundle bundle) {
        return new Date(bundle.getLong(getName()));
    }
}
