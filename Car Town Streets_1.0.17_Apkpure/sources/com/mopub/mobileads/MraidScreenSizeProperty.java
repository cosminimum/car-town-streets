package com.mopub.mobileads;
/* compiled from: MraidProperty.java */
/* loaded from: classes.dex */
class MraidScreenSizeProperty extends MraidProperty {
    private final int mScreenHeight;
    private final int mScreenWidth;

    MraidScreenSizeProperty(int width, int height) {
        this.mScreenWidth = width;
        this.mScreenHeight = height;
    }

    public static MraidScreenSizeProperty createWithSize(int width, int height) {
        return new MraidScreenSizeProperty(width, height);
    }

    @Override // com.mopub.mobileads.MraidProperty
    public String toJsonPair() {
        return "screenSize: { width: " + this.mScreenWidth + ", height: " + this.mScreenHeight + " }";
    }
}
