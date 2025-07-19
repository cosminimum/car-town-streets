package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.internal.C0754f;
import java.util.Arrays;

/* renamed from: com.google.android.gms.internal.fj */
public class C1139fj extends C0754f<DriveId> {

    /* renamed from: rN */
    public static final C1139fj f2692rN = new C1139fj();

    private C1139fj() {
        super("driveId", Arrays.asList(new String[]{"sqlId", "resourceId"}));
    }

    /* access modifiers changed from: protected */
    /* renamed from: g */
    public DriveId mo6277b(DataHolder dataHolder, int i, int i2) {
        long j = dataHolder.getMetadata().getLong("dbInstanceId");
        String string = dataHolder.getString("resourceId", i, i2);
        if (string != null && string.startsWith("generated-android-")) {
            string = null;
        }
        return new DriveId(string, Long.valueOf(dataHolder.getLong("sqlId", i, i2)).longValue(), j);
    }
}
