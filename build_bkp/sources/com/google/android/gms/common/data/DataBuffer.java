package com.google.android.gms.common.data;

import android.os.Bundle;
import java.util.Iterator;

public abstract class DataBuffer<T> implements Iterable<T> {

    /* renamed from: nE */
    protected final DataHolder f1366nE;

    protected DataBuffer(DataHolder dataHolder) {
        this.f1366nE = dataHolder;
        if (this.f1366nE != null) {
            this.f1366nE.mo5938c(this);
        }
    }

    public void close() {
        if (this.f1366nE != null) {
            this.f1366nE.close();
        }
    }

    public int describeContents() {
        return 0;
    }

    public abstract T get(int i);

    public int getCount() {
        if (this.f1366nE == null) {
            return 0;
        }
        return this.f1366nE.getCount();
    }

    public Bundle getMetadata() {
        return this.f1366nE.getMetadata();
    }

    public boolean isClosed() {
        if (this.f1366nE == null) {
            return true;
        }
        return this.f1366nE.isClosed();
    }

    public Iterator<T> iterator() {
        return new C0662a(this);
    }
}
