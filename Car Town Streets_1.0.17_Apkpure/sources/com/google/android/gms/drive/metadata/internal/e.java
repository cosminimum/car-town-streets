package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.drive.metadata.CollectionMetadataField;
import java.util.ArrayList;
import java.util.Collection;
/* loaded from: classes.dex */
public class e<T extends Parcelable> extends CollectionMetadataField<T> {
    public e(String str) {
        super(str);
    }

    @Override // com.google.android.gms.drive.metadata.MetadataField
    protected /* bridge */ /* synthetic */ void a(Bundle bundle, Object obj) {
        a(bundle, (Collection) ((Collection) obj));
    }

    protected void a(Bundle bundle, Collection<T> collection) {
        bundle.putParcelableArrayList(getName(), new ArrayList<>(collection));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: i */
    public Collection<T> e(Bundle bundle) {
        return bundle.getParcelableArrayList(getName());
    }
}
