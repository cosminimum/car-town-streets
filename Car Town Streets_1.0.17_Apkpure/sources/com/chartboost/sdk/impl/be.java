package com.chartboost.sdk.impl;

import java.util.Collection;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
/* loaded from: classes.dex */
final class be<K, V> implements bg<K, V>, Map<K, V> {
    private final ConcurrentMap<K, V> a;
    private final bg<K, V> b;

    public static <K, V> Map<K, V> a(bg<K, V> bgVar) {
        return new be(bf.c(), bgVar);
    }

    be(ConcurrentMap<K, V> concurrentMap, bg<K, V> bgVar) {
        this.a = (ConcurrentMap) bb.a("map", concurrentMap);
        this.b = (bg) bb.a("function", bgVar);
    }

    @Override // java.util.Map
    public V get(Object key) {
        while (true) {
            V v = this.a.get(key);
            if (v == null) {
                V a = this.b.a(key);
                if (a == null) {
                    return null;
                }
                this.a.putIfAbsent(key, a);
            } else {
                return v;
            }
        }
    }

    @Override // com.chartboost.sdk.impl.bg
    public V a(K k) {
        return get(k);
    }

    @Override // java.util.Map
    public int size() {
        return this.a.size();
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return this.a.isEmpty();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        return this.a.containsKey(key);
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        return this.a.containsValue(value);
    }

    @Override // java.util.Map
    public V put(K key, V value) {
        return this.a.put(key, value);
    }

    @Override // java.util.Map
    public V remove(Object key) {
        return this.a.remove(key);
    }

    @Override // java.util.Map
    public void putAll(Map<? extends K, ? extends V> m) {
        this.a.putAll(m);
    }

    @Override // java.util.Map
    public void clear() {
        this.a.clear();
    }

    @Override // java.util.Map
    public Set<K> keySet() {
        return this.a.keySet();
    }

    @Override // java.util.Map
    public Collection<V> values() {
        return this.a.values();
    }

    @Override // java.util.Map
    public Set<Map.Entry<K, V>> entrySet() {
        return this.a.entrySet();
    }

    @Override // java.util.Map
    public boolean equals(Object o) {
        return this.a.equals(o);
    }

    @Override // java.util.Map
    public int hashCode() {
        return this.a.hashCode();
    }
}
