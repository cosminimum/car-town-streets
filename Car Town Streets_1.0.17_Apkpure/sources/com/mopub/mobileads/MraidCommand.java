package com.mopub.mobileads;

import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public abstract class MraidCommand {
    protected Map<String, String> mParams;
    protected MraidView mView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public abstract void execute();

    /* JADX INFO: Access modifiers changed from: package-private */
    public MraidCommand(Map<String, String> params, MraidView view) {
        this.mParams = params;
        this.mView = view;
    }

    /* JADX INFO: Access modifiers changed from: protected */
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

    /* JADX INFO: Access modifiers changed from: protected */
    public String getStringFromParamsForKey(String key) {
        return this.mParams.get(key);
    }

    protected float getFloatFromParamsForKey(String key) {
        String s = this.mParams.get(key);
        if (s == null) {
            return BitmapDescriptorFactory.HUE_RED;
        }
        try {
            return Float.parseFloat(key);
        } catch (NumberFormatException e) {
            return BitmapDescriptorFactory.HUE_RED;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public boolean getBooleanFromParamsForKey(String key) {
        return "true".equals(this.mParams.get(key));
    }
}
