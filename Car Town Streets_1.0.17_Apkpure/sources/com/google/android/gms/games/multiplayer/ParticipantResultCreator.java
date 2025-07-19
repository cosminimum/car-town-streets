package com.google.android.gms.games.multiplayer;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.a;
/* loaded from: classes.dex */
public class ParticipantResultCreator implements Parcelable.Creator<ParticipantResult> {
    public static final int CONTENT_DESCRIPTION = 0;

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void a(ParticipantResult participantResult, Parcel parcel, int i) {
        int o = com.google.android.gms.common.internal.safeparcel.b.o(parcel);
        com.google.android.gms.common.internal.safeparcel.b.a(parcel, 1, participantResult.getParticipantId(), false);
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 1000, participantResult.getVersionCode());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 2, participantResult.getResult());
        com.google.android.gms.common.internal.safeparcel.b.c(parcel, 3, participantResult.getPlacing());
        com.google.android.gms.common.internal.safeparcel.b.D(parcel, o);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: createFromParcel */
    public ParticipantResult mo349createFromParcel(Parcel parcel) {
        int i = 0;
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        String str = null;
        int i2 = 0;
        int i3 = 0;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            switch (com.google.android.gms.common.internal.safeparcel.a.M(m)) {
                case 1:
                    str = com.google.android.gms.common.internal.safeparcel.a.m(parcel, m);
                    break;
                case 2:
                    i2 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 3:
                    i = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                case 1000:
                    i3 = com.google.android.gms.common.internal.safeparcel.a.g(parcel, m);
                    break;
                default:
                    com.google.android.gms.common.internal.safeparcel.a.b(parcel, m);
                    break;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        return new ParticipantResult(i3, str, i2, i);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // android.os.Parcelable.Creator
    /* renamed from: newArray */
    public ParticipantResult[] mo350newArray(int size) {
        return new ParticipantResult[size];
    }
}
