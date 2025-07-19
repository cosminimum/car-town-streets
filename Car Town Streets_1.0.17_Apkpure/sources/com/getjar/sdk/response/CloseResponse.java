package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public class CloseResponse extends Response {
    public static final Parcelable.Creator<CloseResponse> CREATOR = new Parcelable.Creator<CloseResponse>() { // from class: com.getjar.sdk.response.CloseResponse.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public CloseResponse mo49createFromParcel(Parcel in) {
            return new CloseResponse(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public CloseResponse[] mo50newArray(int size) {
            return new CloseResponse[size];
        }
    };

    public CloseResponse() {
    }

    public CloseResponse(Parcel source) {
        super(source);
    }
}
