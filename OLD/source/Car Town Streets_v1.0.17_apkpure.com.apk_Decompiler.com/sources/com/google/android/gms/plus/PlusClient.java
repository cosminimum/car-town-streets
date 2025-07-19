package com.google.android.gms.plus;

import android.content.Context;
import android.net.Uri;
import com.google.android.gms.common.ConnectionResult;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.internal.hs;
import com.google.android.gms.internal.hv;
import com.google.android.gms.plus.Moments;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.Collection;

@Deprecated
public class PlusClient implements GooglePlayServicesClient {
    final hs Du;

    @Deprecated
    public static class Builder {
        private final hv DA = new hv(this.mContext);
        private final GooglePlayServicesClient.ConnectionCallbacks Dz;
        private final GooglePlayServicesClient.OnConnectionFailedListener jE;
        private final Context mContext;

        public Builder(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener connectionFailedListener) {
            this.mContext = context;
            this.Dz = connectionCallbacks;
            this.jE = connectionFailedListener;
        }

        public PlusClient build() {
            return new PlusClient(new hs(this.mContext, this.Dz, this.jE, this.DA.eZ()));
        }

        public Builder clearScopes() {
            this.DA.eY();
            return this;
        }

        public Builder setAccountName(String accountName) {
            this.DA.aA(accountName);
            return this;
        }

        public Builder setActions(String... actions) {
            this.DA.e(actions);
            return this;
        }

        public Builder setScopes(String... scopes) {
            this.DA.d(scopes);
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

    PlusClient(hs plusClientImpl) {
        this.Du = plusClientImpl;
    }

    @Deprecated
    public void clearDefaultAccount() {
        this.Du.clearDefaultAccount();
    }

    @Deprecated
    public void connect() {
        this.Du.connect();
    }

    @Deprecated
    public void disconnect() {
        this.Du.disconnect();
    }

    /* access modifiers changed from: package-private */
    public hs eK() {
        return this.Du;
    }

    @Deprecated
    public String getAccountName() {
        return this.Du.getAccountName();
    }

    @Deprecated
    public Person getCurrentPerson() {
        return this.Du.getCurrentPerson();
    }

    @Deprecated
    public boolean isConnected() {
        return this.Du.isConnected();
    }

    @Deprecated
    public boolean isConnecting() {
        return this.Du.isConnecting();
    }

    @Deprecated
    public boolean isConnectionCallbacksRegistered(GooglePlayServicesClient.ConnectionCallbacks listener) {
        return this.Du.isConnectionCallbacksRegistered(listener);
    }

    @Deprecated
    public boolean isConnectionFailedListenerRegistered(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        return this.Du.isConnectionFailedListenerRegistered(listener);
    }

    @Deprecated
    public void loadMoments(final OnMomentsLoadedListener listener) {
        this.Du.j(new a.c<Moments.LoadMomentsResult>() {
            public void a(Moments.LoadMomentsResult loadMomentsResult) {
                listener.onMomentsLoaded(loadMomentsResult.getStatus().bu(), loadMomentsResult.getMomentBuffer(), loadMomentsResult.getNextPageToken(), loadMomentsResult.getUpdated());
            }
        });
    }

    @Deprecated
    public void loadMoments(final OnMomentsLoadedListener listener, int maxResults, String pageToken, Uri targetUrl, String type, String userId) {
        this.Du.a(new a.c<Moments.LoadMomentsResult>() {
            public void a(Moments.LoadMomentsResult loadMomentsResult) {
                listener.onMomentsLoaded(loadMomentsResult.getStatus().bu(), loadMomentsResult.getMomentBuffer(), loadMomentsResult.getNextPageToken(), loadMomentsResult.getUpdated());
            }
        }, maxResults, pageToken, targetUrl, type, userId);
    }

    @Deprecated
    public void loadPeople(final OnPeopleLoadedListener listener, Collection<String> personIds) {
        this.Du.a((a.c<People.LoadPeopleResult>) new a.c<People.LoadPeopleResult>() {
            public void a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, personIds);
    }

    @Deprecated
    public void loadPeople(final OnPeopleLoadedListener listener, String... personIds) {
        this.Du.a((a.c<People.LoadPeopleResult>) new a.c<People.LoadPeopleResult>() {
            public void a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, personIds);
    }

    @Deprecated
    public void loadVisiblePeople(final OnPeopleLoadedListener listener, int orderBy, String pageToken) {
        this.Du.a((a.c<People.LoadPeopleResult>) new a.c<People.LoadPeopleResult>() {
            public void a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, orderBy, pageToken);
    }

    @Deprecated
    public void loadVisiblePeople(final OnPeopleLoadedListener listener, String pageToken) {
        this.Du.i(new a.c<People.LoadPeopleResult>() {
            public void a(People.LoadPeopleResult loadPeopleResult) {
                listener.onPeopleLoaded(loadPeopleResult.getStatus().bu(), loadPeopleResult.getPersonBuffer(), loadPeopleResult.getNextPageToken());
            }
        }, pageToken);
    }

    @Deprecated
    public void registerConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Du.registerConnectionCallbacks(listener);
    }

    @Deprecated
    public void registerConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Du.registerConnectionFailedListener(listener);
    }

    @Deprecated
    public void removeMoment(String momentId) {
        this.Du.removeMoment(momentId);
    }

    @Deprecated
    public void revokeAccessAndDisconnect(final OnAccessRevokedListener listener) {
        this.Du.l(new a.c<Status>() {
            public void a(Status status) {
                listener.onAccessRevoked(status.getStatus().bu());
            }
        });
    }

    @Deprecated
    public void unregisterConnectionCallbacks(GooglePlayServicesClient.ConnectionCallbacks listener) {
        this.Du.unregisterConnectionCallbacks(listener);
    }

    @Deprecated
    public void unregisterConnectionFailedListener(GooglePlayServicesClient.OnConnectionFailedListener listener) {
        this.Du.unregisterConnectionFailedListener(listener);
    }

    @Deprecated
    public void writeMoment(Moment moment) {
        this.Du.writeMoment(moment);
    }
}
