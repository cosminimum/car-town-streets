package com.google.android.gms.games;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class PlayerBuffer extends DataBuffer<Player> {
    public PlayerBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public Player mo391get(int position) {
        return new d(this.nE, position);
    }
}
