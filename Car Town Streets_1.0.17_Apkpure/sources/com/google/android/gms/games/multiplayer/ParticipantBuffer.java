package com.google.android.gms.games.multiplayer;

import com.google.android.gms.common.data.DataBuffer;
/* loaded from: classes.dex */
public final class ParticipantBuffer extends DataBuffer<Participant> {
    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public Participant mo391get(int position) {
        return new d(this.nE, position);
    }
}
