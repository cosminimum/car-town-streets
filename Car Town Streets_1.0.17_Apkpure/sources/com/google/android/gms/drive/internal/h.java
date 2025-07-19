package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
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
/* loaded from: classes.dex */
public class h implements DriveApi {

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class a implements DriveApi.ContentsResult {
        private final Status jY;
        private final Contents qK;

        public a(Status status, Contents contents) {
            this.jY = status;
            this.qK = contents;
        }

        @Override // com.google.android.gms.drive.DriveApi.ContentsResult
        public Contents getContents() {
            return this.qK;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* loaded from: classes.dex */
    abstract class b extends com.google.android.gms.drive.internal.i<Status> {
        b() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class c extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveApi.DriveIdResult> jW;

        public c(a.c<DriveApi.DriveIdResult> cVar) {
            this.jW = cVar;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnMetadataResponse onMetadataResponse) throws RemoteException {
            this.jW.a(new d(Status.nA, new com.google.android.gms.drive.internal.g(onMetadataResponse.cU()).getDriveId()));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new d(status, null));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class d implements DriveApi.DriveIdResult {
        private final Status jY;
        private final DriveId qG;

        public d(Status status, DriveId driveId) {
            this.jY = status;
            this.qG = driveId;
        }

        @Override // com.google.android.gms.drive.DriveApi.DriveIdResult
        public DriveId getDriveId() {
            return this.qG;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* loaded from: classes.dex */
    abstract class e extends com.google.android.gms.drive.internal.i<DriveApi.DriveIdResult> {
        e() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: n */
        public DriveApi.DriveIdResult e(Status status) {
            return new d(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class f implements DriveApi.MetadataBufferResult {
        private final Status jY;
        private final MetadataBuffer rf;

        public f(Status status, MetadataBuffer metadataBuffer) {
            this.jY = status;
            this.rf = metadataBuffer;
        }

        @Override // com.google.android.gms.drive.DriveApi.MetadataBufferResult
        public MetadataBuffer getMetadataBuffer() {
            return this.rf;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class g extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveApi.ContentsResult> jW;

        public g(a.c<DriveApi.ContentsResult> cVar) {
            this.jW = cVar;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnContentsResponse onContentsResponse) throws RemoteException {
            this.jW.a(new a(Status.nA, onContentsResponse.cQ()));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new a(status, null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.h$h  reason: collision with other inner class name */
    /* loaded from: classes.dex */
    abstract class AbstractC0014h extends com.google.android.gms.drive.internal.i<DriveApi.ContentsResult> {
        AbstractC0014h() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: o */
        public DriveApi.ContentsResult e(Status status) {
            return new a(status, null);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class i extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveApi.MetadataBufferResult> jW;

        public i(a.c<DriveApi.MetadataBufferResult> cVar) {
            this.jW = cVar;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnListEntriesResponse onListEntriesResponse) throws RemoteException {
            this.jW.a(new f(Status.nA, new MetadataBuffer(onListEntriesResponse.cT(), null)));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new f(status, null));
        }
    }

    /* loaded from: classes.dex */
    abstract class j extends com.google.android.gms.drive.internal.i<DriveApi.MetadataBufferResult> {
        j() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: p */
        public DriveApi.MetadataBufferResult e(Status status) {
            return new f(status, null);
        }
    }

    /* loaded from: classes.dex */
    abstract class k extends com.google.android.gms.drive.internal.i<Status> {
        k() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    @Override // com.google.android.gms.drive.DriveApi
    public PendingResult<Status> discardContents(GoogleApiClient apiClient, final Contents contents) {
        return apiClient.b(new b() { // from class: com.google.android.gms.drive.internal.h.3
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(com.google.android.gms.drive.internal.j jVar) {
                try {
                    jVar.cN().a(new CloseContentsRequest(contents, false), new z(this));
                } catch (RemoteException e2) {
                    a((AnonymousClass3) new Status(8, e2.getLocalizedMessage(), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveApi
    public PendingResult<DriveApi.DriveIdResult> fetchDriveId(GoogleApiClient apiClient, final String resourceId) {
        return apiClient.a((GoogleApiClient) new e() { // from class: com.google.android.gms.drive.internal.h.4
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(com.google.android.gms.drive.internal.j jVar) {
                try {
                    jVar.cN().a(new GetMetadataRequest(DriveId.ab(resourceId)), new c(this));
                } catch (RemoteException e2) {
                    a((AnonymousClass4) new d(new Status(8, e2.getLocalizedMessage(), null), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveApi
    public DriveFile getFile(GoogleApiClient apiClient, DriveId id) {
        if (id == null) {
            throw new IllegalArgumentException("Id must be provided.");
        }
        if (apiClient.isConnected()) {
            return new com.google.android.gms.drive.internal.k(id);
        }
        throw new IllegalStateException("Client must be connected");
    }

    @Override // com.google.android.gms.drive.DriveApi
    public DriveFolder getFolder(GoogleApiClient apiClient, DriveId id) {
        if (id == null) {
            throw new IllegalArgumentException("Id must be provided.");
        }
        if (apiClient.isConnected()) {
            return new l(id);
        }
        throw new IllegalStateException("Client must be connected");
    }

    @Override // com.google.android.gms.drive.DriveApi
    public DriveFolder getRootFolder(GoogleApiClient apiClient) {
        if (!apiClient.isConnected()) {
            throw new IllegalStateException("Client must be connected");
        }
        return new l(((com.google.android.gms.drive.internal.j) apiClient.a(Drive.jO)).cO());
    }

    @Override // com.google.android.gms.drive.DriveApi
    public PendingResult<DriveApi.ContentsResult> newContents(GoogleApiClient apiClient) {
        return apiClient.a((GoogleApiClient) new AbstractC0014h() { // from class: com.google.android.gms.drive.internal.h.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(com.google.android.gms.drive.internal.j jVar) {
                try {
                    jVar.cN().a(new CreateContentsRequest(), new g(this));
                } catch (RemoteException e2) {
                    a((AnonymousClass2) new a(new Status(8, e2.getLocalizedMessage(), null), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveApi
    public CreateFileActivityBuilder newCreateFileActivityBuilder() {
        return new CreateFileActivityBuilder();
    }

    @Override // com.google.android.gms.drive.DriveApi
    public OpenFileActivityBuilder newOpenFileActivityBuilder() {
        return new OpenFileActivityBuilder();
    }

    @Override // com.google.android.gms.drive.DriveApi
    public PendingResult<DriveApi.MetadataBufferResult> query(GoogleApiClient apiClient, final Query query) {
        if (query == null) {
            throw new IllegalArgumentException("Query must be provided.");
        }
        return apiClient.a((GoogleApiClient) new j() { // from class: com.google.android.gms.drive.internal.h.1
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(com.google.android.gms.drive.internal.j jVar) {
                try {
                    jVar.cN().a(new QueryRequest(query), new i(this));
                } catch (RemoteException e2) {
                    a((AnonymousClass1) new f(new Status(8, e2.getLocalizedMessage(), null), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveApi
    public PendingResult<Status> requestSync(GoogleApiClient client) {
        return client.b(new k() { // from class: com.google.android.gms.drive.internal.h.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(com.google.android.gms.drive.internal.j jVar) {
                try {
                    jVar.cN().a(new z(this));
                } catch (RemoteException e2) {
                    a((AnonymousClass5) new Status(8, e2.getLocalizedMessage(), null));
                }
            }
        });
    }
}
