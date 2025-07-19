package com.mopub.mobileads;

import java.util.Map;

/* compiled from: MraidCommand */
class MraidCommandClose extends MraidCommand {
    MraidCommandClose(Map<String, String> params, MraidView view) {
        super(params, view);
    }

    /* access modifiers changed from: package-private */
    public void execute() {
        this.mView.getDisplayController().close();
    }
}
