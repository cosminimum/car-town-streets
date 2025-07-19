package com.mopub.mobileads;

import com.google.android.gms.plus.PlusShare;
import java.util.Map;

/* compiled from: MraidCommand */
class MraidCommandOpen extends MraidCommand {
    MraidCommandOpen(Map<String, String> params, MraidView view) {
        super(params, view);
    }

    /* access modifiers changed from: package-private */
    public void execute() {
        this.mView.getBrowserController().open(getStringFromParamsForKey(PlusShare.KEY_CALL_TO_ACTION_URL));
    }
}
