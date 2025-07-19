package com.google.android.gms.games.multiplayer.realtime;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.C1102eg;

public final class RealTimeMessage implements Parcelable {
    public static final Parcelable.Creator<RealTimeMessage> CREATOR = new Parcelable.Creator<RealTimeMessage>() {
        /* renamed from: aK */
        public RealTimeMessage[] newArray(int i) {
            return new RealTimeMessage[i];
        }

        /* renamed from: ac */
        public RealTimeMessage createFromParcel(Parcel parcel) {
            return new RealTimeMessage(parcel);
        }
    };
    public static final int RELIABLE = 1;
    public static final int UNRELIABLE = 0;

    /* renamed from: wA */
    private final String f1833wA;

    /* renamed from: wB */
    private final byte[] f1834wB;

    /* renamed from: wC */
    private final int f1835wC;

    private RealTimeMessage(Parcel parcel) {
        this(parcel.readString(), parcel.createByteArray(), parcel.readInt());
    }

    public RealTimeMessage(String senderParticipantId, byte[] messageData, int isReliable) {
        this.f1833wA = (String) C1102eg.m2616f(senderParticipantId);
        this.f1834wB = (byte[]) ((byte[]) C1102eg.m2616f(messageData)).clone();
        this.f1835wC = isReliable;
    }

    public int describeContents() {
        return 0;
    }

    public byte[] getMessageData() {
        return this.f1834wB;
    }

    public String getSenderParticipantId() {
        return this.f1833wA;
    }

    public boolean isReliable() {
        return this.f1835wC == 1;
    }

    public void writeToParcel(Parcel parcel, int flag) {
        parcel.writeString(this.f1833wA);
        parcel.writeByteArray(this.f1834wB);
        parcel.writeInt(this.f1835wC);
    }
}
