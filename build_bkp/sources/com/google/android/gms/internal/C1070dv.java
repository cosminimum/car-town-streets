package com.google.android.gms.internal;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

/* renamed from: com.google.android.gms.internal.dv */
public abstract class C1070dv implements SafeParcelable {

    /* renamed from: pa */
    private static final Object f2570pa = new Object();

    /* renamed from: pb */
    private static ClassLoader f2571pb = null;

    /* renamed from: pc */
    private static Integer f2572pc = null;

    /* renamed from: pd */
    private boolean f2573pd = false;

    /* access modifiers changed from: protected */
    /* renamed from: P */
    public static boolean m2470P(String str) {
        ClassLoader bL = m2472bL();
        if (bL == null) {
            return true;
        }
        try {
            return m2471a(bL.loadClass(str));
        } catch (Exception e) {
            return false;
        }
    }

    /* renamed from: a */
    private static boolean m2471a(Class<?> cls) {
        try {
            return SafeParcelable.NULL.equals(cls.getField("NULL").get((Object) null));
        } catch (IllegalAccessException | NoSuchFieldException e) {
            return false;
        }
    }

    /* renamed from: bL */
    protected static ClassLoader m2472bL() {
        ClassLoader classLoader;
        synchronized (f2570pa) {
            classLoader = f2571pb;
        }
        return classLoader;
    }

    /* access modifiers changed from: protected */
    /* renamed from: bM */
    public static Integer m2473bM() {
        Integer num;
        synchronized (f2570pa) {
            num = f2572pc;
        }
        return num;
    }

    /* access modifiers changed from: protected */
    /* renamed from: bN */
    public boolean mo7449bN() {
        return this.f2573pd;
    }
}
