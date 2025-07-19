package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.HashMap;

/* renamed from: com.google.android.gms.internal.es */
public abstract class C1115es {

    /* renamed from: com.google.android.gms.internal.es$a */
    public static class C1116a<I, O> implements SafeParcelable {
        public static final C1118et CREATOR = new C1118et();

        /* renamed from: kg */
        private final int f2650kg;

        /* renamed from: qi */
        protected final int f2651qi;

        /* renamed from: qj */
        protected final boolean f2652qj;

        /* renamed from: qk */
        protected final int f2653qk;

        /* renamed from: ql */
        protected final boolean f2654ql;

        /* renamed from: qm */
        protected final String f2655qm;

        /* renamed from: qn */
        protected final int f2656qn;

        /* renamed from: qo */
        protected final Class<? extends C1115es> f2657qo;

        /* renamed from: qp */
        protected final String f2658qp;

        /* renamed from: qq */
        private C1120ev f2659qq;
        /* access modifiers changed from: private */

        /* renamed from: qr */
        public C1117b<I, O> f2660qr;

        C1116a(int i, int i2, boolean z, int i3, boolean z2, String str, int i4, String str2, C1109en enVar) {
            this.f2650kg = i;
            this.f2651qi = i2;
            this.f2652qj = z;
            this.f2653qk = i3;
            this.f2654ql = z2;
            this.f2655qm = str;
            this.f2656qn = i4;
            if (str2 == null) {
                this.f2657qo = null;
                this.f2658qp = null;
            } else {
                this.f2657qo = C1125ey.class;
                this.f2658qp = str2;
            }
            if (enVar == null) {
                this.f2660qr = null;
            } else {
                this.f2660qr = enVar.mo7570cf();
            }
        }

        protected C1116a(int i, boolean z, int i2, boolean z2, String str, int i3, Class<? extends C1115es> cls, C1117b<I, O> bVar) {
            this.f2650kg = 1;
            this.f2651qi = i;
            this.f2652qj = z;
            this.f2653qk = i2;
            this.f2654ql = z2;
            this.f2655qm = str;
            this.f2656qn = i3;
            this.f2657qo = cls;
            if (cls == null) {
                this.f2658qp = null;
            } else {
                this.f2658qp = cls.getCanonicalName();
            }
            this.f2660qr = bVar;
        }

        /* renamed from: a */
        public static C1116a m2670a(String str, int i, C1117b<?, ?> bVar, boolean z) {
            return new C1116a(bVar.mo7581ch(), z, bVar.mo7582ci(), false, str, i, (Class<? extends C1115es>) null, bVar);
        }

        /* renamed from: a */
        public static <T extends C1115es> C1116a<T, T> m2671a(String str, int i, Class<T> cls) {
            return new C1116a<>(11, false, 11, false, str, i, cls, (C1117b) null);
        }

        /* renamed from: b */
        public static <T extends C1115es> C1116a<ArrayList<T>, ArrayList<T>> m2672b(String str, int i, Class<T> cls) {
            return new C1116a<>(11, true, 11, true, str, i, cls, (C1117b) null);
        }

        /* renamed from: d */
        public static C1116a<Integer, Integer> m2674d(String str, int i) {
            return new C1116a<>(0, false, 0, false, str, i, (Class<? extends C1115es>) null, (C1117b) null);
        }

        /* renamed from: e */
        public static C1116a<Double, Double> m2675e(String str, int i) {
            return new C1116a<>(4, false, 4, false, str, i, (Class<? extends C1115es>) null, (C1117b) null);
        }

        /* renamed from: f */
        public static C1116a<Boolean, Boolean> m2676f(String str, int i) {
            return new C1116a<>(6, false, 6, false, str, i, (Class<? extends C1115es>) null, (C1117b) null);
        }

        /* renamed from: g */
        public static C1116a<String, String> m2677g(String str, int i) {
            return new C1116a<>(7, false, 7, false, str, i, (Class<? extends C1115es>) null, (C1117b) null);
        }

        /* renamed from: h */
        public static C1116a<ArrayList<String>, ArrayList<String>> m2678h(String str, int i) {
            return new C1116a<>(7, true, 7, true, str, i, (Class<? extends C1115es>) null, (C1117b) null);
        }

        /* renamed from: a */
        public void mo7608a(C1120ev evVar) {
            this.f2659qq = evVar;
        }

        /* renamed from: ch */
        public int mo7609ch() {
            return this.f2651qi;
        }

        /* renamed from: ci */
        public int mo7610ci() {
            return this.f2653qk;
        }

        /* renamed from: cm */
        public C1116a<I, O> mo7611cm() {
            return new C1116a<>(this.f2650kg, this.f2651qi, this.f2652qj, this.f2653qk, this.f2654ql, this.f2655qm, this.f2656qn, this.f2658qp, mo7619cu());
        }

        /* renamed from: cn */
        public boolean mo7612cn() {
            return this.f2652qj;
        }

        /* renamed from: co */
        public boolean mo7613co() {
            return this.f2654ql;
        }

        /* renamed from: cp */
        public String mo7614cp() {
            return this.f2655qm;
        }

        /* renamed from: cq */
        public int mo7615cq() {
            return this.f2656qn;
        }

        /* renamed from: cr */
        public Class<? extends C1115es> mo7616cr() {
            return this.f2657qo;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: cs */
        public String mo7617cs() {
            if (this.f2658qp == null) {
                return null;
            }
            return this.f2658qp;
        }

        /* renamed from: ct */
        public boolean mo7618ct() {
            return this.f2660qr != null;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: cu */
        public C1109en mo7619cu() {
            if (this.f2660qr == null) {
                return null;
            }
            return C1109en.m2639a(this.f2660qr);
        }

        /* renamed from: cv */
        public HashMap<String, C1116a<?, ?>> mo7620cv() {
            C1102eg.m2616f(this.f2658qp);
            C1102eg.m2616f(this.f2659qq);
            return this.f2659qq.mo7634Z(this.f2658qp);
        }

        public int describeContents() {
            C1118et etVar = CREATOR;
            return 0;
        }

        /* renamed from: g */
        public I mo7622g(O o) {
            return this.f2660qr.mo7584g(o);
        }

        public int getVersionCode() {
            return this.f2650kg;
        }

        public String toString() {
            StringBuilder sb = new StringBuilder();
            sb.append("Field\n");
            sb.append("            versionCode=").append(this.f2650kg).append(10);
            sb.append("                 typeIn=").append(this.f2651qi).append(10);
            sb.append("            typeInArray=").append(this.f2652qj).append(10);
            sb.append("                typeOut=").append(this.f2653qk).append(10);
            sb.append("           typeOutArray=").append(this.f2654ql).append(10);
            sb.append("        outputFieldName=").append(this.f2655qm).append(10);
            sb.append("      safeParcelFieldId=").append(this.f2656qn).append(10);
            sb.append("       concreteTypeName=").append(mo7617cs()).append(10);
            if (mo7616cr() != null) {
                sb.append("     concreteType.class=").append(mo7616cr().getCanonicalName()).append(10);
            }
            sb.append("          converterName=").append(this.f2660qr == null ? "null" : this.f2660qr.getClass().getCanonicalName()).append(10);
            return sb.toString();
        }

        public void writeToParcel(Parcel out, int flags) {
            C1118et etVar = CREATOR;
            C1118et.m2696a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.es$b */
    public interface C1117b<I, O> {
        /* renamed from: ch */
        int mo7581ch();

        /* renamed from: ci */
        int mo7582ci();

        /* renamed from: g */
        I mo7584g(O o);
    }

    /* renamed from: a */
    private void m2658a(StringBuilder sb, C1116a aVar, Object obj) {
        if (aVar.mo7609ch() == 11) {
            sb.append(((C1115es) aVar.mo7616cr().cast(obj)).toString());
        } else if (aVar.mo7609ch() == 7) {
            sb.append("\"");
            sb.append(C1133fe.m2761aa((String) obj));
            sb.append("\"");
        } else {
            sb.append(obj);
        }
    }

    /* renamed from: a */
    private void m2659a(StringBuilder sb, C1116a aVar, ArrayList<Object> arrayList) {
        sb.append("[");
        int size = arrayList.size();
        for (int i = 0; i < size; i++) {
            if (i > 0) {
                sb.append(",");
            }
            Object obj = arrayList.get(i);
            if (obj != null) {
                m2658a(sb, aVar, obj);
            }
        }
        sb.append("]");
    }

    /* access modifiers changed from: protected */
    /* renamed from: V */
    public abstract Object mo7597V(String str);

    /* access modifiers changed from: protected */
    /* renamed from: W */
    public abstract boolean mo7598W(String str);

    /* access modifiers changed from: protected */
    /* renamed from: X */
    public boolean mo7599X(String str) {
        throw new UnsupportedOperationException("Concrete types not supported");
    }

    /* access modifiers changed from: protected */
    /* renamed from: Y */
    public boolean mo7600Y(String str) {
        throw new UnsupportedOperationException("Concrete type arrays not supported");
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public <O, I> I mo7601a(C1116a<I, O> aVar, Object obj) {
        return aVar.f2660qr != null ? aVar.mo7622g(obj) : obj;
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public boolean mo7602a(C1116a aVar) {
        return aVar.mo7610ci() == 11 ? aVar.mo7613co() ? mo7600Y(aVar.mo7614cp()) : mo7599X(aVar.mo7614cp()) : mo7598W(aVar.mo7614cp());
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public Object mo7603b(C1116a aVar) {
        boolean z = true;
        String cp = aVar.mo7614cp();
        if (aVar.mo7616cr() == null) {
            return mo7597V(aVar.mo7614cp());
        }
        if (mo7597V(aVar.mo7614cp()) != null) {
            z = false;
        }
        C1102eg.m2612a(z, "Concrete field shouldn't be value object: " + aVar.mo7614cp());
        HashMap<String, Object> cl = aVar.mo7613co() ? mo7606cl() : mo7605ck();
        if (cl != null) {
            return cl.get(cp);
        }
        try {
            return getClass().getMethod("get" + Character.toUpperCase(cp.charAt(0)) + cp.substring(1), new Class[0]).invoke(this, new Object[0]);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /* renamed from: cj */
    public abstract HashMap<String, C1116a<?, ?>> mo7604cj();

    /* renamed from: ck */
    public HashMap<String, Object> mo7605ck() {
        return null;
    }

    /* renamed from: cl */
    public HashMap<String, Object> mo7606cl() {
        return null;
    }

    public String toString() {
        HashMap<String, C1116a<?, ?>> cj = mo7604cj();
        StringBuilder sb = new StringBuilder(100);
        for (String next : cj.keySet()) {
            C1116a aVar = cj.get(next);
            if (mo7602a(aVar)) {
                Object a = mo7601a(aVar, mo7603b(aVar));
                if (sb.length() == 0) {
                    sb.append("{");
                } else {
                    sb.append(",");
                }
                sb.append("\"").append(next).append("\":");
                if (a != null) {
                    switch (aVar.mo7610ci()) {
                        case 8:
                            sb.append("\"").append(C1130fb.m2757b((byte[]) a)).append("\"");
                            break;
                        case 9:
                            sb.append("\"").append(C1130fb.m2758c((byte[]) a)).append("\"");
                            break;
                        case 10:
                            C1134ff.m2763a(sb, (HashMap) a);
                            break;
                        default:
                            if (!aVar.mo7612cn()) {
                                m2658a(sb, aVar, a);
                                break;
                            } else {
                                m2659a(sb, aVar, (ArrayList<Object>) (ArrayList) a);
                                break;
                            }
                    }
                } else {
                    sb.append("null");
                }
            }
        }
        if (sb.length() > 0) {
            sb.append("}");
        } else {
            sb.append("{}");
        }
        return sb.toString();
    }
}
