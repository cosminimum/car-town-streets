package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.internal.bz;
/* loaded from: classes.dex */
public final class bu {

    /* loaded from: classes.dex */
    public interface a {
        void a(cj cjVar);
    }

    public static cm a(Context context, bz.a aVar, h hVar, cw cwVar, bb bbVar, a aVar2) {
        bv bvVar = new bv(context, aVar, hVar, cwVar, bbVar, aVar2);
        bvVar.start();
        return bvVar;
    }
}
