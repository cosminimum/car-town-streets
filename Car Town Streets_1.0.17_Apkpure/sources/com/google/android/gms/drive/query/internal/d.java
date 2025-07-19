package com.google.android.gms.drive.query.internal;

import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.Set;
/* loaded from: classes.dex */
class d {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static MetadataField<?> b(MetadataBundle metadataBundle) {
        Set<MetadataField<?>> cY = metadataBundle.cY();
        if (cY.size() != 1) {
            throw new IllegalArgumentException("bundle should have exactly 1 populated field");
        }
        return cY.iterator().next();
    }
}
