package com.google.android.gms.plus.model.moments;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.Cif;
/* loaded from: classes.dex */
public final class MomentBuffer extends DataBuffer<Moment> {
    public MomentBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public Moment mo391get(int position) {
        return new Cif(this.nE, position);
    }
}
