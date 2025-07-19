package com.google.android.gms.drive.query;

import com.google.android.gms.drive.DriveId;
import com.google.android.gms.drive.metadata.CollectionMetadataField;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.OrderedMetadataField;
import com.google.android.gms.internal.C1136fh;
import com.google.android.gms.internal.C1138fi;
import java.util.Date;

public class SearchableField {
    public static final MetadataField<String> MIME_TYPE = C1136fh.MIME_TYPE;
    public static final OrderedMetadataField<Date> MODIFIED_DATE = C1138fi.f2688rJ;
    public static final CollectionMetadataField<DriveId> PARENTS = C1136fh.PARENTS;
    public static final MetadataField<Boolean> STARRED = C1136fh.STARRED;
    public static final MetadataField<String> TITLE = C1136fh.TITLE;
    public static final MetadataField<Boolean> TRASHED = C1136fh.TRASHED;

    /* renamed from: rM */
    public static final OrderedMetadataField<Date> f1569rM = C1138fi.f2691rM;
}
