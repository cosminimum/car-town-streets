package com.google.android.gms.games.multiplayer.realtime;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.internal.eg;
/* loaded from: classes.dex */
public final class RealTimeMessage implements Parcelable {
    public static final Parcelable.Creator<RealTimeMessage> CREATOR = new Parcelable.Creator<RealTimeMessage>() { // from class: com.google.android.gms.games.multiplayer.realtime.RealTimeMessage.1
        @Override // android.os.Parcelable.Creator
        /* renamed from: aK */
        public RealTimeMessage[] newArray(int i) {
            return new RealTimeMessage[i];
        }

        @Override // android.os.Parcelable.Creator
        /* renamed from: ac */
        public RealTimeMessage createFromParcel(Parcel parcel) {
            return new RealTimeMessage(parcel);
        }
    };
    public static final int RELIABLE = 1;
    public static final int UNRELIABLE = 0;
    private final String wA;
    private final byte[] wB;
    private final int wC;

    private RealTimeMessage(Parcel parcel) {
        this(parcel.readString(), parcel.createByteArray(), parcel.readInt());
    }

    public RealTimeMessage(String senderParticipantId, byte[] messageData, int isReliable) {
        this.wA = (String) eg.f(senderParticipantId);
        this.wB = (byte[]) ((byte[]) eg.f(messageData)).clone();
        this.wC = isReliable;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public byte[] getMessageData() {
        return this.wB;
    }

    public String getSenderParticipantId() {
        return this.wA;
    }

    public boolean isReliable() {
        return this.wC == 1;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flag) {
        parcel.writeString(this.wA);
        parcel.writeByteArray(this.wB);
        parcel.writeInt(this.wC);
    }
}
