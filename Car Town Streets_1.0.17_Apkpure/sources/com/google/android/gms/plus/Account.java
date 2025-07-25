package com.google.android.gms.plus;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
/* loaded from: classes.dex */
public interface Account {
    void clearDefaultAccount(GoogleApiClient googleApiClient);

    String getAccountName(GoogleApiClient googleApiClient);

    PendingResult<Status> revokeAccessAndDisconnect(GoogleApiClient googleApiClient);
}
