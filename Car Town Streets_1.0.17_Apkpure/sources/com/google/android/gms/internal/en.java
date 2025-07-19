package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.es;
/* loaded from: classes.dex */
public class en implements SafeParcelable {
    public static final eo CREATOR = new eo();
    private final int kg;
    private final ep qc;

    /* JADX INFO: Access modifiers changed from: package-private */
    public en(int i, ep epVar) {
        this.kg = i;
        this.qc = epVar;
    }

    private en(ep epVar) {
        this.kg = 1;
        this.qc = epVar;
    }

    public static en a(es.b<?, ?> bVar) {
        if (bVar instanceof ep) {
            return new en((ep) bVar);
        }
        throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ep ce() {
        return this.qc;
    }

    public es.b<?, ?> cf() {
        if (this.qc != null) {
            return this.qc;
        }
        throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        eo eoVar = CREATOR;
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        eo eoVar = CREATOR;
        eo.a(this, out, flags);
    }
}
