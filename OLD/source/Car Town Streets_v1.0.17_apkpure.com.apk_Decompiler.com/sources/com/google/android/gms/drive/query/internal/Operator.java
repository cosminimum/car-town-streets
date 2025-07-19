package com.google.android.gms.drive.query.internal;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;

public class Operator implements SafeParcelable {
    public static final Parcelable.Creator<Operator> CREATOR = new h();
    public static final Operator sd = new Operator("=");
    public static final Operator se = new Operator("<");
    public static final Operator sf = new Operator("<=");
    public static final Operator sg = new Operator(">");
    public static final Operator sh = new Operator(">=");
    public static final Operator si = new Operator("and");
    public static final Operator sj = new Operator("or");
    public static final Operator sk = new Operator("not");
    public static final Operator sl = new Operator("contains");
    final int kg;
    final String mTag;

    Operator(int versionCode, String tag) {
        this.kg = versionCode;
        this.mTag = tag;
    }

    private Operator(String tag) {
        this(1, tag);
    }

    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        Operator operator = (Operator) obj;
        return this.mTag == null ? operator.mTag == null : this.mTag.equals(operator.mTag);
    }

    public int hashCode() {
        return (this.mTag == null ? 0 : this.mTag.hashCode()) + 31;
    }

    public void writeToParcel(Parcel out, int flags) {
        h.a(this, out, flags);
    }
}
