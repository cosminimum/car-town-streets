package com.mopub.mobileads;

import java.util.Map;
/* compiled from: MraidCommand.java */
/* loaded from: classes.dex */
class MraidCommandUseCustomClose extends MraidCommand {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MraidCommandUseCustomClose(Map<String, String> params, MraidView view) {
        super(params, view);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.mopub.mobileads.MraidCommand
    public void execute() {
        boolean shouldUseCustomClose = getBooleanFromParamsForKey("shouldUseCustomClose");
        this.mView.getDisplayController().useCustomClose(shouldUseCustomClose);
    }
}
