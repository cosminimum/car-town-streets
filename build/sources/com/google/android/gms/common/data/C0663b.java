package com.google.android.gms.common.data;

import android.database.CharArrayBuffer;
import android.net.Uri;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;

/* renamed from: com.google.android.gms.common.data.b */
public abstract class C0663b {

    /* renamed from: nE */
    protected final DataHolder f1386nE;

    /* renamed from: nG */
    protected final int f1387nG;

    /* renamed from: nH */
    private final int f1388nH;

    public C0663b(DataHolder dataHolder, int i) {
        this.f1386nE = (DataHolder) C1102eg.m2616f(dataHolder);
        C1102eg.m2617p(i >= 0 && i < dataHolder.getCount());
        this.f1387nG = i;
        this.f1388nH = dataHolder.mo5935C(this.f1387nG);
    }

    /* access modifiers changed from: protected */
    /* renamed from: L */
    public Uri mo5974L(String str) {
        return this.f1386nE.parseUri(str, this.f1387nG, this.f1388nH);
    }

    /* access modifiers changed from: protected */
    /* renamed from: M */
    public boolean mo5975M(String str) {
        return this.f1386nE.hasNull(str, this.f1387nG, this.f1388nH);
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public void mo5976a(String str, CharArrayBuffer charArrayBuffer) {
        this.f1386nE.copyToBuffer(str, this.f1387nG, this.f1388nH, charArrayBuffer);
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C0663b)) {
            return false;
        }
        C0663b bVar = (C0663b) obj;
        return C1098ee.equal(Integer.valueOf(bVar.f1387nG), Integer.valueOf(this.f1387nG)) && C1098ee.equal(Integer.valueOf(bVar.f1388nH), Integer.valueOf(this.f1388nH)) && bVar.f1386nE == this.f1386nE;
    }

    /* access modifiers changed from: protected */
    public boolean getBoolean(String column) {
        return this.f1386nE.getBoolean(column, this.f1387nG, this.f1388nH);
    }

    /* access modifiers changed from: protected */
    public byte[] getByteArray(String column) {
        return this.f1386nE.getByteArray(column, this.f1387nG, this.f1388nH);
    }

    /* access modifiers changed from: protected */
    public int getInteger(String column) {
        return this.f1386nE.getInteger(column, this.f1387nG, this.f1388nH);
    }

    /* access modifiers changed from: protected */
    public long getLong(String column) {
        return this.f1386nE.getLong(column, this.f1387nG, this.f1388nH);
    }

    /* access modifiers changed from: protected */
    public String getString(String column) {
        return this.f1386nE.getString(column, this.f1387nG, this.f1388nH);
    }

    public boolean hasColumn(String column) {
        return this.f1386nE.hasColumn(column);
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.f1387nG), Integer.valueOf(this.f1388nH), this.f1386nE);
    }

    public boolean isDataValid() {
        return !this.f1386nE.isClosed();
    }
}
