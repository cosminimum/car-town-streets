package com.chartboost.sdk.impl;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;

/* renamed from: com.chartboost.sdk.impl.be */
final class C0156be<K, V> implements C0160bg<K, V>, Map<K, V> {

    /* renamed from: a */
    private final ConcurrentMap<K, V> f227a;

    /* renamed from: b */
    private final C0160bg<K, V> f228b;

    /* renamed from: a */
    public static <K, V> Map<K, V> m318a(C0160bg<K, V> bgVar) {
        return new C0156be(C0157bf.m321c(), bgVar);
    }

    C0156be(ConcurrentMap<K, V> concurrentMap, C0160bg<K, V> bgVar) {
        this.f227a = (ConcurrentMap) C0150bb.m306a("map", concurrentMap);
        this.f228b = (C0160bg) C0150bb.m306a("function", bgVar);
    }

    public V get(Object key) {
        while (true) {
            V v = this.f227a.get(key);
            if (v != null) {
                return v;
            }
            V a = this.f228b.mo1418a(key);
            if (a == null) {
                return null;
            }
            this.f227a.putIfAbsent(key, a);
        }
    }

    /* renamed from: a */
    public V mo1418a(K k) {
        return get(k);
    }

    public int size() {
        return this.f227a.size();
    }

    public boolean isEmpty() {
        return this.f227a.isEmpty();
    }

    public boolean containsKey(Object key) {
        return this.f227a.containsKey(key);
    }

    public boolean containsValue(Object value) {
        return this.f227a.containsValue(value);
    }

    public V put(K key, V value) {
        return this.f227a.put(key, value);
    }

    public V remove(Object key) {
        return this.f227a.remove(key);
    }

    public void putAll(Map<? extends K, ? extends V> m) {
        this.f227a.putAll(m);
    }

    public void clear() {
        this.f227a.clear();
    }

    public Set<K> keySet() {
        return this.f227a.keySet();
    }

    public Collection<V> values() {
        return this.f227a.values();
    }

    public Set<Map.Entry<K, V>> entrySet() {
        return this.f227a.entrySet();
    }

    public boolean equals(Object o) {
        return this.f227a.equals(o);
    }

    public int hashCode() {
        return this.f227a.hashCode();
    }
}
