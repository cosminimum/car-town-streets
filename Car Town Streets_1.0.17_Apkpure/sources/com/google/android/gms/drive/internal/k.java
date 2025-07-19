package com.google.android.gms.drive.internal;

import android.os.RemoteException;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveApi;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.internal.h;
/* loaded from: classes.dex */
public class k extends m implements DriveFile {

    /* loaded from: classes.dex */
    private abstract class a extends i<Status> {
        private a() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class b extends com.google.android.gms.drive.internal.a {
        private final a.c<DriveApi.ContentsResult> jW;
        private final DriveFile.DownloadProgressListener rk;

        public b(a.c<DriveApi.ContentsResult> cVar, DriveFile.DownloadProgressListener downloadProgressListener) {
            this.jW = cVar;
            this.rk = downloadProgressListener;
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnContentsResponse onContentsResponse) throws RemoteException {
            this.jW.a(new h.a(Status.nA, onContentsResponse.cQ()));
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void a(OnDownloadProgressResponse onDownloadProgressResponse) throws RemoteException {
            if (this.rk != null) {
                this.rk.onProgress(onDownloadProgressResponse.cR(), onDownloadProgressResponse.cS());
            }
        }

        @Override // com.google.android.gms.drive.internal.a, com.google.android.gms.drive.internal.p
        public void m(Status status) throws RemoteException {
            this.jW.a(new h.a(status, null));
        }
    }

    /* loaded from: classes.dex */
    private abstract class c extends i<DriveApi.ContentsResult> {
        private c() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: o */
        public DriveApi.ContentsResult e(Status status) {
            return new h.a(status, null);
        }
    }

    public k(DriveId driveId) {
        super(driveId);
    }

    @Override // com.google.android.gms.drive.DriveFile
    public PendingResult<Status> commitAndCloseContents(GoogleApiClient apiClient, final Contents contents) {
        if (contents == null) {
            throw new IllegalArgumentException("Contents must be provided.");
        }
        return apiClient.b(new a() { // from class: com.google.android.gms.drive.internal.k.2
            /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
            {
                super();
            }

            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(j jVar) {
                try {
                    contents.close();
                    jVar.cN().a(new CloseContentsRequest(contents, true), new z(this));
                } catch (RemoteException e) {
                    a((AnonymousClass2) new Status(8, e.getLocalizedMessage(), null));
                }
            }
        });
    }

    @Override // com.google.android.gms.drive.DriveFile
    public PendingResult<Status> discardContents(GoogleApiClient apiClient, Contents contents) {
        return Drive.DriveApi.discardContents(apiClient, contents);
    }

    @Override // com.google.android.gms.drive.DriveFile
    public PendingResult<DriveApi.ContentsResult> openContents(GoogleApiClient apiClient, final int mode, final DriveFile.DownloadProgressListener listener) {
        if (mode == 268435456 || mode == 536870912 || mode == 805306368) {
            return apiClient.a((GoogleApiClient) new c() { // from class: com.google.android.gms.drive.internal.k.1
                /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                {
                    super();
                }

                /* JADX INFO: Access modifiers changed from: protected */
                @Override // com.google.android.gms.common.api.a.AbstractC0011a
                public void a(j jVar) {
                    try {
                        jVar.cN().a(new OpenContentsRequest(k.this.getDriveId(), mode), new b(this, listener));
                    } catch (RemoteException e) {
                        a((AnonymousClass1) new h.a(new Status(8, e.getLocalizedMessage(), null), null));
                    }
                }
            });
        }
        throw new IllegalArgumentException("Invalid mode provided.");
    }
}
