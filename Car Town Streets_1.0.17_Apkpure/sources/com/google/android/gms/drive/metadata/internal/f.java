package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import java.util.Collection;
/* loaded from: classes.dex */
public abstract class f<T extends Parcelable> extends MetadataField<T> {
    public f(String str, Collection<String> collection) {
        super(str, collection);
    }

    protected void a(Bundle bundle, T t) {
        bundle.putParcelable(getName(), t);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    protected /* bridge */ /* synthetic */ void a(Bundle bundle, Object obj) {
        a(bundle, (Bundle) obj);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: j */
    public T e(Bundle bundle) {
        return (T) bundle.getParcelable(getName());
    }
}
