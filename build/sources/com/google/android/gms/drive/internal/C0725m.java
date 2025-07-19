package com.google.android.gms.drive.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.DriveResource;
import com.google.android.gms.drive.Metadata;
import com.google.android.gms.drive.MetadataChangeSet;

/* renamed from: com.google.android.gms.drive.internal.m */
public class C0725m implements DriveResource {
    /* access modifiers changed from: private */

    /* renamed from: qG */
    public final DriveId f1542qG;

    /* renamed from: com.google.android.gms.drive.internal.m$a */
    private abstract class C0728a extends C0709i<DriveResource.MetadataResult> {
        private C0728a() {
        }

        /* renamed from: s */
        public DriveResource.MetadataResult mo5631e(Status status) {
            return new C0730c(status, (Metadata) null);
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.m$b */
    private static class C0729b extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveResource.MetadataResult> f1547jW;

        public C0729b(C0655a.C0659c<DriveResource.MetadataResult> cVar) {
            this.f1547jW = cVar;
        }

        /* renamed from: a */
        public void mo6161a(OnMetadataResponse onMetadataResponse) throws RemoteException {
            this.f1547jW.mo5612a(new C0730c(Status.f1350nA, new C0691g(onMetadataResponse.mo6146cU())));
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1547jW.mo5612a(new C0730c(status, (Metadata) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.m$c */
    private static class C0730c implements DriveResource.MetadataResult {

        /* renamed from: jY */
        private final Status f1548jY;

        /* renamed from: rq */
        private final Metadata f1549rq;

        public C0730c(Status status, Metadata metadata) {
            this.f1548jY = status;
            this.f1549rq = metadata;
        }

        public Metadata getMetadata() {
            return this.f1549rq;
        }

        public Status getStatus() {
            return this.f1548jY;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.m$d */
    private abstract class C0731d extends C0709i<DriveResource.MetadataResult> {
        private C0731d() {
        }

        /* renamed from: s */
        public DriveResource.MetadataResult mo5631e(Status status) {
            return new C0730c(status, (Metadata) null);
        }
    }

    public C0725m(DriveId driveId) {
        this.f1542qG = driveId;
    }

    public DriveId getDriveId() {
        return this.f1542qG;
    }

    public PendingResult<DriveResource.MetadataResult> getMetadata(GoogleApiClient apiClient) {
        return apiClient.mo5867a(new C0728a() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C0710j jVar) {
                try {
                    jVar.mo6205cN().mo6230a(new GetMetadataRequest(C0725m.this.f1542qG), (C0736p) new C0729b(this));
                } catch (RemoteException e) {
                    mo5612a(new C0730c(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (Metadata) null));
                }
            }
        });
    }

    public PendingResult<DriveResource.MetadataResult> updateMetadata(GoogleApiClient apiClient, final MetadataChangeSet changeSet) {
        if (changeSet != null) {
            return apiClient.mo5868b(new C0731d() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5626a(C0710j jVar) {
                    try {
                        jVar.mo6205cN().mo6233a(new UpdateMetadataRequest(C0725m.this.f1542qG, changeSet.mo6099cM()), (C0736p) new C0729b(this));
                    } catch (RemoteException e) {
                        mo5612a(new C0730c(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (Metadata) null));
                    }
                }
            });
        }
        throw new IllegalArgumentException("ChangeSet must be provided.");
    }
}
