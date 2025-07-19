package com.mopub.mobileads;

import com.google.android.gms.plus.PlusShare;
import java.util.Map;
/* compiled from: MraidCommand.java */
/* loaded from: classes.dex */
class MraidCommandOpen extends MraidCommand {
    /* JADX INFO: Access modifiers changed from: package-private */
    public MraidCommandOpen(Map<String, String> params, MraidView view) {
        super(params, view);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.mopub.mobileads.MraidCommand
    public void execute() {
        String url = getStringFromParamsForKey(PlusShare.KEY_CALL_TO_ACTION_URL);
        this.mView.getBrowserController().open(url);
    }
}
