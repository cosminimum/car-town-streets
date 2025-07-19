package com.google.android.gms.drive.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.CreateFileActivityBuilder;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveApi;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveFolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.MetadataBuffer;
import com.google.android.gms.drive.OpenFileActivityBuilder;
import com.google.android.gms.drive.query.Query;

/* renamed from: com.google.android.gms.drive.internal.h */
public class C0692h implements DriveApi {

    /* renamed from: com.google.android.gms.drive.internal.h$a */
    static class C0698a implements DriveApi.ContentsResult {

        /* renamed from: jY */
        private final Status f1505jY;

        /* renamed from: qK */
        private final Contents f1506qK;

        public C0698a(Status status, Contents contents) {
            this.f1505jY = status;
            this.f1506qK = contents;
        }

        public Contents getContents() {
            return this.f1506qK;
        }

        public Status getStatus() {
            return this.f1505jY;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$b */
    abstract class C0699b extends C0709i<Status> {
        C0699b() {
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$c */
    private static class C0700c extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveApi.DriveIdResult> f1508jW;

        public C0700c(C0655a.C0659c<DriveApi.DriveIdResult> cVar) {
            this.f1508jW = cVar;
        }

        /* renamed from: a */
        public void mo6161a(OnMetadataResponse onMetadataResponse) throws RemoteException {
            this.f1508jW.mo5612a(new C0701d(Status.f1350nA, new C0691g(onMetadataResponse.mo6146cU()).getDriveId()));
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1508jW.mo5612a(new C0701d(status, (DriveId) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$d */
    static class C0701d implements DriveApi.DriveIdResult {

        /* renamed from: jY */
        private final Status f1509jY;

        /* renamed from: qG */
        private final DriveId f1510qG;

        public C0701d(Status status, DriveId driveId) {
            this.f1509jY = status;
            this.f1510qG = driveId;
        }

        public DriveId getDriveId() {
            return this.f1510qG;
        }

        public Status getStatus() {
            return this.f1509jY;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$e */
    abstract class C0702e extends C0709i<DriveApi.DriveIdResult> {
        C0702e() {
        }

        /* renamed from: n */
        public DriveApi.DriveIdResult mo5631e(Status status) {
            return new C0701d(status, (DriveId) null);
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$f */
    static class C0703f implements DriveApi.MetadataBufferResult {

        /* renamed from: jY */
        private final Status f1512jY;

        /* renamed from: rf */
        private final MetadataBuffer f1513rf;

        public C0703f(Status status, MetadataBuffer metadataBuffer) {
            this.f1512jY = status;
            this.f1513rf = metadataBuffer;
        }

        public MetadataBuffer getMetadataBuffer() {
            return this.f1513rf;
        }

        public Status getStatus() {
            return this.f1512jY;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$g */
    private static class C0704g extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveApi.ContentsResult> f1514jW;

        public C0704g(C0655a.C0659c<DriveApi.ContentsResult> cVar) {
            this.f1514jW = cVar;
        }

        /* renamed from: a */
        public void mo6157a(OnContentsResponse onContentsResponse) throws RemoteException {
            this.f1514jW.mo5612a(new C0698a(Status.f1350nA, onContentsResponse.mo6133cQ()));
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1514jW.mo5612a(new C0698a(status, (Contents) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$h */
    abstract class C0705h extends C0709i<DriveApi.ContentsResult> {
        C0705h() {
        }

        /* renamed from: o */
        public DriveApi.ContentsResult mo5631e(Status status) {
            return new C0698a(status, (Contents) null);
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$i */
    static class C0706i extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveApi.MetadataBufferResult> f1516jW;

        public C0706i(C0655a.C0659c<DriveApi.MetadataBufferResult> cVar) {
            this.f1516jW = cVar;
        }

        /* renamed from: a */
        public void mo6160a(OnListEntriesResponse onListEntriesResponse) throws RemoteException {
            this.f1516jW.mo5612a(new C0703f(Status.f1350nA, new MetadataBuffer(onListEntriesResponse.mo6143cT(), (String) null)));
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1516jW.mo5612a(new C0703f(status, (MetadataBuffer) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$j */
    abstract class C0707j extends C0709i<DriveApi.MetadataBufferResult> {
        C0707j() {
        }

        /* renamed from: p */
        public DriveApi.MetadataBufferResult mo5631e(Status status) {
            return new C0703f(status, (MetadataBuffer) null);
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$k */
    abstract class C0708k extends C0709i<Status> {
        C0708k() {
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    public PendingResult<Status> discardContents(GoogleApiClient apiClient, final Contents contents) {
        return apiClient.mo5868b(new C0699b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C0710j jVar) {
                try {
                    jVar.mo6205cN().mo6226a(new CloseContentsRequest(contents, false), (C0736p) new C0748z(this));
                } catch (RemoteException e) {
                    mo5612a(new Status(8, e.getLocalizedMessage(), (PendingIntent) null));
                }
            }
        });
    }

    public PendingResult<DriveApi.DriveIdResult> fetchDriveId(GoogleApiClient apiClient, final String resourceId) {
        return apiClient.mo5867a(new C0702e() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C0710j jVar) {
                try {
                    jVar.mo6205cN().mo6230a(new GetMetadataRequest(DriveId.m1418ab(resourceId)), (C0736p) new C0700c(this));
                } catch (RemoteException e) {
                    mo5612a(new C0701d(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (DriveId) null));
                }
            }
        });
    }

    public DriveFile getFile(GoogleApiClient apiClient, DriveId id) {
        if (id == null) {
            throw new IllegalArgumentException("Id must be provided.");
        } else if (apiClient.isConnected()) {
            return new C0711k(id);
        } else {
            throw new IllegalStateException("Client must be connected");
        }
    }

    public DriveFolder getFolder(GoogleApiClient apiClient, DriveId id) {
        if (id == null) {
            throw new IllegalArgumentException("Id must be provided.");
        } else if (apiClient.isConnected()) {
            return new C0717l(id);
        } else {
            throw new IllegalStateException("Client must be connected");
        }
    }

    public DriveFolder getRootFolder(GoogleApiClient apiClient) {
        if (apiClient.isConnected()) {
            return new C0717l(((C0710j) apiClient.mo5866a(Drive.f1438jO)).mo6206cO());
        }
        throw new IllegalStateException("Client must be connected");
    }

    public PendingResult<DriveApi.ContentsResult> newContents(GoogleApiClient apiClient) {
        return apiClient.mo5867a(new C0705h() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C0710j jVar) {
                try {
                    jVar.mo6205cN().mo6227a(new CreateContentsRequest(), (C0736p) new C0704g(this));
                } catch (RemoteException e) {
                    mo5612a(new C0698a(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (Contents) null));
                }
            }
        });
    }

    public CreateFileActivityBuilder newCreateFileActivityBuilder() {
        return new CreateFileActivityBuilder();
    }

    public OpenFileActivityBuilder newOpenFileActivityBuilder() {
        return new OpenFileActivityBuilder();
    }

    public PendingResult<DriveApi.MetadataBufferResult> query(GoogleApiClient apiClient, final Query query) {
        if (query != null) {
            return apiClient.mo5867a(new C0707j() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5626a(C0710j jVar) {
                    try {
                        jVar.mo6205cN().mo6232a(new QueryRequest(query), (C0736p) new C0706i(this));
                    } catch (RemoteException e) {
                        mo5612a(new C0703f(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (MetadataBuffer) null));
                    }
                }
            });
        }
        throw new IllegalArgumentException("Query must be provided.");
    }

    public PendingResult<Status> requestSync(GoogleApiClient client) {
        return client.mo5868b(new C0708k() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C0710j jVar) {
                try {
                    jVar.mo6205cN().mo6234a((C0736p) new C0748z(this));
                } catch (RemoteException e) {
                    mo5612a(new Status(8, e.getLocalizedMessage(), (PendingIntent) null));
                }
            }
        });
    }
}
