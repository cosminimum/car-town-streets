package com.mopub.mobileads;

import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.util.Map;

abstract class MraidCommand {
    protected Map<String, String> mParams;
    protected MraidView mView;

    /* access modifiers changed from: package-private */
    public abstract void execute();

    MraidCommand(Map<String, String> params, MraidView view) {
        this.mParams = params;
        this.mView = view;
    }

    /* access modifiers changed from: protected */
    public int getIntFromParamsForKey(String key) {
        String s = this.mParams.get(key);
        if (s == null) {
            return -1;
        }
        try {
            return Integer.parseInt(s, 10);
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    /* access modifiers changed from: protected */
    public String getStringFromParamsForKey(String key) {
        return this.mParams.get(key);
    }

    /* access modifiers changed from: protected */
    public float getFloatFromParamsForKey(String key) {
        if (this.mParams.get(key) == null) {
            return BitmapDescriptorFactory.HUE_RED;
        }
        try {
            return Float.parseFloat(key);
        } catch (NumberFormatException e) {
            return BitmapDescriptorFactory.HUE_RED;
        }
    }

    /* access modifiers changed from: protected */
    public boolean getBooleanFromParamsForKey(String key) {
        return "true".equals(this.mParams.get(key));
    }
}
