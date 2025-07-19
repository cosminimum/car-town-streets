package google.android.gms.common;

import android.content.Intent;

public class GooglePlayServicesRepairableException extends UserRecoverableException {
    private final int kf;

    GooglePlayServicesRepairableException(int connectionStatusCode, String msg, Intent intent) {
        super(msg, intent);
        this.kf = connectionStatusCode;
    }

    public int getConnectionStatusCode() {
        return this.kf;
    }
}
