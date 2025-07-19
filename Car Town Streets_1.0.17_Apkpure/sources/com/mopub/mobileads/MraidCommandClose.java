package com.mopub.mobileads;

import java.util.Map;
/* compiled from: MraidCommand.java */
/* loaded from: classes.dex */
class MraidCommandClose extends MraidCommand {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MraidCommandClose(Map<String, String> params, MraidView view) {
        super(params, view);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.mopub.mobileads.MraidCommand
    public void execute() {
        this.mView.getDisplayController().close();
    }
}
