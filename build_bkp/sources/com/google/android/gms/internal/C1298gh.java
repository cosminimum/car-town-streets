package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.List;

/* renamed from: com.google.android.gms.internal.gh */
public class C1298gh implements SafeParcelable, Cloneable {
    public static final C1299gi CREATOR = new C1299gi();

    /* renamed from: kg */
    private final int f2962kg;

    /* renamed from: xK */
    private final boolean f2963xK;

    /* renamed from: xL */
    private final boolean f2964xL;

    /* renamed from: xM */
    private final boolean f2965xM;

    /* renamed from: xN */
    private final boolean f2966xN;

    /* renamed from: xO */
    private final ArrayList<C1107el> f2967xO;

    public C1298gh(int i, boolean z, boolean z2, boolean z3, boolean z4, ArrayList<C1107el> arrayList) {
        this.f2962kg = i;
        this.f2963xK = z;
        this.f2964xL = z2;
        this.f2965xM = z3;
        this.f2966xN = z4;
        this.f2967xO = arrayList;
    }

    public Object clone() {
        return new C1298gh(this.f2962kg, this.f2963xK, this.f2964xL, this.f2965xM, this.f2966xN, this.f2967xO == null ? null : (ArrayList) this.f2967xO.clone());
    }

    /* renamed from: dD */
    public boolean mo8011dD() {
        return this.f2964xL;
    }

    /* renamed from: dE */
    public boolean mo8012dE() {
        return this.f2965xM;
    }

    /* renamed from: dF */
    public boolean mo8013dF() {
        return this.f2966xN;
    }

    /* renamed from: dG */
    public List<C1107el> mo8014dG() {
        return this.f2967xO;
    }

    public int describeContents() {
        C1299gi giVar = CREATOR;
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
        C1298gh ghVar = (C1298gh) obj;
        if (this.f2967xO == null) {
            if (ghVar.f2967xO != null) {
                return false;
            }
        } else if (!this.f2967xO.equals(ghVar.f2967xO)) {
            return false;
        }
        if (this.f2963xK != ghVar.f2963xK) {
            return false;
        }
        if (this.f2964xL != ghVar.f2964xL) {
            return false;
        }
        if (this.f2966xN != ghVar.f2966xN) {
            return false;
        }
        if (this.f2965xM != ghVar.f2965xM) {
            return false;
        }
        return this.f2962kg == ghVar.f2962kg;
    }

    public int getVersionCode() {
        return this.f2962kg;
    }

    public int hashCode() {
        int i = 1231;
        int hashCode = ((this.f2966xN ? 1231 : 1237) + (((this.f2964xL ? 1231 : 1237) + (((this.f2963xK ? 1231 : 1237) + (((this.f2967xO == null ? 0 : this.f2967xO.hashCode()) + 31) * 31)) * 31)) * 31)) * 31;
        if (!this.f2965xM) {
            i = 1237;
        }
        return ((hashCode + i) * 31) + this.f2962kg;
    }

    public boolean isEnabled() {
        return this.f2963xK;
    }

    public String toString() {
        return "CopresenceSettings [mVersionCode=" + this.f2962kg + ", mEnabled=" + this.f2963xK + "," + "mAcl={" + this.f2967xO.toArray() + "}," + ", mNotifiedForNonAcl=" + this.f2965xM + "]";
    }

    public void writeToParcel(Parcel dest, int flags) {
        C1299gi giVar = CREATOR;
        C1299gi.m3422a(this, dest, flags);
    }
}
