package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveApi;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.query.Filters;
import com.google.android.gms.drive.query.Query;
import com.google.android.gms.drive.query.SearchableField;
/* loaded from: classes.dex */
public class l extends m implements DriveFolder {

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class a extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveFolder.DriveFileResult> jW;

        public a(a.c<DriveFolder.DriveFileResult> cVar) {
            this.jW = cVar;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnDriveIdResponse onDriveIdResponse) throws RemoteException {
            this.jW.a(new d(Status.nA, new k(onDriveIdResponse.getDriveId())));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new d(status, null));
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class b extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveFolder.DriveFolderResult> jW;

        public b(a.c<DriveFolder.DriveFolderResult> cVar) {
            this.jW = cVar;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnDriveIdResponse onDriveIdResponse) throws RemoteException {
            this.jW.a(new e(Status.nA, new l(onDriveIdResponse.getDriveId())));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new e(status, null));
        }
    }

    /* loaded from: classes.dex */
    private abstract class c extends i<DriveFolder.DriveFolderResult> {
        private c() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: r */
        public DriveFolder.DriveFolderResult e(Status status) {
            return new e(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class d implements DriveFolder.DriveFileResult {
        private final Status jY;
        private final DriveFile rn;

        public d(Status status, DriveFile driveFile) {
            this.jY = status;
            this.rn = driveFile;
        }

        @Override // com.google.android.gms.drive.DriveFolder.DriveFileResult
        public DriveFile getDriveFile() {
            return this.rn;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class e implements DriveFolder.DriveFolderResult {
        private final Status jY;
        private final DriveFolder ro;

        public e(Status status, DriveFolder driveFolder) {
            this.jY = status;
            this.ro = driveFolder;
        }

        @Override // com.google.android.gms.drive.DriveFolder.DriveFolderResult
        public DriveFolder getDriveFolder() {
            return this.ro;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    public l(DriveId driveId) {
        super(driveId);
    }

    @Override // com.google.android.gms.drive.DriveFolder
    public PendingResult<DriveFolder.DriveFileResult> createFile(GoogleApiClient apiClient, final MetadataChangeSet changeSet, final Contents contents) {
        if (changeSet == null) {
            throw new IllegalArgumentException("MetatadataChangeSet must be provided.");
        }
        if (contents == null) {
            throw new IllegalArgumentException("Contents must be provided.");
        }
        if (!DriveFolder.MIME_TYPE.equals(changeSet.getMimeType())) {
            return apiClient.b(new i<DriveFolder.DriveFileResult>() { // from class: com.google.android.gms.drive.internal.l.1
                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.google.android.gms.common.api.a.AbstractC0011a
                public void a(j jVar) {
                    try {
                        contents.close();
                        jVar.cN().a(new CreateFileRequest(l.this.getDriveId(), changeSet.cM(), contents), new a(this));
                    } catch (RemoteException e2) {
                        a((AnonymousClass1) new d(new Status(8, e2.getLocalizedMessage(), null), null));
                    }
                }

                @Override // com.google.android.gms.common.api.PendingResult
                /* renamed from: q */
                public DriveFolder.DriveFileResult e(Status status) {
                    return new d(status, null);
                }
            });
        }
        throw new IllegalArgumentException("May not create folders (mimetype: application/vnd.google-apps.folder) using this method. Use DriveFolder.createFolder() instead.");
    }

    @Override // com.google.android.gms.drive.DriveFolder
    public PendingResult<DriveFolder.DriveFolderResult> createFolder(GoogleApiClient apiClient, final MetadataChangeSet changeSet) {
        if (changeSet == null) {
            throw new IllegalArgumentException("MetatadataChangeSet must be provided.");
        }
        if (changeSet.getMimeType() != null && !changeSet.getMimeType().equals(DriveFolder.MIME_TYPE)) {
            throw new IllegalArgumentException("The mimetype must be of type application/vnd.google-apps.folder");
        }
        return apiClient.b(new c() { // from class: com.google.android.gms.drive.internal.l.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(j jVar) {
                try {
                    jVar.cN().a(new CreateFolderRequest(l.this.getDriveId(), changeSet.cM()), new b(this));
                } catch (RemoteException e2) {
                    a((AnonymousClass2) new e(new Status(8, e2.getLocalizedMessage(), null), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveFolder
    public PendingResult<DriveApi.MetadataBufferResult> listChildren(GoogleApiClient apiClient) {
        return queryChildren(apiClient, null);
    }

    @Override // com.google.android.gms.drive.DriveFolder
    public PendingResult<DriveApi.MetadataBufferResult> queryChildren(GoogleApiClient apiClient, Query query) {
        Query.Builder addFilter = new Query.Builder().addFilter(Filters.in(SearchableField.PARENTS, getDriveId()));
        if (query != null) {
            if (query.getFilter() != null) {
                addFilter.addFilter(query.getFilter());
            }
            addFilter.setPageToken(query.getPageToken());
        }
        return new h().query(apiClient, addFilter.build());
    }
}
