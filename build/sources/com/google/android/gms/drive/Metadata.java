package com.google.android.gms.drive;

import com.google.android.gms.common.data.Freezable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.internal.C1136fh;
import com.google.android.gms.internal.C1138fi;
import java.util.Date;

public abstract class Metadata implements Freezable<Metadata> {
    /* access modifiers changed from: protected */
    /* renamed from: a */
    public abstract <T> T mo6085a(MetadataField<T> metadataField);

    public Date getCreatedDate() {
        return (Date) mo6085a(C1138fi.f2690rL);
    }

    public DriveId getDriveId() {
        return (DriveId) mo6085a(C1136fh.f2685rG);
    }

    public String getMimeType() {
        return (String) mo6085a(C1136fh.MIME_TYPE);
    }

    public Date getModifiedByMeDate() {
        return (Date) mo6085a(C1138fi.f2689rK);
    }

    public Date getModifiedDate() {
        return (Date) mo6085a(C1138fi.f2688rJ);
    }

    public Date getSharedWithMeDate() {
        return (Date) mo6085a(C1138fi.f2691rM);
    }

    public String getTitle() {
        return (String) mo6085a(C1136fh.TITLE);
    }

    public boolean isEditable() {
        Boolean bool = (Boolean) mo6085a(C1136fh.f2686rH);
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public boolean isFolder() {
        return DriveFolder.MIME_TYPE.equals(getMimeType());
    }

    public boolean isStarred() {
        Boolean bool = (Boolean) mo6085a(C1136fh.STARRED);
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }

    public boolean isTrashed() {
        Boolean bool = (Boolean) mo6085a(C1136fh.TRASHED);
        if (bool == null) {
            return false;
        }
        return bool.booleanValue();
    }
}
