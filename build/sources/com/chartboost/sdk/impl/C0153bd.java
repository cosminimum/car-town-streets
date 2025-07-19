package com.chartboost.sdk.impl;

import java.util.List;
import java.util.Map;

/* renamed from: com.chartboost.sdk.impl.bd */
public class C0153bd<T> {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public final Map<Class<?>, T> f224a = C0157bf.m321c();

    /* renamed from: b */
    private final Map<Class<?>, T> f225b = C0156be.m318a(new C0155a());

    /* renamed from: a */
    public static <T> List<Class<?>> m311a(Class<T> cls) {
        return C0152bc.m307a(cls);
    }

    /* renamed from: com.chartboost.sdk.impl.bd$a */
    private final class C0155a implements C0160bg<Class<?>, T> {
        private C0155a() {
        }

        /* renamed from: a */
        public T mo1418a(Class<?> cls) {
            for (Class<?> cls2 : C0153bd.m311a(cls)) {
                T t = C0153bd.this.f224a.get(cls2);
                if (t != null) {
                    return t;
                }
            }
            return null;
        }
    }

    /* renamed from: a */
    public T mo1416a(Object obj) {
        return this.f225b.get(obj);
    }

    /* renamed from: a */
    public T mo1415a(Class<?> cls, T t) {
        try {
            return this.f224a.put(cls, t);
        } finally {
            this.f225b.clear();
        }
    }

    /* renamed from: a */
    public int mo1414a() {
        return this.f224a.size();
    }
}
