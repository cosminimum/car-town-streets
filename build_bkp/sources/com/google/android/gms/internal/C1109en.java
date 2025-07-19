package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;

/* renamed from: com.google.android.gms.internal.en */
public class C1109en implements SafeParcelable {
    public static final C1110eo CREATOR = new C1110eo();

    /* renamed from: kg */
    private final int f2642kg;

    /* renamed from: qc */
    private final C1111ep f2643qc;

    C1109en(int i, C1111ep epVar) {
        this.f2642kg = i;
        this.f2643qc = epVar;
    }

    private C1109en(C1111ep epVar) {
        this.f2642kg = 1;
        this.f2643qc = epVar;
    }

    /* renamed from: a */
    public static C1109en m2639a(C1115es.C1117b<?, ?> bVar) {
        if (bVar instanceof C1111ep) {
            return new C1109en((C1111ep) bVar);
        }
        throw new IllegalArgumentException("Unsupported safe parcelable field converter class.");
    }

    /* access modifiers changed from: package-private */
    /* renamed from: ce */
    public C1111ep mo7569ce() {
        return this.f2643qc;
    }

    /* renamed from: cf */
    public C1115es.C1117b<?, ?> mo7570cf() {
        if (this.f2643qc != null) {
            return this.f2643qc;
        }
        throw new IllegalStateException("There was no converter wrapped in this ConverterWrapper.");
    }

    public int describeContents() {
        C1110eo eoVar = CREATOR;
        return 0;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f2642kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1110eo eoVar = CREATOR;
        C1110eo.m2642a(this, out, flags);
    }
}
