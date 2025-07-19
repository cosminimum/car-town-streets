package com.google.android.gms.internal;

import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.CollectionMetadataField;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.StringMetadataField;
import com.google.android.gms.plus.PlusShare;
/* loaded from: classes.dex */
public class fh {
    public static final MetadataField<DriveId> rG = fj.rN;
    public static final MetadataField<String> TITLE = new StringMetadataField(PlusShare.KEY_CONTENT_DEEP_LINK_METADATA_TITLE);
    public static final MetadataField<String> MIME_TYPE = new StringMetadataField("mimeType");
    public static final MetadataField<Boolean> STARRED = new com.google.android.gms.drive.metadata.internal.a("starred");
    public static final MetadataField<Boolean> TRASHED = new com.google.android.gms.drive.metadata.internal.a("trashed") { // from class: com.google.android.gms.internal.fh.1
        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.google.android.gms.drive.metadata.internal.a, com.google.android.gms.drive.metadata.MetadataField
        /* renamed from: e */
        public Boolean b(DataHolder dataHolder, int i, int i2) {
            return Boolean.valueOf(dataHolder.getInteger(getName(), i, i2) != 0);
        }
    };
    public static final MetadataField<Boolean> rH = new com.google.android.gms.drive.metadata.internal.a("isEditable");
    public static final MetadataField<Boolean> rI = new com.google.android.gms.drive.metadata.internal.a("isPinned");
    public static final CollectionMetadataField<DriveId> PARENTS = new com.google.android.gms.drive.metadata.internal.e("parents");
}
