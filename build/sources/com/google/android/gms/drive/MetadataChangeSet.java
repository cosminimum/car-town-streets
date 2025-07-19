package com.google.android.gms.drive;

import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import com.google.android.gms.internal.C1136fh;

public final class MetadataChangeSet {

    /* renamed from: qV */
    private final MetadataBundle f1449qV;

    public static class Builder {

        /* renamed from: qV */
        private final MetadataBundle f1450qV = MetadataBundle.m1619cX();

        public MetadataChangeSet build() {
            return new MetadataChangeSet(this.f1450qV);
        }

        public Builder setMimeType(String mimeType) {
            this.f1450qV.mo6291b(C1136fh.MIME_TYPE, mimeType);
            return this;
        }

        public Builder setStarred(boolean starred) {
            this.f1450qV.mo6291b(C1136fh.STARRED, Boolean.valueOf(starred));
            return this;
        }

        public Builder setTitle(String title) {
            this.f1450qV.mo6291b(C1136fh.TITLE, title);
            return this;
        }
    }

    private MetadataChangeSet(MetadataBundle bag) {
        this.f1449qV = MetadataBundle.m1618a(bag);
    }

    /* renamed from: cM */
    public MetadataBundle mo6099cM() {
        return this.f1449qV;
    }

    public String getMimeType() {
        return (String) this.f1449qV.mo6290a(C1136fh.MIME_TYPE);
    }

    public String getTitle() {
        return (String) this.f1449qV.mo6290a(C1136fh.TITLE);
    }

    public Boolean isStarred() {
        return (Boolean) this.f1449qV.mo6290a(C1136fh.STARRED);
    }
}
