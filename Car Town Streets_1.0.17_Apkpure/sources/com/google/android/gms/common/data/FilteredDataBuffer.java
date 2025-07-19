package com.google.android.gms.common.data;

import android.os.Bundle;
import com.google.android.gms.internal.ds;
/* loaded from: classes.dex */
public abstract class FilteredDataBuffer<T> extends DataBuffer<T> {
    protected final DataBuffer<T> mDataBuffer;

    public FilteredDataBuffer(DataBuffer<T> dataBuffer) {
        super(null);
        ds.d(dataBuffer);
        ds.a(!(dataBuffer instanceof FilteredDataBuffer), "Not possible to have nested FilteredDataBuffers.");
        this.mDataBuffer = dataBuffer;
    }

    @Override // com.google.android.gms.common.data.DataBuffer
    public void close() {
        this.mDataBuffer.close();
    }

    protected abstract int computeRealPosition(int i);

    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public T mo391get(int position) {
        return this.mDataBuffer.mo391get(computeRealPosition(position));
    }

    @Override // com.google.android.gms.common.data.DataBuffer
    public Bundle getMetadata() {
        return this.mDataBuffer.getMetadata();
    }

    @Override // com.google.android.gms.common.data.DataBuffer
    public boolean isClosed() {
        return this.mDataBuffer.isClosed();
    }
}
