package com.getjar.sdk.logging;

import android.util.Log;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
abstract class AppenderBase implements AppenderInterface {
    protected static String _TAG = "GetJar SDK";
    private volatile long _areas;
    private volatile boolean _enabled;
    private volatile int _level;

    /* JADX INFO: Access modifiers changed from: protected */
    public AppenderBase(boolean enabled, int level, long areas) {
        validateLevel(level);
        if (areas <= 0) {
            throw new IllegalArgumentException("'areas' cannot be zero or less");
        }
        this._enabled = enabled;
        this._level = level;
        this._areas = areas;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void configureAppender(boolean enabled, String level, String areas) {
        int parsedLevel = getLogLevelFromString(level);
        long parsedAreas = parseAreas(areas);
        this._enabled = enabled;
        this._level = parsedLevel;
        this._areas = parsedAreas;
        Log.d(_TAG, String.format(Locale.US, "%1$s|%2$s: AppenderBase: configureAppender() Appender %3$s configured [enabled=%4$s level=%5$s areas=%6$s]", Area.LOGGING.name(), Area.CONFIG.name(), getClass().getName(), Boolean.valueOf(enabled), level, areas));
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public boolean isEnabled() {
        return this._enabled;
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public boolean isLevelActive(int logLevel) {
        validateLevel(logLevel);
        return this._level <= logLevel;
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public boolean isAreaActive(long areas) {
        return Area.areasOverlap(this._areas, areas);
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public int getLevel() {
        return this._level;
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public long getAreas() {
        return this._areas;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void logInternal(int level, String msg) {
        logInternal(level, msg, null);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void logInternal(int level, String msg, Throwable t) {
        validateLevel(level);
        if (isLevelActive(level)) {
            String logCatMsg = String.format(Locale.US, "%1$s: %2$s", Area.LOGGING.name(), msg);
            switch (level) {
                case 2:
                    if (t != null) {
                        Log.v(_TAG, logCatMsg, t);
                        return;
                    } else {
                        Log.v(_TAG, logCatMsg);
                        return;
                    }
                case 3:
                    if (t == null) {
                        Log.d(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.d(_TAG, logCatMsg, t);
                        return;
                    }
                case 4:
                    if (t == null) {
                        Log.i(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.i(_TAG, logCatMsg, t);
                        return;
                    }
                case 5:
                    if (t == null) {
                        Log.w(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.w(_TAG, logCatMsg, t);
                        return;
                    }
                case 6:
                    if (t == null) {
                        Log.e(_TAG, logCatMsg);
                        return;
                    } else {
                        Log.e(_TAG, logCatMsg, t);
                        return;
                    }
                default:
                    throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level [level:%1$d]", Integer.valueOf(level)));
            }
        }
    }

    private static void validateLevel(int level) {
        if (level != 7 && level != 3 && level != 6 && level != 4 && level != 2 && level != 5) {
            throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level: %1$d", Integer.valueOf(level)));
        }
    }

    private static long parseAreas(String areasString) {
        if (StringUtility.isNullOrEmpty(areasString)) {
            throw new IllegalArgumentException("'areasString' cannot be NULL or empty");
        }
        long areaBitmask = 0;
        String[] arr$ = areasString.split("\\|");
        for (String areaStr : arr$) {
            if (!StringUtility.isNullOrEmpty(areaStr)) {
                areaBitmask |= Area.valueOf(areaStr).value();
            }
        }
        if (areaBitmask != 0) {
            return areaBitmask;
        }
        throw new IllegalStateException("parseAreas() failed to parse any recognized area values");
    }

    private static int getLogLevelFromString(String logLevel) {
        if (StringUtility.isNullOrEmpty(logLevel)) {
            throw new IllegalArgumentException("'logLevelString' cannot be NULL or empty");
        }
        if (logLevel.equalsIgnoreCase("ASSERT")) {
            return 7;
        }
        if (logLevel.equalsIgnoreCase("DEBUG")) {
            return 3;
        }
        if (logLevel.equalsIgnoreCase("ERROR")) {
            return 6;
        }
        if (logLevel.equalsIgnoreCase("INFO")) {
            return 4;
        }
        if (logLevel.equalsIgnoreCase("VERBOSE")) {
            return 2;
        }
        if (!logLevel.equalsIgnoreCase("WARN")) {
            throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level [%1$s]", logLevel));
        }
        return 5;
    }
}
