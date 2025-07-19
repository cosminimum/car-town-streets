package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;

public abstract class Response implements Parcelable {
    protected Response() {
    }

    public Response(Parcel source) {
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel dest, int flags) {
    }
}
