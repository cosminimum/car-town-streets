package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;

/* renamed from: com.google.android.gms.internal.if */
public final class C1406if extends C0663b implements Moment {

    /* renamed from: Fo */
    private C1404id f3334Fo;

    public C1406if(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    /* renamed from: fu */
    private C1404id m3785fu() {
        synchronized (this) {
            if (this.f3334Fo == null) {
                byte[] byteArray = getByteArray("momentImpl");
                Parcel obtain = Parcel.obtain();
                obtain.unmarshall(byteArray, 0, byteArray.length);
                obtain.setDataPosition(0);
                this.f3334Fo = C1404id.CREATOR.createFromParcel(obtain);
                obtain.recycle();
            }
        }
        return this.f3334Fo;
    }

    /* renamed from: ft */
    public C1404id freeze() {
        return m3785fu();
    }

    public String getId() {
        return m3785fu().getId();
    }

    public ItemScope getResult() {
        return m3785fu().getResult();
    }

    public String getStartDate() {
        return m3785fu().getStartDate();
    }

    public ItemScope getTarget() {
        return m3785fu().getTarget();
    }

    public String getType() {
        return m3785fu().getType();
    }

    public boolean hasId() {
        return m3785fu().hasId();
    }

    public boolean hasResult() {
        return m3785fu().hasId();
    }

    public boolean hasStartDate() {
        return m3785fu().hasStartDate();
    }

    public boolean hasTarget() {
        return m3785fu().hasTarget();
    }

    public boolean hasType() {
        return m3785fu().hasType();
    }
}
