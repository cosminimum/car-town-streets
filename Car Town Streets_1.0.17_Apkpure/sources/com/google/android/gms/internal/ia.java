package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.Collection;
/* loaded from: classes.dex */
public final class ia implements People {
    private final Api.b<hs> Ea;

    /* loaded from: classes.dex */
    private static abstract class a extends Plus.a<People.LoadPeopleResult> {
        a(Api.b<hs> bVar) {
            super(bVar);
        }

        @Override // com.google.android.gms.common.api.PendingResult
        /* renamed from: L */
        public People.LoadPeopleResult e(final Status status) {
            return new People.LoadPeopleResult() { // from class: com.google.android.gms.internal.ia.a.1
                @Override // com.google.android.gms.plus.People.LoadPeopleResult
                public String getNextPageToken() {
                    return null;
                }

                @Override // com.google.android.gms.plus.People.LoadPeopleResult
                public PersonBuffer getPersonBuffer() {
                    return null;
                }

                @Override // com.google.android.gms.common.api.Result
                public Status getStatus() {
                    return status;
                }

                @Override // com.google.android.gms.common.api.Releasable
                public void release() {
                }
            };
        }
    }

    public ia(Api.b<hs> bVar) {
        this.Ea = bVar;
    }

    @Override // com.google.android.gms.plus.People
    public Person getCurrentPerson(GoogleApiClient googleApiClient) {
        return Plus.a(googleApiClient, this.Ea).getCurrentPerson();
    }

    @Override // com.google.android.gms.plus.People
    public PendingResult<People.LoadPeopleResult> load(GoogleApiClient googleApiClient, final Collection<String> personIds) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.ia.4
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.a(this, personIds);
            }
        });
    }

    @Override // com.google.android.gms.plus.People
    public PendingResult<People.LoadPeopleResult> load(GoogleApiClient googleApiClient, final String... personIds) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.ia.5
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.a(this, personIds);
            }
        });
    }

    @Override // com.google.android.gms.plus.People
    public PendingResult<People.LoadPeopleResult> loadConnected(GoogleApiClient googleApiClient) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.ia.3
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.k(this);
            }
        });
    }

    @Override // com.google.android.gms.plus.People
    public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient googleApiClient, final int orderBy, final String pageToken) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.ia.1
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.a(this, orderBy, pageToken);
            }
        });
    }

    @Override // com.google.android.gms.plus.People
    public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient googleApiClient, final String pageToken) {
        return googleApiClient.a((GoogleApiClient) new a(this.Ea) { // from class: com.google.android.gms.internal.ia.2
            /* JADX INFO: Access modifiers changed from: protected */
            @Override // com.google.android.gms.common.api.a.AbstractC0011a
            public void a(hs hsVar) {
                hsVar.i(this, pageToken);
            }
        });
    }
}
