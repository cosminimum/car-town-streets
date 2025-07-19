package com.google.android.gms.cast;

import android.app.PendingIntent;
import android.content.Context;
import android.os.RemoteException;
import android.text.TextUtils;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1040dg;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1102eg;
import java.io.IOException;

public final class Cast {
    public static final Api API = new Api(f1201jO, new Scope[0]);
    public static final CastApi CastApi = new CastApi.C0616a();
    public static final String EXTRA_APP_NO_LONGER_RUNNING = "com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING";
    public static final int MAX_MESSAGE_LENGTH = 65536;
    public static final int MAX_NAMESPACE_LENGTH = 128;

    /* renamed from: jO */
    static final Api.C0647b<C1040dg> f1201jO = new Api.C0647b<C1040dg>() {
        /* renamed from: c */
        public C1040dg mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            C1102eg.m2614b(apiOptions, (Object) "Setting the API options is required.");
            C1102eg.m2615b(apiOptions instanceof CastOptions, (Object) "Must provide valid CastOptions!");
            CastOptions castOptions = (CastOptions) apiOptions;
            return new C1040dg(context, castOptions.f1220ks, (long) castOptions.f1222ku, castOptions.f1221kt, connectionCallbacks, onConnectionFailedListener);
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

        /* renamed from: com.google.android.gms.cast.Cast$CastApi$a */
        public static final class C0616a implements CastApi {
            public ApplicationMetadata getApplicationMetadata(GoogleApiClient client) throws IllegalStateException {
                return ((C1040dg) client.mo5866a(Cast.f1201jO)).getApplicationMetadata();
            }

            public String getApplicationStatus(GoogleApiClient client) throws IllegalStateException {
                return ((C1040dg) client.mo5866a(Cast.f1201jO)).getApplicationStatus();
            }

            public double getVolume(GoogleApiClient client) throws IllegalStateException {
                return ((C1040dg) client.mo5866a(Cast.f1201jO)).mo7341aW();
            }

            public boolean isMute(GoogleApiClient client) throws IllegalStateException {
                return ((C1040dg) client.mo5866a(Cast.f1201jO)).isMute();
            }

            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client) {
                return client.mo5868b(new C0628c() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7342b((String) null, (String) null, this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client, final String applicationId) {
                return client.mo5868b(new C0628c() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7342b(applicationId, (String) null, this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client, final String applicationId, final String sessionId) {
                return client.mo5868b(new C0628c() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7342b(applicationId, sessionId, this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient client, final String applicationId) {
                return client.mo5868b(new C0628c() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7339a(applicationId, false, (C0655a.C0659c<ApplicationConnectionResult>) this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient client, final String applicationId, final boolean relaunchIfRunning) {
                return client.mo5868b(new C0628c() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7339a(applicationId, relaunchIfRunning, (C0655a.C0659c<ApplicationConnectionResult>) this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public PendingResult<Status> leaveApplication(GoogleApiClient client) {
                return client.mo5868b(new C0627b() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7343e((C0655a.C0659c<Status>) this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public void removeMessageReceivedCallbacks(GoogleApiClient client, String namespace) throws IOException, IllegalStateException {
                try {
                    ((C1040dg) client.mo5866a(Cast.f1201jO)).mo7334C(namespace);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public void requestStatus(GoogleApiClient client) throws IOException, IllegalStateException {
                try {
                    ((C1040dg) client.mo5866a(Cast.f1201jO)).mo7340aV();
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public PendingResult<Status> sendMessage(GoogleApiClient client, final String namespace, final String message) {
                return client.mo5868b(new C0627b() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7338a(namespace, message, (C0655a.C0659c<Status>) this);
                        } catch (IllegalArgumentException e) {
                            mo5714r(2001);
                        } catch (IllegalStateException e2) {
                            mo5714r(2001);
                        } catch (RemoteException e3) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public void setMessageReceivedCallbacks(GoogleApiClient client, String namespace, MessageReceivedCallback callbacks) throws IOException, IllegalStateException {
                try {
                    ((C1040dg) client.mo5866a(Cast.f1201jO)).mo7336a(namespace, callbacks);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public void setMute(GoogleApiClient client, boolean mute) throws IOException, IllegalStateException {
                try {
                    ((C1040dg) client.mo5866a(Cast.f1201jO)).mo7347n(mute);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public void setVolume(GoogleApiClient client, double volume) throws IOException, IllegalArgumentException, IllegalStateException {
                try {
                    ((C1040dg) client.mo5866a(Cast.f1201jO)).mo7335a(volume);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            public PendingResult<Status> stopApplication(GoogleApiClient client) {
                return client.mo5868b(new C0627b() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        try {
                            dgVar.mo7337a("", (C0655a.C0659c<Status>) this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
                        }
                    }
                });
            }

            public PendingResult<Status> stopApplication(GoogleApiClient client, final String sessionId) {
                return client.mo5868b(new C0627b() {
                    /* access modifiers changed from: protected */
                    /* renamed from: a */
                    public void mo5626a(C1040dg dgVar) {
                        if (TextUtils.isEmpty(sessionId)) {
                            mo5713c(2001, "IllegalArgument: sessionId cannot be null or empty");
                            return;
                        }
                        try {
                            dgVar.mo7337a(sessionId, (C0655a.C0659c<Status>) this);
                        } catch (IllegalStateException e) {
                            mo5714r(2001);
                        } catch (RemoteException e2) {
                            mo5714r(8);
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

        /* renamed from: ks */
        final CastDevice f1220ks;

        /* renamed from: kt */
        final Listener f1221kt;
        /* access modifiers changed from: private */

        /* renamed from: ku */
        public final int f1222ku;

        public static final class Builder {

            /* renamed from: kv */
            CastDevice f1223kv;

            /* renamed from: kw */
            Listener f1224kw;
            /* access modifiers changed from: private */

            /* renamed from: kx */
            public int f1225kx;

            private Builder(CastDevice castDevice, Listener castListener) {
                this.f1223kv = castDevice;
                this.f1224kw = castListener;
                this.f1225kx = 0;
            }

            public CastOptions build() {
                return new CastOptions(this);
            }

            public Builder setDebuggingEnabled() {
                this.f1225kx |= 1;
                return this;
            }
        }

        private CastOptions(Builder builder) {
            this.f1220ks = builder.f1223kv;
            this.f1221kt = builder.f1224kw;
            this.f1222ku = builder.f1225kx;
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

    /* renamed from: com.google.android.gms.cast.Cast$a */
    protected static abstract class C0626a<R extends Result> extends C0655a.C0656a<R, C1040dg> implements PendingResult<R> {
        public C0626a() {
            super(Cast.f1201jO);
        }

        /* renamed from: c */
        public void mo5713c(int i, String str) {
            mo5612a(mo5631e(new Status(i, str, (PendingIntent) null)));
        }

        /* renamed from: r */
        public void mo5714r(int i) {
            mo5612a(mo5631e(new Status(i)));
        }
    }

    /* renamed from: com.google.android.gms.cast.Cast$b */
    private static abstract class C0627b extends C0626a<Status> {
        private C0627b() {
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    /* renamed from: com.google.android.gms.cast.Cast$c */
    private static abstract class C0628c extends C0626a<ApplicationConnectionResult> {
        private C0628c() {
        }

        /* renamed from: i */
        public ApplicationConnectionResult mo5631e(final Status status) {
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
