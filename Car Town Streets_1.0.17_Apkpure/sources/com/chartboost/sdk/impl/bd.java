package com.chartboost.sdk.impl;

import java.util.List;
import java.util.Map;
/* loaded from: classes.dex */
public class bd<T> {
    private final Map<Class<?>, T> a = bf.c();
    private final Map<Class<?>, T> b = be.a((bg) new a());

    public static <T> List<Class<?>> a(Class<T> cls) {
        return bc.a(cls);
    }

    /* loaded from: classes.dex */
    private final class a implements bg<Class<?>, T> {
        private a() {
        }

        @Override // com.chartboost.sdk.impl.bg
        public T a(Class<?> cls) {
            for (Class<?> cls2 : bd.a((Class) cls)) {
                T t = (T) bd.this.a.get(cls2);
                if (t != null) {
                    return t;
                }
            }
            return null;
        }
    }

    public T a(Object obj) {
        return this.b.get(obj);
    }

    public T a(Class<?> cls, T t) {
        try {
            return this.a.put(cls, t);
        } finally {
            this.b.clear();
        }
    }

    public int a() {
        return this.a.size();
    }
}
