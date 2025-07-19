package com.google.android.gms.drive;

import android.content.IntentSender;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.drive.internal.C0710j;
import com.google.android.gms.drive.internal.CreateFileIntentSenderRequest;
import com.google.android.gms.internal.C1102eg;
import java.io.IOException;

public class CreateFileActivityBuilder {
    public static final String EXTRA_RESPONSE_DRIVE_ID = "response_drive_id";

    /* renamed from: qJ */
    private MetadataChangeSet f1434qJ;

    /* renamed from: qK */
    private Contents f1435qK;

    /* renamed from: qL */
    private String f1436qL;

    /* renamed from: qM */
    private DriveId f1437qM;

    public IntentSender build(GoogleApiClient apiClient) {
        C1102eg.m2614b(this.f1435qK, (Object) "Must provide initial contents to CreateFileActivityBuilder.");
        try {
            this.f1435qK.getParcelFileDescriptor().close();
        } catch (IOException e) {
        }
        this.f1435qK.close();
        C1102eg.m2612a(apiClient.isConnected(), "Client must be connected");
        try {
            return ((C0710j) apiClient.mo5866a(Drive.f1438jO)).mo6205cN().mo6224a(new CreateFileIntentSenderRequest(this.f1434qJ.mo6099cM(), this.f1435qK.mo6033cJ(), this.f1436qL, this.f1437qM));
        } catch (RemoteException e2) {
            throw new RuntimeException("Unable to connect Drive Play Service", e2);
        }
    }

    public CreateFileActivityBuilder setActivityStartFolder(DriveId folder) {
        this.f1437qM = (DriveId) C1102eg.m2616f(folder);
        return this;
    }

    public CreateFileActivityBuilder setActivityTitle(String title) {
        this.f1436qL = (String) C1102eg.m2616f(title);
        return this;
    }

    public CreateFileActivityBuilder setInitialContents(Contents contents) {
        this.f1435qK = (Contents) C1102eg.m2616f(contents);
        return this;
    }

    public CreateFileActivityBuilder setInitialMetadata(MetadataChangeSet metadataChangeSet) {
        this.f1434qJ = (MetadataChangeSet) C1102eg.m2616f(metadataChangeSet);
        return this;
    }
}
