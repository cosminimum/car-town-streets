package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1294gd;

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

    /* renamed from: kg */
    private final int f1825kg;

    /* renamed from: up */
    private final String f1826up;

    /* renamed from: wy */
    private final int f1827wy;

    /* renamed from: wz */
    private final int f1828wz;

    public ParticipantResult(int versionCode, String participantId, int result, int placing) {
        this.f1825kg = versionCode;
        this.f1826up = (String) C1102eg.m2616f(participantId);
        C1102eg.m2617p(C1294gd.isValid(result));
        this.f1827wy = result;
        this.f1828wz = placing;
    }

    public ParticipantResult(String participantId, int result, int placing) {
        this(1, participantId, result, placing);
    }

    public int describeContents() {
        return 0;
    }

    public String getParticipantId() {
        return this.f1826up;
    }

    public int getPlacing() {
        return this.f1828wz;
    }

    public int getResult() {
        return this.f1827wy;
    }

    public int getVersionCode() {
        return this.f1825kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        ParticipantResultCreator.m1850a(this, out, flags);
    }
}
