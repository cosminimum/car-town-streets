package com.chartboost.sdk.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.Collections;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public abstract class ba<K, V, M extends Map<K, V>> implements Serializable, ConcurrentMap<K, V> {
    private volatile M a;
    private final transient Lock b = new ReentrantLock();
    private final h<K, V> c;

    abstract <N extends Map<? extends K, ? extends V>> M a(N n);

    /* JADX INFO: Access modifiers changed from: protected */
    public <N extends Map<? extends K, ? extends V>> ba(N n, h.a aVar) {
        this.a = (M) bb.a("delegate", a((ba<K, V, M>) bb.a("map", n)));
        this.c = ((h.a) bb.a("viewType", aVar)).a(this);
    }

    @Override // java.util.Map
    public final void clear() {
        this.b.lock();
        try {
            b((ba<K, V, M>) a((ba<K, V, M>) Collections.emptyMap()));
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.Map
    public final V remove(Object key) {
        this.b.lock();
        try {
            if (this.a.containsKey(key)) {
                M a2 = a();
                V v = (V) a2.remove(key);
                b((ba<K, V, M>) a2);
                return v;
            }
            return null;
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public boolean remove(Object key, Object value) {
        Lock lock;
        this.b.lock();
        try {
            if (this.a.containsKey(key) && a(value, this.a.get(key))) {
                M a2 = a();
                a2.remove(key);
                b((ba<K, V, M>) a2);
                return true;
            }
            return false;
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public boolean replace(K key, V oldValue, V newValue) {
        Lock lock;
        this.b.lock();
        try {
            if (this.a.containsKey(key) && a(oldValue, this.a.get(key))) {
                M a2 = a();
                a2.put(key, newValue);
                b((ba<K, V, M>) a2);
                return true;
            }
            return false;
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public V replace(K key, V value) {
        this.b.lock();
        try {
            if (this.a.containsKey(key)) {
                M a2 = a();
                V v = (V) a2.put(key, value);
                b((ba<K, V, M>) a2);
                return v;
            }
            return null;
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.Map
    public final V put(K key, V value) {
        this.b.lock();
        try {
            M a2 = a();
            V v = (V) a2.put(key, value);
            b((ba<K, V, M>) a2);
            return v;
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.concurrent.ConcurrentMap, java.util.Map
    public V putIfAbsent(K key, V value) {
        V v;
        this.b.lock();
        try {
            if (!this.a.containsKey(key)) {
                M a2 = a();
                v = (V) a2.put(key, value);
                b((ba<K, V, M>) a2);
            } else {
                v = (V) this.a.get(key);
            }
            return v;
        } finally {
            this.b.unlock();
        }
    }

    @Override // java.util.Map
    public final void putAll(Map<? extends K, ? extends V> t) {
        this.b.lock();
        try {
            M a2 = a();
            a2.putAll(t);
            b((ba<K, V, M>) a2);
        } finally {
            this.b.unlock();
        }
    }

    protected M a() {
        this.b.lock();
        try {
            return a((ba<K, V, M>) this.a);
        } finally {
            this.b.unlock();
        }
    }

    protected void b(M m) {
        this.a = m;
    }

    @Override // java.util.Map
    public final Set<Map.Entry<K, V>> entrySet() {
        return this.c.b();
    }

    @Override // java.util.Map
    public final Set<K> keySet() {
        return this.c.a();
    }

    @Override // java.util.Map
    public final Collection<V> values() {
        return this.c.c();
    }

    @Override // java.util.Map
    public final boolean containsKey(Object key) {
        return this.a.containsKey(key);
    }

    @Override // java.util.Map
    public final boolean containsValue(Object value) {
        return this.a.containsValue(value);
    }

    @Override // java.util.Map
    public final V get(Object key) {
        return (V) this.a.get(key);
    }

    @Override // java.util.Map
    public final boolean isEmpty() {
        return this.a.isEmpty();
    }

    @Override // java.util.Map
    public final int size() {
        return this.a.size();
    }

    @Override // java.util.Map
    public final boolean equals(Object o) {
        return this.a.equals(o);
    }

    @Override // java.util.Map
    public final int hashCode() {
        return this.a.hashCode();
    }

    public String toString() {
        return this.a.toString();
    }

    /* loaded from: classes.dex */
    private class d extends a<K> implements Set<K> {
        private d() {
        }

        @Override // com.chartboost.sdk.impl.ba.a
        Collection<K> a() {
            return ba.this.a.keySet();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public void clear() {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                a.keySet().clear();
                ba.this.b((ba) a);
            } finally {
                ba.this.b.unlock();
            }
        }

        @Override // java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            return ba.this.remove(o) != null;
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> c) {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                boolean removeAll = a.keySet().removeAll(c);
                ba.this.b((ba) a);
                return removeAll;
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> c) {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                boolean retainAll = a.keySet().retainAll(c);
                ba.this.b((ba) a);
                return retainAll;
            } finally {
                ba.this.b.unlock();
            }
        }
    }

    /* loaded from: classes.dex */
    private final class g extends a<V> {
        private g() {
        }

        @Override // com.chartboost.sdk.impl.ba.a
        Collection<V> a() {
            return ba.this.a.values();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public void clear() {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                a.values().clear();
                ba.this.b((ba) a);
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public boolean remove(Object o) {
            ba.this.b.lock();
            try {
                if (contains(o)) {
                    Map a = ba.this.a();
                    boolean remove = a.values().remove(o);
                    ba.this.b((ba) a);
                    return remove;
                }
                return false;
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public boolean removeAll(Collection<?> c) {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                boolean removeAll = a.values().removeAll(c);
                ba.this.b((ba) a);
                return removeAll;
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection
        public boolean retainAll(Collection<?> c) {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                boolean retainAll = a.values().retainAll(c);
                ba.this.b((ba) a);
                return retainAll;
            } finally {
                ba.this.b.unlock();
            }
        }
    }

    /* loaded from: classes.dex */
    private class b extends a<Map.Entry<K, V>> implements Set<Map.Entry<K, V>> {
        private b() {
        }

        @Override // com.chartboost.sdk.impl.ba.a
        Collection<Map.Entry<K, V>> a() {
            return ba.this.a.entrySet();
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public void clear() {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                a.entrySet().clear();
                ba.this.b((ba) a);
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean remove(Object o) {
            ba.this.b.lock();
            try {
                if (contains(o)) {
                    Map a = ba.this.a();
                    boolean remove = a.entrySet().remove(o);
                    ba.this.b((ba) a);
                    return remove;
                }
                return false;
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean removeAll(Collection<?> c) {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                boolean removeAll = a.entrySet().removeAll(c);
                ba.this.b((ba) a);
                return removeAll;
            } finally {
                ba.this.b.unlock();
            }
        }

        /* JADX WARN: Multi-variable type inference failed */
        @Override // java.util.Collection, java.util.Set
        public boolean retainAll(Collection<?> c) {
            ba.this.b.lock();
            try {
                Map a = ba.this.a();
                boolean retainAll = a.entrySet().retainAll(c);
                ba.this.b((ba) a);
                return retainAll;
            } finally {
                ba.this.b.unlock();
            }
        }
    }

    /* loaded from: classes.dex */
    private static class f<T> implements Iterator<T> {
        private final Iterator<T> a;

        public f(Iterator<T> it) {
            this.a = it;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.a.hasNext();
        }

        @Override // java.util.Iterator
        public T next() {
            return this.a.next();
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* loaded from: classes.dex */
    protected static abstract class a<E> implements Collection<E> {
        abstract Collection<E> a();

        protected a() {
        }

        @Override // java.util.Collection
        public final boolean contains(Object o) {
            return a().contains(o);
        }

        @Override // java.util.Collection
        public final boolean containsAll(Collection<?> c) {
            return a().containsAll(c);
        }

        @Override // java.util.Collection, java.lang.Iterable
        public final Iterator<E> iterator() {
            return new f(a().iterator());
        }

        @Override // java.util.Collection
        public final boolean isEmpty() {
            return a().isEmpty();
        }

        @Override // java.util.Collection
        public final int size() {
            return a().size();
        }

        @Override // java.util.Collection
        public final Object[] toArray() {
            return a().toArray();
        }

        @Override // java.util.Collection
        public final <T> T[] toArray(T[] a) {
            return (T[]) a().toArray(a);
        }

        @Override // java.util.Collection
        public int hashCode() {
            return a().hashCode();
        }

        @Override // java.util.Collection
        public boolean equals(Object obj) {
            return a().equals(obj);
        }

        public String toString() {
            return a().toString();
        }

        @Override // java.util.Collection
        public final boolean add(E o) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.Collection
        public final boolean addAll(Collection<? extends E> c) {
            throw new UnsupportedOperationException();
        }
    }

    private boolean a(Object obj, Object obj2) {
        if (obj == null) {
            return obj2 == null;
        }
        return obj.equals(obj2);
    }

    /* loaded from: classes.dex */
    public static abstract class h<K, V> {

        /* loaded from: classes.dex */
        public enum a {
            STABLE { // from class: com.chartboost.sdk.impl.ba.h.a.1
                @Override // com.chartboost.sdk.impl.ba.h.a
                <K, V, M extends Map<K, V>> h<K, V> a(ba<K, V, M> baVar) {
                    baVar.getClass();
                    return new c();
                }
            },
            LIVE { // from class: com.chartboost.sdk.impl.ba.h.a.2
                @Override // com.chartboost.sdk.impl.ba.h.a
                <K, V, M extends Map<K, V>> h<K, V> a(ba<K, V, M> baVar) {
                    baVar.getClass();
                    return new e();
                }
            };

            abstract <K, V, M extends Map<K, V>> h<K, V> a(ba<K, V, M> baVar);
        }

        abstract Set<K> a();

        abstract Set<Map.Entry<K, V>> b();

        abstract Collection<V> c();

        h() {
        }
    }

    /* loaded from: classes.dex */
    final class c extends h<K, V> implements Serializable {
        c() {
        }

        @Override // com.chartboost.sdk.impl.ba.h
        public Set<K> a() {
            return Collections.unmodifiableSet(ba.this.a.keySet());
        }

        @Override // com.chartboost.sdk.impl.ba.h
        public Set<Map.Entry<K, V>> b() {
            return Collections.unmodifiableSet(ba.this.a.entrySet());
        }

        @Override // com.chartboost.sdk.impl.ba.h
        public Collection<V> c() {
            return Collections.unmodifiableCollection(ba.this.a.values());
        }
    }

    /* loaded from: classes.dex */
    final class e extends h<K, V> implements Serializable {
        private final transient ba<K, V, M>.d b;
        private final transient ba<K, V, M>.b c;
        private final transient ba<K, V, M>.g d;

        e() {
            this.b = new d();
            this.c = new b();
            this.d = new g();
        }

        @Override // com.chartboost.sdk.impl.ba.h
        public Set<K> a() {
            return this.b;
        }

        @Override // com.chartboost.sdk.impl.ba.h
        public Set<Map.Entry<K, V>> b() {
            return this.c;
        }

        @Override // com.chartboost.sdk.impl.ba.h
        public Collection<V> c() {
            return this.d;
        }
    }
}
