package com.google.android.gms.internal;

import android.os.Parcel;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.es;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
/* loaded from: classes.dex */
public final class id extends es implements SafeParcelable, Moment {
    public static final ie CREATOR = new ie();
    private static final HashMap<String, es.a<?, ?>> Ep = new HashMap<>();
    private String AI;
    private final Set<Integer> Eq;
    private String Fe;
    private ib Fm;
    private ib Fn;
    private final int kg;
    private String uS;

    static {
        Ep.put(Constants.APP_ID, es.a.g(Constants.APP_ID, 2));
        Ep.put("result", es.a.a("result", 4, ib.class));
        Ep.put("startDate", es.a.g("startDate", 5));
        Ep.put("target", es.a.a("target", 6, ib.class));
        Ep.put(ServerProtocol.DIALOG_PARAM_TYPE, es.a.g(ServerProtocol.DIALOG_PARAM_TYPE, 7));
    }

    public id() {
        this.kg = 1;
        this.Eq = new HashSet();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public id(Set<Integer> set, int i, String str, ib ibVar, String str2, ib ibVar2, String str3) {
        this.Eq = set;
        this.kg = i;
        this.uS = str;
        this.Fm = ibVar;
        this.Fe = str2;
        this.Fn = ibVar2;
        this.AI = str3;
    }

    public id(Set<Integer> set, String str, ib ibVar, String str2, ib ibVar2, String str3) {
        this.Eq = set;
        this.kg = 1;
        this.uS = str;
        this.Fm = ibVar;
        this.Fe = str2;
        this.Fn = ibVar2;
        this.AI = str3;
    }

    @Override // com.google.android.gms.internal.es
    protected Object V(String str) {
        return null;
    }

    @Override // com.google.android.gms.internal.es
    protected boolean W(String str) {
        return false;
    }

    @Override // com.google.android.gms.internal.es
    protected boolean a(es.a aVar) {
        return this.Eq.contains(Integer.valueOf(aVar.cq()));
    }

    @Override // com.google.android.gms.internal.es
    protected Object b(es.a aVar) {
        switch (aVar.cq()) {
            case 2:
                return this.uS;
            case 3:
            default:
                throw new IllegalStateException("Unknown safe parcelable id=" + aVar.cq());
            case 4:
                return this.Fm;
            case 5:
                return this.Fe;
            case 6:
                return this.Fn;
            case 7:
                return this.AI;
        }
    }

    @Override // com.google.android.gms.internal.es
    public HashMap<String, es.a<?, ?>> cj() {
        return Ep;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        ie ieVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof id)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        id idVar = (id) obj;
        for (es.a<?, ?> aVar : Ep.values()) {
            if (a(aVar)) {
                if (idVar.a(aVar) && b(aVar).equals(idVar.b(aVar))) {
                }
                return false;
            } else if (idVar.a(aVar)) {
                return false;
            }
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Set<Integer> fa() {
        return this.Eq;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ib fr() {
        return this.Fm;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ib fs() {
        return this.Fn;
    }

    @Override // com.google.android.gms.common.data.Freezable
    /* renamed from: ft */
    public id mo358freeze() {
        return this;
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public String getId() {
        return this.uS;
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public ItemScope getResult() {
        return this.Fm;
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public String getStartDate() {
        return this.Fe;
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public ItemScope getTarget() {
        return this.Fn;
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public String getType() {
        return this.AI;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.kg;
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasId() {
        return this.Eq.contains(2);
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasResult() {
        return this.Eq.contains(4);
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasStartDate() {
        return this.Eq.contains(5);
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasTarget() {
        return this.Eq.contains(6);
    }

    @Override // com.google.android.gms.plus.model.moments.Moment
    public boolean hasType() {
        return this.Eq.contains(7);
    }

    public int hashCode() {
        int i = 0;
        Iterator<es.a<?, ?>> it = Ep.values().iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                es.a<?, ?> next = it.next();
                if (a(next)) {
                    i = b(next).hashCode() + i2 + next.cq();
                } else {
                    i = i2;
                }
            } else {
                return i2;
            }
        }
    }

    @Override // com.google.android.gms.common.data.Freezable
    public boolean isDataValid() {
        return true;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        ie ieVar = CREATOR;
        ie.a(this, out, flags);
    }
}
