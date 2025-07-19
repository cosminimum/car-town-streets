package com.google.android.gms.drive.metadata.internal;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.internal.C1136fh;
import com.google.android.gms.internal.C1138fi;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

/* renamed from: com.google.android.gms.drive.metadata.internal.c */
public final class C0751c {

    /* renamed from: rE */
    private static Map<String, MetadataField<?>> f1563rE = new HashMap();

    static {
        m1636b(C1136fh.f2685rG);
        m1636b(C1136fh.TITLE);
        m1636b(C1136fh.MIME_TYPE);
        m1636b(C1136fh.STARRED);
        m1636b(C1136fh.TRASHED);
        m1636b(C1136fh.f2686rH);
        m1636b(C1136fh.f2687rI);
        m1636b(C1136fh.PARENTS);
        m1636b(C1138fi.f2690rL);
        m1636b(C1138fi.f2688rJ);
        m1636b(C1138fi.f2689rK);
        m1636b(C1138fi.f2691rM);
    }

    /* renamed from: ac */
    public static MetadataField<?> m1635ac(String str) {
        return f1563rE.get(str);
    }

    /* renamed from: b */
    private static void m1636b(MetadataField<?> metadataField) {
        if (f1563rE.containsKey(metadataField.getName())) {
            throw new IllegalArgumentException("Duplicate field name registered: " + metadataField.getName());
        }
        f1563rE.put(metadataField.getName(), metadataField);
    }

    /* renamed from: cW */
    public static Collection<MetadataField<?>> m1637cW() {
        return Collections.unmodifiableCollection(f1563rE.values());
    }
}
