package google.android.gms.games.multiplayer.realtime;

import android.os.Parcel;
import android.os.Parcelable;

import com.google.android.gms.internal.eg;

public final class RealTimeMessage implements Parcelable {
    public static final Creator<RealTimeMessage> CREATOR = new Creator<RealTimeMessage>() {
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

    public void writeToParcel(Parcel parcel, int flag) {
        parcel.writeString(this.wA);
        parcel.writeByteArray(this.wB);
        parcel.writeInt(this.wC);
    }
}
