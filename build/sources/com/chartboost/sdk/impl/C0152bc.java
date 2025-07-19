package com.chartboost.sdk.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.ConcurrentMap;

/* renamed from: com.chartboost.sdk.impl.bc */
class C0152bc {

    /* renamed from: a */
    private static final ConcurrentMap<Class<?>, List<Class<?>>> f223a = C0157bf.m321c();

    /* renamed from: a */
    public static <T> List<Class<?>> m307a(Class<T> cls) {
        ConcurrentMap<Class<?>, List<Class<?>>> a = m308a();
        while (true) {
            List<Class<?>> list = (List) a.get(cls);
            if (list != null) {
                return list;
            }
            a.putIfAbsent(cls, m310b(cls));
        }
    }

    /* renamed from: b */
    private static List<Class<?>> m310b(Class<?> cls) {
        ArrayList arrayList = new ArrayList();
        arrayList.add(Object.class);
        m309a(cls, arrayList);
        Collections.reverse(arrayList);
        return Collections.unmodifiableList(new ArrayList(arrayList));
    }

    /* renamed from: a */
    private static <T> void m309a(Class<T> cls, List<Class<?>> list) {
        if (cls != null && cls != Object.class) {
            Class[] interfaces = cls.getInterfaces();
            for (int length = interfaces.length - 1; length >= 0; length--) {
                m309a(interfaces[length], list);
            }
            m309a(cls.getSuperclass(), list);
            if (!list.contains(cls)) {
                list.add(cls);
            }
        }
    }

    /* renamed from: a */
    private static ConcurrentMap<Class<?>, List<Class<?>>> m308a() {
        return f223a;
    }
}
