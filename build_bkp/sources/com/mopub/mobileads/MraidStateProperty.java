package com.mopub.mobileads;

import com.mopub.mobileads.MraidView;

/* compiled from: MraidProperty */
class MraidStateProperty extends MraidProperty {
    private final MraidView.ViewState mViewState;

    MraidStateProperty(MraidView.ViewState viewState) {
        this.mViewState = viewState;
    }

    public static MraidStateProperty createWithViewState(MraidView.ViewState viewState) {
        return new MraidStateProperty(viewState);
    }

    public String toJsonPair() {
        return "state: '" + this.mViewState.toString().toLowerCase() + "'";
    }
}
