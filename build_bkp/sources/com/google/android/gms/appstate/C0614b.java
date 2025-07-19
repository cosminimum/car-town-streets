package com.google.android.gms.appstate;

import com.google.android.gms.common.data.C0663b;
import com.google.android.gms.common.data.DataHolder;

/* renamed from: com.google.android.gms.appstate.b */
public final class C0614b extends C0663b implements AppState {
    C0614b(DataHolder dataHolder, int i) {
        super(dataHolder, i);
    }

    /* renamed from: aK */
    public AppState freeze() {
        return new C0613a(this);
    }

    public boolean equals(Object obj) {
        return C0613a.m1138a(this, obj);
    }

    public byte[] getConflictData() {
        return getByteArray("conflict_data");
    }

    public String getConflictVersion() {
        return getString("conflict_version");
    }

    public int getKey() {
        return getInteger("key");
    }

    public byte[] getLocalData() {
        return getByteArray("local_data");
    }

    public String getLocalVersion() {
        return getString("local_version");
    }

    public boolean hasConflict() {
        return !mo5975M("conflict_version");
    }

    public int hashCode() {
        return C0613a.m1137a(this);
    }

    public String toString() {
        return C0613a.m1139b(this);
    }
}
