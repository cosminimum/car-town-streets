package com.google.android.gms.common.data;

import java.util.ArrayList;

/* renamed from: com.google.android.gms.common.data.d */
public abstract class C0665d<T> extends DataBuffer<T> {

    /* renamed from: nZ */
    private boolean f1391nZ = false;

    /* renamed from: oa */
    private ArrayList<Integer> f1392oa;

    protected C0665d(DataHolder dataHolder) {
        super(dataHolder);
    }

    /* renamed from: E */
    private int m1309E(int i) {
        if (i < 0 || i == this.f1392oa.size()) {
            return 0;
        }
        return i == this.f1392oa.size() + -1 ? this.f1366nE.getCount() - this.f1392oa.get(i).intValue() : this.f1392oa.get(i + 1).intValue() - this.f1392oa.get(i).intValue();
    }

    /* renamed from: by */
    private void m1310by() {
        synchronized (this) {
            if (!this.f1391nZ) {
                int count = this.f1366nE.getCount();
                this.f1392oa = new ArrayList<>();
                if (count > 0) {
                    this.f1392oa.add(0);
                    String primaryDataMarkerColumn = getPrimaryDataMarkerColumn();
                    String string = this.f1366nE.getString(primaryDataMarkerColumn, 0, this.f1366nE.mo5935C(0));
                    int i = 1;
                    while (i < count) {
                        String string2 = this.f1366nE.getString(primaryDataMarkerColumn, i, this.f1366nE.mo5935C(i));
                        if (!string2.equals(string)) {
                            this.f1392oa.add(Integer.valueOf(i));
                        } else {
                            string2 = string;
                        }
                        i++;
                        string = string2;
                    }
                }
                this.f1391nZ = true;
            }
        }
    }

    /* access modifiers changed from: package-private */
    /* renamed from: D */
    public int mo5985D(int i) {
        if (i >= 0 && i < this.f1392oa.size()) {
            return this.f1392oa.get(i).intValue();
        }
        throw new IllegalArgumentException("Position " + i + " is out of bounds for this buffer");
    }

    /* access modifiers changed from: protected */
    /* renamed from: a */
    public abstract T mo5986a(int i, int i2);

    public final T get(int position) {
        m1310by();
        return mo5986a(mo5985D(position), m1309E(position));
    }

    public int getCount() {
        m1310by();
        return this.f1392oa.size();
    }

    /* access modifiers changed from: protected */
    public abstract String getPrimaryDataMarkerColumn();
}
