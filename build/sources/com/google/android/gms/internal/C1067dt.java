package com.google.android.gms.internal;

import android.os.Parcel;
import android.view.View;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

/* renamed from: com.google.android.gms.internal.dt */
public final class C1067dt {

    /* renamed from: nu */
    private final View f2561nu;

    /* renamed from: oX */
    private final C1068a f2562oX;

    /* renamed from: com.google.android.gms.internal.dt$a */
    public static final class C1068a implements SafeParcelable {
        public static final C1101ef CREATOR = new C1101ef();

        /* renamed from: jG */
        private final String f2563jG;

        /* renamed from: kg */
        private final int f2564kg;

        /* renamed from: nt */
        private final int f2565nt;

        /* renamed from: nv */
        private final String f2566nv;

        /* renamed from: oY */
        private final List<String> f2567oY;

        C1068a(int i, String str, List<String> list, int i2, String str2) {
            this.f2567oY = new ArrayList();
            this.f2564kg = i;
            this.f2563jG = str;
            this.f2567oY.addAll(list);
            this.f2565nt = i2;
            this.f2566nv = str2;
        }

        public C1068a(String str, Collection<String> collection, int i, String str2) {
            this(3, str, new ArrayList(collection), i, str2);
        }

        /* renamed from: bF */
        public String mo7440bF() {
            return this.f2563jG != null ? this.f2563jG : "<<default account>>";
        }

        /* renamed from: bG */
        public int mo7441bG() {
            return this.f2565nt;
        }

        /* renamed from: bH */
        public List<String> mo7442bH() {
            return new ArrayList(this.f2567oY);
        }

        /* renamed from: bJ */
        public String mo7443bJ() {
            return this.f2566nv;
        }

        public int describeContents() {
            return 0;
        }

        public String getAccountName() {
            return this.f2563jG;
        }

        public int getVersionCode() {
            return this.f2564kg;
        }

        public void writeToParcel(Parcel out, int flags) {
            C1101ef.m2606a(this, out, flags);
        }
    }

    public C1067dt(String str, Collection<String> collection, int i, View view, String str2) {
        this.f2562oX = new C1068a(str, collection, i, str2);
        this.f2561nu = view;
    }

    /* renamed from: bF */
    public String mo7433bF() {
        return this.f2562oX.mo7440bF();
    }

    /* renamed from: bG */
    public int mo7434bG() {
        return this.f2562oX.mo7441bG();
    }

    /* renamed from: bH */
    public List<String> mo7435bH() {
        return this.f2562oX.mo7442bH();
    }

    /* renamed from: bI */
    public String[] mo7436bI() {
        return (String[]) this.f2562oX.mo7442bH().toArray(new String[0]);
    }

    /* renamed from: bJ */
    public String mo7437bJ() {
        return this.f2562oX.mo7443bJ();
    }

    /* renamed from: bK */
    public View mo7438bK() {
        return this.f2561nu;
    }

    public String getAccountName() {
        return this.f2562oX.getAccountName();
    }
}
