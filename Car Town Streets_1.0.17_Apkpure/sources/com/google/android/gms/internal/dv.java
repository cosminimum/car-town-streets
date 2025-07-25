package com.google.android.gms.internal;

import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
/* loaded from: classes.dex */
public abstract class dv implements SafeParcelable {
    private static final Object pa = new Object();
    private static ClassLoader pb = null;
    private static Integer pc = null;
    private boolean pd = false;

    /* JADX INFO: Access modifiers changed from: protected */
    public static boolean P(String str) {
        ClassLoader bL = bL();
        if (bL == null) {
            return true;
        }
        try {
            return a(bL.loadClass(str));
        } catch (Exception e) {
            return false;
        }
    }

    private static boolean a(Class<?> cls) {
        try {
            return SafeParcelable.NULL.equals(cls.getField("NULL").get(null));
        } catch (IllegalAccessException e) {
            return false;
        } catch (NoSuchFieldException e2) {
            return false;
        }
    }

    protected static ClassLoader bL() {
        ClassLoader classLoader;
        synchronized (pa) {
            classLoader = pb;
        }
        return classLoader;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static Integer bM() {
        Integer num;
        synchronized (pa) {
            num = pc;
        }
        return num;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean bN() {
        return this.pd;
    }
}
