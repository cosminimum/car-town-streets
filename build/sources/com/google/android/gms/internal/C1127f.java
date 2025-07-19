package com.google.android.gms.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import com.google.android.gms.internal.C1447l;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.security.SecureRandom;
import java.util.ArrayList;

/* renamed from: com.google.android.gms.internal.f */
public abstract class C1127f extends C1087e {

    /* renamed from: dA */
    private static Method f2674dA;

    /* renamed from: dB */
    private static Method f2675dB;

    /* renamed from: dC */
    private static Method f2676dC;

    /* renamed from: dD */
    private static Method f2677dD;

    /* renamed from: dE */
    private static String f2678dE;

    /* renamed from: dF */
    private static C1447l f2679dF;

    /* renamed from: dG */
    static boolean f2680dG = false;

    /* renamed from: dy */
    private static Method f2681dy;

    /* renamed from: dz */
    private static Method f2682dz;
    private static long startTime = 0;

    /* renamed from: com.google.android.gms.internal.f$a */
    static class C1128a extends Exception {
        public C1128a() {
        }

        public C1128a(Throwable th) {
            super(th);
        }
    }

    protected C1127f(Context context, C1443j jVar, C1446k kVar) {
        super(context, jVar, kVar);
    }

    /* renamed from: a */
    static String m2738a(Context context, C1443j jVar) throws C1128a {
        if (f2674dA == null) {
            throw new C1128a();
        }
        try {
            ByteBuffer byteBuffer = (ByteBuffer) f2674dA.invoke((Object) null, new Object[]{context});
            if (byteBuffer != null) {
                return jVar.mo6983a(byteBuffer.array(), true);
            }
            throw new C1128a();
        } catch (IllegalAccessException e) {
            throw new C1128a(e);
        } catch (InvocationTargetException e2) {
            throw new C1128a(e2);
        }
    }

    /* renamed from: a */
    static ArrayList<Long> m2739a(MotionEvent motionEvent, DisplayMetrics displayMetrics) throws C1128a {
        if (f2675dB == null || motionEvent == null) {
            throw new C1128a();
        }
        try {
            return (ArrayList) f2675dB.invoke((Object) null, new Object[]{motionEvent, displayMetrics});
        } catch (IllegalAccessException e) {
            throw new C1128a(e);
        } catch (InvocationTargetException e2) {
            throw new C1128a(e2);
        }
    }

    /* renamed from: a */
    protected static synchronized void m2740a(String str, Context context, C1443j jVar) {
        synchronized (C1127f.class) {
            if (!f2680dG) {
                try {
                    f2679dF = new C1447l(jVar, (SecureRandom) null);
                    f2678dE = str;
                    m2746e(context);
                    startTime = m2745e().longValue();
                    f2680dG = true;
                } catch (C1128a | UnsupportedOperationException e) {
                }
            }
        }
    }

    /* renamed from: b */
    static String m2741b(Context context, C1443j jVar) throws C1128a {
        if (f2677dD == null) {
            throw new C1128a();
        }
        try {
            ByteBuffer byteBuffer = (ByteBuffer) f2677dD.invoke((Object) null, new Object[]{context});
            if (byteBuffer != null) {
                return jVar.mo6983a(byteBuffer.array(), true);
            }
            throw new C1128a();
        } catch (IllegalAccessException e) {
            throw new C1128a(e);
        } catch (InvocationTargetException e2) {
            throw new C1128a(e2);
        }
    }

    /* renamed from: b */
    private static String m2742b(byte[] bArr, String str) throws C1128a {
        try {
            return new String(f2679dF.mo8811c(bArr, str), "UTF-8");
        } catch (C1447l.C1448a e) {
            throw new C1128a(e);
        } catch (UnsupportedEncodingException e2) {
            throw new C1128a(e2);
        }
    }

    /* renamed from: d */
    static String m2743d() throws C1128a {
        if (f2678dE != null) {
            return f2678dE;
        }
        throw new C1128a();
    }

    /* renamed from: d */
    static String m2744d(Context context) throws C1128a {
        if (f2676dC == null) {
            throw new C1128a();
        }
        try {
            String str = (String) f2676dC.invoke((Object) null, new Object[]{context});
            if (str != null) {
                return str;
            }
            throw new C1128a();
        } catch (IllegalAccessException e) {
            throw new C1128a(e);
        } catch (InvocationTargetException e2) {
            throw new C1128a(e2);
        }
    }

    /* renamed from: e */
    static Long m2745e() throws C1128a {
        if (f2681dy == null) {
            throw new C1128a();
        }
        try {
            return (Long) f2681dy.invoke((Object) null, new Object[0]);
        } catch (IllegalAccessException e) {
            throw new C1128a(e);
        } catch (InvocationTargetException e2) {
            throw new C1128a(e2);
        }
    }

    /* renamed from: e */
    private static void m2746e(Context context) throws C1128a {
        try {
            byte[] d = f2679dF.mo8812d(C1450n.getKey());
            byte[] c = f2679dF.mo8811c(d, C1450n.m4011i());
            File cacheDir = context.getCacheDir();
            if (cacheDir == null && (cacheDir = context.getDir("dex", 0)) == null) {
                throw new C1128a();
            }
            File createTempFile = File.createTempFile("ads", ".jar", cacheDir);
            FileOutputStream fileOutputStream = new FileOutputStream(createTempFile);
            fileOutputStream.write(c, 0, c.length);
            fileOutputStream.close();
            DexClassLoader dexClassLoader = new DexClassLoader(createTempFile.getAbsolutePath(), cacheDir.getAbsolutePath(), (String) null, context.getClassLoader());
            Class loadClass = dexClassLoader.loadClass(m2742b(d, C1450n.m4012j()));
            Class loadClass2 = dexClassLoader.loadClass(m2742b(d, C1450n.m4018p()));
            Class loadClass3 = dexClassLoader.loadClass(m2742b(d, C1450n.m4016n()));
            Class loadClass4 = dexClassLoader.loadClass(m2742b(d, C1450n.m4022t()));
            Class loadClass5 = dexClassLoader.loadClass(m2742b(d, C1450n.m4014l()));
            Class loadClass6 = dexClassLoader.loadClass(m2742b(d, C1450n.m4020r()));
            f2681dy = loadClass.getMethod(m2742b(d, C1450n.m4013k()), new Class[0]);
            f2682dz = loadClass2.getMethod(m2742b(d, C1450n.m4019q()), new Class[0]);
            f2674dA = loadClass3.getMethod(m2742b(d, C1450n.m4017o()), new Class[]{Context.class});
            f2675dB = loadClass4.getMethod(m2742b(d, C1450n.m4023u()), new Class[]{MotionEvent.class, DisplayMetrics.class});
            f2676dC = loadClass5.getMethod(m2742b(d, C1450n.m4015m()), new Class[]{Context.class});
            f2677dD = loadClass6.getMethod(m2742b(d, C1450n.m4021s()), new Class[]{Context.class});
            String name = createTempFile.getName();
            createTempFile.delete();
            new File(cacheDir, name.replace(".jar", ".dex")).delete();
        } catch (FileNotFoundException e) {
            throw new C1128a(e);
        } catch (IOException e2) {
            throw new C1128a(e2);
        } catch (ClassNotFoundException e3) {
            throw new C1128a(e3);
        } catch (C1447l.C1448a e4) {
            throw new C1128a(e4);
        } catch (NoSuchMethodException e5) {
            throw new C1128a(e5);
        } catch (NullPointerException e6) {
            throw new C1128a(e6);
        }
    }

    /* renamed from: f */
    static String m2747f() throws C1128a {
        if (f2682dz == null) {
            throw new C1128a();
        }
        try {
            return (String) f2682dz.invoke((Object) null, new Object[0]);
        } catch (IllegalAccessException e) {
            throw new C1128a(e);
        } catch (InvocationTargetException e2) {
            throw new C1128a(e2);
        }
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:18:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:19:?, code lost:
        return;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:12:0x0027 A[ExcHandler: IOException (e java.io.IOException), Splitter:B:1:0x0001] */
    /* renamed from: b */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void mo7500b(android.content.Context r4) {
        /*
            r3 = this;
            r0 = 1
            java.lang.String r1 = m2747f()     // Catch:{ a -> 0x002f, IOException -> 0x0027 }
            r3.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x002f, IOException -> 0x0027 }
        L_0x0008:
            r0 = 2
            java.lang.String r1 = m2743d()     // Catch:{ a -> 0x002d, IOException -> 0x0027 }
            r3.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x002d, IOException -> 0x0027 }
        L_0x0010:
            r0 = 25
            java.lang.Long r1 = m2745e()     // Catch:{ a -> 0x002b, IOException -> 0x0027 }
            long r1 = r1.longValue()     // Catch:{ a -> 0x002b, IOException -> 0x0027 }
            r3.mo7497a((int) r0, (long) r1)     // Catch:{ a -> 0x002b, IOException -> 0x0027 }
        L_0x001d:
            r0 = 24
            java.lang.String r1 = m2744d(r4)     // Catch:{ a -> 0x0029, IOException -> 0x0027 }
            r3.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x0029, IOException -> 0x0027 }
        L_0x0026:
            return
        L_0x0027:
            r0 = move-exception
            goto L_0x0026
        L_0x0029:
            r0 = move-exception
            goto L_0x0026
        L_0x002b:
            r0 = move-exception
            goto L_0x001d
        L_0x002d:
            r0 = move-exception
            goto L_0x0010
        L_0x002f:
            r0 = move-exception
            goto L_0x0008
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C1127f.mo7500b(android.content.Context):void");
    }

    /* access modifiers changed from: protected */
    /* JADX WARNING: Code restructure failed: missing block: B:28:?, code lost:
        return;
     */
    /* JADX WARNING: Code restructure failed: missing block: B:29:?, code lost:
        return;
     */
    /* JADX WARNING: Failed to process nested try/catch */
    /* JADX WARNING: Removed duplicated region for block: B:20:0x008a A[ExcHandler: IOException (e java.io.IOException), Splitter:B:6:0x0010] */
    /* renamed from: c */
    /* Code decompiled incorrectly, please refer to instructions dump. */
    public void mo7501c(android.content.Context r7) {
        /*
            r6 = this;
            r0 = 2
            java.lang.String r1 = m2743d()     // Catch:{ a -> 0x0097, IOException -> 0x008a }
            r6.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x0097, IOException -> 0x008a }
        L_0x0008:
            r0 = 1
            java.lang.String r1 = m2747f()     // Catch:{ a -> 0x0094, IOException -> 0x008a }
            r6.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x0094, IOException -> 0x008a }
        L_0x0010:
            java.lang.Long r0 = m2745e()     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            long r0 = r0.longValue()     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            r2 = 25
            r6.mo7497a((int) r2, (long) r0)     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            long r2 = startTime     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            r4 = 0
            int r2 = (r2 > r4 ? 1 : (r2 == r4 ? 0 : -1))
            if (r2 == 0) goto L_0x0034
            r2 = 17
            long r3 = startTime     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            long r0 = r0 - r3
            r6.mo7497a((int) r2, (long) r0)     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            r0 = 23
            long r1 = startTime     // Catch:{ a -> 0x0092, IOException -> 0x008a }
            r6.mo7497a((int) r0, (long) r1)     // Catch:{ a -> 0x0092, IOException -> 0x008a }
        L_0x0034:
            android.view.MotionEvent r0 = r6.f2616du     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            android.util.DisplayMetrics r1 = r6.f2617dv     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            java.util.ArrayList r1 = m2739a((android.view.MotionEvent) r0, (android.util.DisplayMetrics) r1)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            r2 = 14
            r0 = 0
            java.lang.Object r0 = r1.get(r0)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            java.lang.Long r0 = (java.lang.Long) r0     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            long r3 = r0.longValue()     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            r6.mo7497a((int) r2, (long) r3)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            r2 = 15
            r0 = 1
            java.lang.Object r0 = r1.get(r0)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            java.lang.Long r0 = (java.lang.Long) r0     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            long r3 = r0.longValue()     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            r6.mo7497a((int) r2, (long) r3)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            int r0 = r1.size()     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            r2 = 3
            if (r0 < r2) goto L_0x0073
            r2 = 16
            r0 = 2
            java.lang.Object r0 = r1.get(r0)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            java.lang.Long r0 = (java.lang.Long) r0     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            long r0 = r0.longValue()     // Catch:{ a -> 0x0090, IOException -> 0x008a }
            r6.mo7497a((int) r2, (long) r0)     // Catch:{ a -> 0x0090, IOException -> 0x008a }
        L_0x0073:
            r0 = 27
            com.google.android.gms.internal.j r1 = r6.f2618dw     // Catch:{ a -> 0x008e, IOException -> 0x008a }
            java.lang.String r1 = m2738a((android.content.Context) r7, (com.google.android.gms.internal.C1443j) r1)     // Catch:{ a -> 0x008e, IOException -> 0x008a }
            r6.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x008e, IOException -> 0x008a }
        L_0x007e:
            r0 = 29
            com.google.android.gms.internal.j r1 = r6.f2618dw     // Catch:{ a -> 0x008c, IOException -> 0x008a }
            java.lang.String r1 = m2741b((android.content.Context) r7, (com.google.android.gms.internal.C1443j) r1)     // Catch:{ a -> 0x008c, IOException -> 0x008a }
            r6.mo7498a((int) r0, (java.lang.String) r1)     // Catch:{ a -> 0x008c, IOException -> 0x008a }
        L_0x0089:
            return
        L_0x008a:
            r0 = move-exception
            goto L_0x0089
        L_0x008c:
            r0 = move-exception
            goto L_0x0089
        L_0x008e:
            r0 = move-exception
            goto L_0x007e
        L_0x0090:
            r0 = move-exception
            goto L_0x0073
        L_0x0092:
            r0 = move-exception
            goto L_0x0034
        L_0x0094:
            r0 = move-exception
            goto L_0x0010
        L_0x0097:
            r0 = move-exception
            goto L_0x0008
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.android.gms.internal.C1127f.mo7501c(android.content.Context):void");
    }
}
