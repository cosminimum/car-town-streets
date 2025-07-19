package google.android.gms.cast;

import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.dg;
import com.google.android.gms.internal.dl;
import com.google.android.gms.internal.dm;
import com.google.android.gms.internal.dn;

import org.json.JSONObject;

import java.io.IOException;

public class RemoteMediaPlayer implements Cast.MessageReceivedCallback {
    public static final int RESUME_STATE_PAUSE = 2;
    public static final int RESUME_STATE_PLAY = 1;
    public static final int RESUME_STATE_UNCHANGED = 0;
    public static final int STATUS_CANCELED = 2;
    public static final int STATUS_FAILED = 1;
    public static final int STATUS_REPLACED = 4;
    public static final int STATUS_SUCCEEDED = 0;
    public static final int STATUS_TIMED_OUT = 3;
    /* access modifiers changed from: private */
    public final Object fx = new Object();
    /* access modifiers changed from: private */
    public final dl ld = new dl() {
        /* access modifiers changed from: protected */
        public void onMetadataUpdated() {
            RemoteMediaPlayer.this.onMetadataUpdated();
        }

        /* access modifiers changed from: protected */
        public void onStatusUpdated() {
            RemoteMediaPlayer.this.onStatusUpdated();
        }
    };
    /* access modifiers changed from: private */
    public final a le = new a();
    private OnMetadataUpdatedListener lf;
    private OnStatusUpdatedListener lg;

    public interface MediaChannelResult extends Result {
    }

    public interface OnMetadataUpdatedListener {
        void onMetadataUpdated();
    }

    public interface OnStatusUpdatedListener {
        void onStatusUpdated();
    }

    private class a implements dm {
        private GoogleApiClient lr;
        private long ls = 0;

        /* renamed from: com.google.android.gms.cast.RemoteMediaPlayer$a$a  reason: collision with other inner class name */
        private final class C0010a implements ResultCallback<Status> {
            private final long lt;

            C0010a(long j) {
                this.lt = j;
            }

            /* renamed from: j */
            public void onResult(Status status) {
                if (!status.isSuccess()) {
                    RemoteMediaPlayer.this.ld.a(this.lt, status.getStatusCode());
                }
            }
        }

        public a() {
        }

        public void a(String str, String str2, long j, String str3) throws IOException {
            if (this.lr == null) {
                throw new IOException("No GoogleApiClient available");
            }
            Cast.CastApi.sendMessage(this.lr, str, str2).setResultCallback(new C0010a(j));
        }

        public long aR() {
            long j = this.ls + 1;
            this.ls = j;
            return j;
        }

        public void b(GoogleApiClient googleApiClient) {
            this.lr = googleApiClient;
        }
    }

    private static abstract class b extends Cast.a<MediaChannelResult> {
        dn lv = new dn() {
            public void a(long j, int i, JSONObject jSONObject) {
                b.this.a(new c(new Status(i), jSONObject));
            }

            public void g(long j) {
                b.this.a(b.this.e(new Status(4)));
            }
        };

        b() {
        }

        /* renamed from: k */
        public MediaChannelResult e(final Status status) {
            return new MediaChannelResult() {
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    private static final class c implements MediaChannelResult {
        private final Status jY;
        private final JSONObject kM;

        c(Status status, JSONObject jSONObject) {
            this.jY = status;
            this.kM = jSONObject;
        }

        public Status getStatus() {
            return this.jY;
        }
    }

    public RemoteMediaPlayer() {
        this.ld.a(this.le);
    }

    /* access modifiers changed from: private */
    public void onMetadataUpdated() {
        if (this.lf != null) {
            this.lf.onMetadataUpdated();
        }
    }

    /* access modifiers changed from: private */
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
        return load(apiClient, mediaInfo, true, 0, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> load(GoogleApiClient apiClient, MediaInfo mediaInfo, boolean autoplay) {
        return load(apiClient, mediaInfo, autoplay, 0, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> load(GoogleApiClient apiClient, MediaInfo mediaInfo, boolean autoplay, long playPosition) {
        return load(apiClient, mediaInfo, autoplay, playPosition, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> load(GoogleApiClient apiClient, MediaInfo mediaInfo, boolean autoplay, long playPosition, JSONObject customData) {
        final GoogleApiClient googleApiClient = apiClient;
        final MediaInfo mediaInfo2 = mediaInfo;
        final boolean z = autoplay;
        final long j = playPosition;
        final JSONObject jSONObject = customData;
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(googleApiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, mediaInfo2, z, j, jSONObject);
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IOException e) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                        throw th;
                    }
                }
            }
        });
    }

    public void onMessageReceived(CastDevice castDevice, String namespace, String message) {
        this.ld.B(message);
    }

    public void pause(GoogleApiClient apiClient) throws IOException {
        pause(apiClient, (JSONObject) null);
    }

    public void pause(GoogleApiClient apiClient, JSONObject customData) throws IOException {
        synchronized (this.fx) {
            this.le.b(apiClient);
            try {
                this.ld.c(customData);
                this.le.b((GoogleApiClient) null);
            } catch (Throwable th) {
                this.le.b((GoogleApiClient) null);
                throw th;
            }
        }
    }

    public void play(GoogleApiClient apiClient) throws IOException, IllegalStateException {
        play(apiClient, (JSONObject) null);
    }

    public void play(GoogleApiClient apiClient, JSONObject customData) throws IOException, IllegalStateException {
        synchronized (this.fx) {
            this.le.b(apiClient);
            try {
                this.ld.e(customData);
                this.le.b((GoogleApiClient) null);
            } catch (Throwable th) {
                this.le.b((GoogleApiClient) null);
                throw th;
            }
        }
    }

    public PendingResult<MediaChannelResult> requestStatus(final GoogleApiClient apiClient) {
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv);
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IOException e) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                        throw th;
                    }
                }
            }
        });
    }

    public PendingResult<MediaChannelResult> seek(GoogleApiClient apiClient, long position) {
        return seek(apiClient, position, 0, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> seek(GoogleApiClient apiClient, long position, int resumeState) {
        return seek(apiClient, position, resumeState, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> seek(GoogleApiClient apiClient, long position, int resumeState, JSONObject customData) {
        final GoogleApiClient googleApiClient = apiClient;
        final long j = position;
        final int i = resumeState;
        final JSONObject jSONObject = customData;
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(googleApiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, j, i, jSONObject);
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IOException e) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                        throw th;
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
        return setStreamMute(apiClient, muteState, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> setStreamMute(final GoogleApiClient apiClient, final boolean muteState, final JSONObject customData) {
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(apiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, muteState, customData);
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IllegalStateException e) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IOException e2) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                        throw th;
                    }
                }
            }
        });
    }

    public PendingResult<MediaChannelResult> setStreamVolume(GoogleApiClient apiClient, double volume) throws IllegalArgumentException {
        return setStreamVolume(apiClient, volume, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> setStreamVolume(GoogleApiClient apiClient, double volume, JSONObject customData) throws IllegalArgumentException {
        if (Double.isInfinite(volume) || Double.isNaN(volume)) {
            throw new IllegalArgumentException("Volume cannot be " + volume);
        }
        final GoogleApiClient googleApiClient = apiClient;
        final double d = volume;
        final JSONObject jSONObject = customData;
        return apiClient.b(new b() {
            /* access modifiers changed from: protected */
            public void a(dg dgVar) {
                synchronized (RemoteMediaPlayer.this.fx) {
                    RemoteMediaPlayer.this.le.b(googleApiClient);
                    try {
                        RemoteMediaPlayer.this.ld.a(this.lv, d, jSONObject);
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IllegalStateException e) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IllegalArgumentException e2) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (IOException e3) {
                        a(e(new Status(1)));
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.le.b((GoogleApiClient) null);
                        throw th;
                    }
                }
                return;
            }
        });
    }

    public void stop(GoogleApiClient apiClient) throws IOException {
        stop(apiClient, (JSONObject) null);
    }

    public void stop(GoogleApiClient apiClient, JSONObject customData) throws IOException {
        synchronized (this.fx) {
            this.le.b(apiClient);
            try {
                this.ld.d(customData);
                this.le.b((GoogleApiClient) null);
            } catch (Throwable th) {
                this.le.b((GoogleApiClient) null);
                throw th;
            }
        }
    }
}
