package com.flurry.android;

public final class Offer {

    /* renamed from: a */
    private long f472a;

    /* renamed from: b */
    private String f473b;

    /* renamed from: c */
    private String f474c;

    /* renamed from: d */
    private int f475d;

    /* renamed from: e */
    private AdImage f476e;

    Offer(long j, AdImage adImage, String str, String str2, int i) {
        this.f472a = j;
        this.f473b = str;
        this.f476e = adImage;
        this.f474c = str2;
        this.f475d = i;
    }

    public final long getId() {
        return this.f472a;
    }

    public final String getName() {
        return this.f473b;
    }

    public final String getDescription() {
        return this.f474c;
    }

    public final int getPrice() {
        return this.f475d;
    }

    public final String getUrl() {
        return "";
    }

    public final AdImage getImage() {
        return this.f476e;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("[id=" + this.f472a + ",name=" + this.f473b + ",price=" + this.f475d + ", image size: " + this.f476e.f408e.length);
        return sb.toString();
    }
}
