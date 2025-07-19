package com.google.android.gms.plus;

import android.content.Context;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Result;
import com.google.android.gms.common.api.Scope;
import com.google.android.gms.internal.C1067dt;
import com.google.android.gms.internal.C1102eg;
import com.google.android.gms.internal.C1368hs;
import com.google.android.gms.internal.C1377hu;
import com.google.android.gms.internal.C1380hx;
import com.google.android.gms.internal.C1383hy;
import com.google.android.gms.internal.C1384hz;
import com.google.android.gms.internal.C1394ia;
import java.util.HashSet;
import java.util.Set;

public final class Plus {
    public static final Api API = new Api(f3715jO, new Scope[0]);
    public static final Account AccountApi = new C1380hx(f3715jO);

    /* renamed from: Dr */
    public static final C1617a f3714Dr = new C1383hy(f3715jO);
    public static final Moments MomentsApi = new C1384hz(f3715jO);
    public static final People PeopleApi = new C1394ia(f3715jO);
    public static final Scope SCOPE_PLUS_LOGIN = new Scope(Scopes.PLUS_LOGIN);
    public static final Scope SCOPE_PLUS_PROFILE = new Scope(Scopes.PLUS_ME);

    /* renamed from: jO */
    static final Api.C0647b<C1368hs> f3715jO = new Api.C0647b<C1368hs>() {
        /* renamed from: g */
        public C1368hs mo5621b(Context context, C1067dt dtVar, GoogleApiClient.ApiOptions apiOptions, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener) {
            PlusOptions plusOptions;
            PlusOptions plusOptions2 = new PlusOptions();
            if (apiOptions != null) {
                C1102eg.m2615b(apiOptions instanceof PlusOptions, (Object) "Must provide valid PlusOptions!");
                plusOptions = (PlusOptions) apiOptions;
            } else {
                plusOptions = plusOptions2;
            }
            return new C1368hs(context, connectionCallbacks, onConnectionFailedListener, new C1377hu(dtVar.mo7433bF(), dtVar.mo7436bI(), (String[]) plusOptions.f3717Dt.toArray(new String[0]), new String[0], context.getPackageName(), context.getPackageName(), (String) null));
        }

        public int getPriority() {
            return 2;
        }
    };

    public static final class PlusOptions implements GoogleApiClient.ApiOptions {

        /* renamed from: Ds */
        final String f3716Ds;

        /* renamed from: Dt */
        final Set<String> f3717Dt;

        public static final class Builder {

            /* renamed from: Ds */
            String f3718Ds;

            /* renamed from: Dt */
            final Set<String> f3719Dt = new HashSet();

            public Builder addActivityTypes(String... activityTypes) {
                C1102eg.m2614b(activityTypes, (Object) "activityTypes may not be null.");
                for (String add : activityTypes) {
                    this.f3719Dt.add(add);
                }
                return this;
            }

            public PlusOptions build() {
                return new PlusOptions(this);
            }

            public Builder setServerClientId(String clientId) {
                this.f3718Ds = clientId;
                return this;
            }
        }

        private PlusOptions() {
            this.f3716Ds = null;
            this.f3717Dt = new HashSet();
        }

        private PlusOptions(Builder builder) {
            this.f3716Ds = builder.f3718Ds;
            this.f3717Dt = builder.f3719Dt;
        }

        public static Builder builder() {
            return new Builder();
        }
    }

    /* renamed from: com.google.android.gms.plus.Plus$a */
    public static abstract class C1604a<R extends Result> extends C0655a.C0656a<R, C1368hs> {
        public C1604a(Api.C0647b<C1368hs> bVar) {
            super(bVar);
        }
    }

    private Plus() {
    }

    /* renamed from: a */
    public static C1368hs m4296a(GoogleApiClient googleApiClient, Api.C0647b<C1368hs> bVar) {
        boolean z = true;
        C1102eg.m2615b(googleApiClient != null, (Object) "GoogleApiClient parameter is required.");
        C1102eg.m2612a(googleApiClient.isConnected(), "GoogleApiClient must be connected.");
        C1368hs hsVar = (C1368hs) googleApiClient.mo5866a(bVar);
        if (hsVar == null) {
            z = false;
        }
        C1102eg.m2612a(z, "GoogleApiClient is not configured to use the Plus.API Api. Pass this into GoogleApiClient.Builder#addApi() to use this feature.");
        return hsVar;
    }
}
