package com.google.android.gms.plus;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.internal.C1368hs;
import com.google.android.gms.internal.C1378hv;
import com.google.android.gms.plus.Moments;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.Collection;

@Deprecated
public class PlusClient implements GooglePlayServicesClient {

    /* renamed from: Du */
    final C1368hs f3720Du;

    @Deprecated
    public static class Builder {

        /* renamed from: DA */
        private final C1378hv f3735DA = new C1378hv(this.mContext);

        /* renamed from: Dz */
        private final GooglePlayServicesClient.ConnectionCallbacks f3736Dz;

        /* renamed from: jE */
        private final GooglePlayServicesClient.OnConnectionFailedListener f3737jE;
        private final Context mContext;

        public Builder(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
            this.mContext = context;
            this.f3736Dz = connectionCallbacks;
            this.f3737jE = connectionFailedListener;
        }

        public PlusClient build() {
            return new PlusClient(new C1368hs(this.mContext, this.f3736Dz, this.f3737jE, this.f3735DA.mo8329eZ()));
        }

        public Builder clearScopes() {
            this.f3735DA.mo8328eY();
            return this;
        }

        public Builder setAccountName(String accountName) {
            this.f3735DA.mo8325aA(accountName);
            return this;
        }

        public Builder setActions(String... actions) {
            this.f3735DA.mo8327e(actions);
            return this;
        }

        public Builder setScopes(String... scopes) {
            this.f3735DA.mo8326d(scopes);
            return this;
        }
    }

    @Deprecated
    public interface OnAccessRevokedListener {
        void onAccessRevoked(ConnectionResult connectionResult);
    }

    @Deprecated
    public interface OnMomentsLoadedListener {
        @Deprecated
        void onMomentsLoaded(ConnectionResult connectionResult, MomentBuffer momentBuffer, String str, String str2);
    }

    @Deprecated
    public interface OnPeopleLoadedListener {
        void onPeopleLoaded(ConnectionResult connectionResult, PersonBuffer personBuffer, String str);
    }

    @Deprecated
    public interface OrderBy {
        @Deprecated
        public static final int ALPHABETICAL = 0;
        @Deprecated
        public static final int BEST = 1;
    }

    PlusClient(C1368hs plusClientImpl) {
        this.f3720Du = plusClientImpl;
    }

    @Deprecated
    public void clearDefaultAccount() {
        this.f3720Du.clearDefaultAccount();
    }

    @Deprecated
    public void connect() {
        this.f3720Du.connect();
    }

    @Deprecated
    public void disconnect() {
        this.f3720Du.disconnect();
    }

    /* access modifiers changed from: package-private */
    /* renamed from: eK */
    public C1368hs mo9697eK() {
        return this.f3720Du;
    }

    @Deprecated
    public String getAccountName() {
        return this.f3720Du.getAccountName();
    }

    @Deprecated
    public Person getCurrentPerson() {
        return this.f3720Du.getCurrentPerson();
    }

    @Deprecated
    public boolean isConnected() {
        return this.f3720Du.isConnected();
    }

    @Deprecated
    public boolean isConnecting() {
        return this.f3720Du.isConnecting();
    }

    @Deprecated
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.f3720Du.isConnectionCallbacksRegistered(listener);
    }

    @Deprecated
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.f3720Du.isConnectionFailedListenerRegistered(listener);
    }

    @Deprecated
    public void loadMoments(final OnMomentsLoadedListener listener) {
        this.f3720Du.mo8298j(new C0655a.C0659c<Moments.LoadMomentsResult>() {
            /* renamed from: a */
            public void mo5612a(Moments.LoadMomentsResult loadMomentsResult) {
                listener.onMomentsLoaded(loadMomentsResult.getStatus().mo5908bu(), loadMomentsResult.getMomentBuffer(), loadMomentsResult.getNextPageToken(), loadMomentsResult.getUpdated());
            }
        });
    }

    @Deprecated
    public void loadMoments(final OnMomentsLoadedListener listener, int maxResults, String pageToken, Uri targetUrl, String type, String userId) {
        this.f3720Du.mo8289a(new C0655a.C0659c<Moments.LoadMomentsResult>() {
            /* renamed from: a */
            public void mo5612a(Moments.LoadMomentsResult loadMomentsResult) {
                listener.onMomentsLoaded(loadMomentsResult.getStatus().mo5908bu(), loadMomentsResult.getMomentBuffer(), loadMomentsResult.getNextPageToken(), loadMomentsResult.getUpdated());
            }
        }, maxResults, pageToken, targetUrl, type, userId);
    }

    @Deprecated
    public void loadPeople(final OnPeopleLoadedListener listener, Collection<String> personIds) {
        this.f3720Du.mo8290a((C0655a.C0659c<People.LoadPeopleResult>) new C0655a.C0659c<People.LoadPeopleResult>() {
            /* renamed from: a */
            public void mo5612a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().mo5908bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, personIds);
    }

    @Deprecated
    public void loadPeople(final OnPeopleLoadedListener listener, String... personIds) {
        this.f3720Du.mo8291a((C0655a.C0659c<People.LoadPeopleResult>) new C0655a.C0659c<People.LoadPeopleResult>() {
            /* renamed from: a */
            public void mo5612a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().mo5908bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, personIds);
    }

    @Deprecated
    public void loadVisiblePeople(final OnPeopleLoadedListener listener, int orderBy, String pageToken) {
        this.f3720Du.mo8288a((C0655a.C0659c<People.LoadPeopleResult>) new C0655a.C0659c<People.LoadPeopleResult>() {
            /* renamed from: a */
            public void mo5612a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().mo5908bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, orderBy, pageToken);
    }

    @Deprecated
    public void loadVisiblePeople(final OnPeopleLoadedListener listener, String pageToken) {
        this.f3720Du.mo8297i(new C0655a.C0659c<People.LoadPeopleResult>() {
            /* renamed from: a */
            public void mo5612a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().mo5908bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, pageToken);
    }

    @Deprecated
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3720Du.registerConnectionCallbacks(listener);
    }

    @Deprecated
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3720Du.registerConnectionFailedListener(listener);
    }

    @Deprecated
    public void removeMoment(String momentId) {
        this.f3720Du.removeMoment(momentId);
    }

    @Deprecated
    public void revokeAccessAndDisconnect(final OnAccessRevokedListener listener) {
        this.f3720Du.mo8300l(new C0655a.C0659c<Status>() {
            /* renamed from: a */
            public void mo5612a(Status status) {
                listener.onAccessRevoked(status.getStatus().mo5908bu());
            }
        });
    }

    @Deprecated
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.f3720Du.unregisterConnectionCallbacks(listener);
    }

    @Deprecated
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.f3720Du.unregisterConnectionFailedListener(listener);
    }

    @Deprecated
    public void writeMoment(Moment moment) {
        this.f3720Du.writeMoment(moment);
    }
}
