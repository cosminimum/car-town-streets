package com.google.android.gms.plus.model.people;

import com.google.android.gms.common.data.C0664c;
import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1407ig;
import com.google.android.gms.internal.C1428ir;

public final class PersonBuffer extends DataBuffer<Person> {

    /* renamed from: FZ */
    private final C0664c<C1407ig> f3812FZ;

    public PersonBuffer(DataHolder dataHolder) {
        super(dataHolder);
        if (dataHolder.getMetadata() == null || !dataHolder.getMetadata().getBoolean("com.google.android.gms.plus.IsSafeParcelable", false)) {
            this.f3812FZ = null;
        } else {
            this.f3812FZ = new C0664c<>(dataHolder, C1407ig.CREATOR);
        }
    }

    public Person get(int position) {
        return this.f3812FZ != null ? this.f3812FZ.get(position) : new C1428ir(this.f1366nE, position);
    }
}
