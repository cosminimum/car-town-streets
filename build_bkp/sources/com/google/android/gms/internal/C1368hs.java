package com.google.android.gms.internal;

import android.app.PendingIntent;
import android.content.Context;
import android.net.Uri;
import android.os.Bundle;
import android.os.IBinder;
import android.os.RemoteException;
import com.google.android.gms.common.GooglePlayServicesClient;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.api.C0655a;
import com.google.android.gms.common.api.GoogleApiClient;
import com.google.android.gms.common.api.Status;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.internal.C1071dw;
import com.google.android.gms.internal.C1365hr;
import com.google.android.gms.plus.Moments;
import com.google.android.gms.plus.People;
import com.google.android.gms.plus.model.moments.Moment;
import com.google.android.gms.plus.model.moments.MomentBuffer;
import com.google.android.gms.plus.model.people.Person;
import com.google.android.gms.plus.model.people.PersonBuffer;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

/* renamed from: com.google.android.gms.internal.hs */
public class C1368hs extends C1071dw<C1365hr> implements GooglePlayServicesClient {

    /* renamed from: DK */
    private Person f3203DK;

    /* renamed from: DL */
    private C1377hu f3204DL;

    /* renamed from: com.google.android.gms.internal.hs$a */
    final class C1369a extends C1355hn {

        /* renamed from: Dp */
        private final C0655a.C0659c<Moments.LoadMomentsResult> f3206Dp;

        public C1369a(C0655a.C0659c<Moments.LoadMomentsResult> cVar) {
            this.f3206Dp = cVar;
        }

        /* renamed from: a */
        public void mo8251a(DataHolder dataHolder, String str, String str2) {
            DataHolder dataHolder2;
            Status status = new Status(dataHolder.getStatusCode(), (String) null, dataHolder.getMetadata() != null ? (PendingIntent) dataHolder.getMetadata().getParcelable("pendingIntent") : null);
            if (status.isSuccess() || dataHolder == null) {
                dataHolder2 = dataHolder;
            } else {
                if (!dataHolder.isClosed()) {
                    dataHolder.close();
                }
                dataHolder2 = null;
            }
            C1368hs.this.mo7451a((C1071dw<T>.b<?>) new C1370b(this.f3206Dp, status, dataHolder2, str, str2));
        }
    }

    /* renamed from: com.google.android.gms.internal.hs$b */
    final class C1370b extends C1071dw<C1365hr>.d<C0655a.C0659c<Moments.LoadMomentsResult>> implements Moments.LoadMomentsResult {

        /* renamed from: DN */
        private final String f3208DN;

        /* renamed from: DO */
        private MomentBuffer f3209DO;

        /* renamed from: jY */
        private final Status f3210jY;

        /* renamed from: qT */
        private final String f3211qT;

        public C1370b(C0655a.C0659c<Moments.LoadMomentsResult> cVar, Status status, DataHolder dataHolder, String str, String str2) {
            super(cVar, dataHolder);
            this.f3210jY = status;
            this.f3211qT = str;
            this.f3208DN = str2;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<Moments.LoadMomentsResult> cVar, DataHolder dataHolder) {
            this.f3209DO = dataHolder != null ? new MomentBuffer(dataHolder) : null;
            cVar.mo5612a(this);
        }

        public MomentBuffer getMomentBuffer() {
            return this.f3209DO;
        }

        public String getNextPageToken() {
            return this.f3211qT;
        }

        public Status getStatus() {
            return this.f3210jY;
        }

        public String getUpdated() {
            return this.f3208DN;
        }

        public void release() {
            if (this.f3209DO != null) {
                this.f3209DO.close();
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.hs$c */
    final class C1371c extends C1355hn {

        /* renamed from: Dp */
        private final C0655a.C0659c<People.LoadPeopleResult> f3213Dp;

        public C1371c(C0655a.C0659c<People.LoadPeopleResult> cVar) {
            this.f3213Dp = cVar;
        }

        /* renamed from: a */
        public void mo8250a(DataHolder dataHolder, String str) {
            DataHolder dataHolder2;
            Status status = new Status(dataHolder.getStatusCode(), (String) null, dataHolder.getMetadata() != null ? (PendingIntent) dataHolder.getMetadata().getParcelable("pendingIntent") : null);
            if (status.isSuccess() || dataHolder == null) {
                dataHolder2 = dataHolder;
            } else {
                if (!dataHolder.isClosed()) {
                    dataHolder.close();
                }
                dataHolder2 = null;
            }
            C1368hs.this.mo7451a((C1071dw<T>.b<?>) new C1372d(this.f3213Dp, status, dataHolder2, str));
        }
    }

    /* renamed from: com.google.android.gms.internal.hs$d */
    final class C1372d extends C1071dw<C1365hr>.d<C0655a.C0659c<People.LoadPeopleResult>> implements People.LoadPeopleResult {

        /* renamed from: DP */
        private PersonBuffer f3215DP;

        /* renamed from: jY */
        private final Status f3216jY;

        /* renamed from: qT */
        private final String f3217qT;

        public C1372d(C0655a.C0659c<People.LoadPeopleResult> cVar, Status status, DataHolder dataHolder, String str) {
            super(cVar, dataHolder);
            this.f3216jY = status;
            this.f3217qT = str;
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public void mo7310a(C0655a.C0659c<People.LoadPeopleResult> cVar, DataHolder dataHolder) {
            this.f3215DP = dataHolder != null ? new PersonBuffer(dataHolder) : null;
            cVar.mo5612a(this);
        }

        public String getNextPageToken() {
            return this.f3217qT;
        }

        public PersonBuffer getPersonBuffer() {
            return this.f3215DP;
        }

        public Status getStatus() {
            return this.f3216jY;
        }

        public void release() {
            if (this.f3215DP != null) {
                this.f3215DP.close();
            }
        }
    }

    /* renamed from: com.google.android.gms.internal.hs$e */
    final class C1373e extends C1355hn {

        /* renamed from: Dp */
        private final C0655a.C0659c<Status> f3219Dp;

        public C1373e(C0655a.C0659c<Status> cVar) {
            this.f3219Dp = cVar;
        }

        /* renamed from: b */
        public void mo8254b(int i, Bundle bundle) {
            C1368hs.this.mo7451a((C1071dw<T>.b<?>) new C1374f(this.f3219Dp, new Status(i, (String) null, bundle != null ? (PendingIntent) bundle.getParcelable("pendingIntent") : null)));
        }
    }

    /* renamed from: com.google.android.gms.internal.hs$f */
    final class C1374f extends C1071dw<C1365hr>.b<C0655a.C0659c<Status>> {

        /* renamed from: jY */
        private final Status f3221jY;

        public C1374f(C0655a.C0659c<Status> cVar, Status status) {
            super(cVar);
            this.f3221jY = status;
        }

        /* access modifiers changed from: protected */
        /* renamed from: aL */
        public void mo7306aL() {
        }

        /* access modifiers changed from: protected */
        /* renamed from: c */
        public void mo7307b(C0655a.C0659c<Status> cVar) {
            C1368hs.this.disconnect();
            if (cVar != null) {
                cVar.mo5612a(this.f3221jY);
            }
        }
    }

    @Deprecated
    public C1368hs(Context context, GooglePlayServicesClient.ConnectionCallbacks connectionCallbacks, GooglePlayServicesClient.OnConnectionFailedListener onConnectionFailedListener, C1377hu huVar) {
        this(context, (GoogleApiClient.ConnectionCallbacks) new C1071dw.C1074c(connectionCallbacks), (GoogleApiClient.OnConnectionFailedListener) new C1071dw.C1078g(onConnectionFailedListener), huVar);
    }

    public C1368hs(Context context, GoogleApiClient.ConnectionCallbacks connectionCallbacks, GoogleApiClient.OnConnectionFailedListener onConnectionFailedListener, C1377hu huVar) {
        super(context, connectionCallbacks, onConnectionFailedListener, huVar.mo8312eR());
        this.f3204DL = huVar;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6201a(int i, IBinder iBinder, Bundle bundle) {
        if (i == 0 && bundle != null && bundle.containsKey("loaded_person")) {
            this.f3203DK = C1407ig.m3787g(bundle.getByteArray("loaded_person"));
        }
        super.mo6201a(i, iBinder, bundle);
    }

    /* renamed from: a */
    public void mo8288a(C0655a.C0659c<People.LoadPeopleResult> cVar, int i, String str) {
        mo7453bP();
        C1371c cVar2 = new C1371c(cVar);
        try {
            ((C1365hr) mo7454bQ()).mo8269a(cVar2, 1, i, -1, str);
        } catch (RemoteException e) {
            cVar2.mo8250a(DataHolder.empty(8), (String) null);
        }
    }

    /* renamed from: a */
    public void mo8289a(C0655a.C0659c<Moments.LoadMomentsResult> cVar, int i, String str, Uri uri, String str2, String str3) {
        mo7453bP();
        C1369a aVar = cVar != null ? new C1369a(cVar) : null;
        try {
            ((C1365hr) mo7454bQ()).mo8270a(aVar, i, str, uri, str2, str3);
        } catch (RemoteException e) {
            aVar.mo8251a(DataHolder.empty(8), (String) null, (String) null);
        }
    }

    /* renamed from: a */
    public void mo8290a(C0655a.C0659c<People.LoadPeopleResult> cVar, Collection<String> collection) {
        mo7453bP();
        C1371c cVar2 = new C1371c(cVar);
        try {
            ((C1365hr) mo7454bQ()).mo8274a((C1356ho) cVar2, (List<String>) new ArrayList(collection));
        } catch (RemoteException e) {
            cVar2.mo8250a(DataHolder.empty(8), (String) null);
        }
    }

    /* renamed from: a */
    public void mo8291a(C0655a.C0659c<People.LoadPeopleResult> cVar, String[] strArr) {
        mo8290a(cVar, (Collection<String>) Arrays.asList(strArr));
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo6202a(C1092ec ecVar, C1071dw.C1076e eVar) throws RemoteException {
        Bundle bundle = new Bundle();
        bundle.putStringArray("request_visible_actions", this.f3204DL.mo8313eS());
        ecVar.mo7514a(eVar, GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_VERSION_CODE, this.f3204DL.mo8316eV(), this.f3204DL.mo8315eU(), mo7452bO(), this.f3204DL.getAccountName(), bundle);
    }

    /* access modifiers changed from: protected */
    /* renamed from: am */
    public String mo6203am() {
        return "com.google.android.gms.plus.service.START";
    }

    /* access modifiers changed from: protected */
    /* renamed from: an */
    public String mo6204an() {
        return "com.google.android.gms.plus.internal.IPlusService";
    }

    /* access modifiers changed from: protected */
    /* renamed from: ay */
    public C1365hr mo6207p(IBinder iBinder) {
        return C1365hr.C1366a.m3657ax(iBinder);
    }

    /* renamed from: az */
    public boolean mo8293az(String str) {
        return Arrays.asList(mo7452bO()).contains(str);
    }

    public void clearDefaultAccount() {
        mo7453bP();
        try {
            this.f3203DK = null;
            ((C1365hr) mo7454bQ()).clearDefaultAccount();
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public String getAccountName() {
        mo7453bP();
        try {
            return ((C1365hr) mo7454bQ()).getAccountName();
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public Person getCurrentPerson() {
        mo7453bP();
        return this.f3203DK;
    }

    /* renamed from: i */
    public void mo8297i(C0655a.C0659c<People.LoadPeopleResult> cVar, String str) {
        mo8288a(cVar, 0, str);
    }

    /* renamed from: j */
    public void mo8298j(C0655a.C0659c<Moments.LoadMomentsResult> cVar) {
        mo8289a(cVar, 20, (String) null, (Uri) null, (String) null, "me");
    }

    /* renamed from: k */
    public void mo8299k(C0655a.C0659c<People.LoadPeopleResult> cVar) {
        mo7453bP();
        C1371c cVar2 = new C1371c(cVar);
        try {
            ((C1365hr) mo7454bQ()).mo8269a(cVar2, 2, 1, -1, (String) null);
        } catch (RemoteException e) {
            cVar2.mo8250a(DataHolder.empty(8), (String) null);
        }
    }

    /* renamed from: l */
    public void mo8300l(C0655a.C0659c<Status> cVar) {
        mo7453bP();
        clearDefaultAccount();
        C1373e eVar = new C1373e(cVar);
        try {
            ((C1365hr) mo7454bQ()).mo8275b(eVar);
        } catch (RemoteException e) {
            eVar.mo8254b(8, (Bundle) null);
        }
    }

    public void removeMoment(String momentId) {
        mo7453bP();
        try {
            ((C1365hr) mo7454bQ()).removeMoment(momentId);
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }

    public void writeMoment(Moment moment) {
        mo7453bP();
        try {
            ((C1365hr) mo7454bQ()).mo8267a(C1125ey.m2718a((C1404id) moment));
        } catch (RemoteException e) {
            throw new IllegalStateException(e);
        }
    }
}
