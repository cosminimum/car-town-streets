package com.google.android.gms.drive;

import com.google.android.gms.common.data.DataBuffer;
import com.google.android.gms.common.data.DataHolder;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.drive.metadata.internal.C0751c;
import com.google.android.gms.drive.metadata.internal.MetadataBundle;
import java.util.ArrayList;

public final class MetadataBuffer extends DataBuffer<Metadata> {

    /* renamed from: qS */
    private static final String[] f1444qS;

    /* renamed from: qT */
    private final String f1445qT;

    /* renamed from: com.google.android.gms.drive.MetadataBuffer$a */
    private static class C0679a extends Metadata {

        /* renamed from: nE */
        private final DataHolder f1446nE;

        /* renamed from: nH */
        private final int f1447nH;

        /* renamed from: qU */
        private final int f1448qU;

        public C0679a(DataHolder dataHolder, int i) {
            this.f1446nE = dataHolder;
            this.f1448qU = i;
            this.f1447nH = dataHolder.mo5935C(i);
        }

        /* access modifiers changed from: protected */
        /* renamed from: a */
        public <T> T mo6085a(MetadataField<T> metadataField) {
            return metadataField.mo6281c(this.f1446nE, this.f1448qU, this.f1447nH);
        }

        /* renamed from: cK */
        public Metadata freeze() {
            MetadataBundle cX = MetadataBundle.m1619cX();
            for (MetadataField<?> a : C0751c.m1637cW()) {
                a.mo6279a(this.f1446nE, cX, this.f1448qU, this.f1447nH);
            }
            return new C0682b(cX);
        }

        public boolean isDataValid() {
            return !this.f1446nE.isClosed();
        }
    }

    static {
        ArrayList arrayList = new ArrayList();
        for (MetadataField<?> cV : C0751c.m1637cW()) {
            arrayList.addAll(cV.mo6282cV());
        }
        f1444qS = (String[]) arrayList.toArray(new String[0]);
    }

    public MetadataBuffer(DataHolder dataHolder, String nextPageToken) {
        super(dataHolder);
        this.f1445qT = nextPageToken;
    }

    public Metadata get(int row) {
        return new C0679a(this.f1366nE, row);
    }

    public String getNextPageToken() {
        return this.f1445qT;
    }
}
