package com.google.android.gms.maps.internal;

import android.os.Bundle;
import android.os.Parcelable;

/* renamed from: com.google.android.gms.maps.internal.p */
public final class C1556p {
    private C1556p() {
    }

    /* renamed from: a */
    public static void m4197a(Bundle bundle, String str, Parcelable parcelable) {
        bundle.setClassLoader(C1556p.class.getClassLoader());
        Bundle bundle2 = bundle.getBundle("map_state");
        if (bundle2 == null) {
            bundle2 = new Bundle();
        }
        bundle2.setClassLoader(C1556p.class.getClassLoader());
        bundle2.putParcelable(str, parcelable);
        bundle.putBundle("map_state", bundle2);
    }
}
