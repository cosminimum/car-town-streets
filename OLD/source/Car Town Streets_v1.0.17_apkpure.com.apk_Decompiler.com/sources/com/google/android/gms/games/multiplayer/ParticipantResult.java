package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.gd;

public final class ParticipantResult implements SafeParcelable {
    public static final ParticipantResultCreator CREATOR = new ParticipantResultCreator();
    public static final int MATCH_RESULT_DISAGREED = 5;
    public static final int MATCH_RESULT_DISCONNECT = 4;
    public static final int MATCH_RESULT_LOSS = 1;
    public static final int MATCH_RESULT_NONE = 3;
    public static final int MATCH_RESULT_TIE = 2;
    public static final int MATCH_RESULT_UNINITIALIZED = -1;
    public static final int MATCH_RESULT_WIN = 0;
    public static final int PLACING_UNINITIALIZED = -1;
    private final int kg;
    private final String up;
    private final int wy;
    private final int wz;

    public ParticipantResult(int versionCode, String participantId, int result, int placing) {
        this.kg = versionCode;
        this.up = (String) eg.f(participantId);
        eg.p(gd.isValid(result));
        this.wy = result;
        this.wz = placing;
    }

    public ParticipantResult(String participantId, int result, int placing) {
        this(1, participantId, result, placing);
    }

    public int describeContents() {
        return 0;
    }

    public String getParticipantId() {
        return this.up;
    }

    public int getPlacing() {
        return this.wz;
    }

    public int getResult() {
        return this.wy;
    }

    public int getVersionCode() {
        return this.kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        ParticipantResultCreator.a(this, out, flags);
    }
}
