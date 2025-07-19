package com.mopub.mobileads;
/* compiled from: MraidProperty.java */
/* loaded from: classes.dex */
class MraidViewableProperty extends MraidProperty {
    private final boolean mViewable;

    MraidViewableProperty(boolean viewable) {
        this.mViewable = viewable;
    }

    public static MraidViewableProperty createWithViewable(boolean viewable) {
        return new MraidViewableProperty(viewable);
    }

    @Override // com.mopub.mobileads.MraidProperty
    public String toJsonPair() {
        return "viewable: " + (this.mViewable ? "true" : "false");
    }
}
