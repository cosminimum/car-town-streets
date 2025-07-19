package com.google.android.gms.games.multiplayer;

import com.google.android.gms.common.data.DataHolder;
/* loaded from: classes.dex */
public final class InvitationBuffer extends com.google.android.gms.common.data.d<Invitation> {
    public InvitationBuffer(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.common.data.d
    /* renamed from: getEntry */
    public Invitation a(int rowIndex, int numChildren) {
        return new b(this.nE, rowIndex, numChildren);
    }

    @Override // com.google.android.gms.common.data.d
    protected String getPrimaryDataMarkerColumn() {
        return "external_invitation_id";
    }
}
