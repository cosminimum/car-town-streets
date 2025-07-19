package com.google.android.gms.cast;

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
/* loaded from: classes.dex */
public final class Cast {
    public static final String EXTRA_APP_NO_LONGER_RUNNING = "com.google.android.gms.cast.EXTRA_APP_NO_LONGER_RUNNING";
    public static final int MAX_MESSAGE_LENGTH = 65536;
    public static final int MAX_NAMESPACE_LENGTH = 128;
    static final Api.b<dg> jO = new Api.b<dg>() { // from class: com.google.android.gms.cast.Cast.1
        @Override // com.google.android.gms.common.api.Api.b
        /* renamed from: c */
        public dg b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            eg.b(apiOptions, "Setting the API options is required.");
            eg.b(apiOptions instanceof CastOptions, "Must provide valid CastOptions!");
            CastOptions castOptions = (CastOptions) apiOptions;
            return new dg(context, castOptions.ks, castOptions.ku, castOptions.kt, connectionCallbacks, onConnectionFailedListener);
        }

        @Override // com.google.android.gms.common.api.Api.b
        public int getPriority() {
            return Integer.MAX_VALUE;
        }
    };
    public static final Api API = new Api(jO, new Scope[0]);
    public static final CastApi CastApi = new CastApi.a();

    /* loaded from: classes.dex */
    public interface ApplicationConnectionResult extends Result {
        ApplicationMetadata getApplicationMetadata();

        String getApplicationStatus();

        String getSessionId();

        boolean getWasLaunched();
    }

    /* loaded from: classes.dex */
    public interface CastApi {

        /* loaded from: classes.dex */
        public static final class a implements CastApi {
            @Override // com.google.android.gms.cast.Cast.CastApi
            public ApplicationMetadata getApplicationMetadata(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).getApplicationMetadata();
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public String getApplicationStatus(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).getApplicationStatus();
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public double getVolume(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).aW();
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public boolean isMute(GoogleApiClient client) throws IllegalStateException {
                return ((dg) client.a(Cast.jO)).isMute();
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client) {
                return client.b(new c() { // from class: com.google.android.gms.cast.Cast.CastApi.a.6
                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.b(null, null, this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client, final String applicationId) {
                return client.b(new c() { // from class: com.google.android.gms.cast.Cast.CastApi.a.5
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.b(applicationId, null, this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<ApplicationConnectionResult> joinApplication(GoogleApiClient client, final String applicationId, final String sessionId) {
                return client.b(new c() { // from class: com.google.android.gms.cast.Cast.CastApi.a.4
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.b(applicationId, sessionId, this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient client, final String applicationId) {
                return client.b(new c() { // from class: com.google.android.gms.cast.Cast.CastApi.a.2
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.a(applicationId, false, (a.c<ApplicationConnectionResult>) this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<ApplicationConnectionResult> launchApplication(GoogleApiClient client, final String applicationId, final boolean relaunchIfRunning) {
                return client.b(new c() { // from class: com.google.android.gms.cast.Cast.CastApi.a.3
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.a(applicationId, relaunchIfRunning, this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<Status> leaveApplication(GoogleApiClient client) {
                return client.b(new b() { // from class: com.google.android.gms.cast.Cast.CastApi.a.7
                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.e(this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public void removeMessageReceivedCallbacks(GoogleApiClient client, String namespace) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).C(namespace);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public void requestStatus(GoogleApiClient client) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).aV();
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<Status> sendMessage(GoogleApiClient client, final String namespace, final String message) {
                return client.b(new b() { // from class: com.google.android.gms.cast.Cast.CastApi.a.1
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.a(namespace, message, this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalArgumentException e2) {
                            r(2001);
                        } catch (IllegalStateException e3) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public void setMessageReceivedCallbacks(GoogleApiClient client, String namespace, MessageReceivedCallback callbacks) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).a(namespace, callbacks);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public void setMute(GoogleApiClient client, boolean mute) throws IOException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).n(mute);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public void setVolume(GoogleApiClient client, double volume) throws IOException, IllegalArgumentException, IllegalStateException {
                try {
                    ((dg) client.a(Cast.jO)).a(volume);
                } catch (RemoteException e) {
                    throw new IOException("service error");
                }
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<Status> stopApplication(GoogleApiClient client) {
                return client.b(new b() { // from class: com.google.android.gms.cast.Cast.CastApi.a.8
                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        try {
                            dgVar.a("", this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
                        }
                    }
                });
            }

            @Override // com.google.android.gms.cast.Cast.CastApi
            public PendingResult<Status> stopApplication(GoogleApiClient client, final String sessionId) {
                return client.b(new b() { // from class: com.google.android.gms.cast.Cast.CastApi.a.9
                    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
                    {
                        super();
                    }

                    /* JADX INFO: Access modifiers changed from: protected */
                    @Override // com.google.android.gms.common.api.a.AbstractC0011a
                    public void a(dg dgVar) {
                        if (TextUtils.isEmpty(sessionId)) {
                            c(2001, "IllegalArgument: sessionId cannot be null or empty");
                            return;
                        }
                        try {
                            dgVar.a(sessionId, this);
                        } catch (RemoteException e) {
                            r(8);
                        } catch (IllegalStateException e2) {
                            r(2001);
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

    /* loaded from: classes.dex */
    public static final class CastOptions implements GoogleApiClient.ApiOptions {
        final CastDevice ks;
        final Listener kt;
        private final int ku;

        /* loaded from: classes.dex */
        public static final class Builder {
            CastDevice kv;
            Listener kw;
            private int kx;

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

    /* loaded from: classes.dex */
    public static abstract class Listener {
        public void onApplicationDisconnected(int statusCode) {
        }

        public void onApplicationStatusChanged() {
        }

        public void onVolumeChanged() {
        }
    }

    /* loaded from: classes.dex */
    public interface MessageReceivedCallback {
        void onMessageReceived(CastDevice castDevice, String str, String str2);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes.dex */
    public static abstract class a<R extends Result> extends a.AbstractC0011a<R, dg> implements PendingResult<R> {
        public a() {
            super(Cast.jO);
        }

        public void c(int i, String str) {
            a((a<R>) e(new Status(i, str, null)));
        }

        public void r(int i) {
            a((a<R>) e(new Status(i)));
        }
    }

    /* loaded from: classes.dex */
    private static abstract class b extends a<Status> {
        private b() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: g */
        public Status e(Status status) {
            return status;
        }
    }

    /* loaded from: classes.dex */
    private static abstract class c extends a<ApplicationConnectionResult> {
        private c() {
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: i */
        public ApplicationConnectionResult e(final Status status) {
            return new ApplicationConnectionResult() { // from class: com.google.android.gms.cast.Cast.c.1
                @Override // com.google.android.gms.cast.Cast.ApplicationConnectionResult
                public ApplicationMetadata getApplicationMetadata() {
                    return null;
                }

                @Override // com.google.android.gms.cast.Cast.ApplicationConnectionResult
                public String getApplicationStatus() {
                    return null;
                }

                @Override // com.google.android.gms.cast.Cast.ApplicationConnectionResult
                public String getSessionId() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }

                @Override // com.google.android.gms.cast.Cast.ApplicationConnectionResult
                public boolean getWasLaunched() {
                    return false;
                }
            };
        }
    }

    private Cast() {
    }
}
