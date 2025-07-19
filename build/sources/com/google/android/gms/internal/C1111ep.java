package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

/* renamed from: com.google.android.gms.internal.ep */
public final class C1111ep implements SafeParcelable, C1115es.C1117b<String, Integer> {
    public static final C1113eq CREATOR = new C1113eq();

    /* renamed from: kg */
    private final int f2644kg;

    /* renamed from: qd */
    private final HashMap<String, Integer> f2645qd;

    /* renamed from: qe */
    private final HashMap<Integer, String> f2646qe;

    /* renamed from: qf */
    private final ArrayList<C1112a> f2647qf;

    /* renamed from: com.google.android.gms.internal.ep$a */
    public static final class C1112a implements SafeParcelable {
        public static final C1114er CREATOR = new C1114er();

        /* renamed from: qg */
        final String f2648qg;

        /* renamed from: qh */
        final int f2649qh;
        final int versionCode;

        C1112a(int i, String str, int i2) {
            this.versionCode = i;
            this.f2648qg = str;
            this.f2649qh = i2;
        }

        C1112a(String str, int i) {
            this.versionCode = 1;
            this.f2648qg = str;
            this.f2649qh = i;
        }

        public int describeContents() {
            C1114er erVar = CREATOR;
            return 0;
        }

        public void writeToParcel(Parcel out, int flags) {
            C1114er erVar = CREATOR;
            C1114er.m2655a(this, out, flags);
        }
    }

    public C1111ep() {
        this.f2644kg = 1;
        this.f2645qd = new HashMap<>();
        this.f2646qe = new HashMap<>();
        this.f2647qf = null;
    }

    C1111ep(int i, ArrayList<C1112a> arrayList) {
        this.f2644kg = i;
        this.f2645qd = new HashMap<>();
        this.f2646qe = new HashMap<>();
        this.f2647qf = null;
        m2645a(arrayList);
    }

    /* renamed from: a */
    private void m2645a(ArrayList<C1112a> arrayList) {
        Iterator<C1112a> it = arrayList.iterator();
        while (it.hasNext()) {
            C1112a next = it.next();
            mo7579c(next.f2648qg, next.f2649qh);
        }
    }

    /* renamed from: a */
    public String mo7584g(Integer num) {
        String str = this.f2646qe.get(num);
        return (str != null || !this.f2645qd.containsKey("gms_unknown")) ? str : "gms_unknown";
    }

    /* renamed from: c */
    public C1111ep mo7579c(String str, int i) {
        this.f2645qd.put(str, Integer.valueOf(i));
        this.f2646qe.put(Integer.valueOf(i), str);
        return this;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: cg */
    public ArrayList<C1112a> mo7580cg() {
        ArrayList<C1112a> arrayList = new ArrayList<>();
        for (String next : this.f2645qd.keySet()) {
            arrayList.add(new C1112a(next, this.f2645qd.get(next).intValue()));
        }
        return arrayList;
    }

    /* renamed from: ch */
    public int mo7581ch() {
        return 7;
    }

    /* renamed from: ci */
    public int mo7582ci() {
        return 0;
    }

    public int describeContents() {
        C1113eq eqVar = CREATOR;
        return 0;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f2644kg;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1113eq eqVar = CREATOR;
        C1113eq.m2652a(this, out, flags);
    }
}
