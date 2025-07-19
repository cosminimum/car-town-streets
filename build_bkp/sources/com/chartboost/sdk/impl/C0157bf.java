package com.chartboost.sdk.impl;

import com.chartboost.sdk.impl.C0137ba;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.chartboost.sdk.impl.bf */
abstract class C0157bf<K, V> extends C0137ba<K, V, Map<K, V>> {
    /* renamed from: b */
    public static <K, V> C0158a<K, V> m320b() {
        return new C0158a<>();
    }

    /* renamed from: com.chartboost.sdk.impl.bf$a */
    public static class C0158a<K, V> {

        /* renamed from: a */
        private C0137ba.C0146h.C0147a f229a = C0137ba.C0146h.C0147a.STABLE;

        /* renamed from: b */
        private final Map<K, V> f230b = new HashMap();

        C0158a() {
        }

        /* renamed from: a */
        public C0157bf<K, V> mo1433a() {
            return new C0159b(this.f230b, this.f229a);
        }
    }

    /* renamed from: c */
    public static <K, V> C0157bf<K, V> m321c() {
        return m320b().mo1433a();
    }

    protected C0157bf(Map<? extends K, ? extends V> map, C0137ba.C0146h.C0147a aVar) {
        super(map, aVar);
    }

    /* renamed from: com.chartboost.sdk.impl.bf$b */
    static class C0159b<K, V> extends C0157bf<K, V> {
        C0159b(Map<? extends K, ? extends V> map, C0137ba.C0146h.C0147a aVar) {
            super(map, aVar);
        }

        /* renamed from: a */
        public <N extends Map<? extends K, ? extends V>> Map<K, V> mo1361a(N n) {
            return new HashMap(n);
        }
    }
}
