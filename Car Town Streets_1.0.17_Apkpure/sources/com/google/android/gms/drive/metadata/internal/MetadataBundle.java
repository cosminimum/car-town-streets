package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.internal.ee;
import com.google.android.gms.internal.eg;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
/* loaded from: classes.dex */
public final class MetadataBundle implements SafeParcelable {
    public static final Parcelable.Creator<MetadataBundle> CREATOR = new d();
    final int kg;
    final Bundle rF;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MetadataBundle(int versionCode, Bundle valueBundle) {
        this.kg = versionCode;
        this.rF = (Bundle) eg.f(valueBundle);
        this.rF.setClassLoader(getClass().getClassLoader());
        ArrayList<String> arrayList = new ArrayList();
        for (String str : this.rF.keySet()) {
            if (c.ac(str) == null) {
                arrayList.add(str);
                Log.w("MetadataBundle", "Ignored unknown metadata field in bundle: " + str);
            }
        }
        for (String str2 : arrayList) {
            this.rF.remove(str2);
        }
    }

    private MetadataBundle(Bundle valueBundle) {
        this(1, valueBundle);
    }

    public static <T> MetadataBundle a(MetadataField<T> metadataField, T t) {
        MetadataBundle cX = cX();
        cX.b(metadataField, t);
        return cX;
    }

    public static MetadataBundle a(MetadataBundle metadataBundle) {
        return new MetadataBundle(new Bundle(metadataBundle.rF));
    }

    public static MetadataBundle cX() {
        return new MetadataBundle(new Bundle());
    }

    public <T> T a(MetadataField<T> metadataField) {
        return metadataField.d(this.rF);
    }

    public <T> void b(MetadataField<T> metadataField, T t) {
        if (c.ac(metadataField.getName()) == null) {
            throw new IllegalArgumentException("Unregistered field: " + metadataField.getName());
        }
        metadataField.a((MetadataField<T>) t, this.rF);
    }

    public Set<MetadataField<?>> cY() {
        HashSet hashSet = new HashSet();
        for (String str : this.rF.keySet()) {
            hashSet.add(c.ac(str));
        }
        return hashSet;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof MetadataBundle)) {
            return false;
        }
        MetadataBundle metadataBundle = (MetadataBundle) obj;
        Set<String> keySet = this.rF.keySet();
        if (!keySet.equals(metadataBundle.rF.keySet())) {
            return false;
        }
        for (String str : keySet) {
            if (!ee.equal(this.rF.get(str), metadataBundle.rF.get(str))) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int i = 1;
        Iterator<String> it = this.rF.keySet().iterator();
        while (true) {
            int i2 = i;
            if (it.hasNext()) {
                i = this.rF.get(it.next()).hashCode() + (i2 * 31);
            } else {
                return i2;
            }
        }
    }

    public String toString() {
        return "MetadataBundle [values=" + this.rF + "]";
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        d.a(this, dest, flags);
    }
}
