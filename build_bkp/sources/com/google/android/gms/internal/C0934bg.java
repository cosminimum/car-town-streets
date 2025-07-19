package com.google.android.gms.internal;

import com.google.ads.AdRequest;
import com.google.ads.AdSize;
import com.google.ads.mediation.MediationAdRequest;
import com.google.android.gms.ads.C0588a;
import java.util.Date;
import java.util.HashSet;

/* renamed from: com.google.android.gms.internal.bg */
public final class C0934bg {
    /* renamed from: a */
    public static int m2025a(AdRequest.ErrorCode errorCode) {
        switch (errorCode) {
            case INVALID_REQUEST:
                return 1;
            case NETWORK_ERROR:
                return 2;
            case NO_FILL:
                return 3;
            default:
                return 0;
        }
    }

    /* renamed from: a */
    public static int m2026a(AdRequest.Gender gender) {
        switch (gender) {
            case FEMALE:
                return 2;
            case MALE:
                return 1;
            default:
                return 0;
        }
    }

    /* renamed from: b */
    public static AdSize m2027b(C1466x xVar) {
        return new AdSize(C0588a.m1080a(xVar.width, xVar.height, xVar.f3485eF));
    }

    /* renamed from: e */
    public static MediationAdRequest m2028e(C1464v vVar) {
        return new MediationAdRequest(new Date(vVar.f3482ex), m2029g(vVar.f3483ey), vVar.f3484ez != null ? new HashSet(vVar.f3484ez) : null, vVar.f3477eA);
    }

    /* renamed from: g */
    public static AdRequest.Gender m2029g(int i) {
        switch (i) {
            case 1:
                return AdRequest.Gender.MALE;
            case 2:
                return AdRequest.Gender.FEMALE;
            default:
                return AdRequest.Gender.UNKNOWN;
        }
    }

    /* renamed from: h */
    public static final AdRequest.ErrorCode m2030h(int i) {
        switch (i) {
            case 1:
                return AdRequest.ErrorCode.INVALID_REQUEST;
            case 2:
                return AdRequest.ErrorCode.NETWORK_ERROR;
            case 3:
                return AdRequest.ErrorCode.NO_FILL;
            default:
                return AdRequest.ErrorCode.INTERNAL_ERROR;
        }
    }
}
