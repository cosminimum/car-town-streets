package com.google.android.gms.drive;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.ArrayList;
/* loaded from: classes.dex */
public final class MetadataBuffer extends DataBuffer<Metadata> {
    private static final String[] qS;
    private final String qT;

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class a extends Metadata {
        private final DataHolder nE;
        private final int nH;
        private final int qU;

        public a(DataHolder dataHolder, int i) {
            this.nE = dataHolder;
            this.qU = i;
            this.nH = dataHolder.C(i);
        }

        @Override // com.google.android.gms.drive.Metadata
        protected <T> T a(MetadataField<T> metadataField) {
            return metadataField.c(this.nE, this.qU, this.nH);
        }

        @Override // com.google.android.gms.common.data.Freezable
        /* renamed from: cK */
        public Metadata mo358freeze() {
            MetadataBundle cX = MetadataBundle.cX();
            for (MetadataField<?> metadataField : com.google.android.gms.drive.metadata.internal.c.cW()) {
                metadataField.a(this.nE, cX, this.qU, this.nH);
            }
            return new b(cX);
        }

        @Override // com.google.android.gms.common.data.Freezable
        public boolean isDataValid() {
            return !this.nE.isClosed();
        }
    }

    static {
        ArrayList arrayList = new ArrayList();
        for (MetadataField<?> metadataField : com.google.android.gms.drive.metadata.internal.c.cW()) {
            arrayList.addAll(metadataField.cV());
        }
        qS = (String[]) arrayList.toArray(new String[0]);
    }

    public MetadataBuffer(DataHolder dataHolder, String nextPageToken) {
        super(dataHolder);
        this.qT = nextPageToken;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public Metadata mo391get(int row) {
        return new a(this.nE, row);
    }

    public String getNextPageToken() {
        return this.qT;
    }
}
