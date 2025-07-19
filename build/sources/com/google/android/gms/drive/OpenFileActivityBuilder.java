package com.google.android.gms.drive;

import android.content.IntentSender;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.drive.internal.C0710j;
import com.google.android.gms.drive.internal.OpenFileIntentSenderRequest;
import com.google.android.gms.internal.C1102eg;

public class OpenFileActivityBuilder {
    public static final String EXTRA_RESPONSE_DRIVE_ID = "response_drive_id";

    /* renamed from: qL */
    private String f1451qL;

    /* renamed from: qM */
    private DriveId f1452qM;

    /* renamed from: qW */
    private String[] f1453qW;

    public IntentSender build(GoogleApiClient apiClient) {
        C1102eg.m2614b(this.f1453qW, (Object) "setMimeType(String[]) must be called on this builder before calling build()");
        C1102eg.m2612a(apiClient.isConnected(), "Client must be connected");
        try {
            return ((C0710j) apiClient.mo5866a(Drive.f1438jO)).mo6205cN().mo6225a(new OpenFileIntentSenderRequest(this.f1451qL, this.f1453qW, this.f1452qM));
        } catch (RemoteException e) {
            throw new RuntimeException("Unable to connect Drive Play Service", e);
        }
    }

    public OpenFileActivityBuilder setActivityStartFolder(DriveId folder) {
        this.f1452qM = (DriveId) C1102eg.m2616f(folder);
        return this;
    }

    public OpenFileActivityBuilder setActivityTitle(String title) {
        this.f1451qL = (String) C1102eg.m2616f(title);
        return this;
    }

    public OpenFileActivityBuilder setMimeType(String[] mimeTypes) {
        C1102eg.m2615b(mimeTypes != null && mimeTypes.length > 0, (Object) "mimeTypes may not be null and must contain at least one value");
        this.f1453qW = mimeTypes;
        return this;
    }
}
