package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;

public class ParticipantResultCreator implements Parcelable.Creator<ParticipantResult> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* renamed from: a */
    static void m1850a(ParticipantResult participantResult, Parcel parcel, int i) {
        int o = C0677b.m1414o(parcel);
        C0677b.m1401a(parcel, 1, participantResult.getParticipantId(), false);
        C0677b.m1412c(parcel, 1000, participantResult.getVersionCode());
        C0677b.m1412c(parcel, 2, participantResult.getResult());
        C0677b.m1412c(parcel, 3, participantResult.getPlacing());
        C0677b.m1391D(parcel, o);
    }

    public ParticipantResult createFromParcel(Parcel parcel) {
        int i = 0;
        int n = C0675a.m1375n(parcel);
        String str = null;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            switch (C0675a.m1354M(m)) {
                case 1:
                    str = C0675a.m1374m(parcel, m);
                    break;
                case 2:
                    i2 = C0675a.m1367g(parcel, m);
                    break;
                case 3:
                    i = C0675a.m1367g(parcel, m);
                    break;
                case 1000:
                    i3 = C0675a.m1367g(parcel, m);
                    break;
                default:
                    C0675a.m1360b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() == n) {
            return new ParticipantResult(i3, str, i2, i);
        }
        throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
    }

    public ParticipantResult[] newArray(int size) {
        return new ParticipantResult[size];
    }
}
