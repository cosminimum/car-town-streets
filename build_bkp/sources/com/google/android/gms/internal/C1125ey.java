package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.C0675a;
import com.google.android.gms.common.internal.safeparcel.C0677b;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ey */
public class C1125ey extends C1115es implements SafeParcelable {
    public static final C1126ez CREATOR = new C1126ez();

    /* renamed from: kg */
    private final int f2668kg;
    private final String mClassName;

    /* renamed from: qA */
    private int f2669qA;

    /* renamed from: qB */
    private int f2670qB;

    /* renamed from: qq */
    private final C1120ev f2671qq;

    /* renamed from: qy */
    private final Parcel f2672qy;

    /* renamed from: qz */
    private final int f2673qz;

    C1125ey(int i, Parcel parcel, C1120ev evVar) {
        this.f2668kg = i;
        this.f2672qy = (Parcel) C1102eg.m2616f(parcel);
        this.f2673qz = 2;
        this.f2671qq = evVar;
        if (this.f2671qq == null) {
            this.mClassName = null;
        } else {
            this.mClassName = this.f2671qq.mo7640cz();
        }
        this.f2669qA = 2;
    }

    private C1125ey(SafeParcelable safeParcelable, C1120ev evVar, String str) {
        this.f2668kg = 1;
        this.f2672qy = Parcel.obtain();
        safeParcelable.writeToParcel(this.f2672qy, 0);
        this.f2673qz = 1;
        this.f2671qq = (C1120ev) C1102eg.m2616f(evVar);
        this.mClassName = (String) C1102eg.m2616f(str);
        this.f2669qA = 2;
    }

    /* renamed from: a */
    public static <T extends C1115es & SafeParcelable> C1125ey m2718a(T t) {
        String canonicalName = t.getClass().getCanonicalName();
        return new C1125ey((SafeParcelable) t, m2724b(t), canonicalName);
    }

    /* renamed from: a */
    private static void m2719a(C1120ev evVar, C1115es esVar) {
        Class<?> cls = esVar.getClass();
        if (!evVar.mo7636b((Class<? extends C1115es>) cls)) {
            HashMap<String, C1115es.C1116a<?, ?>> cj = esVar.mo7604cj();
            evVar.mo7635a(cls, esVar.mo7604cj());
            for (String str : cj.keySet()) {
                C1115es.C1116a aVar = cj.get(str);
                Class<? extends C1115es> cr = aVar.mo7616cr();
                if (cr != null) {
                    try {
                        m2719a(evVar, (C1115es) cr.newInstance());
                    } catch (InstantiationException e) {
                        throw new IllegalStateException("Could not instantiate an object of type " + aVar.mo7616cr().getCanonicalName(), e);
                    } catch (IllegalAccessException e2) {
                        throw new IllegalStateException("Could not access object of type " + aVar.mo7616cr().getCanonicalName(), e2);
                    }
                }
            }
        }
    }

    /* renamed from: a */
    private void m2720a(StringBuilder sb, int i, Object obj) {
        switch (i) {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
                sb.append(obj);
                return;
            case 7:
                sb.append("\"").append(C1133fe.m2761aa(obj.toString())).append("\"");
                return;
            case 8:
                sb.append("\"").append(C1130fb.m2757b((byte[]) obj)).append("\"");
                return;
            case 9:
                sb.append("\"").append(C1130fb.m2758c((byte[]) obj));
                sb.append("\"");
                return;
            case 10:
                C1134ff.m2763a(sb, (HashMap) obj);
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException("Unknown type = " + i);
        }
    }

    /* renamed from: a */
    private void m2721a(StringBuilder sb, C1115es.C1116a<?, ?> aVar, Parcel parcel, int i) {
        switch (aVar.mo7610ci()) {
            case 0:
                m2726b(sb, aVar, (Object) mo7601a(aVar, Integer.valueOf(C0675a.m1367g(parcel, i))));
                return;
            case 1:
                m2726b(sb, aVar, (Object) mo7601a(aVar, C0675a.m1369i(parcel, i)));
                return;
            case 2:
                m2726b(sb, aVar, (Object) mo7601a(aVar, Long.valueOf(C0675a.m1368h(parcel, i))));
                return;
            case 3:
                m2726b(sb, aVar, (Object) mo7601a(aVar, Float.valueOf(C0675a.m1370j(parcel, i))));
                return;
            case 4:
                m2726b(sb, aVar, (Object) mo7601a(aVar, Double.valueOf(C0675a.m1371k(parcel, i))));
                return;
            case 5:
                m2726b(sb, aVar, (Object) mo7601a(aVar, C0675a.m1372l(parcel, i)));
                return;
            case 6:
                m2726b(sb, aVar, (Object) mo7601a(aVar, Boolean.valueOf(C0675a.m1363c(parcel, i))));
                return;
            case 7:
                m2726b(sb, aVar, (Object) mo7601a(aVar, C0675a.m1374m(parcel, i)));
                return;
            case 8:
            case 9:
                m2726b(sb, aVar, (Object) mo7601a(aVar, C0675a.m1378p(parcel, i)));
                return;
            case 10:
                m2726b(sb, aVar, (Object) mo7601a(aVar, m2728c(C0675a.m1377o(parcel, i))));
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException("Unknown field out type = " + aVar.mo7610ci());
        }
    }

    /* renamed from: a */
    private void m2722a(StringBuilder sb, String str, C1115es.C1116a<?, ?> aVar, Parcel parcel, int i) {
        sb.append("\"").append(str).append("\":");
        if (aVar.mo7618ct()) {
            m2721a(sb, aVar, parcel, i);
        } else {
            m2725b(sb, aVar, parcel, i);
        }
    }

    /* renamed from: a */
    private void m2723a(StringBuilder sb, HashMap<String, C1115es.C1116a<?, ?>> hashMap, Parcel parcel) {
        HashMap<Integer, Map.Entry<String, C1115es.C1116a<?, ?>>> c = m2729c(hashMap);
        sb.append('{');
        int n = C0675a.m1375n(parcel);
        boolean z = false;
        while (parcel.dataPosition() < n) {
            int m = C0675a.m1373m(parcel);
            Map.Entry entry = c.get(Integer.valueOf(C0675a.m1354M(m)));
            if (entry != null) {
                if (z) {
                    sb.append(",");
                }
                m2722a(sb, (String) entry.getKey(), (C1115es.C1116a) entry.getValue(), parcel, m);
                z = true;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new C0675a.C0676a("Overread allowed size end=" + n, parcel);
        }
        sb.append('}');
    }

    /* renamed from: b */
    private static C1120ev m2724b(C1115es esVar) {
        C1120ev evVar = new C1120ev(esVar.getClass());
        m2719a(evVar, esVar);
        evVar.mo7638cx();
        evVar.mo7637cw();
        return evVar;
    }

    /* renamed from: b */
    private void m2725b(StringBuilder sb, C1115es.C1116a<?, ?> aVar, Parcel parcel, int i) {
        if (aVar.mo7613co()) {
            sb.append("[");
            switch (aVar.mo7610ci()) {
                case 0:
                    C1129fa.m2752a(sb, C0675a.m1380r(parcel, i));
                    break;
                case 1:
                    C1129fa.m2754a(sb, (T[]) C0675a.m1382t(parcel, i));
                    break;
                case 2:
                    C1129fa.m2753a(sb, C0675a.m1381s(parcel, i));
                    break;
                case 3:
                    C1129fa.m2751a(sb, C0675a.m1383u(parcel, i));
                    break;
                case 4:
                    C1129fa.m2750a(sb, C0675a.m1384v(parcel, i));
                    break;
                case 5:
                    C1129fa.m2754a(sb, (T[]) C0675a.m1385w(parcel, i));
                    break;
                case 6:
                    C1129fa.m2756a(sb, C0675a.m1379q(parcel, i));
                    break;
                case 7:
                    C1129fa.m2755a(sb, C0675a.m1386x(parcel, i));
                    break;
                case 8:
                case 9:
                case 10:
                    throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
                case 11:
                    Parcel[] A = C0675a.m1353A(parcel, i);
                    int length = A.length;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (i2 > 0) {
                            sb.append(",");
                        }
                        A[i2].setDataPosition(0);
                        m2723a(sb, aVar.mo7620cv(), A[i2]);
                    }
                    break;
                default:
                    throw new IllegalStateException("Unknown field type out.");
            }
            sb.append("]");
            return;
        }
        switch (aVar.mo7610ci()) {
            case 0:
                sb.append(C0675a.m1367g(parcel, i));
                return;
            case 1:
                sb.append(C0675a.m1369i(parcel, i));
                return;
            case 2:
                sb.append(C0675a.m1368h(parcel, i));
                return;
            case 3:
                sb.append(C0675a.m1370j(parcel, i));
                return;
            case 4:
                sb.append(C0675a.m1371k(parcel, i));
                return;
            case 5:
                sb.append(C0675a.m1372l(parcel, i));
                return;
            case 6:
                sb.append(C0675a.m1363c(parcel, i));
                return;
            case 7:
                sb.append("\"").append(C1133fe.m2761aa(C0675a.m1374m(parcel, i))).append("\"");
                return;
            case 8:
                sb.append("\"").append(C1130fb.m2757b(C0675a.m1378p(parcel, i))).append("\"");
                return;
            case 9:
                sb.append("\"").append(C1130fb.m2758c(C0675a.m1378p(parcel, i)));
                sb.append("\"");
                return;
            case 10:
                Bundle o = C0675a.m1377o(parcel, i);
                Set<String> keySet = o.keySet();
                keySet.size();
                sb.append("{");
                boolean z = true;
                for (String str : keySet) {
                    if (!z) {
                        sb.append(",");
                    }
                    sb.append("\"").append(str).append("\"");
                    sb.append(":");
                    sb.append("\"").append(C1133fe.m2761aa(o.getString(str))).append("\"");
                    z = false;
                }
                sb.append("}");
                return;
            case 11:
                Parcel z2 = C0675a.m1388z(parcel, i);
                z2.setDataPosition(0);
                m2723a(sb, aVar.mo7620cv(), z2);
                return;
            default:
                throw new IllegalStateException("Unknown field type out");
        }
    }

    /* renamed from: b */
    private void m2726b(StringBuilder sb, C1115es.C1116a<?, ?> aVar, Object obj) {
        if (aVar.mo7612cn()) {
            m2727b(sb, aVar, (ArrayList<?>) (ArrayList) obj);
        } else {
            m2720a(sb, aVar.mo7609ch(), obj);
        }
    }

    /* renamed from: b */
    private void m2727b(StringBuilder sb, C1115es.C1116a<?, ?> aVar, ArrayList<?> arrayList) {
        sb.append("[");
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (i != 0) {
                sb.append(",");
            }
            m2720a(sb, aVar.mo7609ch(), (Object) arrayList.get(i));
        }
        sb.append("]");
    }

    /* renamed from: c */
    public static HashMap<String, String> m2728c(Bundle bundle) {
        HashMap<String, String> hashMap = new HashMap<>();
        for (String str : bundle.keySet()) {
            hashMap.put(str, bundle.getString(str));
        }
        return hashMap;
    }

    /* renamed from: c */
    private static HashMap<Integer, Map.Entry<String, C1115es.C1116a<?, ?>>> m2729c(HashMap<String, C1115es.C1116a<?, ?>> hashMap) {
        HashMap<Integer, Map.Entry<String, C1115es.C1116a<?, ?>>> hashMap2 = new HashMap<>();
        for (Map.Entry next : hashMap.entrySet()) {
            hashMap2.put(Integer.valueOf(((C1115es.C1116a) next.getValue()).mo7615cq()), next);
        }
        return hashMap2;
    }

    /* access modifiers changed from: protected */
    /* renamed from: V */
    public Object mo7597V(String str) {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    /* access modifiers changed from: protected */
    /* renamed from: W */
    public boolean mo7598W(String str) {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    /* renamed from: cB */
    public Parcel mo7658cB() {
        switch (this.f2669qA) {
            case 0:
                this.f2670qB = C0677b.m1414o(this.f2672qy);
                C0677b.m1391D(this.f2672qy, this.f2670qB);
                this.f2669qA = 2;
                break;
            case 1:
                C0677b.m1391D(this.f2672qy, this.f2670qB);
                this.f2669qA = 2;
                break;
        }
        return this.f2672qy;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: cC */
    public C1120ev mo7659cC() {
        switch (this.f2673qz) {
            case 0:
                return null;
            case 1:
                return this.f2671qq;
            case 2:
                return this.f2671qq;
            default:
                throw new IllegalStateException("Invalid creation type: " + this.f2673qz);
        }
    }

    /* renamed from: cj */
    public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
        if (this.f2671qq == null) {
            return null;
        }
        return this.f2671qq.mo7634Z(this.mClassName);
    }

    public int describeContents() {
        C1126ez ezVar = CREATOR;
        return 0;
    }

    public int getVersionCode() {
        return this.f2668kg;
    }

    public String toString() {
        C1102eg.m2614b(this.f2671qq, (Object) "Cannot convert to JSON on client side.");
        Parcel cB = mo7658cB();
        cB.setDataPosition(0);
        StringBuilder sb = new StringBuilder(100);
        m2723a(sb, this.f2671qq.mo7634Z(this.mClassName), cB);
        return sb.toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        C1126ez ezVar = CREATOR;
        C1126ez.m2735a(this, out, flags);
    }
}
