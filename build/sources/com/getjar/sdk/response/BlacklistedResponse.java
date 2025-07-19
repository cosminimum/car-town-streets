package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;

public class BlacklistedResponse extends Response {
    public static final Parcelable.Creator<BlacklistedResponse> CREATOR = new Parcelable.Creator<BlacklistedResponse>() {
        public BlacklistedResponse createFromParcel(Parcel in) {
            return new BlacklistedResponse(in);
        }

        public BlacklistedResponse[] newArray(int size) {
            return new BlacklistedResponse[size];
        }
    };
    private BlacklistType _blacklistType;

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

    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeString(this._blacklistType.name());
    }

    public BlacklistType getBlacklistType() {
        return this._blacklistType;
    }
}
