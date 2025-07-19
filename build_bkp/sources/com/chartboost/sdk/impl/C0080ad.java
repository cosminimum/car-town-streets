package com.chartboost.sdk.impl;

import java.lang.reflect.Array;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Map;
import java.util.SimpleTimeZone;
import java.util.UUID;
import java.util.regex.Pattern;

/* renamed from: com.chartboost.sdk.impl.ad */
public class C0080ad {
    /* renamed from: a */
    public static C0102af m152a() {
        C0078ab b = m153b();
        b.mo1252a(Date.class, (C0102af) new C0090i(b));
        b.mo1252a(C0120as.class, (C0102af) new C0088g(b));
        b.mo1252a(C0121at.class, (C0102af) new C0089h());
        b.mo1252a(byte[].class, (C0102af) new C0089h());
        return b;
    }

    /* renamed from: b */
    static C0078ab m153b() {
        C0078ab abVar = new C0078ab();
        abVar.mo1252a(Object[].class, (C0102af) new C0094m(abVar));
        abVar.mo1252a(Boolean.class, (C0102af) new C0098q());
        abVar.mo1252a(C0122au.class, (C0102af) new C0082a(abVar));
        abVar.mo1252a(C0123av.class, (C0102af) new C0083b(abVar));
        abVar.mo1252a(C0217y.class, (C0102af) new C0085d(abVar));
        abVar.mo1252a(C0218z.class, (C0102af) new C0086e(abVar));
        abVar.mo1252a(Iterable.class, (C0102af) new C0087f(abVar));
        abVar.mo1252a(Map.class, (C0102af) new C0091j(abVar));
        abVar.mo1252a(C0124aw.class, (C0102af) new C0092k(abVar));
        abVar.mo1252a(C0125ax.class, (C0102af) new C0093l(abVar));
        abVar.mo1252a(Number.class, (C0102af) new C0098q());
        abVar.mo1252a(C0126ay.class, (C0102af) new C0095n(abVar));
        abVar.mo1252a(Pattern.class, (C0102af) new C0096o(abVar));
        abVar.mo1252a(String.class, (C0102af) new C0097p());
        abVar.mo1252a(UUID.class, (C0102af) new C0099r(abVar));
        return abVar;
    }

    /* renamed from: com.chartboost.sdk.impl.ad$c */
    private static abstract class C0084c extends C0077aa {

        /* renamed from: a */
        protected final C0102af f133a;

        C0084c(C0102af afVar) {
            this.f133a = afVar;
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$h */
    private static class C0089h extends C0077aa {
        private C0089h() {
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            sb.append("<Binary Data>");
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$m */
    private static class C0094m extends C0084c {
        C0094m(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            sb.append("[ ");
            for (int i = 0; i < Array.getLength(obj); i++) {
                if (i > 0) {
                    sb.append(" , ");
                }
                this.f133a.mo1253a(Array.get(obj, i), sb);
            }
            sb.append("]");
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$q */
    private static class C0098q extends C0077aa {
        private C0098q() {
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            sb.append(obj.toString());
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$g */
    private static class C0088g extends C0084c {
        C0088g(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0120as asVar = (C0120as) obj;
            C0215w wVar = new C0215w();
            wVar.put("$ts", Integer.valueOf(asVar.mo1323a()));
            wVar.put("$inc", Integer.valueOf(asVar.mo1325b()));
            this.f133a.mo1253a(wVar, sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$a */
    private static class C0082a extends C0084c {
        C0082a(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0215w wVar = new C0215w();
            wVar.put("$code", ((C0122au) obj).mo1332a());
            this.f133a.mo1253a(wVar, sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$b */
    private static class C0083b extends C0084c {
        C0083b(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0123av avVar = (C0123av) obj;
            C0215w wVar = new C0215w();
            wVar.put("$code", avVar.mo1332a());
            wVar.put("$scope", avVar.mo1336b());
            this.f133a.mo1253a(wVar, sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$i */
    private static class C0090i extends C0084c {
        C0090i(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
            simpleDateFormat.setCalendar(new GregorianCalendar(new SimpleTimeZone(0, "GMT")));
            this.f133a.mo1253a(new C0215w("$date", simpleDateFormat.format((Date) obj)), sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$d */
    private static class C0085d extends C0084c {
        C0085d(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            sb.append("{ ");
            C0217y yVar = (C0217y) obj;
            boolean z = true;
            for (String next : yVar.keySet()) {
                if (z) {
                    z = false;
                } else {
                    sb.append(" , ");
                }
                C0079ac.m151a(sb, next);
                sb.append(" : ");
                this.f133a.mo1253a(yVar.mo1259a(next), sb);
            }
            sb.append("}");
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$e */
    private static class C0086e extends C0084c {
        C0086e(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0218z zVar = (C0218z) obj;
            C0215w wVar = new C0215w();
            wVar.put("$ref", zVar.mo1519b());
            wVar.put("$id", zVar.mo1518a());
            this.f133a.mo1253a(wVar, sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$f */
    private static class C0087f extends C0084c {
        C0087f(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            boolean z = true;
            sb.append("[ ");
            for (Object next : (Iterable) obj) {
                if (z) {
                    z = false;
                } else {
                    sb.append(" , ");
                }
                this.f133a.mo1253a(next, sb);
            }
            sb.append("]");
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$j */
    private static class C0091j extends C0084c {
        C0091j(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            sb.append("{ ");
            boolean z = true;
            for (Map.Entry entry : ((Map) obj).entrySet()) {
                if (z) {
                    z = false;
                } else {
                    sb.append(" , ");
                }
                C0079ac.m151a(sb, entry.getKey().toString());
                sb.append(" : ");
                this.f133a.mo1253a(entry.getValue(), sb);
            }
            sb.append("}");
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$k */
    private static class C0092k extends C0084c {
        C0092k(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            this.f133a.mo1253a(new C0215w("$maxKey", 1), sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$l */
    private static class C0093l extends C0084c {
        C0093l(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            this.f133a.mo1253a(new C0215w("$minKey", 1), sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$n */
    private static class C0095n extends C0084c {
        C0095n(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            this.f133a.mo1253a(new C0215w("$oid", obj.toString()), sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$o */
    private static class C0096o extends C0084c {
        C0096o(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0215w wVar = new C0215w();
            wVar.mo1260a("$regex", obj.toString());
            if (((Pattern) obj).flags() != 0) {
                wVar.mo1260a("$options", C0216x.m174a(((Pattern) obj).flags()));
            }
            this.f133a.mo1253a(wVar, sb);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$p */
    private static class C0097p extends C0077aa {
        private C0097p() {
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0079ac.m151a(sb, (String) obj);
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ad$r */
    private static class C0099r extends C0084c {
        C0099r(C0102af afVar) {
            super(afVar);
        }

        /* renamed from: a */
        public void mo1253a(Object obj, StringBuilder sb) {
            C0215w wVar = new C0215w();
            wVar.put("$uuid", ((UUID) obj).toString());
            this.f133a.mo1253a(wVar, sb);
        }
    }
}
