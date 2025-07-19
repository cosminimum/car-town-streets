package com.google.android.gms.internal;

import android.content.Context;
import com.google.android.gms.common.Scopes;
import java.util.ArrayList;
import java.util.Arrays;

/* renamed from: com.google.android.gms.internal.hv */
public class C1378hv {

    /* renamed from: DT */
    private String[] f3233DT;

    /* renamed from: DU */
    private String f3234DU;

    /* renamed from: DV */
    private String f3235DV;

    /* renamed from: DW */
    private String f3236DW;

    /* renamed from: DY */
    private ArrayList<String> f3237DY = new ArrayList<>();

    /* renamed from: DZ */
    private String[] f3238DZ;

    /* renamed from: jG */
    private String f3239jG;

    public C1378hv(Context context) {
        this.f3235DV = context.getPackageName();
        this.f3234DU = context.getPackageName();
        this.f3237DY.add(Scopes.PLUS_LOGIN);
    }

    /* renamed from: aA */
    public C1378hv mo8325aA(String str) {
        this.f3239jG = str;
        return this;
    }

    /* renamed from: d */
    public C1378hv mo8326d(String... strArr) {
        this.f3237DY.clear();
        this.f3237DY.addAll(Arrays.asList(strArr));
        return this;
    }

    /* renamed from: e */
    public C1378hv mo8327e(String... strArr) {
        this.f3238DZ = strArr;
        return this;
    }

    /* renamed from: eY */
    public C1378hv mo8328eY() {
        this.f3237DY.clear();
        return this;
    }

    /* renamed from: eZ */
    public C1377hu mo8329eZ() {
        if (this.f3239jG == null) {
            this.f3239jG = "<<default account>>";
        }
        return new C1377hu(this.f3239jG, (String[]) this.f3237DY.toArray(new String[this.f3237DY.size()]), this.f3238DZ, this.f3233DT, this.f3234DU, this.f3235DV, this.f3236DW);
    }
}
