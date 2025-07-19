package com.google.ads.util;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.HashMap;

/* renamed from: com.google.ads.util.i */
public abstract class C0530i {

    /* renamed from: a */
    private static final Object f1091a = new Object();

    /* renamed from: b */
    private static int f1092b = 0;

    /* renamed from: c */
    private static HashMap<Class<?>, Integer> f1093c = new HashMap<>();

    /* renamed from: d */
    private final ArrayList<C0532a<?>> f1094d = new ArrayList<>();

    /* renamed from: o */
    public final int f1095o;

    public C0530i() {
        synchronized (f1091a) {
            int i = f1092b;
            f1092b = i + 1;
            this.f1095o = i;
            Integer num = f1093c.get(getClass());
            if (num == null) {
                f1093c.put(getClass(), 1);
            } else {
                f1093c.put(getClass(), Integer.valueOf(num.intValue() + 1));
            }
        }
        C0508b.m1034d("State created: " + toString());
    }

    /* access modifiers changed from: protected */
    public void finalize() throws Throwable {
        synchronized (f1091a) {
            f1093c.put(getClass(), Integer.valueOf(f1093c.get(getClass()).intValue() - 1));
        }
        super.finalize();
    }

    public String toString() {
        return getClass().getSimpleName() + "[" + this.f1095o + "]";
    }

    /* access modifiers changed from: private */
    /* renamed from: a */
    public void m1059a(C0532a<?> aVar) {
        this.f1094d.add(aVar);
    }

    /* renamed from: com.google.ads.util.i$a */
    public abstract class C0532a<T> {

        /* renamed from: a */
        protected T f1096a;

        /* renamed from: b */
        protected final String f1097b;

        private C0532a(C0530i iVar, String str) {
            this(str, (Object) null);
        }

        private C0532a(String str, T t) {
            this.f1097b = str;
            C0530i.this.m1059a(this);
            this.f1096a = t;
        }

        public String toString() {
            return C0530i.this.toString() + "." + this.f1097b + " = " + this.f1096a;
        }
    }

    /* renamed from: com.google.ads.util.i$c */
    public final class C0534c<T> extends C0532a<T> {

        /* renamed from: e */
        private boolean f1101e;

        public C0534c(String str) {
            super(str);
            this.f1101e = false;
            this.f1101e = false;
        }

        public C0534c(String str, T t) {
            super(str, t);
            this.f1101e = false;
            this.f1101e = false;
        }

        /* renamed from: a */
        public synchronized T mo3875a() {
            return this.f1096a;
        }

        /* renamed from: a */
        public synchronized void mo3876a(T t) {
            C0508b.m1034d("State changed - " + C0530i.this.toString() + "." + this.f1097b + ": '" + t + "' <-- '" + this.f1096a + "'.");
            this.f1096a = t;
            this.f1101e = true;
        }

        public String toString() {
            return super.toString() + (this.f1101e ? " (*)" : "");
        }
    }

    /* renamed from: com.google.ads.util.i$b */
    public final class C0533b<T> extends C0532a<T> {
        public C0533b(String str, T t) {
            super(str, t);
        }

        /* renamed from: a */
        public T mo3874a() {
            return this.f1096a;
        }

        public String toString() {
            return super.toString() + " (!)";
        }
    }

    /* renamed from: com.google.ads.util.i$d */
    public final class C0535d<T> extends C0532a<WeakReference<T>> {
        public C0535d(String str, T t) {
            super(str, new WeakReference(t));
        }

        /* renamed from: a */
        public T mo3877a() {
            return ((WeakReference) this.f1096a).get();
        }

        public String toString() {
            return C0530i.this.toString() + "." + this.f1097b + " = " + mo3877a() + " (?)";
        }
    }
}
