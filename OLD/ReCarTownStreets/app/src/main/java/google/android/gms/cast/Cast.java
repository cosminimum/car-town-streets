package google.android.gms.cast;

import android.app.PendingIntent;
import android.content.Context;
import android.os.RemoteException;
import android.text.TextUtils;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.dg;
import com.google.android.gms.internal.dt;
import com.google.android.gms.internal.eg;

import java.io.IOException;

import google.android.gms.cast.Cast.a;

public final class Cast {
    public static final Api API = new Api(jO, new Scope[0]);
    public static final CastApi CastApi = new CastApi.a();
    public static final String EXTRA_APP_NO_LONGER_RUNNING = "com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING";
    public static final int MAX_MESSAGE_LENGTH = 65536;
    public static final int MAX_NAMESPACE_LENGTH = 128;
    static final Api.b<dg> jO = new Api.b<dg>() {
        /* renamed from: c */
        public dg b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            eg.b(apiOptions, (Object) "Setting the API options is required.");
            eg.b(apiOptions instanceof CastOptions, (Object) "Must provide valid CastOptions!");
            CastOptions castOptions = (CastOptions) apiOptions;
            return new dg(context, castOptions.ks, (long) castOptions.ku, castOptions.kt, connectionCallbacks, onConnectionFailedListener);
        }

        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };

    public interface ApplicationConnectionResult extends Result {
        ApplicationMetadata getApplicationMetadata();

        String getApplicationStatus();

        String getSessionId();

        boolean getWasLaunched();
    }

    public interface CastApi {

        public static final class a implements CastApi {
            public ApplicationMetadata getApplicationMetadata(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).getApplicationMetadata();
            }

            public String getApplicationStatus(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).getApplicationStatus();
            }

            public double getVolume(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).aW();
            }

            public boolean isMute(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).isMute();
            }

            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client) {
                return client.b(new c() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.b((String) null, (String) null, this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client, final String applicationId) {
                return client.b(new c() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.b(applicationId, (String) null, this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client, final String applicationId, final String sessionId) {
                return client.b(new c() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.b(applicationId, sessionId, this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient client, final String applicationId) {
                return client.b(new c() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.a(applicationId, false, (a.c<ApplicationConnectionResult>) this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient client, final String applicationId, final boolean relaunchIfRunning) {
                return client.b(new c() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.a(applicationId, relaunchIfRunning, (a.c<ApplicationConnectionResult>) this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public PendingResult<Status> leaveApplication(GoogleApiClient client) {
                return client.b(new b() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.e((a.c<Status>) this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public void removeMessageReceivedCallbacks(GoogleApiClient client, String namespace) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).C(namespace);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public void requestStatus(GoogleApiClient client) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).aV();
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public PendingResult<Status> sendMessage(GoogleApiClient client, final String namespace, final String message) {
                return client.b(new b() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.a(namespace, message, (a.c<Status>) this);
                        } catch (IllegalArgumentException e) {
                            r(2001);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        } catch (RemoteException e3) {
                            r(8);
                        }
                    }
                });
            }

            public void setMessageReceivedCallbacks(GoogleApiClient client, String namespace, MessageReceivedCallback callbacks) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).a(namespace, callbacks);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public void setMute(GoogleApiClient client, boolean mute) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).n(mute);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public void setVolume(GoogleApiClient client, double volume) throws IOException, IllegalArgumentException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).a(volume);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public PendingResult<Status> stopApplication(GoogleApiClient client) {
                return client.b(new b() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        try {
                            dgVar.a("", (a.c<Status>) this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }

            public PendingResult<Status> stopApplication(GoogleApiClient client, final String sessionId) {
                return client.b(new b() {
                    /* access modifiers changed from: protected */
                    public void a(dg dgVar) {
                        if (TextUtils.isEmpty(sessionId)) {
                            c(2001, "IllegalArgument: sessionId cannot be null or empty");
                            return;
                        }
                        try {
                            dgVar.a(sessionId, (a.c<Status>) this);
                        } catch (IllegalStateException e) {
                            r(2001);
                        } catch (RemoteException e2) {
                            r(8);
                        }
                    }
                });
            }
        }

        ApplicationMetadata getApplicationMetadata(GoogleApiClient googleApiClient) throws IllegalStateException;

        String getApplicationStatus(GoogleApiClient googleApiClient) throws IllegalStateException;

        double getVolume(GoogleApiClient googleApiClient) throws IllegalStateException;

        boolean isMute(GoogleApiClient googleApiClient) throws IllegalStateException;

        PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient googleApiClient);

        PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient googleApiClient, String str);

        PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient googleApiClient, String str, String str2);

        PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient googleApiClient, String str);

        PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient googleApiClient, String str, boolean z);

        PendingResult<Status> leaveApplication(GoogleApiClient googleApiClient);

        void removeMessageReceivedCallbacks(GoogleApiClient googleApiClient, String str) throws IOException, IllegalStateException;

        void requestStatus(GoogleApiClient googleApiClient) throws IOException, IllegalStateException;

        PendingResult<Status> sendMessage(GoogleApiClient googleApiClient, String str, String str2);

        void setMessageReceivedCallbacks(GoogleApiClient googleApiClient, String str, MessageReceivedCallback messageReceivedCallback) throws IOException, IllegalStateException;

        void setMute(GoogleApiClient googleApiClient, boolean z) throws IOException, IllegalStateException;

        void setVolume(GoogleApiClient googleApiClient, double d) throws IOException, IllegalArgumentException, IllegalStateException;

        PendingResult<Status> stopApplication(GoogleApiClient googleApiClient);

        PendingResult<Status> stopApplication(GoogleApiClient googleApiClient, String str);
    }

    public static final class CastOptions implements GoogleApiClient.ApiOptions {
        final CastDevice ks;
        final Listener kt;
        /* access modifiers changed from: private */
        public final int ku;

        public static final class Builder {
            CastDevice kv;
            Listener kw;
            /* access modifiers changed from: private */
            public int kx;

            private Builder(CastDevice castDevice, Listener castListener) {
                this.kv = castDevice;
                this.kw = castListener;
                this.kx = 0;
            }

            public CastOptions build() {
                return new CastOptions(this);
            }

            public Builder setDebuggingEnabled() {
                this.kx |= 1;
                return this;
            }
        }

        private CastOptions(Builder builder) {
            this.ks = builder.kv;
            this.kt = builder.kw;
            this.ku = builder.kx;
        }

        public static Builder builder(CastDevice castDevice, Listener castListener) {
            return new Builder(castDevice, castListener);
        }
    }

    public static abstract class Listener {
        public void onApplicationDisconnected(int statusCode) {
        }

        public void onApplicationStatusChanged() {
        }

        public void onVolumeChanged() {
        }
    }

    public interface MessageReceivedCallback {
        void onMessageReceived(CastDevice castDevice, String str, String str2);
    }

    protected static abstract class a<R extends Result> extends a.C0011a<R, dg> implements PendingResult<R> {
        public a() {
            super(Cast.jO);
        }

        public void c(int i, String str) {
            a(e(new Status(i, str, (PendingIntent) null)));
        }

        public void r(int i) {
            a(e(new Status(i)));
        }
    }

    private static abstract class b extends a<Status> {
        private b() {
        }

        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    private static abstract class c extends a<ApplicationConnectionResult> {
        private c() {
        }

        /* renamed from: i */
        public ApplicationConnectionResult e(final Status status) {
            return new ApplicationConnectionResult() {
                public ApplicationMetadata getApplicationMetadata() {
                    return null;
                }

                public String getApplicationStatus() {
                    return null;
                }

                public String getSessionId() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }

                public boolean getWasLaunched() {
                    return false;
                }
            };
        }
    }

    private Cast() {
    }
}
