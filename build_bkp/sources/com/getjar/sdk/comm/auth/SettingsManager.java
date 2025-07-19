package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;

public class SettingsManager {
    private static SettingsManager _Instance = null;
    private Context androidContext;

    private SettingsManager(Context androidContext2) {
        if (androidContext2 == null) {
            throw new IllegalArgumentException("'androidContext' cannot be NULL");
        }
        this.androidContext = androidContext2;
    }

    public static SettingsManager getInstance(Context androidContext2) {
        if (_Instance == null) {
            _Instance = new SettingsManager(androidContext2);
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
            Logger.m644i(Area.CONFIG.value(), String.format(Locale.US, "Unable to use 'settings' at this time [%1$s]", new Object[]{e.getMessage()}));
        }
        if (settingsValue == null) {
            return null;
        }
        return settingsValue.getValue();
    }
}
