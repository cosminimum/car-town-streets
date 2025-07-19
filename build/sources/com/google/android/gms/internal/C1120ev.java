package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;
import java.util.ArrayList;
import java.util.HashMap;

/* renamed from: com.google.android.gms.internal.ev */
public class C1120ev implements SafeParcelable {
    public static final C1123ew CREATOR = new C1123ew();

    /* renamed from: kg */
    private final int f2661kg;

    /* renamed from: qs */
    private final HashMap<String, HashMap<String, C1115es.C1116a<?, ?>>> f2662qs;

    /* renamed from: qt */
    private final ArrayList<C1121a> f2663qt;

    /* renamed from: qu */
    private final String f2664qu;

    /* renamed from: com.google.android.gms.internal.ev$a */
    public static class C1121a implements SafeParcelable {
        public static final C1124ex CREATOR = new C1124ex();
        final String className;

        /* renamed from: qv */
        final ArrayList<C1122b> f2665qv;
        final int versionCode;

        C1121a(int i, String str, ArrayList<C1122b> arrayList) {
            this.versionCode = i;
            this.className = str;
            this.f2665qv = arrayList;
        }

        C1121a(String str, HashMap<String, C1115es.C1116a<?, ?>> hashMap) {
            this.versionCode = 1;
            this.className = str;
            this.f2665qv = m2710b(hashMap);
        }

        /* renamed from: b */
        private static ArrayList<C1122b> m2710b(HashMap<String, C1115es.C1116a<?, ?>> hashMap) {
            if (hashMap == null) {
                return null;
            }
            ArrayList<C1122b> arrayList = new ArrayList<>();
            for (String next : hashMap.keySet()) {
                arrayList.add(new C1122b(next, hashMap.get(next)));
            }
            return arrayList;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: cA */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7645cA() {
            HashMap<String, C1115es.C1116a<?, ?>> hashMap = new HashMap<>();
            int size = this.f2665qv.size();
            for (int i = 0; i < size; i++) {
                C1122b bVar = this.f2665qv.get(i);
                hashMap.put(bVar.f2666qw, bVar.f2667qx);
            }
            return hashMap;
        }

        public int describeContents() {
            C1124ex exVar = CREATOR;
            return 0;
        }

        public void writeToParcel(Parcel out, int flags) {
            C1124ex exVar = CREATOR;
            C1124ex.m2715a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ev$b */
    public static class C1122b implements SafeParcelable {
        public static final C1119eu CREATOR = new C1119eu();

        /* renamed from: qw */
        final String f2666qw;

        /* renamed from: qx */
        final C1115es.C1116a<?, ?> f2667qx;
        final int versionCode;

        C1122b(int i, String str, C1115es.C1116a<?, ?> aVar) {
            this.versionCode = i;
            this.f2666qw = str;
            this.f2667qx = aVar;
        }

        C1122b(String str, C1115es.C1116a<?, ?> aVar) {
            this.versionCode = 1;
            this.f2666qw = str;
            this.f2667qx = aVar;
        }

        public int describeContents() {
            C1119eu euVar = CREATOR;
            return 0;
        }

        public void writeToParcel(Parcel out, int flags) {
            C1119eu euVar = CREATOR;
            C1119eu.m2699a(this, out, flags);
        }
    }

    C1120ev(int i, ArrayList<C1121a> arrayList, String str) {
        this.f2661kg = i;
        this.f2663qt = null;
        this.f2662qs = m2702b(arrayList);
        this.f2664qu = (String) C1102eg.m2616f(str);
        mo7637cw();
    }

    public C1120ev(Class<? extends C1115es> cls) {
        this.f2661kg = 1;
        this.f2663qt = null;
        this.f2662qs = new HashMap<>();
        this.f2664qu = cls.getCanonicalName();
    }

    /* renamed from: b */
    private static HashMap<String, HashMap<String, C1115es.C1116a<?, ?>>> m2702b(ArrayList<C1121a> arrayList) {
        HashMap<String, HashMap<String, C1115es.C1116a<?, ?>>> hashMap = new HashMap<>();
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            C1121a aVar = arrayList.get(i);
            hashMap.put(aVar.className, aVar.mo7645cA());
        }
        return hashMap;
    }

    /* renamed from: Z */
    public HashMap<String, C1115es.C1116a<?, ?>> mo7634Z(String str) {
        return this.f2662qs.get(str);
    }

    /* renamed from: a */
    public void mo7635a(Class<? extends C1115es> cls, HashMap<String, C1115es.C1116a<?, ?>> hashMap) {
        this.f2662qs.put(cls.getCanonicalName(), hashMap);
    }

    /* renamed from: b */
    public boolean mo7636b(Class<? extends C1115es> cls) {
        return this.f2662qs.containsKey(cls.getCanonicalName());
    }

    /* renamed from: cw */
    public void mo7637cw() {
        for (String str : this.f2662qs.keySet()) {
            HashMap hashMap = this.f2662qs.get(str);
            for (String str2 : hashMap.keySet()) {
                ((C1115es.C1116a) hashMap.get(str2)).mo7608a(this);
            }
        }
    }

    /* renamed from: cx */
    public void mo7638cx() {
        for (String next : this.f2662qs.keySet()) {
            HashMap hashMap = this.f2662qs.get(next);
            HashMap hashMap2 = new HashMap();
            for (String str : hashMap.keySet()) {
                hashMap2.put(str, ((C1115es.C1116a) hashMap.get(str)).mo7611cm());
            }
            this.f2662qs.put(next, hashMap2);
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: cy */
    public ArrayList<C1121a> mo7639cy() {
        ArrayList<C1121a> arrayList = new ArrayList<>();
        for (String next : this.f2662qs.keySet()) {
            arrayList.add(new C1121a(next, this.f2662qs.get(next)));
        }
        return arrayList;
    }

    /* renamed from: cz */
    public String mo7640cz() {
        return this.f2664qu;
    }

    public int describeContents() {
        C1123ew ewVar = CREATOR;
        return 0;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f2661kg;
    }

    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (String next : this.f2662qs.keySet()) {
            sb.append(next).append(":\n");
            HashMap hashMap = this.f2662qs.get(next);
            for (String str : hashMap.keySet()) {
                sb.append("  ").append(str).append(": ");
                sb.append(hashMap.get(str));
            }
        }
        return sb.toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        C1123ew ewVar = CREATOR;
        C1123ew.m2712a(this, out, flags);
    }
}
