package com.google.android.gms.internal;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.MotionEvent;
import com.google.android.gms.internal.l;
import dalvik.system.DexClassLoader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.util.ArrayList;
/* loaded from: classes.dex */
public abstract class f extends e {
    private static Method dA;
    private static Method dB;
    private static Method dC;
    private static Method dD;
    private static String dE;
    private static l dF;
    private static Method dy;
    private static Method dz;
    private static long startTime = 0;
    static boolean dG = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class a extends Exception {
        public a() {
        }

        public a(Throwable th) {
            super(th);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public f(Context context, j jVar, k kVar) {
        super(context, jVar, kVar);
    }

    static String a(Context context, j jVar) throws a {
        if (dA == null) {
            throw new a();
        }
        try {
            ByteBuffer byteBuffer = (ByteBuffer) dA.invoke(null, context);
            if (byteBuffer != null) {
                return jVar.a(byteBuffer.array(), true);
            }
            throw new a();
        } catch (IllegalAccessException e) {
            throw new a(e);
        } catch (InvocationTargetException e2) {
            throw new a(e2);
        }
    }

    static ArrayList<Long> a(MotionEvent motionEvent, DisplayMetrics displayMetrics) throws a {
        if (dB == null || motionEvent == null) {
            throw new a();
        }
        try {
            return (ArrayList) dB.invoke(null, motionEvent, displayMetrics);
        } catch (IllegalAccessException e) {
            throw new a(e);
        } catch (InvocationTargetException e2) {
            throw new a(e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static synchronized void a(String str, Context context, j jVar) {
        synchronized (f.class) {
            if (!dG) {
                try {
                    dF = new l(jVar, null);
                    dE = str;
                    e(context);
                    startTime = e().longValue();
                    dG = true;
                } catch (a e) {
                } catch (UnsupportedOperationException e2) {
                }
            }
        }
    }

    static String b(Context context, j jVar) throws a {
        if (dD == null) {
            throw new a();
        }
        try {
            ByteBuffer byteBuffer = (ByteBuffer) dD.invoke(null, context);
            if (byteBuffer != null) {
                return jVar.a(byteBuffer.array(), true);
            }
            throw new a();
        } catch (IllegalAccessException e) {
            throw new a(e);
        } catch (InvocationTargetException e2) {
            throw new a(e2);
        }
    }

    private static String b(byte[] bArr, String str) throws a {
        try {
            return new String(dF.c(bArr, str), "UTF-8");
        } catch (l.a e) {
            throw new a(e);
        } catch (UnsupportedEncodingException e2) {
            throw new a(e2);
        }
    }

    static String d() throws a {
        if (dE == null) {
            throw new a();
        }
        return dE;
    }

    static String d(Context context) throws a {
        if (dC == null) {
            throw new a();
        }
        try {
            String str = (String) dC.invoke(null, context);
            if (str != null) {
                return str;
            }
            throw new a();
        } catch (IllegalAccessException e) {
            throw new a(e);
        } catch (InvocationTargetException e2) {
            throw new a(e2);
        }
    }

    static Long e() throws a {
        if (dy == null) {
            throw new a();
        }
        try {
            return (Long) dy.invoke(null, new Object[0]);
        } catch (IllegalAccessException e) {
            throw new a(e);
        } catch (InvocationTargetException e2) {
            throw new a(e2);
        }
    }

    private static void e(Context context) throws a {
        try {
            byte[] d = dF.d(n.getKey());
            byte[] c = dF.c(d, n.i());
            File cacheDir = context.getCacheDir();
            if (cacheDir == null && (cacheDir = context.getDir("dex", 0)) == null) {
                throw new a();
            }
            File createTempFile = File.createTempFile("ads", ".jar", cacheDir);
            FileOutputStream fileOutputStream = new FileOutputStream(createTempFile);
            fileOutputStream.write(c, 0, c.length);
            fileOutputStream.close();
            DexClassLoader dexClassLoader = new DexClassLoader(createTempFile.getAbsolutePath(), cacheDir.getAbsolutePath(), null, context.getClassLoader());
            Class loadClass = dexClassLoader.loadClass(b(d, n.j()));
            Class loadClass2 = dexClassLoader.loadClass(b(d, n.p()));
            Class loadClass3 = dexClassLoader.loadClass(b(d, n.n()));
            Class loadClass4 = dexClassLoader.loadClass(b(d, n.t()));
            Class loadClass5 = dexClassLoader.loadClass(b(d, n.l()));
            Class loadClass6 = dexClassLoader.loadClass(b(d, n.r()));
            dy = loadClass.getMethod(b(d, n.k()), new Class[0]);
            dz = loadClass2.getMethod(b(d, n.q()), new Class[0]);
            dA = loadClass3.getMethod(b(d, n.o()), Context.class);
            dB = loadClass4.getMethod(b(d, n.u()), MotionEvent.class, DisplayMetrics.class);
            dC = loadClass5.getMethod(b(d, n.m()), Context.class);
            dD = loadClass6.getMethod(b(d, n.s()), Context.class);
            String name = createTempFile.getName();
            createTempFile.delete();
            new File(cacheDir, name.replace(".jar", ".dex")).delete();
        } catch (l.a e) {
            throw new a(e);
        } catch (FileNotFoundException e2) {
            throw new a(e2);
        } catch (IOException e3) {
            throw new a(e3);
        } catch (ClassNotFoundException e4) {
            throw new a(e4);
        } catch (NoSuchMethodException e5) {
            throw new a(e5);
        } catch (NullPointerException e6) {
            throw new a(e6);
        }
    }

    static String f() throws a {
        if (dz == null) {
            throw new a();
        }
        try {
            return (String) dz.invoke(null, new Object[0]);
        } catch (IllegalAccessException e) {
            throw new a(e);
        } catch (InvocationTargetException e2) {
            throw new a(e2);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.internal.e
    public void b(Context context) {
        try {
            try {
                a(1, f());
            } catch (IOException e) {
                return;
            }
        } catch (a e2) {
        }
        try {
            a(2, d());
        } catch (a e3) {
        }
        try {
            a(25, e().longValue());
        } catch (a e4) {
        }
        try {
            a(24, d(context));
        } catch (a e5) {
        }
    }

    @Override // com.google.android.gms.internal.e
    protected void c(Context context) {
        try {
            try {
                a(2, d());
            } catch (a e) {
            }
            try {
                a(1, f());
            } catch (a e2) {
            }
            try {
                long longValue = e().longValue();
                a(25, longValue);
                if (startTime != 0) {
                    a(17, longValue - startTime);
                    a(23, startTime);
                }
            } catch (a e3) {
            }
            try {
                ArrayList<Long> a2 = a(this.du, this.dv);
                a(14, a2.get(0).longValue());
                a(15, a2.get(1).longValue());
                if (a2.size() >= 3) {
                    a(16, a2.get(2).longValue());
                }
            } catch (a e4) {
            }
            try {
                a(27, a(context, this.dw));
            } catch (a e5) {
            }
            try {
                a(29, b(context, this.dw));
            } catch (a e6) {
            }
        } catch (IOException e7) {
        }
    }
}
