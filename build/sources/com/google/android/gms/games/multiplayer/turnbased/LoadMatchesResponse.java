package com.google.android.gms.games.multiplayer.turnbased;

import android.os.Bundle;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.games.multiplayer.InvitationBuffer;
import com.google.android.gms.internal.C1296gf;

public final class LoadMatchesResponse {

    /* renamed from: wO */
    private final InvitationBuffer f1863wO;

    /* renamed from: wP */
    private final TurnBasedMatchBuffer f1864wP;

    /* renamed from: wQ */
    private final TurnBasedMatchBuffer f1865wQ;

    /* renamed from: wR */
    private final TurnBasedMatchBuffer f1866wR;

    public LoadMatchesResponse(Bundle matchData) {
        DataHolder a = m1877a(matchData, 0);
        if (a != null) {
            this.f1863wO = new InvitationBuffer(a);
        } else {
            this.f1863wO = null;
        }
        DataHolder a2 = m1877a(matchData, 1);
        if (a2 != null) {
            this.f1864wP = new TurnBasedMatchBuffer(a2);
        } else {
            this.f1864wP = null;
        }
        DataHolder a3 = m1877a(matchData, 2);
        if (a3 != null) {
            this.f1865wQ = new TurnBasedMatchBuffer(a3);
        } else {
            this.f1865wQ = null;
        }
        DataHolder a4 = m1877a(matchData, 3);
        if (a4 != null) {
            this.f1866wR = new TurnBasedMatchBuffer(a4);
        } else {
            this.f1866wR = null;
        }
    }

    /* renamed from: a */
    private static DataHolder m1877a(Bundle bundle, int i) {
        String aG = C1296gf.m3417aG(i);
        if (!bundle.containsKey(aG)) {
            return null;
        }
        return (DataHolder) bundle.getParcelable(aG);
    }

    public void close() {
        if (this.f1863wO != null) {
            this.f1863wO.close();
        }
        if (this.f1864wP != null) {
            this.f1864wP.close();
        }
        if (this.f1865wQ != null) {
            this.f1865wQ.close();
        }
        if (this.f1866wR != null) {
            this.f1866wR.close();
        }
    }

    public TurnBasedMatchBuffer getCompletedMatches() {
        return this.f1866wR;
    }

    public InvitationBuffer getInvitations() {
        return this.f1863wO;
    }

    public TurnBasedMatchBuffer getMyTurnMatches() {
        return this.f1864wP;
    }

    public TurnBasedMatchBuffer getTheirTurnMatches() {
        return this.f1865wQ;
    }
}
