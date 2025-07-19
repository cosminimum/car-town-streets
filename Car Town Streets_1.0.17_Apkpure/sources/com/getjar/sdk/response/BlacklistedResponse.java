package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public class BlacklistedResponse extends Response {
    public static final Parcelable.Creator<BlacklistedResponse> CREATOR = new Parcelable.Creator<BlacklistedResponse>() { // from class: com.getjar.sdk.response.BlacklistedResponse.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public BlacklistedResponse mo47createFromParcel(Parcel in) {
            return new BlacklistedResponse(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public BlacklistedResponse[] mo48newArray(int size) {
            return new BlacklistedResponse[size];
        }
    };
    private BlacklistType _blacklistType;

    /* loaded from: classes.dex */
    public enum BlacklistType {
        DEVICE,
        USER,
        APP
    }

    public BlacklistedResponse(BlacklistType blacklistType) {
        this._blacklistType = blacklistType;
    }

    public BlacklistedResponse(Parcel source) {
        super(source);
        this._blacklistType = BlacklistType.valueOf(source.readString());
    }

    @Override // com.getjar.sdk.response.Response, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this._blacklistType.name());
    }

    public BlacklistType getBlacklistType() {
        return this._blacklistType;
    }
}
