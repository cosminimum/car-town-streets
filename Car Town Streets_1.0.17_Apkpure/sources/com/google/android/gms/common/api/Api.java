package com.google.android.gms.common.api;

import android.content.Context;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.internal.dt;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes.dex */
public final class Api {
    private final b<?> mS;
    private final ArrayList<Scope> mT;

    /* loaded from: classes.dex */
    public interface a {
        void connect();

        void disconnect();

        boolean isConnected();
    }

    /* loaded from: classes.dex */
    public interface b<T extends a> {
        T b(Context context, dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener);

        int getPriority();
    }

    public Api(b<?> ClientBuilder, Scope... impliedScopes) {
        this.mS = ClientBuilder;
        this.mT = new ArrayList<>(Arrays.asList(impliedScopes));
    }

    public b<?> bj() {
        return this.mS;
    }

    public List<Scope> bk() {
        return this.mT;
    }
}
