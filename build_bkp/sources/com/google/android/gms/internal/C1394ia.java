package com.google.android.gms.internal;

import com.google.android.gms.common.api.Api;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.PendingResult;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.Plus;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.Collection;

/* renamed from: com.google.android.gms.internal.ia */
public final class C1394ia implements People {

    /* renamed from: Ea */
    private final Api.C0647b<C1368hs> f3257Ea;

    /* renamed from: com.google.android.gms.internal.ia$a */
    private static abstract class C1400a extends Plus.C1604a<People.LoadPeopleResult> {
        C1400a(Api.C0647b<C1368hs> bVar) {
            super(bVar);
        }

        /* renamed from: L */
        public People.LoadPeopleResult mo5631e(final Status status) {
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

    public C1394ia(Api.C0647b<C1368hs> bVar) {
        this.f3257Ea = bVar;
    }

    public Person getCurrentPerson(GoogleApiClient googleApiClient) {
        return Plus.m4296a(googleApiClient, this.f3257Ea).getCurrentPerson();
    }

    public PendingResult<People.LoadPeopleResult> load(GoogleApiClient googleApiClient, final Collection<String> personIds) {
        return googleApiClient.mo5867a(new C1400a(this.f3257Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8290a((C0655a.C0659c<People.LoadPeopleResult>) this, (Collection<String>) personIds);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> load(GoogleApiClient googleApiClient, final String... personIds) {
        return googleApiClient.mo5867a(new C1400a(this.f3257Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8291a((C0655a.C0659c<People.LoadPeopleResult>) this, personIds);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> loadConnected(GoogleApiClient googleApiClient) {
        return googleApiClient.mo5867a(new C1400a(this.f3257Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8299k(this);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient googleApiClient, final int orderBy, final String pageToken) {
        return googleApiClient.mo5867a(new C1400a(this.f3257Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8288a((C0655a.C0659c<People.LoadPeopleResult>) this, orderBy, pageToken);
            }
        });
    }

    public PendingResult<People.LoadPeopleResult> loadVisible(GoogleApiClient googleApiClient, final String pageToken) {
        return googleApiClient.mo5867a(new C1400a(this.f3257Ea) {
            /* access modifiers changed from: protected */
            /* renamed from: a */
            public void mo5626a(C1368hs hsVar) {
                hsVar.mo8297i(this, pageToken);
            }
        });
    }
}
