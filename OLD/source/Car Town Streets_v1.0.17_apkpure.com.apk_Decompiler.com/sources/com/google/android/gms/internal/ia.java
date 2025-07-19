package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.api.a;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.Collection;

public final class ia implements People {
    private final Api.b<hs> Ea;

    private static abstract class a extends Plus.a<People.LoadPeopleResult> {
        a(Api.b<hs> bVar) {
            super(bVar);
        }

        /* renamed from: L */
        public People.LoadPeopleResult e(final Status status) {
            return new People.LoadPeopleResult() {
                public String getNextPageToken() {
                    return null;
                }

                public PersonBuffer getPersonBuffer() {
                    return null;
                }

                public Status getStatus() {
                    return status;
                }

                public void release() {
                }
            };
        }
    }

    public ia(Api.b<hs> bVar) {
        this.Ea = bVar;
    }

    public Person getCurrentPerson(GoogleApiClient googleApiClient) {
        return Plus.a(googleApiClient, this.Ea).getCurrentPerson();
    }

    public PendingResult<People.LoadPeopleResult> load(GoogleApiClient googleApiClient, final Collection<String> personIds) {
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.a((a.c<People.LoadPeopleResult>) this, (Collection<String>) personIds);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> load(GoogleApiClient googleApiClient, final String... personIds) {
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.a((a.c<People.LoadPeopleResult>) this, personIds);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> loadConnected(GoogleApiClient googleApiClient) {
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.k(this);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient googleApiClient, final int orderBy, final String pageToken) {
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.a((a.c<People.LoadPeopleResult>) this, orderBy, pageToken);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient googleApiClient, final String pageToken) {
        return googleApiClient.a(new a(this.Ea) {
            /* access modifiers changed from: protected */
            public void a(hs hsVar) {
                hsVar.i(this, pageToken);
            }
        });
    }
}
