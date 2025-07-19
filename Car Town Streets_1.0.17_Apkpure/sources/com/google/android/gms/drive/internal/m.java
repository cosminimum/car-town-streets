package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.DriveResource;
import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.MetadataChangeSet;
/* loaded from: classes.dex */
public class m implements DriveResource {
    private final DriveId qG;

    /* loaded from: classes.dex */
    private abstract class a extends i<DriveResource.MetadataResult> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: s */
        public DriveResource.MetadataResult e(Status status) {
            return new c(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class b extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveResource.MetadataResult> jW;

        public b(a.c<DriveResource.MetadataResult> cVar) {
            this.jW = cVar;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnMetadataResponse onMetadataResponse) throws RemoteException {
            this.jW.a(new c(Status.nA, new g(onMetadataResponse.cU())));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new c(status, null));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class c implements DriveResource.MetadataResult {
        private final Status jY;
        private final Metadata rq;

        public c(Status status, Metadata metadata) {
            this.jY = status;
            this.rq = metadata;
        }

        @Override // com.google.android.gms.drive.DriveResource.MetadataResult
        public Metadata getMetadata() {
            return this.rq;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* loaded from: classes.dex */
    private abstract class d extends i<DriveResource.MetadataResult> {
        private d() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: s */
        public DriveResource.MetadataResult e(Status status) {
            return new c(status, null);
        }
    }

    public m(DriveId driveId) {
        this.qG = driveId;
    }

    @Override // com.google.android.gms.drive.DriveResource
    public DriveId getDriveId() {
        return this.qG;
    }

    @Override // com.google.android.gms.drive.DriveResource
    public PendingResult<DriveResource.MetadataResult> getMetadata(GoogleApiClient apiClient) {
        return apiClient.a((GoogleApiClient) new a() { // from class: com.google.android.gms.drive.internal.m.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(j jVar) {
                try {
                    jVar.cN().a(new GetMetadataRequest(m.this.qG), new b(this));
                } catch (RemoteException e) {
                    a((AnonymousClass1) new c(new Status(8, e.getLocalizedMessage(), null), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveResource
    public PendingResult<DriveResource.MetadataResult> updateMetadata(GoogleApiClient apiClient, final MetadataChangeSet changeSet) {
        if (changeSet == null) {
            throw new IllegalArgumentException("ChangeSet must be provided.");
        }
        return apiClient.b(new d() { // from class: com.google.android.gms.drive.internal.m.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(j jVar) {
                try {
                    jVar.cN().a(new UpdateMetadataRequest(m.this.qG, changeSet.cM()), new b(this));
                } catch (RemoteException e) {
                    a((AnonymousClass2) new c(new Status(8, e.getLocalizedMessage(), null), null));
                }
            }
        });
    }
}
