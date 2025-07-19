package com.google.android.gms.common.data;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.common.data.c */
public class C0664c<T extends SafeParcelable> extends DataBuffer<T> {

    /* renamed from: nI */
    private static final String[] f1389nI = {"data"};

    /* renamed from: nJ */
    private final Parcelable.Creator<T> f1390nJ;

    public C0664c(DataHolder dataHolder, Parcelable.Creator<T> creator) {
        super(dataHolder);
        this.f1390nJ = creator;
    }

    /* renamed from: B */
    public T get(int i) {
        byte[] byteArray = this.f1366nE.getByteArray("data", i, 0);
        Parcel obtain = Parcel.obtain();
        obtain.unmarshall(byteArray, 0, byteArray.length);
        obtain.setDataPosition(0);
        T t = (SafeParcelable) this.f1390nJ.createFromParcel(obtain);
        obtain.recycle();
        return t;
    }
}
