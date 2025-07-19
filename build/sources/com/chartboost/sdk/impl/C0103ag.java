package com.chartboost.sdk.impl;

import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/* renamed from: com.chartboost.sdk.impl.ag */
public class C0103ag {

    /* renamed from: a */
    private static boolean f136a = false;

    /* renamed from: b */
    private static boolean f137b = false;

    /* renamed from: f */
    static final Logger f138f = Logger.getLogger("org.bson.BSON");

    /* renamed from: g */
    static C0153bd<List<C0113an>> f139g = new C0153bd<>();

    /* renamed from: h */
    static C0153bd<List<C0113an>> f140h = new C0153bd<>();

    /* renamed from: i */
    protected static Charset f141i = Charset.forName("UTF-8");

    /* renamed from: j */
    static ThreadLocal<C0108ai> f142j = new ThreadLocal<C0108ai>() {
        /* access modifiers changed from: protected */
        /* renamed from: a */
        public C0108ai initialValue() {
            return new C0111al();
        }
    };

    /* renamed from: k */
    static ThreadLocal<C0107ah> f143k = new ThreadLocal<C0107ah>() {
        /* access modifiers changed from: protected */
        /* renamed from: a */
        public C0107ah initialValue() {
            return new C0110ak();
        }
    };

    /* renamed from: a */
    public static String m174a(int i) {
        StringBuilder sb = new StringBuilder();
        int i2 = i;
        for (C0106a aVar : C0106a.values()) {
            if ((aVar.f155j & i2) > 0) {
                sb.append(aVar.f156k);
                i2 -= aVar.f155j;
            }
        }
        if (i2 <= 0) {
            return sb.toString();
        }
        throw new IllegalArgumentException("some flags could not be recognized.");
    }

    /* renamed from: com.chartboost.sdk.impl.ag$a */
    private enum C0106a {
        CANON_EQ(128, 'c', "Pattern.CANON_EQ"),
        UNIX_LINES(1, 'd', "Pattern.UNIX_LINES"),
        GLOBAL(256, 'g', (int) null),
        CASE_INSENSITIVE(2, 'i', (int) null),
        MULTILINE(8, 'm', (int) null),
        DOTALL(32, 's', "Pattern.DOTALL"),
        LITERAL(16, 't', "Pattern.LITERAL"),
        UNICODE_CASE(64, 'u', "Pattern.UNICODE_CASE"),
        COMMENTS(4, 'x', (int) null);
        

        /* renamed from: m */
        private static final Map<Character, C0106a> f153m = null;

        /* renamed from: j */
        public final int f155j;

        /* renamed from: k */
        public final char f156k;

        /* renamed from: l */
        public final String f157l;

        static {
            int i;
            f153m = new HashMap();
            for (C0106a aVar : values()) {
                f153m.put(Character.valueOf(aVar.f156k), aVar);
            }
        }

        private C0106a(int i, char c, String str) {
            this.f155j = i;
            this.f156k = c;
            this.f157l = str;
        }
    }

    /* renamed from: a */
    public static Object m173a(Object obj) {
        List<C0113an> a;
        if (!(!m175a() || f139g.mo1414a() == 0 || obj == null || (a = f139g.mo1416a(obj.getClass())) == null)) {
            for (C0113an a2 : a) {
                obj = a2.mo1291a(obj);
            }
        }
        return obj;
    }

    /* renamed from: a */
    private static boolean m175a() {
        return f136a || f137b;
    }
}
