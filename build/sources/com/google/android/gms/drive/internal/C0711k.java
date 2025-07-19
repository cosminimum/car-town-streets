package com.google.android.gms.drive.internal;

import android.app.PendingIntent;
import android.os.RemoteException;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.drive.Contents;
import com.google.android.gms.drive.Drive;
import com.google.android.gms.drive.DriveApi;
import com.google.android.gms.drive.DriveFile;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.internal.C0692h;

/* renamed from: com.google.android.gms.drive.internal.k */
public class C0711k extends C0725m implements DriveFile {

    /* renamed from: com.google.android.gms.drive.internal.k$a */
    private abstract class C0714a extends C0709i<Status> {
        private C0714a() {
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.k$b */
    private static class C0715b extends C0684a {

        /* renamed from: jW */
        private final C0655a.C0659c<DriveApi.ContentsResult> f1527jW;

        /* renamed from: rk */
        private final DriveFile.DownloadProgressListener f1528rk;

        public C0715b(C0655a.C0659c<DriveApi.ContentsResult> cVar, DriveFile.DownloadProgressListener downloadProgressListener) {
            this.f1527jW = cVar;
            this.f1528rk = downloadProgressListener;
        }

        /* renamed from: a */
        public void mo6157a(OnContentsResponse onContentsResponse) throws RemoteException {
            this.f1527jW.mo5612a(new C0692h.C0698a(Status.f1350nA, onContentsResponse.mo6133cQ()));
        }

        /* renamed from: a */
        public void mo6158a(OnDownloadProgressResponse onDownloadProgressResponse) throws RemoteException {
            if (this.f1528rk != null) {
                this.f1528rk.onProgress(onDownloadProgressResponse.mo6136cR(), onDownloadProgressResponse.mo6137cS());
            }
        }

        /* renamed from: m */
        public void mo6162m(Status status) throws RemoteException {
            this.f1527jW.mo5612a(new C0692h.C0698a(status, (Contents) null));
        }
    }

    /* renamed from: com.google.android.gms.drive.internal.k$c */
    private abstract class C0716c extends C0709i<DriveApi.ContentsResult> {
        private C0716c() {
        }

        /* renamed from: o */
        public DriveApi.ContentsResult mo5631e(Status status) {
            return new C0692h.C0698a(status, (Contents) null);
        }
    }

    public C0711k(DriveId driveId) {
        super(driveId);
    }

    public PendingResult<Status> commitAndCloseContents(GoogleApiClient apiClient, final Contents contents) {
        if (contents != null) {
            return apiClient.mo5868b(new C0714a() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5626a(C0710j jVar) {
                    try {
                        contents.close();
                        jVar.mo6205cN().mo6226a(new CloseContentsRequest(contents, true), (C0736p) new C0748z(this));
                    } catch (RemoteException e) {
                        mo5612a(new Status(8, e.getLocalizedMessage(), (PendingIntent) null));
                    }
                }
            });
        }
        throw new IllegalArgumentException("Contents must be provided.");
    }

    public PendingResult<Status> discardContents(GoogleApiClient apiClient, Contents contents) {
        return Drive.DriveApi.discardContents(apiClient, contents);
    }

    public PendingResult<DriveApi.ContentsResult> openContents(GoogleApiClient apiClient, final int mode, final DriveFile.DownloadProgressListener listener) {
        if (mode == 268435456 || mode == 536870912 || mode == 805306368) {
            return apiClient.mo5867a(new C0716c() {
                /* access modifiers changed from: protected */
                /* renamed from: a */
                public void mo5626a(C0710j jVar) {
                    try {
                        jVar.mo6205cN().mo6231a(new OpenContentsRequest(C0711k.this.getDriveId(), mode), (C0736p) new C0715b(this, listener));
                    } catch (RemoteException e) {
                        mo5612a(new C0692h.C0698a(new Status(8, e.getLocalizedMessage(), (PendingIntent) null), (Contents) null));
                    }
                }
            });
        }
        throw new IllegalArgumentException("Invalid mode provided.");
    }
}
