package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public class DeviceUnsupportedResponse extends Response {
    public static final Parcelable.Creator<DeviceUnsupportedResponse> CREATOR = new Parcelable.Creator<DeviceUnsupportedResponse>() { // from class: com.getjar.sdk.response.DeviceUnsupportedResponse.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public DeviceUnsupportedResponse mo51createFromParcel(Parcel in) {
            return new DeviceUnsupportedResponse(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public DeviceUnsupportedResponse[] mo52newArray(int size) {
            return new DeviceUnsupportedResponse[size];
        }
    };
    private Map<String, String> _deviceMetadata;

    public DeviceUnsupportedResponse(Map<String, String> deviceMetadata) {
        this._deviceMetadata = new HashMap();
        this._deviceMetadata = deviceMetadata;
    }

    public DeviceUnsupportedResponse(Parcel source) {
        super(source);
        this._deviceMetadata = new HashMap();
        source.readMap(this._deviceMetadata, String.class.getClassLoader());
    }

    @Override // com.getjar.sdk.response.Response, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeMap(this._deviceMetadata);
    }

    public Map<String, String> getDeviceMetadata() {
        return this._deviceMetadata;
    }
}
