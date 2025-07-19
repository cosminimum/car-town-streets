package com.getjar.sdk.response;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.HashMap;
import java.util.Map;

public class DeviceUnsupportedResponse extends Response {
    public static final Parcelable.Creator<DeviceUnsupportedResponse> CREATOR = new Parcelable.Creator<DeviceUnsupportedResponse>() {
        public DeviceUnsupportedResponse createFromParcel(Parcel in) {
            return new DeviceUnsupportedResponse(in);
        }

        public DeviceUnsupportedResponse[] newArray(int size) {
            return new DeviceUnsupportedResponse[size];
        }
    };
    private Map<String, String> _deviceMetadata = new HashMap();

    public DeviceUnsupportedResponse(Map<String, String> deviceMetadata) {
        this._deviceMetadata = deviceMetadata;
    }

    public DeviceUnsupportedResponse(Parcel source) {
        super(source);
        source.readMap(this._deviceMetadata, String.class.getClassLoader());
    }

    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeMap(this._deviceMetadata);
    }

    public Map<String, String> getDeviceMetadata() {
        return this._deviceMetadata;
    }
}
