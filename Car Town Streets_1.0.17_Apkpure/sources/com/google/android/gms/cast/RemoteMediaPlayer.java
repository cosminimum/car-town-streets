package com.google.android.gms.cast;

import com.google.android.gms.cast.Cast;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.dg;
import com.google.android.gms.internal.dl;
import com.google.android.gms.internal.dm;
import com.google.android.gms.internal.dn;
import java.io.IOException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class RemoteMediaPlayer implements Cast.MessageReceivedCallback {
    public static final int RESUME_STATE_PAUSE = 2;
    public static final int RESUME_STATE_PLAY = 1;
    public static final int RESUME_STATE_UNCHANGED = 0;
    public static final int STATUS_CANCELED = 2;
    public static final int STATUS_FAILED = 1;
    public static final int STATUS_REPLACED = 4;
    public static final int STATUS_SUCCEEDED = 0;
    public static final int STATUS_TIMED_OUT = 3;
    private OnMetadataUpdatedListener lf;
    private OnStatusUpdatedListener lg;
    private final Object fx = new Object();
    private final a le = new a();
    private final dl ld = new dl() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.1
        @Override // com.google.android.gms.internal.dl
        protected void onMetadataUpdated() {
            RemoteMediaPlayer.this.onMetadataUpdated();
        }

        @Override // com.google.android.gms.internal.dl
        protected void onStatusUpdated() {
            RemoteMediaPlayer.this.onStatusUpdated();
        }
    };

    /* loaded from: classes.dex */
    public interface MediaChannelResult extends Result {
    }

    /* loaded from: classes.dex */
    public interface OnMetadataUpdatedListener {
        void onMetadataUpdated();
    }

    /* loaded from: classes.dex */
    public interface OnStatusUpdatedListener {
        void onStatusUpdated();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class a implements dm {
        private GoogleApiClient lr;
        private long ls = 0;

        /* renamed from: com.google.android.gms.cast.RemoteMediaPlayer$a$a  reason: collision with other inner class name */
        /* loaded from: classes.dex */
        private final class C0010a implements ResultCallback<Status> {
            private final long lt;

            C0010a(long j) {
                this.lt = j;
            }

            @Override // com.google.android.gms.common.api.ResultCallback
            /* renamed from: j */
            public void onResult(Status status) {
                if (!status.isSuccess()) {
                    RemoteMediaPlayer.this.ld.a(this.lt, status.getStatusCode());
                }
            }
        }

        public a() {
        }

        @Override // com.google.android.gms.internal.dm
        public void a(String str, String str2, long j, String str3) throws IOException {
            if (this.lr == null) {
                throw new IOException("No GoogleApiClient available");
            }
            Cast.CastApi.sendMessage(this.lr, str, str2).setResultCallback(new C0010a(j));
        }

        @Override // com.google.android.gms.internal.dm
        public long aR() {
            long j = this.ls + 1;
            this.ls = j;
            return j;
        }

        public void b(GoogleApiClient googleApiClient) {
            this.lr = googleApiClient;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static abstract class b extends Cast.a<MediaChannelResult> {
        dn lv = new dn() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.b.1
            @Override // com.google.android.gms.internal.dn
            public void a(long j, int i, JSONObject jSONObject) {
                b.this.a((b) new c(new Status(i), jSONObject));
            }

            @Override // com.google.android.gms.internal.dn
            public void g(long j) {
                b.this.a((b) b.this.e(new Status(4)));
            }
        };

        b() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: k */
        public MediaChannelResult e(final Status status) {
            return new MediaChannelResult() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.b.2
                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* loaded from: classes.dex */
    private static final class c implements MediaChannelResult {
        private final Status jY;
        private final JSONObject kM;

        c(Status status, JSONObject jSONObject) {
            this.jY = status;
            this.kM = jSONObject;
        }

        @Override // com.google.android.gms.common.api.Result
        public Status getStatus() {
            return this.jY;
        }
    }

    public RemoteMediaPlayer() {
        this.ld.a(this.le);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onMetadataUpdated() {
        if (this.lf != null) {
            this.lf.onMetadataUpdated();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void onStatusUpdated() {
        if (this.lg != null) {
            this.lg.onStatusUpdated();
        }
    }

    public long getApproximateStreamPosition() {
        long approximateStreamPosition;
        synchronized (this.fx) {
            approximateStreamPosition = this.ld.getApproximateStreamPosition();
        }
        return approximateStreamPosition;
    }

    public MediaInfo getMediaInfo() {
        MediaInfo mediaInfo;
        synchronized (this.fx) {
            mediaInfo = this.ld.getMediaInfo();
        }
        return mediaInfo;
    }

    public MediaStatus getMediaStatus() {
        MediaStatus mediaStatus;
        synchronized (this.fx) {
            mediaStatus = this.ld.getMediaStatus();
        }
        return mediaStatus;
    }

    public String getNamespace() {
        return this.ld.getNamespace();
    }

    public long getStreamDuration() {
        long streamDuration;
        synchronized (this.fx) {
            streamDuration = this.ld.getStreamDuration();
        }
        return streamDuration;
    }

    public PendingResult<MediaChannelResult> load(GoogleApiClient apiClient, MediaInfo mediaInfo) {
        return load(apiClient, mediaInfo, true, 0L, null);
    }

    public PendingResult<MediaChannelResult> load(GoogleApiClient apiClient, MediaInfo mediaInfo, boolean autoplay) {
        return load(apiClient, mediaInfo, autoplay, 0L, null);
    }

    public PendingResult<MediaChannelResult> load(GoogleApiClient apiClient, MediaInfo mediaInfo, boolean autoplay, long playPosition) {
        return load(apiClient, mediaInfo, autoplay, playPosition, null);
    }

    public PendingResult<MediaChannelResult> load(final GoogleApiClient apiClient, final MediaInfo mediaInfo, final boolean autoplay, final long playPosition, final JSONObject customData) {
        return apiClient.b(new b() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, mediaInfo, autoplay, playPosition, customData);
                        RemoteMediaPlayer.this.le.b(null);
                    } catch (IOException e) {
                        a((AnonymousClass2) k(new Status(1)));
                        RemoteMediaPlayer.this.le.b(null);
                    }
                }
            }
        });
    }

    @Override // com.google.android.gms.cast.Cast.MessageReceivedCallback
    public void onMessageReceived(CastDevice castDevice, String namespace, String message) {
        this.ld.B(message);
    }

    public void pause(GoogleApiClient apiClient) throws IOException {
        pause(apiClient, null);
    }

    public void pause(GoogleApiClient apiClient, JSONObject customData) throws IOException {
        synchronized (this.fx) {
            this.le.b(apiClient);
            this.ld.c(customData);
            this.le.b(null);
        }
    }

    public void play(GoogleApiClient apiClient) throws IOException, IllegalStateException {
        play(apiClient, null);
    }

    public void play(GoogleApiClient apiClient, JSONObject customData) throws IOException, IllegalStateException {
        synchronized (this.fx) {
            this.le.b(apiClient);
            this.ld.e(customData);
            this.le.b(null);
        }
    }

    public PendingResult<MediaChannelResult> requestStatus(final GoogleApiClient apiClient) {
        return apiClient.b(new b() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.6
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv);
                        RemoteMediaPlayer.this.le.b(null);
                    } catch (IOException e) {
                        a((AnonymousClass6) k(new Status(1)));
                        RemoteMediaPlayer.this.le.b(null);
                    }
                }
            }
        });
    }

    public PendingResult<MediaChannelResult> seek(GoogleApiClient apiClient, long position) {
        return seek(apiClient, position, 0, null);
    }

    public PendingResult<MediaChannelResult> seek(GoogleApiClient apiClient, long position, int resumeState) {
        return seek(apiClient, position, resumeState, null);
    }

    public PendingResult<MediaChannelResult> seek(final GoogleApiClient apiClient, final long position, final int resumeState, final JSONObject customData) {
        return apiClient.b(new b() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, position, resumeState, customData);
                        RemoteMediaPlayer.this.le.b(null);
                    } catch (IOException e) {
                        a((AnonymousClass3) k(new Status(1)));
                        RemoteMediaPlayer.this.le.b(null);
                    }
                }
            }
        });
    }

    public void setOnMetadataUpdatedListener(OnMetadataUpdatedListener listener) {
        this.lf = listener;
    }

    public void setOnStatusUpdatedListener(OnStatusUpdatedListener listener) {
        this.lg = listener;
    }

    public PendingResult<MediaChannelResult> setStreamMute(GoogleApiClient apiClient, boolean muteState) {
        return setStreamMute(apiClient, muteState, null);
    }

    public PendingResult<MediaChannelResult> setStreamMute(final GoogleApiClient apiClient, final boolean muteState, final JSONObject customData) {
        return apiClient.b(new b() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, muteState, customData);
                        RemoteMediaPlayer.this.le.b(null);
                    } catch (IOException e) {
                        a((AnonymousClass5) k(new Status(1)));
                        RemoteMediaPlayer.this.le.b(null);
                    } catch (IllegalStateException e2) {
                        a((AnonymousClass5) k(new Status(1)));
                        RemoteMediaPlayer.this.le.b(null);
                    }
                }
            }
        });
    }

    public PendingResult<MediaChannelResult> setStreamVolume(GoogleApiClient apiClient, double volume) throws IllegalArgumentException {
        return setStreamVolume(apiClient, volume, null);
    }

    public PendingResult<MediaChannelResult> setStreamVolume(final GoogleApiClient apiClient, final double volume, final JSONObject customData) throws IllegalArgumentException {
        if (Double.isInfinite(volume) || Double.isNaN(volume)) {
            throw new IllegalArgumentException("Volume cannot be " + volume);
        }
        return apiClient.b(new b() { // from class: com.google.android.gms.cast.RemoteMediaPlayer.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        try {
                            try {
                                RemoteMediaPlayer.this.ld.a(this.lv, volume, customData);
                                RemoteMediaPlayer.this.le.b(null);
                            } catch (IOException e) {
                                a((AnonymousClass4) k(new Status(1)));
                                RemoteMediaPlayer.this.le.b(null);
                            }
                        } catch (IllegalArgumentException e2) {
                            a((AnonymousClass4) k(new Status(1)));
                            RemoteMediaPlayer.this.le.b(null);
                        }
                    } catch (IllegalStateException e3) {
                        a((AnonymousClass4) k(new Status(1)));
                        RemoteMediaPlayer.this.le.b(null);
                    }
                }
            }
        });
    }

    public void stop(GoogleApiClient apiClient) throws IOException {
        stop(apiClient, null);
    }

    public void stop(GoogleApiClient apiClient, JSONObject customData) throws IOException {
        synchronized (this.fx) {
            this.le.b(apiClient);
            this.ld.d(customData);
            this.le.b(null);
        }
    }
}
