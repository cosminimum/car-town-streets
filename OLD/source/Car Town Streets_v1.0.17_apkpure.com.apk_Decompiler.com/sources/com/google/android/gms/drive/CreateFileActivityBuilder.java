package com.google.android.gms.drive;

import android.content.IntentSender;
import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.drive.internal.CreateFileIntentSenderRequest;
import com.google.android.gms.drive.internal.j;
import com.google.android.gms.internal.eg;
import java.io.IOException;

public class CreateFileActivityBuilder {
    public static final String EXTRA_RESPONSE_DRIVE_ID = "response_drive_id";
    private MetadataChangeSet qJ;
    private Contents qK;
    private String qL;
    private DriveId qM;

    public IntentSender build(GoogleApiClient apiClient) {
        eg.b(this.qK, (Object) "Must provide initial contents to CreateFileActivityBuilder.");
        try {
            this.qK.getParcelFileDescriptor().close();
        } catch (IOException e) {
        }
        this.qK.close();
        eg.a(apiClient.isConnected(), "Client must be connected");
        try {
            return ((j) apiClient.a(Drive.jO)).cN().a(new CreateFileIntentSenderRequest(this.qJ.cM(), this.qK.cJ(), this.qL, this.qM));
        } catch (RemoteException e2) {
            throw new RuntimeException("Unable to connect Drive Play Service", e2);
        }
    }

    public CreateFileActivityBuilder setActivityStartFolder(DriveId folder) {
        this.qM = (DriveId) eg.f(folder);
        return this;
    }

    public CreateFileActivityBuilder setActivityTitle(String title) {
        this.qL = (String) eg.f(title);
        return this;
    }

    public CreateFileActivityBuilder setInitialContents(Contents contents) {
        this.qK = (Contents) eg.f(contents);
        return this;
    }

    public CreateFileActivityBuilder setInitialMetadata(MetadataChangeSet metadataChangeSet) {
        this.qJ = (MetadataChangeSet) eg.f(metadataChangeSet);
        return this;
    }
}
