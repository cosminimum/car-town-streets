package com.google.android.gms.dynamic;

import android.content.Context;
import android.os.IBinder;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.internal.C1102eg;

/* renamed from: com.google.android.gms.dynamic.e */
public abstract class C0777e<T> {

    /* renamed from: sF */
    private final String f1631sF;

    /* renamed from: sG */
    private T f1632sG;

    /* renamed from: com.google.android.gms.dynamic.e$a */
    public static class C0778a extends Exception {
        public C0778a(String str) {
            super(str);
        }

        public C0778a(String str, Throwable th) {
            super(str, th);
        }
    }

    protected C0777e(String str) {
        this.f1631sF = str;
    }

    /* access modifiers changed from: protected */
    /* renamed from: d */
    public abstract T mo6406d(IBinder iBinder);

    /* access modifiers changed from: protected */
    /* renamed from: t */
    public final T mo6407t(Context context) throws C0778a {
        if (this.f1632sG == null) {
            C1102eg.m2616f(context);
            Context remoteContext = GooglePlayServicesUtil.getRemoteContext(context);
            if (remoteContext == null) {
                throw new C0778a("Could not get remote context.");
            }
            try {
                this.f1632sG = mo6406d((IBinder) remoteContext.getClassLoader().loadClass(this.f1631sF).newInstance());
            } catch (ClassNotFoundException e) {
                throw new C0778a("Could not load creator class.");
            } catch (InstantiationException e2) {
                throw new C0778a("Could not instantiate creator.");
            } catch (IllegalAccessException e3) {
                throw new C0778a("Could not access creator.");
            }
        }
        return this.f1632sG;
    }
}
