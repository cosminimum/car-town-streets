package com.mopub.mobileads;

class MraidAbstractController {
    private final MraidView mView;

    MraidAbstractController(MraidView view) {
        this.mView = view;
    }

    public MraidView getView() {
        return this.mView;
    }
}
