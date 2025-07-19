package com.getjar.sdk.data;

import com.getjar.sdk.utilities.StringUtility;
import java.util.Map;

public class ReportUsageData {
    private final int _appFlags;
    private final Map<String, String> _appMetadata;
    private final long _eventTimestamp;
    private final String _packageName;
    private final Map<String, String> _trackingMetadata;
    private final UsageType _usageType;

    public enum UsageType {
        UNKNOWN,
        DOWNLOADED,
        INSTALLED,
        UNINSTALLED,
        USED,
        FOUND_INSTALLED,
        FOUND_UNINSTALLED,
        PHONE_SESSION_STARTED,
        PHONE_SESSION_ENDED,
        APP_SESSION_STARTED,
        APP_SESSION_ENDED,
        FIRST_OPENED
    }

    public String getPackageName() {
        return this._packageName;
    }

    public long getEventTimestamp() {
        return this._eventTimestamp;
    }

    public UsageType getUsageType() {
        return this._usageType;
    }

    public Map<String, String> getAppMetadata() {
        return this._appMetadata;
    }

    public Map<String, String> getTrackingMetadata() {
        return this._trackingMetadata;
    }

    public int getAppFlags() {
        return this._appFlags;
    }

    public ReportUsageData(UsageType type, Map<String, String> trackingMetadata, Map<String, String> appMetadata, int appFlags) {
        validateConstructorParameters(type, trackingMetadata, appMetadata, appFlags);
        this._packageName = null;
        this._usageType = type;
        this._trackingMetadata = trackingMetadata;
        this._appMetadata = appMetadata;
        this._appFlags = appFlags;
        this._eventTimestamp = System.currentTimeMillis();
    }

    public ReportUsageData(String packageName, UsageType type, Map<String, String> trackingMetadata, Map<String, String> appMetadata, int appFlags) {
        validateConstructorParameters(type, trackingMetadata, appMetadata, appFlags);
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        this._packageName = packageName;
        this._usageType = type;
        this._trackingMetadata = trackingMetadata;
        this._appMetadata = appMetadata;
        this._appFlags = appFlags;
        this._eventTimestamp = System.currentTimeMillis();
    }

    private void validateConstructorParameters(UsageType type, Map<String, String> trackingMetadata, Map<String, String> appMetadata, int appFlags) {
        if (type == null) {
            throw new IllegalArgumentException("'type' cannot be NULL");
        } else if (trackingMetadata == null || trackingMetadata.size() <= 0) {
            throw new IllegalArgumentException("'trackingMetadata' cannot be NULL or empty");
        } else if (appMetadata == null || appMetadata.size() <= 0) {
            throw new IllegalArgumentException("'appMetadata' cannot be NULL or empty");
        }
    }
}
