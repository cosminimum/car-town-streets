package com.google.android.gms.drive;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
/* loaded from: classes.dex */
public interface DriveResource {

    /* loaded from: classes.dex */
    public interface MetadataResult extends Result {
        Metadata getMetadata();
    }

    DriveId getDriveId();

    PendingResult<MetadataResult> getMetadata(GoogleApiClient googleApiClient);

    PendingResult<MetadataResult> updateMetadata(GoogleApiClient googleApiClient, MetadataChangeSet metadataChangeSet);
}
