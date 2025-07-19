package com.google.android.gms.common.data;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.eg;
/* loaded from: classes.dex */
public abstract class b {
    protected final DataHolder nE;
    protected final int nG;
    private final int nH;

    public b(DataHolder dataHolder, int i) {
        this.nE = (DataHolder) eg.f(dataHolder);
        eg.p(i >= 0 && i < dataHolder.getCount());
        this.nG = i;
        this.nH = dataHolder.C(this.nG);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public Uri L(String str) {
        return this.nE.parseUri(str, this.nG, this.nH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean M(String str) {
        return this.nE.hasNull(str, this.nG, this.nH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void a(String str, CharArrayBuffer charArrayBuffer) {
        this.nE.copyToBuffer(str, this.nG, this.nH, charArrayBuffer);
    }

    public boolean equals(Object obj) {
        if (obj instanceof b) {
            b bVar = (b) obj;
            return ee.equal(Integer.valueOf(bVar.nG), Integer.valueOf(this.nG)) && ee.equal(Integer.valueOf(bVar.nH), Integer.valueOf(this.nH)) && bVar.nE == this.nE;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean getBoolean(String column) {
        return this.nE.getBoolean(column, this.nG, this.nH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public byte[] getByteArray(String column) {
        return this.nE.getByteArray(column, this.nG, this.nH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getInteger(String column) {
        return this.nE.getInteger(column, this.nG, this.nH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long getLong(String column) {
        return this.nE.getLong(column, this.nG, this.nH);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getString(String column) {
        return this.nE.getString(column, this.nG, this.nH);
    }

    public boolean hasColumn(String column) {
        return this.nE.hasColumn(column);
    }

    public int hashCode() {
        return ee.hashCode(Integer.valueOf(this.nG), Integer.valueOf(this.nH), this.nE);
    }

    public boolean isDataValid() {
        return !this.nE.isClosed();
    }
}
