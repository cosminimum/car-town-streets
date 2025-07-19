package com.google.android.gms.drive.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.DriveApi;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.MetadataChangeSet;
import com.google.android.gms.drive.query.Filters;
import com.google.android.gms.drive.query.Query;
import com.google.android.gms.drive.query.SearchableField;

/* renamed from: com.google.android.gms.drive.internal.l */
public class C0717l extends C0725m implements DriveFolder {

    /* renamed from: com.google.android.gms.drive.internal.l$a */
    private static class C0720a extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveFolder.DriveFileResult> f1535jW;

        public C0720a(C0655a.C0659c<DriveFolder.DriveFileResult> cVar) {
            this.f1535jW = cVar;
        }

        /* renamed from: a */
        public void mo6159a(OnDriveIdResponse onDriveIdResponse) throws RemoteException {
            this.f1535jW.mo5612a(new C0723d(Status.f1350nA, new C0711k(onDriveIdResponse.getDriveId())));
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1535jW.mo5612a(new C0723d(status, (DriveFile) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.l$b */
    private static class C0721b extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveFolder.DriveFolderResult> f1536jW;

        public C0721b(C0655a.C0659c<DriveFolder.DriveFolderResult> cVar) {
            this.f1536jW = cVar;
        }

        /* renamed from: a */
        public void mo6159a(OnDriveIdResponse onDriveIdResponse) throws RemoteException {
            this.f1536jW.mo5612a(new C0724e(Status.f1350nA, new C0717l(onDriveIdResponse.getDriveId())));
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1536jW.mo5612a(new C0724e(status, (DriveFolder) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.l$c */
    private abstract class C0722c extends C0709i<DriveFolder.DriveFolderResult> {
        private C0722c() {
        }

        /* renamed from: r */
        public DriveFolder.DriveFolderResult mo5631e(Status status) {
            return new C0724e(status, (DriveFolder) null);
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.l$d */
    private static class C0723d implements DriveFolder.DriveFileResult {

        /* renamed from: jY */
        private final Status f1538jY;

        /* renamed from: rn */
        private final DriveFile f1539rn;

        public C0723d(Status status, DriveFile driveFile) {
            this.f1538jY = status;
            this.f1539rn = driveFile;
        }

        public DriveFile getDriveFile() {
            return this.f1539rn;
        }

        public Status getStatus() {
            return this.f1538jY;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.l$e */
    private static class C0724e implements DriveFolder.DriveFolderResult {

        /* renamed from: jY */
        private final Status f1540jY;

        /* renamed from: ro */
        private final DriveFolder f1541ro;

        public C0724e(Status status, DriveFolder driveFolder) {
            this.f1540jY = status;
            this.f1541ro = driveFolder;
        }

        public DriveFolder getDriveFolder() {
            return this.f1541ro;
        }

        public Status getStatus() {
            return this.f1540jY;
        }
    }

    public C0717l(DriveId driveId) {
        super(driveId);
    }

    public PendingResult<DriveFolder.DriveFileResult> createFile(GoogleApiClient apiClient, final MetadataChangeSet changeSet, final Contents contents) {
        if (changeSet == null) {
            throw new IllegalArgumentException("MetatadataChangeSet must be provided.");
        } else if (contents == null) {
            throw new IllegalArgumentException("Contents must be provided.");
        } else if (!DriveFolder.MIME_TYPE.equals(changeSet.getMimeType())) {
            return apiClient.mo5868b(new C0709i<DriveFolder.DriveFileResult>() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5626a(C0710j jVar) {
                    try {
                        contents.close();
                        jVar.mo6205cN().mo6228a(new CreateFileRequest(C0717l.this.getDriveId(), changeSet.mo6099cM(), contents), (C0736p) new C0720a(this));
                    } catch (RemoteException e) {
                        mo5612a(new C0723d(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (DriveFile) null));
                    }
                }

                /* renamed from: q */
                public DriveFolder.DriveFileResult mo5631e(Status status) {
                    return new C0723d(status, (DriveFile) null);
                }
            });
        } else {
            throw new IllegalArgumentException("May not create folders (mimetype: application/vnd.google-apps.folder) using this method. Use DriveFolder.createFolder() instead.");
        }
    }

    public PendingResult<DriveFolder.DriveFolderResult> createFolder(GoogleApiClient apiClient, final MetadataChangeSet changeSet) {
        if (changeSet == null) {
            throw new IllegalArgumentException("MetatadataChangeSet must be provided.");
        } else if (changeSet.getMimeType() == null || changeSet.getMimeType().equals(DriveFolder.MIME_TYPE)) {
            return apiClient.mo5868b(new C0722c() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5626a(C0710j jVar) {
                    try {
                        jVar.mo6205cN().mo6229a(new CreateFolderRequest(C0717l.this.getDriveId(), changeSet.mo6099cM()), (C0736p) new C0721b(this));
                    } catch (RemoteException e) {
                        mo5612a(new C0724e(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (DriveFolder) null));
                    }
                }
            });
        } else {
            throw new IllegalArgumentException("The mimetype must be of type application/vnd.google-apps.folder");
        }
    }

    public PendingResult<DriveApi.MetadataBufferResult> listChildren(GoogleApiClient apiClient) {
        return queryChildren(apiClient, (Query) null);
    }

    public PendingResult<DriveApi.MetadataBufferResult> queryChildren(GoogleApiClient apiClient, Query query) {
        Query.Builder addFilter = new Query.Builder().addFilter(Filters.m1650in(SearchableField.PARENTS, getDriveId()));
        if (query != null) {
            if (query.getFilter() != null) {
                addFilter.addFilter(query.getFilter());
            }
            addFilter.setPageToken(query.getPageToken());
        }
        return new C0692h().query(apiClient, addFilter.build());
    }
}
