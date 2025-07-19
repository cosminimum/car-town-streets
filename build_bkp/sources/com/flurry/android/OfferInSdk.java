package com.flurry.android;

public final class OfferInSdk {

    /* renamed from: a */
    long f477a;

    /* renamed from: b */
    C0318p f478b;

    /* renamed from: c */
    String f479c;

    /* renamed from: d */
    String f480d;

    /* renamed from: e */
    int f481e;

    /* renamed from: f */
    AdImage f482f;

    OfferInSdk(long j, C0318p pVar, AdImage adImage, String str, String str2, int i) {
        this.f477a = j;
        this.f478b = pVar;
        this.f479c = str;
        this.f482f = adImage;
        this.f480d = str2;
        this.f481e = i;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[id=" + this.f477a).append(",name=" + this.f479c + "]");
        return sb.toString();
    }
}
