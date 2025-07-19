package com.google.android.gms.common.data;

import android.os.Bundle;
import java.util.Iterator;
/* loaded from: classes.dex */
public abstract class DataBuffer<T> implements Iterable<T> {
    protected final DataHolder nE;

    /* JADX INFO: Access modifiers changed from: protected */
    public DataBuffer(DataHolder dataHolder) {
        this.nE = dataHolder;
        if (this.nE != null) {
            this.nE.c(this);
        }
    }

    public void close() {
        if (this.nE != null) {
            this.nE.close();
        }
    }

    public int describeContents() {
        return 0;
    }

    /* renamed from: get */
    public abstract T mo391get(int i);

    public int getCount() {
        if (this.nE == null) {
            return 0;
        }
        return this.nE.getCount();
    }

    public Bundle getMetadata() {
        return this.nE.getMetadata();
    }

    public boolean isClosed() {
        if (this.nE == null) {
            return true;
        }
        return this.nE.isClosed();
    }

    @Override // java.lang.Iterable
    public Iterator<T> iterator() {
        return new a(this);
    }
}
