package com.google.android.gms.drive.metadata.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.util.Log;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import com.google.android.gms.drive.metadata.MetadataField;
import com.google.android.gms.internal.C1098ee;
import com.google.android.gms.internal.C1102eg;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public final class MetadataBundle implements SafeParcelable {
    public static final Parcelable.Creator<MetadataBundle> CREATOR = new C0752d();

    /* renamed from: kg */
    final int f1561kg;

    /* renamed from: rF */
    final Bundle f1562rF;

    MetadataBundle(int versionCode, Bundle valueBundle) {
        this.f1561kg = versionCode;
        this.f1562rF = (Bundle) C1102eg.m2616f(valueBundle);
        this.f1562rF.setClassLoader(getClass().getClassLoader());
        ArrayList<String> arrayList = new ArrayList<>();
        for (String str : this.f1562rF.keySet()) {
            if (C0751c.m1635ac(str) == null) {
                arrayList.add(str);
                Log.w("MetadataBundle", "Ignored unknown metadata field in bundle: " + str);
            }
        }
        for (String remove : arrayList) {
            this.f1562rF.remove(remove);
        }
    }

    private MetadataBundle(Bundle valueBundle) {
        this(1, valueBundle);
    }

    /* renamed from: a */
    public static <T> MetadataBundle m1617a(MetadataField<T> metadataField, T t) {
        MetadataBundle cX = m1619cX();
        cX.mo6291b(metadataField, t);
        return cX;
    }

    /* renamed from: a */
    public static MetadataBundle m1618a(MetadataBundle metadataBundle) {
        return new MetadataBundle(new Bundle(metadataBundle.f1562rF));
    }

    /* renamed from: cX */
    public static MetadataBundle m1619cX() {
        return new MetadataBundle(new Bundle());
    }

    /* renamed from: a */
    public <T> T mo6290a(MetadataField<T> metadataField) {
        return metadataField.mo6283d(this.f1562rF);
    }

    /* renamed from: b */
    public <T> void mo6291b(MetadataField<T> metadataField, T t) {
        if (C0751c.m1635ac(metadataField.getName()) == null) {
            throw new IllegalArgumentException("Unregistered field: " + metadataField.getName());
        }
        metadataField.mo6280a(t, this.f1562rF);
    }

    /* renamed from: cY */
    public Set<MetadataField<?>> mo6292cY() {
        HashSet hashSet = new HashSet();
        for (String ac : this.f1562rF.keySet()) {
            hashSet.add(C0751c.m1635ac(ac));
        }
        return hashSet;
    }

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
        Set<String> keySet = this.f1562rF.keySet();
        if (!keySet.equals(metadataBundle.f1562rF.keySet())) {
            return false;
        }
        for (String str : keySet) {
            if (!C1098ee.equal(this.f1562rF.get(str), metadataBundle.f1562rF.get(str))) {
                return false;
            }
        }
        return true;
    }

    public int hashCode() {
        int i = 1;
        Iterator it = this.f1562rF.keySet().iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = this.f1562rF.get((String) it.next()).hashCode() + (i2 * 31);
        }
    }

    public String toString() {
        return "MetadataBundle [values=" + this.f1562rF + "]";
    }

    public void writeToParcel(Parcel dest, int flags) {
        C0752d.m1638a(this, dest, flags);
    }
}
