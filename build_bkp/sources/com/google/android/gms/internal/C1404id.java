package com.google.android.gms.internal;

import android.os.Parcel;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;
import com.google.android.gms.plus.model.moments.ItemScope;
import com.google.android.gms.plus.model.moments.Moment;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.id */
public final class C1404id extends C1115es implements SafeParcelable, Moment {
    public static final C1405ie CREATOR = new C1405ie();

    /* renamed from: Ep */
    private static final HashMap<String, C1115es.C1116a<?, ?>> f3326Ep = new HashMap<>();

    /* renamed from: AI */
    private String f3327AI;

    /* renamed from: Eq */
    private final Set<Integer> f3328Eq;

    /* renamed from: Fe */
    private String f3329Fe;

    /* renamed from: Fm */
    private C1402ib f3330Fm;

    /* renamed from: Fn */
    private C1402ib f3331Fn;

    /* renamed from: kg */
    private final int f3332kg;

    /* renamed from: uS */
    private String f3333uS;

    static {
        f3326Ep.put(Constants.APP_ID, C1115es.C1116a.m2677g(Constants.APP_ID, 2));
        f3326Ep.put("result", C1115es.C1116a.m2671a("result", 4, C1402ib.class));
        f3326Ep.put("startDate", C1115es.C1116a.m2677g("startDate", 5));
        f3326Ep.put("target", C1115es.C1116a.m2671a("target", 6, C1402ib.class));
        f3326Ep.put(ServerProtocol.DIALOG_PARAM_TYPE, C1115es.C1116a.m2677g(ServerProtocol.DIALOG_PARAM_TYPE, 7));
    }

    public C1404id() {
        this.f3332kg = 1;
        this.f3328Eq = new HashSet();
    }

    C1404id(Set<Integer> set, int i, String str, C1402ib ibVar, String str2, C1402ib ibVar2, String str3) {
        this.f3328Eq = set;
        this.f3332kg = i;
        this.f3333uS = str;
        this.f3330Fm = ibVar;
        this.f3329Fe = str2;
        this.f3331Fn = ibVar2;
        this.f3327AI = str3;
    }

    public C1404id(Set<Integer> set, String str, C1402ib ibVar, String str2, C1402ib ibVar2, String str3) {
        this.f3328Eq = set;
        this.f3332kg = 1;
        this.f3333uS = str;
        this.f3330Fm = ibVar;
        this.f3329Fe = str2;
        this.f3331Fn = ibVar2;
        this.f3327AI = str3;
    }

    /* access modifiers changed from: protected */
    /* renamed from: V */
    public Object mo7597V(String str) {
        return null;
    }

    /* access modifiers changed from: protected */
    /* renamed from: W */
    public boolean mo7598W(String str) {
        return false;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo7602a(C1115es.C1116a aVar) {
        return this.f3328Eq.contains(Integer.valueOf(aVar.mo7615cq()));
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public Object mo7603b(C1115es.C1116a aVar) {
        switch (aVar.mo7615cq()) {
            case 2:
                return this.f3333uS;
            case 4:
                return this.f3330Fm;
            case 5:
                return this.f3329Fe;
            case 6:
                return this.f3331Fn;
            case 7:
                return this.f3327AI;
            default:
                throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
        }
    }

    /* renamed from: cj */
    public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
        return f3326Ep;
    }

    public int describeContents() {
        C1405ie ieVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C1404id)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        C1404id idVar = (C1404id) obj;
        for (C1115es.C1116a next : f3326Ep.values()) {
            if (mo7602a(next)) {
                if (!idVar.mo7602a(next)) {
                    return false;
                }
                if (!mo7603b(next).equals(idVar.mo7603b(next))) {
                    return false;
                }
            } else if (idVar.mo7602a(next)) {
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fa */
    public Set<Integer> mo8498fa() {
        return this.f3328Eq;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fr */
    public C1402ib mo8499fr() {
        return this.f3330Fm;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fs */
    public C1402ib mo8500fs() {
        return this.f3331Fn;
    }

    /* renamed from: ft */
    public C1404id freeze() {
        return this;
    }

    public String getId() {
        return this.f3333uS;
    }

    public ItemScope getResult() {
        return this.f3330Fm;
    }

    public String getStartDate() {
        return this.f3329Fe;
    }

    public ItemScope getTarget() {
        return this.f3331Fn;
    }

    public String getType() {
        return this.f3327AI;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3332kg;
    }

    public boolean hasId() {
        return this.f3328Eq.contains(2);
    }

    public boolean hasResult() {
        return this.f3328Eq.contains(4);
    }

    public boolean hasStartDate() {
        return this.f3328Eq.contains(5);
    }

    public boolean hasTarget() {
        return this.f3328Eq.contains(6);
    }

    public boolean hasType() {
        return this.f3328Eq.contains(7);
    }

    public int hashCode() {
        int i = 0;
        Iterator<C1115es.C1116a<?, ?>> it = f3326Ep.values().iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            C1115es.C1116a next = it.next();
            if (mo7602a(next)) {
                i = mo7603b(next).hashCode() + i2 + next.mo7615cq();
            } else {
                i = i2;
            }
        }
    }

    public boolean isDataValid() {
        return true;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1405ie ieVar = CREATOR;
        C1405ie.m3782a(this, out, flags);
    }
}
