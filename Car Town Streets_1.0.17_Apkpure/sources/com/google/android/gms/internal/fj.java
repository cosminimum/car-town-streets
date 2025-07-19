package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.DriveId;
import java.util.Arrays;
/* loaded from: classes.dex */
public class fj extends com.google.android.gms.drive.metadata.internal.f<DriveId> {
    public static final fj rN = new fj();

    private fj() {
        super("driveId", Arrays.asList("sqlId", "resourceId"));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.gms.drive.metadata.MetadataField
    /* renamed from: g */
    public DriveId b(DataHolder dataHolder, int i, int i2) {
        long j = dataHolder.getMetadata().getLong("dbInstanceId");
        String string = dataHolder.getString("resourceId", i, i2);
        if (string != null && string.startsWith("generated-android-")) {
            string = null;
        }
        return new DriveId(string, Long.valueOf(dataHolder.getLong("sqlId", i, i2)).longValue(), j);
    }
}
