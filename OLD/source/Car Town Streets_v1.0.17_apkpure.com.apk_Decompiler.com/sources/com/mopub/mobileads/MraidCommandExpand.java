package com.mopub.mobileads;

import com.google.android.gms.plus.PlusShare;
import java.util.Map;

/* compiled from: MraidCommand */
class MraidCommandExpand extends MraidCommand {
    MraidCommandExpand(Map<String, String> params, MraidView view) {
        super(params, view);
    }

    /* access modifiers changed from: package-private */
    public void execute() {
        int width = getIntFromParamsForKey("w");
        int height = getIntFromParamsForKey("h");
        String url = getStringFromParamsForKey(PlusShare.KEY_CALL_TO_ACTION_URL);
        boolean shouldUseCustomClose = getBooleanFromParamsForKey("shouldUseCustomClose");
        boolean shouldLockOrientation = getBooleanFromParamsForKey("lockOrientation");
        if (width <= 0) {
            width = this.mView.getDisplayController().mScreenWidth;
        }
        if (height <= 0) {
            height = this.mView.getDisplayController().mScreenHeight;
        }
        this.mView.getDisplayController().expand(url, width, height, shouldUseCustomClose, shouldLockOrientation);
    }
}
