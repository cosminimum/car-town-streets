package com.google.android.gms.drive.query.internal;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.Set;

/* renamed from: com.google.android.gms.drive.query.internal.d */
class C0759d {
    /* renamed from: b */
    static MetadataField<?> m1665b(MetadataBundle metadataBundle) {
        Set<MetadataField<?>> cY = metadataBundle.mo6292cY();
        if (cY.size() == 1) {
            return cY.iterator().next();
        }
        throw new IllegalArgumentException("bundle should have exactly 1 populated field");
    }
}
