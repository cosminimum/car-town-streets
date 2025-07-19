package com.google.android.gms.cast;

import com.google.android.gms.cast.Cast;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.ResultCallback;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1040dg;
import com.google.android.gms.internal.C1053dl;
import com.google.android.gms.internal.C1056dm;
import com.google.android.gms.internal.C1057dn;
import java.io.IOException;
import org.json.JSONObject;

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

    /* renamed from: fx */
    public final Object f1262fx = new Object();
    /* access modifiers changed from: private */

    /* renamed from: ld */
    public final C1053dl f1263ld = new C1053dl() {
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

    /* renamed from: le */
    public final C0637a f1264le = new C0637a();

    /* renamed from: lf */
    private OnMetadataUpdatedListener f1265lf;

    /* renamed from: lg */
    private OnStatusUpdatedListener f1266lg;

    public interface MediaChannelResult extends Result {
    }

    public interface OnMetadataUpdatedListener {
        void onMetadataUpdated();
    }

    public interface OnStatusUpdatedListener {
        void onStatusUpdated();
    }

    /* renamed from: com.google.android.gms.cast.RemoteMediaPlayer$a */
    private class C0637a implements C1056dm {

        /* renamed from: lr */
        private GoogleApiClient f1290lr;

        /* renamed from: ls */
        private long f1291ls = 0;

        /* renamed from: com.google.android.gms.cast.RemoteMediaPlayer$a$a */
        private final class C0638a implements ResultCallback<Status> {

            /* renamed from: lt */
            private final long f1292lt;

            C0638a(long j) {
                this.f1292lt = j;
            }

            /* renamed from: j */
            public void onResult(Status status) {
                if (!status.isSuccess()) {
                    RemoteMediaPlayer.this.f1263ld.mo7328a(this.f1292lt, status.getStatusCode());
                }
            }
        }

        public C0637a() {
        }

        /* renamed from: a */
        public void mo5825a(String str, String str2, long j, String str3) throws IOException {
            if (this.f1290lr == null) {
                throw new IOException("No GoogleApiClient available");
            }
            Cast.CastApi.sendMessage(this.f1290lr, str, str2).setResultCallback(new C0638a(j));
        }

        /* renamed from: aR */
        public long mo5826aR() {
            long j = this.f1291ls + 1;
            this.f1291ls = j;
            return j;
        }

        /* renamed from: b */
        public void mo5827b(GoogleApiClient googleApiClient) {
            this.f1290lr = googleApiClient;
        }
    }

    /* renamed from: com.google.android.gms.cast.RemoteMediaPlayer$b */
    private static abstract class C0639b extends Cast.C0626a<MediaChannelResult> {

        /* renamed from: lv */
        C1057dn f1294lv = new C1057dn() {
            /* renamed from: a */
            public void mo5831a(long j, int i, JSONObject jSONObject) {
                C0639b.this.mo5612a(new C0642c(new Status(i), jSONObject));
            }

            /* renamed from: g */
            public void mo5832g(long j) {
                C0639b.this.mo5612a(C0639b.this.mo5631e(new Status(4)));
            }
        };

        C0639b() {
        }

        /* renamed from: k */
        public MediaChannelResult mo5631e(final Status status) {
            return new MediaChannelResult() {
                public Status getStatus() {
                    return status;
                }
            };
        }
    }

    /* renamed from: com.google.android.gms.cast.RemoteMediaPlayer$c */
    private static final class C0642c implements MediaChannelResult {

        /* renamed from: jY */
        private final Status f1298jY;

        /* renamed from: kM */
        private final JSONObject f1299kM;

        C0642c(Status status, JSONObject jSONObject) {
            this.f1298jY = status;
            this.f1299kM = jSONObject;
        }

        public Status getStatus() {
            return this.f1298jY;
        }
    }

    public RemoteMediaPlayer() {
        this.f1263ld.mo7329a(this.f1264le);
    }

    /* access modifiers changed from: private */
    public void onMetadataUpdated() {
        if (this.f1265lf != null) {
            this.f1265lf.onMetadataUpdated();
        }
    }

    /* access modifiers changed from: private */
    public void onStatusUpdated() {
        if (this.f1266lg != null) {
            this.f1266lg.onStatusUpdated();
        }
    }

    public long getApproximateStreamPosition() {
        long approximateStreamPosition;
        synchronized (this.f1262fx) {
            approximateStreamPosition = this.f1263ld.getApproximateStreamPosition();
        }
        return approximateStreamPosition;
    }

    public MediaInfo getMediaInfo() {
        MediaInfo mediaInfo;
        synchronized (this.f1262fx) {
            mediaInfo = this.f1263ld.getMediaInfo();
        }
        return mediaInfo;
    }

    public MediaStatus getMediaStatus() {
        MediaStatus mediaStatus;
        synchronized (this.f1262fx) {
            mediaStatus = this.f1263ld.getMediaStatus();
        }
        return mediaStatus;
    }

    public String getNamespace() {
        return this.f1263ld.getNamespace();
    }

    public long getStreamDuration() {
        long streamDuration;
        synchronized (this.f1262fx) {
            streamDuration = this.f1263ld.getStreamDuration();
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
        return apiClient.mo5868b(new C0639b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1040dg dgVar) {
                synchronized (RemoteMediaPlayer.this.f1262fx) {
                    RemoteMediaPlayer.this.f1264le.mo5827b(googleApiClient);
                    try {
                        RemoteMediaPlayer.this.f1263ld.mo7386a(this.f1294lv, mediaInfo2, z, j, jSONObject);
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IOException e) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                        throw th;
                    }
                }
            }
        });
    }

    public void onMessageReceived(CastDevice castDevice, String namespace, String message) {
        this.f1263ld.mo7327B(message);
    }

    public void pause(GoogleApiClient apiClient) throws IOException {
        pause(apiClient, (JSONObject) null);
    }

    public void pause(GoogleApiClient apiClient, JSONObject customData) throws IOException {
        synchronized (this.f1262fx) {
            this.f1264le.mo5827b(apiClient);
            try {
                this.f1263ld.mo7389c(customData);
                this.f1264le.mo5827b((GoogleApiClient) null);
            } catch (Throwable th) {
                this.f1264le.mo5827b((GoogleApiClient) null);
                throw th;
            }
        }
    }

    public void play(GoogleApiClient apiClient) throws IOException, IllegalStateException {
        play(apiClient, (JSONObject) null);
    }

    public void play(GoogleApiClient apiClient, JSONObject customData) throws IOException, IllegalStateException {
        synchronized (this.f1262fx) {
            this.f1264le.mo5827b(apiClient);
            try {
                this.f1263ld.mo7391e(customData);
                this.f1264le.mo5827b((GoogleApiClient) null);
            } catch (Throwable th) {
                this.f1264le.mo5827b((GoogleApiClient) null);
                throw th;
            }
        }
    }

    public PendingResult<MediaChannelResult> requestStatus(final GoogleApiClient apiClient) {
        return apiClient.mo5868b(new C0639b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1040dg dgVar) {
                synchronized (RemoteMediaPlayer.this.f1262fx) {
                    RemoteMediaPlayer.this.f1264le.mo5827b(apiClient);
                    try {
                        RemoteMediaPlayer.this.f1263ld.mo7383a(this.f1294lv);
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IOException e) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
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
        return apiClient.mo5868b(new C0639b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1040dg dgVar) {
                synchronized (RemoteMediaPlayer.this.f1262fx) {
                    RemoteMediaPlayer.this.f1264le.mo5827b(googleApiClient);
                    try {
                        RemoteMediaPlayer.this.f1263ld.mo7385a(this.f1294lv, j, i, jSONObject);
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IOException e) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                        throw th;
                    }
                }
            }
        });
    }

    public void setOnMetadataUpdatedListener(OnMetadataUpdatedListener listener) {
        this.f1265lf = listener;
    }

    public void setOnStatusUpdatedListener(OnStatusUpdatedListener listener) {
        this.f1266lg = listener;
    }

    public PendingResult<MediaChannelResult> setStreamMute(GoogleApiClient apiClient, boolean muteState) {
        return setStreamMute(apiClient, muteState, (JSONObject) null);
    }

    public PendingResult<MediaChannelResult> setStreamMute(final GoogleApiClient apiClient, final boolean muteState, final JSONObject customData) {
        return apiClient.mo5868b(new C0639b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1040dg dgVar) {
                synchronized (RemoteMediaPlayer.this.f1262fx) {
                    RemoteMediaPlayer.this.f1264le.mo5827b(apiClient);
                    try {
                        RemoteMediaPlayer.this.f1263ld.mo7387a(this.f1294lv, muteState, customData);
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IllegalStateException e) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IOException e2) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
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
        return apiClient.mo5868b(new C0639b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1040dg dgVar) {
                synchronized (RemoteMediaPlayer.this.f1262fx) {
                    RemoteMediaPlayer.this.f1264le.mo5827b(googleApiClient);
                    try {
                        RemoteMediaPlayer.this.f1263ld.mo7384a(this.f1294lv, d, jSONObject);
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IllegalStateException e) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IllegalArgumentException e2) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (IOException e3) {
                        mo5612a(mo5631e(new Status(1)));
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
                    } catch (Throwable th) {
                        RemoteMediaPlayer.this.f1264le.mo5827b((GoogleApiClient) null);
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
        synchronized (this.f1262fx) {
            this.f1264le.mo5827b(apiClient);
            try {
                this.f1263ld.mo7390d(customData);
                this.f1264le.mo5827b((GoogleApiClient) null);
            } catch (Throwable th) {
                this.f1264le.mo5827b((GoogleApiClient) null);
                throw th;
            }
        }
    }
}
