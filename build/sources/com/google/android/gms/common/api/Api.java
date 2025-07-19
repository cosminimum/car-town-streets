package com.google.android.gms.common.api;

import android.content.Context;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.C1067dt;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public final class Api {

    /* renamed from: mS */
    private final C0647b<?> f1320mS;

    /* renamed from: mT */
    private final ArrayList<Scope> f1321mT;

    /* renamed from: com.google.android.gms.common.api.Api$a */
    public interface C0646a {
        void connect();

        void disconnect();

        boolean isConnected();
    }

    /* renamed from: com.google.android.gms.common.api.Api$b */
    public interface C0647b<T extends C0646a> {
        /* renamed from: b */
        T mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener);

        int getPriority();
    }

    public Api(C0647b<?> ClientBuilder, Scope... impliedScopes) {
        this.f1320mS = ClientBuilder;
        this.f1321mT = new ArrayList<>(Arrays.asList(impliedScopes));
    }

    /* renamed from: bj */
    public C0647b<?> mo5861bj() {
        return this.f1320mS;
    }

    /* renamed from: bk */
    public List<Scope> mo5862bk() {
        return this.f1321mT;
    }
}
