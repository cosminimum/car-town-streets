package com.google.android.gms.games;

import android.content.Context;
import android.content.Intent;
import android.view.View;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.games.achievement.Achievements;
import com.google.android.gms.games.leaderboard.Leaderboards;
import com.google.android.gms.games.multiplayer.Invitations;
import com.google.android.gms.games.multiplayer.Multiplayer;
import com.google.android.gms.games.multiplayer.realtime.RealTimeMultiplayer;
import com.google.android.gms.games.multiplayer.turnbased.TurnBasedMultiplayer;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1141fl;
import com.google.android.gms.internal.C1218fs;
import com.google.android.gms.internal.C1232ft;
import com.google.android.gms.internal.C1233fu;
import com.google.android.gms.internal.C1237fv;
import com.google.android.gms.internal.C1241fw;
import com.google.android.gms.internal.C1257fx;
import com.google.android.gms.internal.C1258fy;
import com.google.android.gms.internal.C1259fz;
import com.google.android.gms.internal.C1269ga;
import com.google.android.gms.internal.C1270gb;
import com.google.android.gms.internal.C1297gg;

public final class Games {
    public static final Api API = new Api(f1651jO, SCOPE_GAMES);
    public static final Achievements Achievements = new C1218fs();
    public static final GamesMetadata GamesMetadata = new C1233fu();
    public static final Invitations Invitations = new C1237fv();
    public static final Leaderboards Leaderboards = new C1241fw();
    public static final Notifications Notifications = new C1258fy();
    public static final Players Players = new C1259fz();
    public static final RealTimeMultiplayer RealTimeMultiplayer = new C1269ga();
    public static final Scope SCOPE_GAMES = new Scope(Scopes.GAMES);
    public static final TurnBasedMultiplayer TurnBasedMultiplayer = new C1270gb();

    /* renamed from: jO */
    static final Api.C0647b<C1141fl> f1651jO = new Api.C0647b<C1141fl>() {
        /* renamed from: e */
        public C1141fl mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            GamesOptions gamesOptions;
            GamesOptions gamesOptions2 = new GamesOptions();
            if (apiOptions != null) {
                C1102eg.m2615b(apiOptions instanceof GamesOptions, (Object) "Must provide valid GamesOptions!");
                gamesOptions = (GamesOptions) apiOptions;
            } else {
                gamesOptions = gamesOptions2;
            }
            return new C1141fl(context, dtVar.mo7437bJ(), dtVar.mo7433bF(), connectionCallbacks, onConnectionFailedListener, dtVar.mo7436bI(), dtVar.mo7434bG(), dtVar.mo7438bK(), gamesOptions.f1656ta, gamesOptions.f1657tb, gamesOptions.f1658tc, gamesOptions.f1659td);
        }

        public int getPriority() {
            return 1;
        }
    };

    /* renamed from: sW */
    public static final Scope f1652sW = new Scope("https://www.googleapis.com/auth/games.firstparty");

    /* renamed from: sX */
    public static final Api f1653sX = new Api(f1651jO, f1652sW);

    /* renamed from: sY */
    public static final Multiplayer f1654sY = new C1257fx();

    /* renamed from: sZ */
    public static final C1297gg f1655sZ = new C1232ft();

    public static final class GamesOptions implements GoogleApiClient.ApiOptions {

        /* renamed from: ta */
        final boolean f1656ta;

        /* renamed from: tb */
        final boolean f1657tb;

        /* renamed from: tc */
        final int f1658tc;

        /* renamed from: td */
        final int f1659td;

        public static final class Builder {

            /* renamed from: ta */
            boolean f1660ta;

            /* renamed from: tb */
            boolean f1661tb;

            /* renamed from: tc */
            int f1662tc;

            /* renamed from: td */
            int f1663td;

            private Builder() {
                this.f1660ta = false;
                this.f1661tb = true;
                this.f1662tc = 17;
                this.f1663td = 4368;
            }

            public GamesOptions build() {
                return new GamesOptions(this);
            }

            public Builder setSdkVariant(int variant) {
                this.f1663td = variant;
                return this;
            }

            public Builder setShowConnectingPopup(boolean showConnectingPopup) {
                this.f1661tb = showConnectingPopup;
                this.f1662tc = 17;
                return this;
            }

            public Builder setShowConnectingPopup(boolean showConnectingPopup, int gravity) {
                this.f1661tb = showConnectingPopup;
                this.f1662tc = gravity;
                return this;
            }
        }

        private GamesOptions() {
            this.f1656ta = false;
            this.f1657tb = true;
            this.f1658tc = 17;
            this.f1659td = 4368;
        }

        private GamesOptions(Builder builder) {
            this.f1656ta = builder.f1660ta;
            this.f1657tb = builder.f1661tb;
            this.f1658tc = builder.f1662tc;
            this.f1659td = builder.f1663td;
        }

        public static Builder builder() {
            return new Builder();
        }
    }

    /* renamed from: com.google.android.gms.games.Games$a */
    public static abstract class C0782a<R extends Result> extends C0655a.C0656a<R, C1141fl> implements PendingResult<R> {
        public C0782a() {
            super(Games.f1651jO);
        }
    }

    /* renamed from: com.google.android.gms.games.Games$b */
    private static abstract class C0783b extends C0782a<Status> {
        private C0783b() {
        }

        /* renamed from: g */
        public Status mo5631e(Status status) {
            return status;
        }
    }

    private Games() {
    }

    public static String getAppId(GoogleApiClient apiClient) {
        return m1707j(apiClient).getAppId();
    }

    public static String getCurrentAccountName(GoogleApiClient apiClient) {
        return m1707j(apiClient).getCurrentAccountName();
    }

    public static int getSdkVariant(GoogleApiClient apiClient) {
        return m1707j(apiClient).mo7749dd();
    }

    public static Intent getSettingsIntent(GoogleApiClient apiClient) {
        return m1707j(apiClient).getSettingsIntent();
    }

    /* renamed from: j */
    public static C1141fl m1707j(GoogleApiClient googleApiClient) {
        boolean z = true;
        C1102eg.m2615b(googleApiClient != null, (Object) "GoogleApiClient parameter is required.");
        C1102eg.m2612a(googleApiClient.isConnected(), "GoogleApiClient must be connected.");
        C1141fl flVar = (C1141fl) googleApiClient.mo5866a(f1651jO);
        if (flVar == null) {
            z = false;
        }
        C1102eg.m2612a(z, "GoogleApiClient is not configured to use the Games Api. Pass Games.API into GoogleApiClient.Builder#addApi() to use this feature.");
        return flVar;
    }

    public static void setGravityForPopups(GoogleApiClient apiClient, int gravity) {
        m1707j(apiClient).setGravityForPopups(gravity);
    }

    public static void setViewForPopups(GoogleApiClient apiClient, View gamesContentView) {
        C1102eg.m2616f(gamesContentView);
        m1707j(apiClient).setViewForPopups(gamesContentView);
    }

    public static PendingResult<Status> signOut(GoogleApiClient apiClient) {
        return apiClient.mo5868b(new C0783b() {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1141fl flVar) {
                flVar.mo7740b(this);
            }
        });
    }
}
