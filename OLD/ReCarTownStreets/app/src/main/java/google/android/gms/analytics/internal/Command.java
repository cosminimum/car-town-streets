package google.android.gms.analytics.internal;

import android.os.Parcel;
import android.os.Parcelable;

public class Command implements Parcelable {
    public static final String APPEND_CACHE_BUSTER = "appendCacheBuster";
    public static final String APPEND_QUEUE_TIME = "appendQueueTime";
    public static final String APPEND_VERSION = "appendVersion";
    public static final Creator<Command> CREATOR = new Creator<Command>() {
        public Command createFromParcel(Parcel in) {
            return new Command(in);
        }

        public Command[] newArray(int size) {
            return new Command[size];
        }
    };
    private String id;
    private String urlParam;
    private String value;

    public Command(String id2, String urlParam2, String value2) {
        this.id = id2;
        this.urlParam = urlParam2;
        this.value = value2;
    }

    public String getId() {
        return this.id;
    }

    public String getUrlParam() {
        return this.urlParam;
    }

    public String getValue() {
        return this.value;
    }

    public Command() {
    }

    Command(Parcel in) {
        readFromParcel(in);
    }

    public int describeContents() {
        return 0;
    }

    public void writeToParcel(Parcel out, int flags) {
        out.writeString(this.id);
        out.writeString(this.urlParam);
        out.writeString(this.value);
    }

    private void readFromParcel(Parcel in) {
        this.id = in.readString();
        this.urlParam = in.readString();
        this.value = in.readString();
    }
}
