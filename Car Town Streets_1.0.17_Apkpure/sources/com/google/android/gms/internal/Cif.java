package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;
/* renamed from: com.google.android.gms.internal.if  reason: invalid class name */
/* loaded from: classes.dex */
public final class Cif extends com.google.android.gms.common.data.b implements Moment {
    private id Fo;

    public Cif(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    private id fu() {
        synchronized (this) {
            if (this.Fo == null) {
                byte[] byteArray = getByteArray("momentImpl");
                Parcel obtain = Parcel.obtain();
                obtain.unmarshall(byteArray, 0, byteArray.length);
                obtain.setDataPosition(0);
                this.Fo = id.CREATOR.createFromParcel(obtain);
                obtain.recycle();
            }
        }
        return this.Fo;
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: ft */
    public id mo358freeze() {
        return fu();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public String getId() {
        return fu().getId();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public ItemScope getResult() {
        return fu().getResult();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public String getStartDate() {
        return fu().getStartDate();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public ItemScope getTarget() {
        return fu().getTarget();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public String getType() {
        return fu().getType();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasId() {
        return fu().hasId();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasResult() {
        return fu().hasId();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasStartDate() {
        return fu().hasStartDate();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasTarget() {
        return fu().hasTarget();
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasType() {
        return fu().hasType();
    }
}
