package com.mopub.mobileads;

import com.mopub.mobileads.MraidView;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: MraidProperty.java */
/* loaded from: classes.dex */
public class MraidStateProperty extends MraidProperty {
    private final MraidView.ViewState mViewState;

    MraidStateProperty(MraidView.ViewState viewState) {
        this.mViewState = viewState;
    }

    public static MraidStateProperty createWithViewState(MraidView.ViewState viewState) {
        return new MraidStateProperty(viewState);
    }

    @Override // com.mopub.mobileads.MraidProperty
    public String toJsonPair() {
        return "state: '" + this.mViewState.toString().toLowerCase() + "'";
    }
}
