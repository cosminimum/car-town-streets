package com.google.android.gms.drive;

import android.content.IntentSender;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.drive.internal.OpenFileIntentSenderRequest;
import com.google.android.gms.drive.internal.j;
import com.google.android.gms.internal.eg;

public class OpenFileActivityBuilder {
    public static final String EXTRA_RESPONSE_DRIVE_ID = "response_drive_id";
    private String qL;
    private DriveId qM;
    private String[] qW;

    public IntentSender build(GoogleApiClient apiClient) {
        eg.b(this.qW, (Object) "setMimeType(String[]) must be called on this builder before calling build()");
        eg.a(apiClient.isConnected(), "Client must be connected");
        try {
            return ((j) apiClient.a(Drive.jO)).cN().a(new OpenFileIntentSenderRequest(this.qL, this.qW, this.qM));
        } catch (RemoteException e) {
            throw new RuntimeException("Unable to connect Drive Play Service", e);
        }
    }

    public OpenFileActivityBuilder setActivityStartFolder(DriveId folder) {
        this.qM = (DriveId) eg.f(folder);
        return this;
    }

    public OpenFileActivityBuilder setActivityTitle(String title) {
        this.qL = (String) eg.f(title);
        return this;
    }

    public OpenFileActivityBuilder setMimeType(String[] mimeTypes) {
        eg.b(mimeTypes != null && mimeTypes.length > 0, (Object) "mimeTypes may not be null and must contain at least one value");
        this.qW = mimeTypes;
        return this;
    }
}
