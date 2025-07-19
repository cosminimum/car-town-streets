package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;

public class CloseResponse extends Response {
    public static final Parcelable.Creator<CloseResponse> CREATOR = new Parcelable.Creator<CloseResponse>() {
        public CloseResponse createFromParcel(Parcel in) {
            return new CloseResponse(in);
        }

        public CloseResponse[] newArray(int size) {
            return new CloseResponse[size];
        }
    };

    public CloseResponse() {
    }

    public CloseResponse(Parcel source) {
        super(source);
    }
}
