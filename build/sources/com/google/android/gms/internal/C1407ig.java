package com.google.android.gms.internal;

import android.os.Parcel;
import com.facebook.internal.ServerProtocol;
import com.getjar.sdk.utilities.Constants;
import com.google.android.gms.common.Scopes;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.internal.C1115es;
import com.google.android.gms.plus.PlusShare;
import com.google.android.gms.plus.model.people.Person;
import com.millennialmedia.android.MMAdView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

/* renamed from: com.google.android.gms.internal.ig */
public final class C1407ig extends C1115es implements SafeParcelable, Person {
    public static final C1418ih CREATOR = new C1418ih();

    /* renamed from: Ep */
    private static final HashMap<String, C1115es.C1116a<?, ?>> f3335Ep = new HashMap<>();

    /* renamed from: Eq */
    private final Set<Integer> f3336Eq;

    /* renamed from: FA */
    private String f3337FA;

    /* renamed from: FB */
    private int f3338FB;

    /* renamed from: FC */
    private List<C1415f> f3339FC;

    /* renamed from: FD */
    private List<C1416g> f3340FD;

    /* renamed from: FE */
    private int f3341FE;

    /* renamed from: FF */
    private int f3342FF;

    /* renamed from: FG */
    private String f3343FG;

    /* renamed from: FH */
    private List<C1417h> f3344FH;

    /* renamed from: FI */
    private boolean f3345FI;

    /* renamed from: Fp */
    private String f3346Fp;

    /* renamed from: Fq */
    private C1408a f3347Fq;

    /* renamed from: Fr */
    private String f3348Fr;

    /* renamed from: Fs */
    private String f3349Fs;

    /* renamed from: Ft */
    private int f3350Ft;

    /* renamed from: Fu */
    private C1409b f3351Fu;

    /* renamed from: Fv */
    private String f3352Fv;

    /* renamed from: Fw */
    private C1412c f3353Fw;

    /* renamed from: Fx */
    private boolean f3354Fx;

    /* renamed from: Fy */
    private String f3355Fy;

    /* renamed from: Fz */
    private C1413d f3356Fz;

    /* renamed from: eL */
    private int f3357eL;

    /* renamed from: iH */
    private String f3358iH;

    /* renamed from: kg */
    private final int f3359kg;

    /* renamed from: qa */
    private String f3360qa;

    /* renamed from: uS */
    private String f3361uS;

    /* renamed from: com.google.android.gms.internal.ig$a */
    public static final class C1408a extends C1115es implements SafeParcelable, Person.AgeRange {
        public static final C1419ii CREATOR = new C1419ii();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3362Ep = new HashMap<>();

        /* renamed from: Eq */
        private final Set<Integer> f3363Eq;

        /* renamed from: FJ */
        private int f3364FJ;

        /* renamed from: FK */
        private int f3365FK;

        /* renamed from: kg */
        private final int f3366kg;

        static {
            f3362Ep.put("max", C1115es.C1116a.m2674d("max", 2));
            f3362Ep.put("min", C1115es.C1116a.m2674d("min", 3));
        }

        public C1408a() {
            this.f3366kg = 1;
            this.f3363Eq = new HashSet();
        }

        C1408a(Set<Integer> set, int i, int i2, int i3) {
            this.f3363Eq = set;
            this.f3366kg = i;
            this.f3364FJ = i2;
            this.f3365FK = i3;
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
            return this.f3363Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 2:
                    return Integer.valueOf(this.f3364FJ);
                case 3:
                    return Integer.valueOf(this.f3365FK);
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3362Ep;
        }

        public int describeContents() {
            C1419ii iiVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1408a)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1408a aVar = (C1408a) obj;
            for (C1115es.C1116a next : f3362Ep.values()) {
                if (mo7602a(next)) {
                    if (!aVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(aVar.mo7603b(next))) {
                        return false;
                    }
                } else if (aVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        /* renamed from: fD */
        public C1408a freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8585fa() {
            return this.f3363Eq;
        }

        public int getMax() {
            return this.f3364FJ;
        }

        public int getMin() {
            return this.f3365FK;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3366kg;
        }

        public boolean hasMax() {
            return this.f3363Eq.contains(2);
        }

        public boolean hasMin() {
            return this.f3363Eq.contains(3);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3362Ep.values().iterator();
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
            C1419ii iiVar = CREATOR;
            C1419ii.m3872a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$b */
    public static final class C1409b extends C1115es implements SafeParcelable, Person.Cover {
        public static final C1420ij CREATOR = new C1420ij();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3367Ep = new HashMap<>();

        /* renamed from: Eq */
        private final Set<Integer> f3368Eq;

        /* renamed from: FL */
        private C1410a f3369FL;

        /* renamed from: FM */
        private C1411b f3370FM;

        /* renamed from: FN */
        private int f3371FN;

        /* renamed from: kg */
        private final int f3372kg;

        /* renamed from: com.google.android.gms.internal.ig$b$a */
        public static final class C1410a extends C1115es implements SafeParcelable, Person.Cover.CoverInfo {
            public static final C1421ik CREATOR = new C1421ik();

            /* renamed from: Ep */
            private static final HashMap<String, C1115es.C1116a<?, ?>> f3373Ep = new HashMap<>();

            /* renamed from: Eq */
            private final Set<Integer> f3374Eq;

            /* renamed from: FO */
            private int f3375FO;

            /* renamed from: FP */
            private int f3376FP;

            /* renamed from: kg */
            private final int f3377kg;

            static {
                f3373Ep.put("leftImageOffset", C1115es.C1116a.m2674d("leftImageOffset", 2));
                f3373Ep.put("topImageOffset", C1115es.C1116a.m2674d("topImageOffset", 3));
            }

            public C1410a() {
                this.f3377kg = 1;
                this.f3374Eq = new HashSet();
            }

            C1410a(Set<Integer> set, int i, int i2, int i3) {
                this.f3374Eq = set;
                this.f3377kg = i;
                this.f3375FO = i2;
                this.f3376FP = i3;
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
                return this.f3374Eq.contains(Integer.valueOf(aVar.mo7615cq()));
            }

            /* access modifiers changed from: protected */
            /* renamed from: b */
            public Object mo7603b(C1115es.C1116a aVar) {
                switch (aVar.mo7615cq()) {
                    case 2:
                        return Integer.valueOf(this.f3375FO);
                    case 3:
                        return Integer.valueOf(this.f3376FP);
                    default:
                        throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
                }
            }

            /* renamed from: cj */
            public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
                return f3373Ep;
            }

            public int describeContents() {
                C1421ik ikVar = CREATOR;
                return 0;
            }

            public boolean equals(Object obj) {
                if (!(obj instanceof C1410a)) {
                    return false;
                }
                if (this == obj) {
                    return true;
                }
                C1410a aVar = (C1410a) obj;
                for (C1115es.C1116a next : f3373Ep.values()) {
                    if (mo7602a(next)) {
                        if (!aVar.mo7602a(next)) {
                            return false;
                        }
                        if (!mo7603b(next).equals(aVar.mo7603b(next))) {
                            return false;
                        }
                    } else if (aVar.mo7602a(next)) {
                        return false;
                    }
                }
                return true;
            }

            /* renamed from: fH */
            public C1410a freeze() {
                return this;
            }

            /* access modifiers changed from: package-private */
            /* renamed from: fa */
            public Set<Integer> mo8611fa() {
                return this.f3374Eq;
            }

            public int getLeftImageOffset() {
                return this.f3375FO;
            }

            public int getTopImageOffset() {
                return this.f3376FP;
            }

            /* access modifiers changed from: package-private */
            public int getVersionCode() {
                return this.f3377kg;
            }

            public boolean hasLeftImageOffset() {
                return this.f3374Eq.contains(2);
            }

            public boolean hasTopImageOffset() {
                return this.f3374Eq.contains(3);
            }

            public int hashCode() {
                int i = 0;
                Iterator<C1115es.C1116a<?, ?>> it = f3373Ep.values().iterator();
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
                C1421ik ikVar = CREATOR;
                C1421ik.m3878a(this, out, flags);
            }
        }

        /* renamed from: com.google.android.gms.internal.ig$b$b */
        public static final class C1411b extends C1115es implements SafeParcelable, Person.Cover.CoverPhoto {
            public static final C1422il CREATOR = new C1422il();

            /* renamed from: Ep */
            private static final HashMap<String, C1115es.C1116a<?, ?>> f3378Ep = new HashMap<>();

            /* renamed from: Eq */
            private final Set<Integer> f3379Eq;

            /* renamed from: iH */
            private String f3380iH;

            /* renamed from: kg */
            private final int f3381kg;

            /* renamed from: v */
            private int f3382v;

            /* renamed from: w */
            private int f3383w;

            static {
                f3378Ep.put("height", C1115es.C1116a.m2674d("height", 2));
                f3378Ep.put(PlusShare.KEY_CALL_TO_ACTION_URL, C1115es.C1116a.m2677g(PlusShare.KEY_CALL_TO_ACTION_URL, 3));
                f3378Ep.put("width", C1115es.C1116a.m2674d("width", 4));
            }

            public C1411b() {
                this.f3381kg = 1;
                this.f3379Eq = new HashSet();
            }

            C1411b(Set<Integer> set, int i, int i2, String str, int i3) {
                this.f3379Eq = set;
                this.f3381kg = i;
                this.f3382v = i2;
                this.f3380iH = str;
                this.f3383w = i3;
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
                return this.f3379Eq.contains(Integer.valueOf(aVar.mo7615cq()));
            }

            /* access modifiers changed from: protected */
            /* renamed from: b */
            public Object mo7603b(C1115es.C1116a aVar) {
                switch (aVar.mo7615cq()) {
                    case 2:
                        return Integer.valueOf(this.f3382v);
                    case 3:
                        return this.f3380iH;
                    case 4:
                        return Integer.valueOf(this.f3383w);
                    default:
                        throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
                }
            }

            /* renamed from: cj */
            public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
                return f3378Ep;
            }

            public int describeContents() {
                C1422il ilVar = CREATOR;
                return 0;
            }

            public boolean equals(Object obj) {
                if (!(obj instanceof C1411b)) {
                    return false;
                }
                if (this == obj) {
                    return true;
                }
                C1411b bVar = (C1411b) obj;
                for (C1115es.C1116a next : f3378Ep.values()) {
                    if (mo7602a(next)) {
                        if (!bVar.mo7602a(next)) {
                            return false;
                        }
                        if (!mo7603b(next).equals(bVar.mo7603b(next))) {
                            return false;
                        }
                    } else if (bVar.mo7602a(next)) {
                        return false;
                    }
                }
                return true;
            }

            /* renamed from: fI */
            public C1411b freeze() {
                return this;
            }

            /* access modifiers changed from: package-private */
            /* renamed from: fa */
            public Set<Integer> mo8622fa() {
                return this.f3379Eq;
            }

            public int getHeight() {
                return this.f3382v;
            }

            public String getUrl() {
                return this.f3380iH;
            }

            /* access modifiers changed from: package-private */
            public int getVersionCode() {
                return this.f3381kg;
            }

            public int getWidth() {
                return this.f3383w;
            }

            public boolean hasHeight() {
                return this.f3379Eq.contains(2);
            }

            public boolean hasUrl() {
                return this.f3379Eq.contains(3);
            }

            public boolean hasWidth() {
                return this.f3379Eq.contains(4);
            }

            public int hashCode() {
                int i = 0;
                Iterator<C1115es.C1116a<?, ?>> it = f3378Ep.values().iterator();
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
                C1422il ilVar = CREATOR;
                C1422il.m3881a(this, out, flags);
            }
        }

        static {
            f3367Ep.put("coverInfo", C1115es.C1116a.m2671a("coverInfo", 2, C1410a.class));
            f3367Ep.put("coverPhoto", C1115es.C1116a.m2671a("coverPhoto", 3, C1411b.class));
            f3367Ep.put("layout", C1115es.C1116a.m2670a("layout", 4, new C1111ep().mo7579c("banner", 0), false));
        }

        public C1409b() {
            this.f3372kg = 1;
            this.f3368Eq = new HashSet();
        }

        C1409b(Set<Integer> set, int i, C1410a aVar, C1411b bVar, int i2) {
            this.f3368Eq = set;
            this.f3372kg = i;
            this.f3369FL = aVar;
            this.f3370FM = bVar;
            this.f3371FN = i2;
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
            return this.f3368Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 2:
                    return this.f3369FL;
                case 3:
                    return this.f3370FM;
                case 4:
                    return Integer.valueOf(this.f3371FN);
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3367Ep;
        }

        public int describeContents() {
            C1420ij ijVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1409b)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1409b bVar = (C1409b) obj;
            for (C1115es.C1116a next : f3367Ep.values()) {
                if (mo7602a(next)) {
                    if (!bVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(bVar.mo7603b(next))) {
                        return false;
                    }
                } else if (bVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fE */
        public C1410a mo8595fE() {
            return this.f3369FL;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fF */
        public C1411b mo8596fF() {
            return this.f3370FM;
        }

        /* renamed from: fG */
        public C1409b freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8598fa() {
            return this.f3368Eq;
        }

        public Person.Cover.CoverInfo getCoverInfo() {
            return this.f3369FL;
        }

        public Person.Cover.CoverPhoto getCoverPhoto() {
            return this.f3370FM;
        }

        public int getLayout() {
            return this.f3371FN;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3372kg;
        }

        public boolean hasCoverInfo() {
            return this.f3368Eq.contains(2);
        }

        public boolean hasCoverPhoto() {
            return this.f3368Eq.contains(3);
        }

        public boolean hasLayout() {
            return this.f3368Eq.contains(4);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3367Ep.values().iterator();
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
            C1420ij ijVar = CREATOR;
            C1420ij.m3875a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$c */
    public static final class C1412c extends C1115es implements SafeParcelable, Person.Image {
        public static final C1423im CREATOR = new C1423im();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3384Ep = new HashMap<>();

        /* renamed from: Eq */
        private final Set<Integer> f3385Eq;

        /* renamed from: iH */
        private String f3386iH;

        /* renamed from: kg */
        private final int f3387kg;

        static {
            f3384Ep.put(PlusShare.KEY_CALL_TO_ACTION_URL, C1115es.C1116a.m2677g(PlusShare.KEY_CALL_TO_ACTION_URL, 2));
        }

        public C1412c() {
            this.f3387kg = 1;
            this.f3385Eq = new HashSet();
        }

        public C1412c(String str) {
            this.f3385Eq = new HashSet();
            this.f3387kg = 1;
            this.f3386iH = str;
            this.f3385Eq.add(2);
        }

        C1412c(Set<Integer> set, int i, String str) {
            this.f3385Eq = set;
            this.f3387kg = i;
            this.f3386iH = str;
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
            return this.f3385Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 2:
                    return this.f3386iH;
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3384Ep;
        }

        public int describeContents() {
            C1423im imVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1412c)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1412c cVar = (C1412c) obj;
            for (C1115es.C1116a next : f3384Ep.values()) {
                if (mo7602a(next)) {
                    if (!cVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(cVar.mo7603b(next))) {
                        return false;
                    }
                } else if (cVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        /* renamed from: fJ */
        public C1412c freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8635fa() {
            return this.f3385Eq;
        }

        public String getUrl() {
            return this.f3386iH;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3387kg;
        }

        public boolean hasUrl() {
            return this.f3385Eq.contains(2);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3384Ep.values().iterator();
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
            C1423im imVar = CREATOR;
            C1423im.m3884a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$d */
    public static final class C1413d extends C1115es implements SafeParcelable, Person.Name {
        public static final C1424in CREATOR = new C1424in();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3388Ep = new HashMap<>();

        /* renamed from: EP */
        private String f3389EP;

        /* renamed from: ES */
        private String f3390ES;

        /* renamed from: Eq */
        private final Set<Integer> f3391Eq;

        /* renamed from: FQ */
        private String f3392FQ;

        /* renamed from: FR */
        private String f3393FR;

        /* renamed from: FS */
        private String f3394FS;

        /* renamed from: FT */
        private String f3395FT;

        /* renamed from: kg */
        private final int f3396kg;

        static {
            f3388Ep.put("familyName", C1115es.C1116a.m2677g("familyName", 2));
            f3388Ep.put("formatted", C1115es.C1116a.m2677g("formatted", 3));
            f3388Ep.put("givenName", C1115es.C1116a.m2677g("givenName", 4));
            f3388Ep.put("honorificPrefix", C1115es.C1116a.m2677g("honorificPrefix", 5));
            f3388Ep.put("honorificSuffix", C1115es.C1116a.m2677g("honorificSuffix", 6));
            f3388Ep.put("middleName", C1115es.C1116a.m2677g("middleName", 7));
        }

        public C1413d() {
            this.f3396kg = 1;
            this.f3391Eq = new HashSet();
        }

        C1413d(Set<Integer> set, int i, String str, String str2, String str3, String str4, String str5, String str6) {
            this.f3391Eq = set;
            this.f3396kg = i;
            this.f3389EP = str;
            this.f3392FQ = str2;
            this.f3390ES = str3;
            this.f3393FR = str4;
            this.f3394FS = str5;
            this.f3395FT = str6;
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
            return this.f3391Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 2:
                    return this.f3389EP;
                case 3:
                    return this.f3392FQ;
                case 4:
                    return this.f3390ES;
                case 5:
                    return this.f3393FR;
                case 6:
                    return this.f3394FS;
                case 7:
                    return this.f3395FT;
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3388Ep;
        }

        public int describeContents() {
            C1424in inVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1413d)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1413d dVar = (C1413d) obj;
            for (C1115es.C1116a next : f3388Ep.values()) {
                if (mo7602a(next)) {
                    if (!dVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(dVar.mo7603b(next))) {
                        return false;
                    }
                } else if (dVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        /* renamed from: fK */
        public C1413d freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8644fa() {
            return this.f3391Eq;
        }

        public String getFamilyName() {
            return this.f3389EP;
        }

        public String getFormatted() {
            return this.f3392FQ;
        }

        public String getGivenName() {
            return this.f3390ES;
        }

        public String getHonorificPrefix() {
            return this.f3393FR;
        }

        public String getHonorificSuffix() {
            return this.f3394FS;
        }

        public String getMiddleName() {
            return this.f3395FT;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3396kg;
        }

        public boolean hasFamilyName() {
            return this.f3391Eq.contains(2);
        }

        public boolean hasFormatted() {
            return this.f3391Eq.contains(3);
        }

        public boolean hasGivenName() {
            return this.f3391Eq.contains(4);
        }

        public boolean hasHonorificPrefix() {
            return this.f3391Eq.contains(5);
        }

        public boolean hasHonorificSuffix() {
            return this.f3391Eq.contains(6);
        }

        public boolean hasMiddleName() {
            return this.f3391Eq.contains(7);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3388Ep.values().iterator();
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
            C1424in inVar = CREATOR;
            C1424in.m3887a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$e */
    public static class C1414e {
        /* renamed from: aB */
        public static int m3846aB(String str) {
            if (str.equals("person")) {
                return 0;
            }
            if (str.equals("page")) {
                return 1;
            }
            throw new IllegalArgumentException("Unknown objectType string: " + str);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$f */
    public static final class C1415f extends C1115es implements SafeParcelable, Person.Organizations {
        public static final C1425io CREATOR = new C1425io();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3397Ep = new HashMap<>();

        /* renamed from: EO */
        private String f3398EO;

        /* renamed from: Eq */
        private final Set<Integer> f3399Eq;

        /* renamed from: FU */
        private String f3400FU;

        /* renamed from: FV */
        private String f3401FV;

        /* renamed from: FW */
        private boolean f3402FW;

        /* renamed from: Fe */
        private String f3403Fe;

        /* renamed from: kg */
        private final int f3404kg;
        private String mName;

        /* renamed from: os */
        private int f3405os;

        /* renamed from: qL */
        private String f3406qL;

        /* renamed from: sJ */
        private String f3407sJ;

        static {
            f3397Ep.put("department", C1115es.C1116a.m2677g("department", 2));
            f3397Ep.put(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, C1115es.C1116a.m2677g(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_DESCRIPTION, 3));
            f3397Ep.put("endDate", C1115es.C1116a.m2677g("endDate", 4));
            f3397Ep.put("location", C1115es.C1116a.m2677g("location", 5));
            f3397Ep.put("name", C1115es.C1116a.m2677g("name", 6));
            f3397Ep.put("primary", C1115es.C1116a.m2676f("primary", 7));
            f3397Ep.put("startDate", C1115es.C1116a.m2677g("startDate", 8));
            f3397Ep.put(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE, C1115es.C1116a.m2677g(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE, 9));
            f3397Ep.put(ServerProtocol.DIALOG_PARAM_TYPE, C1115es.C1116a.m2670a(ServerProtocol.DIALOG_PARAM_TYPE, 10, new C1111ep().mo7579c("work", 0).mo7579c("school", 1), false));
        }

        public C1415f() {
            this.f3404kg = 1;
            this.f3399Eq = new HashSet();
        }

        C1415f(Set<Integer> set, int i, String str, String str2, String str3, String str4, String str5, boolean z, String str6, String str7, int i2) {
            this.f3399Eq = set;
            this.f3404kg = i;
            this.f3400FU = str;
            this.f3407sJ = str2;
            this.f3398EO = str3;
            this.f3401FV = str4;
            this.mName = str5;
            this.f3402FW = z;
            this.f3403Fe = str6;
            this.f3406qL = str7;
            this.f3405os = i2;
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
            return this.f3399Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 2:
                    return this.f3400FU;
                case 3:
                    return this.f3407sJ;
                case 4:
                    return this.f3398EO;
                case 5:
                    return this.f3401FV;
                case 6:
                    return this.mName;
                case 7:
                    return Boolean.valueOf(this.f3402FW);
                case 8:
                    return this.f3403Fe;
                case 9:
                    return this.f3406qL;
                case 10:
                    return Integer.valueOf(this.f3405os);
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3397Ep;
        }

        public int describeContents() {
            C1425io ioVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1415f)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1415f fVar = (C1415f) obj;
            for (C1115es.C1116a next : f3397Ep.values()) {
                if (mo7602a(next)) {
                    if (!fVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(fVar.mo7603b(next))) {
                        return false;
                    }
                } else if (fVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        /* renamed from: fL */
        public C1415f freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8663fa() {
            return this.f3399Eq;
        }

        public String getDepartment() {
            return this.f3400FU;
        }

        public String getDescription() {
            return this.f3407sJ;
        }

        public String getEndDate() {
            return this.f3398EO;
        }

        public String getLocation() {
            return this.f3401FV;
        }

        public String getName() {
            return this.mName;
        }

        public String getStartDate() {
            return this.f3403Fe;
        }

        public String getTitle() {
            return this.f3406qL;
        }

        public int getType() {
            return this.f3405os;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3404kg;
        }

        public boolean hasDepartment() {
            return this.f3399Eq.contains(2);
        }

        public boolean hasDescription() {
            return this.f3399Eq.contains(3);
        }

        public boolean hasEndDate() {
            return this.f3399Eq.contains(4);
        }

        public boolean hasLocation() {
            return this.f3399Eq.contains(5);
        }

        public boolean hasName() {
            return this.f3399Eq.contains(6);
        }

        public boolean hasPrimary() {
            return this.f3399Eq.contains(7);
        }

        public boolean hasStartDate() {
            return this.f3399Eq.contains(8);
        }

        public boolean hasTitle() {
            return this.f3399Eq.contains(9);
        }

        public boolean hasType() {
            return this.f3399Eq.contains(10);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3397Ep.values().iterator();
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

        public boolean isPrimary() {
            return this.f3402FW;
        }

        public void writeToParcel(Parcel out, int flags) {
            C1425io ioVar = CREATOR;
            C1425io.m3890a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$g */
    public static final class C1416g extends C1115es implements SafeParcelable, Person.PlacesLived {
        public static final C1426ip CREATOR = new C1426ip();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3408Ep = new HashMap<>();

        /* renamed from: Eq */
        private final Set<Integer> f3409Eq;

        /* renamed from: FW */
        private boolean f3410FW;

        /* renamed from: kg */
        private final int f3411kg;
        private String mValue;

        static {
            f3408Ep.put("primary", C1115es.C1116a.m2676f("primary", 2));
            f3408Ep.put("value", C1115es.C1116a.m2677g("value", 3));
        }

        public C1416g() {
            this.f3411kg = 1;
            this.f3409Eq = new HashSet();
        }

        C1416g(Set<Integer> set, int i, boolean z, String str) {
            this.f3409Eq = set;
            this.f3411kg = i;
            this.f3410FW = z;
            this.mValue = str;
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
            return this.f3409Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 2:
                    return Boolean.valueOf(this.f3410FW);
                case 3:
                    return this.mValue;
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3408Ep;
        }

        public int describeContents() {
            C1426ip ipVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1416g)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1416g gVar = (C1416g) obj;
            for (C1115es.C1116a next : f3408Ep.values()) {
                if (mo7602a(next)) {
                    if (!gVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(gVar.mo7603b(next))) {
                        return false;
                    }
                } else if (gVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        /* renamed from: fM */
        public C1416g freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8688fa() {
            return this.f3409Eq;
        }

        public String getValue() {
            return this.mValue;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3411kg;
        }

        public boolean hasPrimary() {
            return this.f3409Eq.contains(2);
        }

        public boolean hasValue() {
            return this.f3409Eq.contains(3);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3408Ep.values().iterator();
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

        public boolean isPrimary() {
            return this.f3410FW;
        }

        public void writeToParcel(Parcel out, int flags) {
            C1426ip ipVar = CREATOR;
            C1426ip.m3893a(this, out, flags);
        }
    }

    /* renamed from: com.google.android.gms.internal.ig$h */
    public static final class C1417h extends C1115es implements SafeParcelable, Person.Urls {
        public static final C1427iq CREATOR = new C1427iq();

        /* renamed from: Ep */
        private static final HashMap<String, C1115es.C1116a<?, ?>> f3412Ep = new HashMap<>();

        /* renamed from: Eq */
        private final Set<Integer> f3413Eq;

        /* renamed from: FX */
        private String f3414FX;

        /* renamed from: FY */
        private final int f3415FY;

        /* renamed from: kg */
        private final int f3416kg;
        private String mValue;

        /* renamed from: os */
        private int f3417os;

        static {
            f3412Ep.put(PlusShare.KEY_CALL_TO_ACTION_LABEL, C1115es.C1116a.m2677g(PlusShare.KEY_CALL_TO_ACTION_LABEL, 5));
            f3412Ep.put(ServerProtocol.DIALOG_PARAM_TYPE, C1115es.C1116a.m2670a(ServerProtocol.DIALOG_PARAM_TYPE, 6, new C1111ep().mo7579c("home", 0).mo7579c("work", 1).mo7579c("blog", 2).mo7579c(Scopes.PROFILE, 3).mo7579c(MMDemographic.ETHNICITY_OTHER, 4).mo7579c("otherProfile", 5).mo7579c("contributor", 6).mo7579c("website", 7), false));
            f3412Ep.put("value", C1115es.C1116a.m2677g("value", 4));
        }

        public C1417h() {
            this.f3415FY = 4;
            this.f3416kg = 2;
            this.f3413Eq = new HashSet();
        }

        C1417h(Set<Integer> set, int i, String str, int i2, String str2, int i3) {
            this.f3415FY = 4;
            this.f3413Eq = set;
            this.f3416kg = i;
            this.f3414FX = str;
            this.f3417os = i2;
            this.mValue = str2;
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
            return this.f3413Eq.contains(Integer.valueOf(aVar.mo7615cq()));
        }

        /* access modifiers changed from: protected */
        /* renamed from: b */
        public Object mo7603b(C1115es.C1116a aVar) {
            switch (aVar.mo7615cq()) {
                case 4:
                    return this.mValue;
                case 5:
                    return this.f3414FX;
                case 6:
                    return Integer.valueOf(this.f3417os);
                default:
                    throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
            }
        }

        /* renamed from: cj */
        public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
            return f3412Ep;
        }

        public int describeContents() {
            C1427iq iqVar = CREATOR;
            return 0;
        }

        public boolean equals(Object obj) {
            if (!(obj instanceof C1417h)) {
                return false;
            }
            if (this == obj) {
                return true;
            }
            C1417h hVar = (C1417h) obj;
            for (C1115es.C1116a next : f3412Ep.values()) {
                if (mo7602a(next)) {
                    if (!hVar.mo7602a(next)) {
                        return false;
                    }
                    if (!mo7603b(next).equals(hVar.mo7603b(next))) {
                        return false;
                    }
                } else if (hVar.mo7602a(next)) {
                    return false;
                }
            }
            return true;
        }

        @Deprecated
        /* renamed from: fN */
        public int mo8698fN() {
            return 4;
        }

        /* renamed from: fO */
        public C1417h freeze() {
            return this;
        }

        /* access modifiers changed from: package-private */
        /* renamed from: fa */
        public Set<Integer> mo8700fa() {
            return this.f3413Eq;
        }

        public String getLabel() {
            return this.f3414FX;
        }

        public int getType() {
            return this.f3417os;
        }

        public String getValue() {
            return this.mValue;
        }

        /* access modifiers changed from: package-private */
        public int getVersionCode() {
            return this.f3416kg;
        }

        public boolean hasLabel() {
            return this.f3413Eq.contains(5);
        }

        public boolean hasType() {
            return this.f3413Eq.contains(6);
        }

        public boolean hasValue() {
            return this.f3413Eq.contains(4);
        }

        public int hashCode() {
            int i = 0;
            Iterator<C1115es.C1116a<?, ?>> it = f3412Ep.values().iterator();
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
            C1427iq iqVar = CREATOR;
            C1427iq.m3896a(this, out, flags);
        }
    }

    static {
        f3335Ep.put("aboutMe", C1115es.C1116a.m2677g("aboutMe", 2));
        f3335Ep.put("ageRange", C1115es.C1116a.m2671a("ageRange", 3, C1408a.class));
        f3335Ep.put("birthday", C1115es.C1116a.m2677g("birthday", 4));
        f3335Ep.put("braggingRights", C1115es.C1116a.m2677g("braggingRights", 5));
        f3335Ep.put("circledByCount", C1115es.C1116a.m2674d("circledByCount", 6));
        f3335Ep.put("cover", C1115es.C1116a.m2671a("cover", 7, C1409b.class));
        f3335Ep.put("currentLocation", C1115es.C1116a.m2677g("currentLocation", 8));
        f3335Ep.put("displayName", C1115es.C1116a.m2677g("displayName", 9));
        f3335Ep.put(MMAdView.KEY_GENDER, C1115es.C1116a.m2670a(MMAdView.KEY_GENDER, 12, new C1111ep().mo7579c(MMDemographic.GENDER_MALE, 0).mo7579c(MMDemographic.GENDER_FEMALE, 1).mo7579c(MMDemographic.ETHNICITY_OTHER, 2), false));
        f3335Ep.put(Constants.APP_ID, C1115es.C1116a.m2677g(Constants.APP_ID, 14));
        f3335Ep.put("image", C1115es.C1116a.m2671a("image", 15, C1412c.class));
        f3335Ep.put("isPlusUser", C1115es.C1116a.m2676f("isPlusUser", 16));
        f3335Ep.put("language", C1115es.C1116a.m2677g("language", 18));
        f3335Ep.put("name", C1115es.C1116a.m2671a("name", 19, C1413d.class));
        f3335Ep.put("nickname", C1115es.C1116a.m2677g("nickname", 20));
        f3335Ep.put("objectType", C1115es.C1116a.m2670a("objectType", 21, new C1111ep().mo7579c("person", 0).mo7579c("page", 1), false));
        f3335Ep.put("organizations", C1115es.C1116a.m2672b("organizations", 22, C1415f.class));
        f3335Ep.put("placesLived", C1115es.C1116a.m2672b("placesLived", 23, C1416g.class));
        f3335Ep.put("plusOneCount", C1115es.C1116a.m2674d("plusOneCount", 24));
        f3335Ep.put("relationshipStatus", C1115es.C1116a.m2670a("relationshipStatus", 25, new C1111ep().mo7579c(MMDemographic.MARITAL_SINGLE, 0).mo7579c("in_a_relationship", 1).mo7579c(MMDemographic.MARITAL_ENGAGED, 2).mo7579c(MMDemographic.MARITAL_MARRIED, 3).mo7579c("its_complicated", 4).mo7579c("open_relationship", 5).mo7579c("widowed", 6).mo7579c("in_domestic_partnership", 7).mo7579c("in_civil_union", 8), false));
        f3335Ep.put("tagline", C1115es.C1116a.m2677g("tagline", 26));
        f3335Ep.put(PlusShare.KEY_CALL_TO_ACTION_URL, C1115es.C1116a.m2677g(PlusShare.KEY_CALL_TO_ACTION_URL, 27));
        f3335Ep.put("urls", C1115es.C1116a.m2672b("urls", 28, C1417h.class));
        f3335Ep.put("verified", C1115es.C1116a.m2676f("verified", 29));
    }

    public C1407ig() {
        this.f3359kg = 2;
        this.f3336Eq = new HashSet();
    }

    public C1407ig(String str, String str2, C1412c cVar, int i, String str3) {
        this.f3359kg = 2;
        this.f3336Eq = new HashSet();
        this.f3360qa = str;
        this.f3336Eq.add(9);
        this.f3361uS = str2;
        this.f3336Eq.add(14);
        this.f3353Fw = cVar;
        this.f3336Eq.add(15);
        this.f3338FB = i;
        this.f3336Eq.add(21);
        this.f3358iH = str3;
        this.f3336Eq.add(27);
    }

    C1407ig(Set<Integer> set, int i, String str, C1408a aVar, String str2, String str3, int i2, C1409b bVar, String str4, String str5, int i3, String str6, C1412c cVar, boolean z, String str7, C1413d dVar, String str8, int i4, List<C1415f> list, List<C1416g> list2, int i5, int i6, String str9, String str10, List<C1417h> list3, boolean z2) {
        this.f3336Eq = set;
        this.f3359kg = i;
        this.f3346Fp = str;
        this.f3347Fq = aVar;
        this.f3348Fr = str2;
        this.f3349Fs = str3;
        this.f3350Ft = i2;
        this.f3351Fu = bVar;
        this.f3352Fv = str4;
        this.f3360qa = str5;
        this.f3357eL = i3;
        this.f3361uS = str6;
        this.f3353Fw = cVar;
        this.f3354Fx = z;
        this.f3355Fy = str7;
        this.f3356Fz = dVar;
        this.f3337FA = str8;
        this.f3338FB = i4;
        this.f3339FC = list;
        this.f3340FD = list2;
        this.f3341FE = i5;
        this.f3342FF = i6;
        this.f3343FG = str9;
        this.f3358iH = str10;
        this.f3344FH = list3;
        this.f3345FI = z2;
    }

    /* renamed from: g */
    public static C1407ig m3787g(byte[] bArr) {
        Parcel obtain = Parcel.obtain();
        obtain.unmarshall(bArr, 0, bArr.length);
        obtain.setDataPosition(0);
        C1407ig au = CREATOR.createFromParcel(obtain);
        obtain.recycle();
        return au;
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
        return this.f3336Eq.contains(Integer.valueOf(aVar.mo7615cq()));
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public Object mo7603b(C1115es.C1116a aVar) {
        switch (aVar.mo7615cq()) {
            case 2:
                return this.f3346Fp;
            case 3:
                return this.f3347Fq;
            case 4:
                return this.f3348Fr;
            case 5:
                return this.f3349Fs;
            case 6:
                return Integer.valueOf(this.f3350Ft);
            case 7:
                return this.f3351Fu;
            case 8:
                return this.f3352Fv;
            case 9:
                return this.f3360qa;
            case 12:
                return Integer.valueOf(this.f3357eL);
            case 14:
                return this.f3361uS;
            case 15:
                return this.f3353Fw;
            case 16:
                return Boolean.valueOf(this.f3354Fx);
            case 18:
                return this.f3355Fy;
            case 19:
                return this.f3356Fz;
            case MMError.DISPLAY_AD_NOT_READY /*20*/:
                return this.f3337FA;
            case MMError.DISPLAY_AD_EXPIRED /*21*/:
                return Integer.valueOf(this.f3338FB);
            case MMError.DISPLAY_AD_NOT_FOUND /*22*/:
                return this.f3339FC;
            case MMError.DISPLAY_AD_ALREADY_DISPLAYED /*23*/:
                return this.f3340FD;
            case MMError.DISPLAY_AD_NOT_PERMITTED /*24*/:
                return Integer.valueOf(this.f3341FE);
            case 25:
                return Integer.valueOf(this.f3342FF);
            case 26:
                return this.f3343FG;
            case 27:
                return this.f3358iH;
            case 28:
                return this.f3344FH;
            case 29:
                return Boolean.valueOf(this.f3345FI);
            default:
                throw new IllegalStateException("Unknown safe parcelable id=" + aVar.mo7615cq());
        }
    }

    /* renamed from: cj */
    public HashMap<String, C1115es.C1116a<?, ?>> mo7604cj() {
        return f3335Ep;
    }

    public int describeContents() {
        C1418ih ihVar = CREATOR;
        return 0;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C1407ig)) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        C1407ig igVar = (C1407ig) obj;
        for (C1115es.C1116a next : f3335Ep.values()) {
            if (mo7602a(next)) {
                if (!igVar.mo7602a(next)) {
                    return false;
                }
                if (!mo7603b(next).equals(igVar.mo7603b(next))) {
                    return false;
                }
            } else if (igVar.mo7602a(next)) {
                return false;
            }
        }
        return true;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fA */
    public List<C1416g> mo8522fA() {
        return this.f3340FD;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fB */
    public List<C1417h> mo8523fB() {
        return this.f3344FH;
    }

    /* renamed from: fC */
    public C1407ig freeze() {
        return this;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fa */
    public Set<Integer> mo8525fa() {
        return this.f3336Eq;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fv */
    public C1408a mo8526fv() {
        return this.f3347Fq;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fw */
    public C1409b mo8527fw() {
        return this.f3351Fu;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fx */
    public C1412c mo8528fx() {
        return this.f3353Fw;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fy */
    public C1413d mo8529fy() {
        return this.f3356Fz;
    }

    /* access modifiers changed from: package-private */
    /* renamed from: fz */
    public List<C1415f> mo8530fz() {
        return this.f3339FC;
    }

    public String getAboutMe() {
        return this.f3346Fp;
    }

    public Person.AgeRange getAgeRange() {
        return this.f3347Fq;
    }

    public String getBirthday() {
        return this.f3348Fr;
    }

    public String getBraggingRights() {
        return this.f3349Fs;
    }

    public int getCircledByCount() {
        return this.f3350Ft;
    }

    public Person.Cover getCover() {
        return this.f3351Fu;
    }

    public String getCurrentLocation() {
        return this.f3352Fv;
    }

    public String getDisplayName() {
        return this.f3360qa;
    }

    public int getGender() {
        return this.f3357eL;
    }

    public String getId() {
        return this.f3361uS;
    }

    public Person.Image getImage() {
        return this.f3353Fw;
    }

    public String getLanguage() {
        return this.f3355Fy;
    }

    public Person.Name getName() {
        return this.f3356Fz;
    }

    public String getNickname() {
        return this.f3337FA;
    }

    public int getObjectType() {
        return this.f3338FB;
    }

    public List<Person.Organizations> getOrganizations() {
        return (ArrayList) this.f3339FC;
    }

    public List<Person.PlacesLived> getPlacesLived() {
        return (ArrayList) this.f3340FD;
    }

    public int getPlusOneCount() {
        return this.f3341FE;
    }

    public int getRelationshipStatus() {
        return this.f3342FF;
    }

    public String getTagline() {
        return this.f3343FG;
    }

    public String getUrl() {
        return this.f3358iH;
    }

    public List<Person.Urls> getUrls() {
        return (ArrayList) this.f3344FH;
    }

    /* access modifiers changed from: package-private */
    public int getVersionCode() {
        return this.f3359kg;
    }

    public boolean hasAboutMe() {
        return this.f3336Eq.contains(2);
    }

    public boolean hasAgeRange() {
        return this.f3336Eq.contains(3);
    }

    public boolean hasBirthday() {
        return this.f3336Eq.contains(4);
    }

    public boolean hasBraggingRights() {
        return this.f3336Eq.contains(5);
    }

    public boolean hasCircledByCount() {
        return this.f3336Eq.contains(6);
    }

    public boolean hasCover() {
        return this.f3336Eq.contains(7);
    }

    public boolean hasCurrentLocation() {
        return this.f3336Eq.contains(8);
    }

    public boolean hasDisplayName() {
        return this.f3336Eq.contains(9);
    }

    public boolean hasGender() {
        return this.f3336Eq.contains(12);
    }

    public boolean hasId() {
        return this.f3336Eq.contains(14);
    }

    public boolean hasImage() {
        return this.f3336Eq.contains(15);
    }

    public boolean hasIsPlusUser() {
        return this.f3336Eq.contains(16);
    }

    public boolean hasLanguage() {
        return this.f3336Eq.contains(18);
    }

    public boolean hasName() {
        return this.f3336Eq.contains(19);
    }

    public boolean hasNickname() {
        return this.f3336Eq.contains(20);
    }

    public boolean hasObjectType() {
        return this.f3336Eq.contains(21);
    }

    public boolean hasOrganizations() {
        return this.f3336Eq.contains(22);
    }

    public boolean hasPlacesLived() {
        return this.f3336Eq.contains(23);
    }

    public boolean hasPlusOneCount() {
        return this.f3336Eq.contains(24);
    }

    public boolean hasRelationshipStatus() {
        return this.f3336Eq.contains(25);
    }

    public boolean hasTagline() {
        return this.f3336Eq.contains(26);
    }

    public boolean hasUrl() {
        return this.f3336Eq.contains(27);
    }

    public boolean hasUrls() {
        return this.f3336Eq.contains(28);
    }

    public boolean hasVerified() {
        return this.f3336Eq.contains(29);
    }

    public int hashCode() {
        int i = 0;
        Iterator<C1115es.C1116a<?, ?>> it = f3335Ep.values().iterator();
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

    public boolean isPlusUser() {
        return this.f3354Fx;
    }

    public boolean isVerified() {
        return this.f3345FI;
    }

    public void writeToParcel(Parcel out, int flags) {
        C1418ih ihVar = CREATOR;
        C1418ih.m3869a(this, out, flags);
    }
}
