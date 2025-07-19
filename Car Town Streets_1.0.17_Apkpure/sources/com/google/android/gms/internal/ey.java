package com.google.android.gms.internal;

import android.os.Bundle;
import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.common.internal.safeparcel.a;
import com.google.android.gms.internal.es;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
/* loaded from: classes.dex */
public class ey extends es implements SafeParcelable {
    public static final ez CREATOR = new ez();
    private final int kg;
    private final String mClassName;
    private int qA;
    private int qB;
    private final ev qq;
    private final Parcel qy;
    private final int qz;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ey(int i, Parcel parcel, ev evVar) {
        this.kg = i;
        this.qy = (Parcel) eg.f(parcel);
        this.qz = 2;
        this.qq = evVar;
        if (this.qq == null) {
            this.mClassName = null;
        } else {
            this.mClassName = this.qq.cz();
        }
        this.qA = 2;
    }

    private ey(SafeParcelable safeParcelable, ev evVar, String str) {
        this.kg = 1;
        this.qy = Parcel.obtain();
        safeParcelable.writeToParcel(this.qy, 0);
        this.qz = 1;
        this.qq = (ev) eg.f(evVar);
        this.mClassName = (String) eg.f(str);
        this.qA = 2;
    }

    public static <T extends es & SafeParcelable> ey a(T t) {
        String canonicalName = t.getClass().getCanonicalName();
        return new ey(t, b(t), canonicalName);
    }

    /* JADX WARN: Multi-variable type inference failed */
    private static void a(ev evVar, es esVar) {
        Class<?> cls = esVar.getClass();
        if (!evVar.b((Class<? extends es>) cls)) {
            HashMap<String, es.a<?, ?>> cj = esVar.cj();
            evVar.a(cls, esVar.cj());
            for (String str : cj.keySet()) {
                es.a<?, ?> aVar = cj.get(str);
                Class<? extends es> cr = aVar.cr();
                if (cr != null) {
                    try {
                        a(evVar, cr.newInstance());
                    } catch (IllegalAccessException e) {
                        throw new IllegalStateException("Could not access object of type " + aVar.cr().getCanonicalName(), e);
                    } catch (InstantiationException e2) {
                        throw new IllegalStateException("Could not instantiate an object of type " + aVar.cr().getCanonicalName(), e2);
                    }
                }
            }
        }
    }

    private void a(StringBuilder sb, int i, Object obj) {
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
                sb.append("\"").append(fe.aa(obj.toString())).append("\"");
                return;
            case 8:
                sb.append("\"").append(fb.b((byte[]) obj)).append("\"");
                return;
            case 9:
                sb.append("\"").append(fb.c((byte[]) obj));
                sb.append("\"");
                return;
            case 10:
                ff.a(sb, (HashMap) obj);
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException("Unknown type = " + i);
        }
    }

    private void a(StringBuilder sb, es.a<?, ?> aVar, Parcel parcel, int i) {
        switch (aVar.ci()) {
            case 0:
                b(sb, aVar, a(aVar, Integer.valueOf(com.google.android.gms.common.internal.safeparcel.a.g(parcel, i))));
                return;
            case 1:
                b(sb, aVar, a(aVar, com.google.android.gms.common.internal.safeparcel.a.i(parcel, i)));
                return;
            case 2:
                b(sb, aVar, a(aVar, Long.valueOf(com.google.android.gms.common.internal.safeparcel.a.h(parcel, i))));
                return;
            case 3:
                b(sb, aVar, a(aVar, Float.valueOf(com.google.android.gms.common.internal.safeparcel.a.j(parcel, i))));
                return;
            case 4:
                b(sb, aVar, a(aVar, Double.valueOf(com.google.android.gms.common.internal.safeparcel.a.k(parcel, i))));
                return;
            case 5:
                b(sb, aVar, a(aVar, com.google.android.gms.common.internal.safeparcel.a.l(parcel, i)));
                return;
            case 6:
                b(sb, aVar, a(aVar, Boolean.valueOf(com.google.android.gms.common.internal.safeparcel.a.c(parcel, i))));
                return;
            case 7:
                b(sb, aVar, a(aVar, com.google.android.gms.common.internal.safeparcel.a.m(parcel, i)));
                return;
            case 8:
            case 9:
                b(sb, aVar, a(aVar, com.google.android.gms.common.internal.safeparcel.a.p(parcel, i)));
                return;
            case 10:
                b(sb, aVar, a(aVar, c(com.google.android.gms.common.internal.safeparcel.a.o(parcel, i))));
                return;
            case 11:
                throw new IllegalArgumentException("Method does not accept concrete type.");
            default:
                throw new IllegalArgumentException("Unknown field out type = " + aVar.ci());
        }
    }

    private void a(StringBuilder sb, String str, es.a<?, ?> aVar, Parcel parcel, int i) {
        sb.append("\"").append(str).append("\":");
        if (aVar.ct()) {
            a(sb, aVar, parcel, i);
        } else {
            b(sb, aVar, parcel, i);
        }
    }

    private void a(StringBuilder sb, HashMap<String, es.a<?, ?>> hashMap, Parcel parcel) {
        HashMap<Integer, Map.Entry<String, es.a<?, ?>>> c = c(hashMap);
        sb.append('{');
        int n = com.google.android.gms.common.internal.safeparcel.a.n(parcel);
        boolean z = false;
        while (parcel.dataPosition() < n) {
            int m = com.google.android.gms.common.internal.safeparcel.a.m(parcel);
            Map.Entry<String, es.a<?, ?>> entry = c.get(Integer.valueOf(com.google.android.gms.common.internal.safeparcel.a.M(m)));
            if (entry != null) {
                if (z) {
                    sb.append(",");
                }
                a(sb, entry.getKey(), entry.getValue(), parcel, m);
                z = true;
            }
        }
        if (parcel.dataPosition() != n) {
            throw new a.C0013a("Overread allowed size end=" + n, parcel);
        }
        sb.append('}');
    }

    private static ev b(es esVar) {
        ev evVar = new ev(esVar.getClass());
        a(evVar, esVar);
        evVar.cx();
        evVar.cw();
        return evVar;
    }

    private void b(StringBuilder sb, es.a<?, ?> aVar, Parcel parcel, int i) {
        if (aVar.co()) {
            sb.append("[");
            switch (aVar.ci()) {
                case 0:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.r(parcel, i));
                    break;
                case 1:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.t(parcel, i));
                    break;
                case 2:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.s(parcel, i));
                    break;
                case 3:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.u(parcel, i));
                    break;
                case 4:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.v(parcel, i));
                    break;
                case 5:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.w(parcel, i));
                    break;
                case 6:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.q(parcel, i));
                    break;
                case 7:
                    fa.a(sb, com.google.android.gms.common.internal.safeparcel.a.x(parcel, i));
                    break;
                case 8:
                case 9:
                case 10:
                    throw new UnsupportedOperationException("List of type BASE64, BASE64_URL_SAFE, or STRING_MAP is not supported");
                case 11:
                    Parcel[] A = com.google.android.gms.common.internal.safeparcel.a.A(parcel, i);
                    int length = A.length;
                    for (int i2 = 0; i2 < length; i2++) {
                        if (i2 > 0) {
                            sb.append(",");
                        }
                        A[i2].setDataPosition(0);
                        a(sb, aVar.cv(), A[i2]);
                    }
                    break;
                default:
                    throw new IllegalStateException("Unknown field type out.");
            }
            sb.append("]");
            return;
        }
        switch (aVar.ci()) {
            case 0:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.g(parcel, i));
                return;
            case 1:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.i(parcel, i));
                return;
            case 2:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.h(parcel, i));
                return;
            case 3:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.j(parcel, i));
                return;
            case 4:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.k(parcel, i));
                return;
            case 5:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.l(parcel, i));
                return;
            case 6:
                sb.append(com.google.android.gms.common.internal.safeparcel.a.c(parcel, i));
                return;
            case 7:
                sb.append("\"").append(fe.aa(com.google.android.gms.common.internal.safeparcel.a.m(parcel, i))).append("\"");
                return;
            case 8:
                sb.append("\"").append(fb.b(com.google.android.gms.common.internal.safeparcel.a.p(parcel, i))).append("\"");
                return;
            case 9:
                sb.append("\"").append(fb.c(com.google.android.gms.common.internal.safeparcel.a.p(parcel, i)));
                sb.append("\"");
                return;
            case 10:
                Bundle o = com.google.android.gms.common.internal.safeparcel.a.o(parcel, i);
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
                    sb.append("\"").append(fe.aa(o.getString(str))).append("\"");
                    z = false;
                }
                sb.append("}");
                return;
            case 11:
                Parcel z2 = com.google.android.gms.common.internal.safeparcel.a.z(parcel, i);
                z2.setDataPosition(0);
                a(sb, aVar.cv(), z2);
                return;
            default:
                throw new IllegalStateException("Unknown field type out");
        }
    }

    private void b(StringBuilder sb, es.a<?, ?> aVar, Object obj) {
        if (aVar.cn()) {
            b(sb, aVar, (ArrayList) obj);
        } else {
            a(sb, aVar.ch(), obj);
        }
    }

    private void b(StringBuilder sb, es.a<?, ?> aVar, ArrayList<?> arrayList) {
        sb.append("[");
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (i != 0) {
                sb.append(",");
            }
            a(sb, aVar.ch(), arrayList.get(i));
        }
        sb.append("]");
    }

    public static HashMap<String, String> c(Bundle bundle) {
        HashMap<String, String> hashMap = new HashMap<>();
        for (String str : bundle.keySet()) {
            hashMap.put(str, bundle.getString(str));
        }
        return hashMap;
    }

    private static HashMap<Integer, Map.Entry<String, es.a<?, ?>>> c(HashMap<String, es.a<?, ?>> hashMap) {
        HashMap<Integer, Map.Entry<String, es.a<?, ?>>> hashMap2 = new HashMap<>();
        for (Map.Entry<String, es.a<?, ?>> entry : hashMap.entrySet()) {
            hashMap2.put(Integer.valueOf(entry.getValue().cq()), entry);
        }
        return hashMap2;
    }

    @Override // com.google.android.gms.internal.es
    protected Object V(String str) {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    @Override // com.google.android.gms.internal.es
    protected boolean W(String str) {
        throw new UnsupportedOperationException("Converting to JSON does not require this method.");
    }

    public Parcel cB() {
        switch (this.qA) {
            case 0:
                this.qB = com.google.android.gms.common.internal.safeparcel.b.o(this.qy);
                com.google.android.gms.common.internal.safeparcel.b.D(this.qy, this.qB);
                this.qA = 2;
                break;
            case 1:
                com.google.android.gms.common.internal.safeparcel.b.D(this.qy, this.qB);
                this.qA = 2;
                break;
        }
        return this.qy;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ev cC() {
        switch (this.qz) {
            case 0:
                return null;
            case 1:
                return this.qq;
            case 2:
                return this.qq;
            default:
                throw new IllegalStateException("Invalid creation type: " + this.qz);
        }
    }

    @Override // com.google.android.gms.internal.es
    public HashMap<String, es.a<?, ?>> cj() {
        if (this.qq == null) {
            return null;
        }
        return this.qq.Z(this.mClassName);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        ez ezVar = CREATOR;
        return 0;
    }

    public int getVersionCode() {
        return this.kg;
    }

    @Override // com.google.android.gms.internal.es
    public String toString() {
        eg.b(this.qq, "Cannot convert to JSON on client side.");
        Parcel cB = cB();
        cB.setDataPosition(0);
        StringBuilder sb = new StringBuilder(100);
        a(sb, this.qq.Z(this.mClassName), cB);
        return sb.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        ez ezVar = CREATOR;
        ez.a(this, out, flags);
    }
}
