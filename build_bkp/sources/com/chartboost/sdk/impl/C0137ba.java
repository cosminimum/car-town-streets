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

/* renamed from: com.chartboost.sdk.impl.ba */
abstract class C0137ba<K, V, M extends Map<K, V>> implements Serializable, ConcurrentMap<K, V> {
    /* access modifiers changed from: private */

    /* renamed from: a */
    public volatile M f208a;
    /* access modifiers changed from: private */

    /* renamed from: b */
    public final transient Lock f209b = new ReentrantLock();

    /* renamed from: c */
    private final C0146h<K, V> f210c;

    /* access modifiers changed from: package-private */
    /* renamed from: a */
    public abstract <N extends Map<? extends K, ? extends V>> M mo1361a(N n);

    protected <N extends Map<? extends K, ? extends V>> C0137ba(N n, C0146h.C0147a aVar) {
        this.f208a = (Map) C0150bb.m306a("delegate", mo1361a((Map) C0150bb.m306a("map", n)));
        this.f210c = ((C0146h.C0147a) C0150bb.m306a("viewType", aVar)).mo1413a(this);
    }

    public final void clear() {
        this.f209b.lock();
        try {
            mo1362b(mo1361a(Collections.emptyMap()));
        } finally {
            this.f209b.unlock();
        }
    }

    public final V remove(Object key) {
        Map a;
        this.f209b.lock();
        try {
            if (!this.f208a.containsKey(key)) {
                this.f209b.unlock();
                return null;
            }
            a = mo1360a();
            V remove = a.remove(key);
            mo1362b(a);
            this.f209b.unlock();
            return remove;
        } catch (Throwable th) {
            this.f209b.unlock();
            throw th;
        }
    }

    public boolean remove(Object key, Object value) {
        this.f209b.lock();
        try {
            if (!this.f208a.containsKey(key) || !m285a(value, this.f208a.get(key))) {
                this.f209b.unlock();
                return false;
            }
            Map a = mo1360a();
            a.remove(key);
            mo1362b(a);
            return true;
        } finally {
            this.f209b.unlock();
        }
    }

    public boolean replace(K key, V oldValue, V newValue) {
        this.f209b.lock();
        try {
            if (!this.f208a.containsKey(key) || !m285a(oldValue, this.f208a.get(key))) {
                return false;
            }
            Map a = mo1360a();
            a.put(key, newValue);
            mo1362b(a);
            this.f209b.unlock();
            return true;
        } finally {
            this.f209b.unlock();
        }
    }

    public V replace(K key, V value) {
        Map a;
        this.f209b.lock();
        try {
            if (!this.f208a.containsKey(key)) {
                this.f209b.unlock();
                return null;
            }
            a = mo1360a();
            V put = a.put(key, value);
            mo1362b(a);
            this.f209b.unlock();
            return put;
        } catch (Throwable th) {
            this.f209b.unlock();
            throw th;
        }
    }

    public final V put(K key, V value) {
        Map a;
        this.f209b.lock();
        try {
            a = mo1360a();
            V put = a.put(key, value);
            mo1362b(a);
            this.f209b.unlock();
            return put;
        } catch (Throwable th) {
            this.f209b.unlock();
            throw th;
        }
    }

    public V putIfAbsent(K key, V value) {
        V v;
        Map a;
        this.f209b.lock();
        try {
            if (!this.f208a.containsKey(key)) {
                a = mo1360a();
                v = a.put(key, value);
                mo1362b(a);
                this.f209b.unlock();
            } else {
                v = this.f208a.get(key);
                this.f209b.unlock();
            }
            return v;
        } catch (Throwable th) {
            this.f209b.unlock();
            throw th;
        }
    }

    public final void putAll(Map<? extends K, ? extends V> t) {
        this.f209b.lock();
        try {
            Map a = mo1360a();
            a.putAll(t);
            mo1362b(a);
        } finally {
            this.f209b.unlock();
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public M mo1360a() {
        this.f209b.lock();
        try {
            return mo1361a(this.f208a);
        } finally {
            this.f209b.unlock();
        }
    }

    /* access modifiers changed from: protected */
    /* renamed from: b */
    public void mo1362b(M m) {
        this.f208a = m;
    }

    public final Set<Map.Entry<K, V>> entrySet() {
        return this.f210c.mo1400b();
    }

    public final Set<K> keySet() {
        return this.f210c.mo1399a();
    }

    public final Collection<V> values() {
        return this.f210c.mo1401c();
    }

    public final boolean containsKey(Object key) {
        return this.f208a.containsKey(key);
    }

    public final boolean containsValue(Object value) {
        return this.f208a.containsValue(value);
    }

    public final V get(Object key) {
        return this.f208a.get(key);
    }

    public final boolean isEmpty() {
        return this.f208a.isEmpty();
    }

    public final int size() {
        return this.f208a.size();
    }

    public final boolean equals(Object o) {
        return this.f208a.equals(o);
    }

    public final int hashCode() {
        return this.f208a.hashCode();
    }

    public String toString() {
        return this.f208a.toString();
    }

    /* renamed from: com.chartboost.sdk.impl.ba$d */
    private class C0142d extends C0139a<K> implements Set<K> {
        private C0142d() {
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public Collection<K> mo1382a() {
            return C0137ba.this.f208a.keySet();
        }

        public void clear() {
            C0137ba.this.f209b.lock();
            try {
                Map a = C0137ba.this.mo1360a();
                a.keySet().clear();
                C0137ba.this.mo1362b(a);
            } finally {
                C0137ba.this.f209b.unlock();
            }
        }

        public boolean remove(Object o) {
            return C0137ba.this.remove(o) != null;
        }

        public boolean removeAll(Collection<?> c) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                a = C0137ba.this.mo1360a();
                boolean removeAll = a.keySet().removeAll(c);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return removeAll;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }

        public boolean retainAll(Collection<?> c) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                a = C0137ba.this.mo1360a();
                boolean retainAll = a.keySet().retainAll(c);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return retainAll;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ba$g */
    private final class C0145g extends C0139a<V> {
        private C0145g() {
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public Collection<V> mo1382a() {
            return C0137ba.this.f208a.values();
        }

        public void clear() {
            C0137ba.this.f209b.lock();
            try {
                Map a = C0137ba.this.mo1360a();
                a.values().clear();
                C0137ba.this.mo1362b(a);
            } finally {
                C0137ba.this.f209b.unlock();
            }
        }

        public boolean remove(Object o) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                if (!contains(o)) {
                    C0137ba.this.f209b.unlock();
                    return false;
                }
                a = C0137ba.this.mo1360a();
                boolean remove = a.values().remove(o);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return remove;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }

        public boolean removeAll(Collection<?> c) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                a = C0137ba.this.mo1360a();
                boolean removeAll = a.values().removeAll(c);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return removeAll;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }

        public boolean retainAll(Collection<?> c) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                a = C0137ba.this.mo1360a();
                boolean retainAll = a.values().retainAll(c);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return retainAll;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ba$b */
    private class C0140b extends C0139a<Map.Entry<K, V>> implements Set<Map.Entry<K, V>> {
        private C0140b() {
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public Collection<Map.Entry<K, V>> mo1382a() {
            return C0137ba.this.f208a.entrySet();
        }

        public void clear() {
            C0137ba.this.f209b.lock();
            try {
                Map a = C0137ba.this.mo1360a();
                a.entrySet().clear();
                C0137ba.this.mo1362b(a);
            } finally {
                C0137ba.this.f209b.unlock();
            }
        }

        public boolean remove(Object o) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                if (!contains(o)) {
                    C0137ba.this.f209b.unlock();
                    return false;
                }
                a = C0137ba.this.mo1360a();
                boolean remove = a.entrySet().remove(o);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return remove;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }

        public boolean removeAll(Collection<?> c) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                a = C0137ba.this.mo1360a();
                boolean removeAll = a.entrySet().removeAll(c);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return removeAll;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }

        public boolean retainAll(Collection<?> c) {
            Map a;
            C0137ba.this.f209b.lock();
            try {
                a = C0137ba.this.mo1360a();
                boolean retainAll = a.entrySet().retainAll(c);
                C0137ba.this.mo1362b(a);
                C0137ba.this.f209b.unlock();
                return retainAll;
            } catch (Throwable th) {
                C0137ba.this.f209b.unlock();
                throw th;
            }
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ba$f */
    private static class C0144f<T> implements Iterator<T> {

        /* renamed from: a */
        private final Iterator<T> f218a;

        public C0144f(Iterator<T> it) {
            this.f218a = it;
        }

        public boolean hasNext() {
            return this.f218a.hasNext();
        }

        public T next() {
            return this.f218a.next();
        }

        public void remove() {
            throw new UnsupportedOperationException();
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ba$a */
    protected static abstract class C0139a<E> implements Collection<E> {
        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public abstract Collection<E> mo1382a();

        protected C0139a() {
        }

        public final boolean contains(Object o) {
            return mo1382a().contains(o);
        }

        public final boolean containsAll(Collection<?> c) {
            return mo1382a().containsAll(c);
        }

        public final Iterator<E> iterator() {
            return new C0144f(mo1382a().iterator());
        }

        public final boolean isEmpty() {
            return mo1382a().isEmpty();
        }

        public final int size() {
            return mo1382a().size();
        }

        public final Object[] toArray() {
            return mo1382a().toArray();
        }

        public final <T> T[] toArray(T[] a) {
            return mo1382a().toArray(a);
        }

        public int hashCode() {
            return mo1382a().hashCode();
        }

        public boolean equals(Object obj) {
            return mo1382a().equals(obj);
        }

        public String toString() {
            return mo1382a().toString();
        }

        public final boolean add(E e) {
            throw new UnsupportedOperationException();
        }

        public final boolean addAll(Collection<? extends E> collection) {
            throw new UnsupportedOperationException();
        }
    }

    /* renamed from: a */
    private boolean m285a(Object obj, Object obj2) {
        if (obj == null) {
            return obj2 == null;
        }
        return obj.equals(obj2);
    }

    /* renamed from: com.chartboost.sdk.impl.ba$h */
    public static abstract class C0146h<K, V> {

        /* renamed from: com.chartboost.sdk.impl.ba$h$a */
        public enum C0147a {
            STABLE {
                /* access modifiers changed from: package-private */
                /* renamed from: a */
                public <K, V, M extends Map<K, V>> C0146h<K, V> mo1413a(C0137ba<K, V, M> baVar) {
                    baVar.getClass();
                    return new C0141c();
                }
            },
            LIVE {
                /* access modifiers changed from: package-private */
                /* renamed from: a */
                public <K, V, M extends Map<K, V>> C0146h<K, V> mo1413a(C0137ba<K, V, M> baVar) {
                    baVar.getClass();
                    return new C0143e();
                }
            };

            /* access modifiers changed from: package-private */
            /* renamed from: a */
            public abstract <K, V, M extends Map<K, V>> C0146h<K, V> mo1413a(C0137ba<K, V, M> baVar);
        }

        /* access modifiers changed from: package-private */
        /* renamed from: a */
        public abstract Set<K> mo1399a();

        /* access modifiers changed from: package-private */
        /* renamed from: b */
        public abstract Set<Map.Entry<K, V>> mo1400b();

        /* access modifiers changed from: package-private */
        /* renamed from: c */
        public abstract Collection<V> mo1401c();

        C0146h() {
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ba$c */
    final class C0141c extends C0146h<K, V> implements Serializable {
        C0141c() {
        }

        /* renamed from: a */
        public Set<K> mo1399a() {
            return Collections.unmodifiableSet(C0137ba.this.f208a.keySet());
        }

        /* renamed from: b */
        public Set<Map.Entry<K, V>> mo1400b() {
            return Collections.unmodifiableSet(C0137ba.this.f208a.entrySet());
        }

        /* renamed from: c */
        public Collection<V> mo1401c() {
            return Collections.unmodifiableCollection(C0137ba.this.f208a.values());
        }
    }

    /* renamed from: com.chartboost.sdk.impl.ba$e */
    final class C0143e extends C0146h<K, V> implements Serializable {

        /* renamed from: b */
        private final transient C0137ba<K, V, M>.d f215b = new C0142d();

        /* renamed from: c */
        private final transient C0137ba<K, V, M>.b f216c = new C0140b();

        /* renamed from: d */
        private final transient C0137ba<K, V, M>.g f217d = new C0145g();

        C0143e() {
        }

        /* renamed from: a */
        public Set<K> mo1399a() {
            return this.f215b;
        }

        /* renamed from: b */
        public Set<Map.Entry<K, V>> mo1400b() {
            return this.f216c;
        }

        /* renamed from: c */
        public Collection<V> mo1401c() {
            return this.f217d;
        }
    }
}
