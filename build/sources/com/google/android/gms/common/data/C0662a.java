package com.google.android.gms.common.data;

import com.google.android.gms.internal.C1102eg;
import java.util.Iterator;
import java.util.NoSuchElementException;

/* renamed from: com.google.android.gms.common.data.a */
public final class C0662a<T> implements Iterator<T> {
    private final DataBuffer<T> mDataBuffer;

    /* renamed from: nF */
    private int f1385nF = -1;

    public C0662a(DataBuffer<T> dataBuffer) {
        this.mDataBuffer = (DataBuffer) C1102eg.m2616f(dataBuffer);
    }

    public boolean hasNext() {
        return this.f1385nF < this.mDataBuffer.getCount() + -1;
    }

    public T next() {
        if (!hasNext()) {
            throw new NoSuchElementException("Cannot advance the iterator beyond " + this.f1385nF);
        }
        DataBuffer<T> dataBuffer = this.mDataBuffer;
        int i = this.f1385nF + 1;
        this.f1385nF = i;
        return dataBuffer.get(i);
    }

    public void remove() {
        throw new UnsupportedOperationException("Cannot remove elements from a DataBufferIterator");
    }
}
