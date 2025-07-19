package com.google.android.gms.common.data;

import java.util.ArrayList;
/* loaded from: classes.dex */
public abstract class d<T> extends DataBuffer<T> {
    private boolean nZ = false;
    private ArrayList<Integer> oa;

    /* JADX INFO: Access modifiers changed from: protected */
    public d(DataHolder dataHolder) {
        super(dataHolder);
    }

    private int E(int i) {
        if (i < 0 || i == this.oa.size()) {
            return 0;
        }
        return i == this.oa.size() + (-1) ? this.nE.getCount() - this.oa.get(i).intValue() : this.oa.get(i + 1).intValue() - this.oa.get(i).intValue();
    }

    private void by() {
        synchronized (this) {
            if (!this.nZ) {
                int count = this.nE.getCount();
                this.oa = new ArrayList<>();
                if (count > 0) {
                    this.oa.add(0);
                    String primaryDataMarkerColumn = getPrimaryDataMarkerColumn();
                    String string = this.nE.getString(primaryDataMarkerColumn, 0, this.nE.C(0));
                    int i = 1;
                    while (i < count) {
                        String string2 = this.nE.getString(primaryDataMarkerColumn, i, this.nE.C(i));
                        if (!string2.equals(string)) {
                            this.oa.add(Integer.valueOf(i));
                        } else {
                            string2 = string;
                        }
                        i++;
                        string = string2;
                    }
                }
                this.nZ = true;
            }
        }
    }

    int D(int i) {
        if (i < 0 || i >= this.oa.size()) {
            throw new IllegalArgumentException("Position " + i + " is out of bounds for this buffer");
        }
        return this.oa.get(i).intValue();
    }

    protected abstract T a(int i, int i2);

    @Override // com.google.android.gms.common.data.DataBuffer
    /* renamed from: get */
    public final T mo391get(int position) {
        by();
        return a(D(position), E(position));
    }

    @Override // com.google.android.gms.common.data.DataBuffer
    public int getCount() {
        by();
        return this.oa.size();
    }

    protected abstract String getPrimaryDataMarkerColumn();
}
