package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
public class SettingsManager {
    private static SettingsManager _Instance = null;
    private Context androidContext;

    private SettingsManager(Context androidContext) {
        if (androidContext == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
        this.androidContext = androidContext;
    }

    public static SettingsManager getInstance(Context androidContext) {
        if (_Instance == null) {
            _Instance = new SettingsManager(androidContext);
        }
        return _Instance;
    }

    public String getValue(String key) {
        if (StringUtility.isNullOrEmpty(key)) {
            throw new IllegalArgumentException("'key' cannot be null");
        }
        SettingsValue settingsValue = null;
        try {
            settingsValue = AuthManager.getInstance().getSettings().get(key);
        } catch (IllegalStateException e) {
            Logger.i(Area.CONFIG.value(), String.format(Locale.US, "Unable to use 'settings' at this time [%1$s]", e.getMessage()));
        }
        if (settingsValue == null) {
            return null;
        }
        return settingsValue.getValue();
    }
}
