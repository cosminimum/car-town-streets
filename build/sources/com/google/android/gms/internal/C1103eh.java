package com.google.android.gms.internal;

import android.content.Context;
import android.os.IBinder;
import android.view.View;
import com.google.android.gms.dynamic.C0775c;
import com.google.android.gms.dynamic.C0777e;
import com.google.android.gms.internal.C1095ed;

/* renamed from: com.google.android.gms.internal.eh */
public final class C1103eh extends C0777e<C1095ed> {

    /* renamed from: pP */
    private static final C1103eh f2626pP = new C1103eh();

    private C1103eh() {
        super("com.google.android.gms.common.ui.SignInButtonCreatorImpl");
    }

    /* renamed from: d */
    public static View m2619d(Context context, int i, int i2) throws C0777e.C0778a {
        return f2626pP.m2620e(context, i, i2);
    }

    /* renamed from: e */
    private View m2620e(Context context, int i, int i2) throws C0777e.C0778a {
        try {
            return (View) C0775c.m1695b(((C1095ed) mo6407t(context)).mo7532a(C0775c.m1696h(context), i, i2));
        } catch (Exception e) {
            throw new C0777e.C0778a("Could not get button with size " + i + " and color " + i2, e);
        }
    }

    /* renamed from: A */
    public C1095ed mo6406d(IBinder iBinder) {
        return C1095ed.C1096a.m2602z(iBinder);
    }
}
