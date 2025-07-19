package com.google.android.gms.internal;

import android.os.Parcel;
import com.google.android.gms.common.internal.safeparcel.SafeParcelable;
import java.util.Arrays;

/* renamed from: com.google.android.gms.internal.hu */
public class C1377hu implements SafeParcelable {
    public static final C1379hw CREATOR = new C1379hw();

    /* renamed from: DR */
    private final String[] f3224DR;

    /* renamed from: DS */
    private final String[] f3225DS;

    /* renamed from: DT */
    private final String[] f3226DT;

    /* renamed from: DU */
    private final String f3227DU;

    /* renamed from: DV */
    private final String f3228DV;

    /* renamed from: DW */
    private final String f3229DW;

    /* renamed from: DX */
    private final String f3230DX;

    /* renamed from: jG */
    private final String f3231jG;

    /* renamed from: kg */
    private final int f3232kg;

    C1377hu(int i, String str, String[] strArr, String[] strArr2, String[] strArr3, String str2, String str3, String str4, String str5) {
        this.f3232kg = i;
        this.f3231jG = str;
        this.f3224DR = strArr;
        this.f3225DS = strArr2;
        this.f3226DT = strArr3;
        this.f3227DU = str2;
        this.f3228DV = str3;
        this.f3229DW = str4;
        this.f3230DX = str5;
    }

    public C1377hu(String str, String[] strArr, String[] strArr2, String[] strArr3, String str2, String str3, String str4) {
        this.f3232kg = 1;
        this.f3231jG = str;
        this.f3224DR = strArr;
        this.f3225DS = strArr2;
        this.f3226DT = strArr3;
        this.f3227DU = str2;
        this.f3228DV = str3;
        this.f3229DW = str4;
        this.f3230DX = null;
    }

    public int describeContents() {
        return 0;
    }

    /* renamed from: eR */
    public String[] mo8312eR() {
        return this.f3224DR;
    }

    /* renamed from: eS */
    public String[] mo8313eS() {
        return this.f3225DS;
    }

    /* renamed from: eT */
    public String[] mo8314eT() {
        return this.f3226DT;
    }

    /* renamed from: eU */
    public String mo8315eU() {
        return this.f3227DU;
    }

    /* renamed from: eV */
    public String mo8316eV() {
        return this.f3228DV;
    }

    /* renamed from: eW */
    public String mo8317eW() {
        return this.f3229DW;
    }

    /* renamed from: eX */
    public String mo8318eX() {
        return this.f3230DX;
    }

    public boolean equals(Object obj) {
        if (!(obj instanceof C1377hu)) {
            return false;
        }
        C1377hu huVar = (C1377hu) obj;
        return this.f3232kg == huVar.f3232kg && C1098ee.equal(this.f3231jG, huVar.f3231jG) && Arrays.equals(this.f3224DR, huVar.f3224DR) && Arrays.equals(this.f3225DS, huVar.f3225DS) && Arrays.equals(this.f3226DT, huVar.f3226DT) && C1098ee.equal(this.f3227DU, huVar.f3227DU) && C1098ee.equal(this.f3228DV, huVar.f3228DV) && C1098ee.equal(this.f3229DW, huVar.f3229DW) && C1098ee.equal(this.f3230DX, huVar.f3230DX);
    }

    public String getAccountName() {
        return this.f3231jG;
    }

    public int getVersionCode() {
        return this.f3232kg;
    }

    public int hashCode() {
        return C1098ee.hashCode(Integer.valueOf(this.f3232kg), this.f3231jG, this.f3224DR, this.f3225DS, this.f3226DT, this.f3227DU, this.f3228DV, this.f3229DW, this.f3230DX);
    }

    public String toString() {
        return C1098ee.m2604e(this).mo7535a("versionCode", Integer.valueOf(this.f3232kg)).mo7535a("accountName", this.f3231jG).mo7535a("requestedScopes", this.f3224DR).mo7535a("visibleActivities", this.f3225DS).mo7535a("requiredFeatures", this.f3226DT).mo7535a("packageNameForAuth", this.f3227DU).mo7535a("callingPackageName", this.f3228DV).mo7535a("applicationName", this.f3229DW).toString();
    }

    public void writeToParcel(Parcel out, int flags) {
        C1379hw.m3714a(this, out, flags);
    }
}
