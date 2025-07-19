package com.getjar.sdk.data.usage;

import android.content.Context;
import com.getjar.sdk.comm.GetJarConfig;
import com.getjar.sdk.data.ReportUsageData;
import com.getjar.sdk.data.usage.SessionEvent;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Pattern;

public class UsageManager {
    private static final int BACKGROUND_SEND_BATCH_COUNT = 50;
    private static final boolean BACKGROUND_SEND_ENABLED = false;
    private static final int BACKGROUND_SEND_INTERVAL_SECONDS = 7200;
    private static Comparator<AggregateUsageRecord> ComparatorPackageName = new Comparator<AggregateUsageRecord>() {
        public int compare(AggregateUsageRecord lhs, AggregateUsageRecord rhs) {
            return rhs.getPackageName().compareTo(lhs.getPackageName());
        }
    };
    private static Comparator<AggregateUsageRecord> ComparatorTimestampStart = new Comparator<AggregateUsageRecord>() {
        public int compare(AggregateUsageRecord lhs, AggregateUsageRecord rhs) {
            return (int) (rhs.getTimestampStart() - lhs.getTimestampStart());
        }
    };
    private static Comparator<AggregateUsageRecord> ComparatorTimestampStop = new Comparator<AggregateUsageRecord>() {
        public int compare(AggregateUsageRecord lhs, AggregateUsageRecord rhs) {
            return (int) (rhs.getTimestampStop() - lhs.getTimestampStop());
        }
    };
    private static Comparator<AggregateUsageRecord> ComparatorTotalSessionsCount = new Comparator<AggregateUsageRecord>() {
        public int compare(AggregateUsageRecord lhs, AggregateUsageRecord rhs) {
            return rhs.getTotalSessionsCount() - lhs.getTotalSessionsCount();
        }
    };
    private static Comparator<AggregateUsageRecord> ComparatorTotalUseDuration = new Comparator<AggregateUsageRecord>() {
        public int compare(AggregateUsageRecord lhs, AggregateUsageRecord rhs) {
            return rhs.getTotalUseDuration() - lhs.getTotalUseDuration();
        }
    };
    private static final int REQUEST_MAX_COUNT = 10;
    private static final int REQUEST_TIME_WINDOW_COUNT = 7;
    private static final int REQUEST_TIME_WINDOW_SECONDS = 86400;
    private static final boolean USAGE_FILTER_SYSTEM_ENABLED = true;
    private static final boolean USAGE_MONITORING_ENABLED = true;
    private static final boolean USAGE_REQUEST_SEND_ENABLED = false;
    private static volatile UsageManager _Instance = null;
    private static Object typeFilterLock = new Object();
    private final Context _context;
    private String _regExCache = null;
    private Pattern _regExPatternCache = null;
    private volatile String _typeFilterCache = null;
    private volatile HashSet<ReportUsageData.UsageType> _typeFilterSetCache = new HashSet<>();

    private UsageManager(Context context) {
        this._context = context.getApplicationContext();
    }

    public static synchronized UsageManager getInstance(Context context) {
        UsageManager usageManager;
        synchronized (UsageManager.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' cannot be NULL");
            }
            if (_Instance == null) {
                _Instance = new UsageManager(context);
            }
            usageManager = _Instance;
        }
        return usageManager;
    }

    public boolean isMonitoringEnabled() {
        Boolean value = GetJarConfig.getInstance(this._context).getBooleanValue(GetJarConfig.KEY_USAGE_MONITORING_ENABLED, true);
        if (value == null) {
            value = true;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager isMonitoringEnabled: %1$s", new Object[]{value.toString()}));
        return value.booleanValue();
    }

    public boolean isBackgroundSendEnabled() {
        return getBackgroundSendEnabled() && isMonitoringEnabled();
    }

    public boolean isRequestSendEnabled() {
        return getRequestSendEnabled() && isMonitoringEnabled();
    }

    private boolean getBackgroundSendEnabled() {
        Boolean value = GetJarConfig.getInstance(this._context).getBooleanValue(GetJarConfig.KEY_USAGE_BACKGROUND_SEND_ENABLED, false);
        if (value == null) {
            value = false;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getBackgroundSendEnabled: %1$s", new Object[]{value.toString()}));
        return value.booleanValue();
    }

    private boolean getRequestSendEnabled() {
        Boolean value = GetJarConfig.getInstance(this._context).getBooleanValue(GetJarConfig.KEY_USAGE_REQUEST_SEND_ENABLED, false);
        if (value == null) {
            value = false;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getRequestSendEnabled: %1$s", new Object[]{value.toString()}));
        return value.booleanValue();
    }

    private Pattern getPackagePattern() {
        String newRegEx = getFilterRegex();
        if (StringUtility.isNullOrEmpty(newRegEx)) {
            this._regExPatternCache = null;
        } else if (!newRegEx.equals(this._regExCache)) {
            try {
                this._regExPatternCache = Pattern.compile(newRegEx);
            } catch (Exception e) {
                Logger.w(Area.USAGE.value() | Area.CONFIG.value(), String.format(Locale.US, "UsageManager: getPackagePattern() Bad regex pattern [%1$s]", new Object[]{getFilterRegex()}));
            }
        }
        this._regExCache = newRegEx;
        return this._regExPatternCache;
    }

    public int getBackgroundBatchCount() {
        Integer value = GetJarConfig.getInstance(this._context).getIntegerValue(GetJarConfig.KEY_USAGE_BACKGROUND_SEND_BATCH_COUNT, 50);
        if (value == null) {
            value = 50;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getBackgroundBatchCount: %1$s", new Object[]{value.toString()}));
        return value.intValue();
    }

    private String getFilterRegex() {
        String value = GetJarConfig.getInstance(this._context).getDirectiveValue(GetJarConfig.KEY_USAGE_PACKAGE_FILTER_REGEX, (String) null);
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getFilterRegex: %1$s", new Object[]{value}));
        return value;
    }

    private String getBackgroundTypeFilter() {
        String value = GetJarConfig.getInstance(this._context).getDirectiveValue(GetJarConfig.KEY_USAGE_BACKGROUND_TYPE_FILTER, (String) null);
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getBackgroundTypeFilter: %1$s", new Object[]{value}));
        return value;
    }

    private boolean isFilterSystemEnabled() {
        Boolean value = GetJarConfig.getInstance(this._context).getBooleanValue(GetJarConfig.KEY_USAGE_PACKAGE_FILTER_SYSTEM, true);
        if (value == null) {
            value = true;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager isFilterSystemEnabled: %1$s", new Object[]{value.toString()}));
        return value.booleanValue();
    }

    public int getBackgroundSendIntervalMilliseconds() {
        Integer value = GetJarConfig.getInstance(this._context).getIntegerValue(GetJarConfig.KEY_USAGE_BACKGROUND_SEND_INTERVAL, Integer.valueOf(BACKGROUND_SEND_INTERVAL_SECONDS));
        if (value == null) {
            value = Integer.valueOf(BACKGROUND_SEND_INTERVAL_SECONDS);
        }
        Integer value2 = Integer.valueOf(value.intValue() * 1000);
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getBackgroundSendIntervalMilliseconds: %1$s", new Object[]{value2.toString()}));
        return value2.intValue();
    }

    public int getRequestTimeWindowMilliseconds() {
        Integer value = GetJarConfig.getInstance(this._context).getIntegerValue(GetJarConfig.KEY_USAGE_REQUEST_TIME_WINDOW, Integer.valueOf(REQUEST_TIME_WINDOW_SECONDS));
        if (value == null) {
            value = Integer.valueOf(REQUEST_TIME_WINDOW_SECONDS);
        }
        Integer value2 = Integer.valueOf(value.intValue() * 1000);
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getRequestTimeWindowMilliseconds: %1$s", new Object[]{value2.toString()}));
        return value2.intValue();
    }

    public int getRequestTimeWindowCount() {
        Integer value = GetJarConfig.getInstance(this._context).getIntegerValue(GetJarConfig.KEY_USAGE_REQUEST_TIME_WINDOW_COUNT, 7);
        if (value == null) {
            value = 7;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getRequestTimeWindowCount: %1$s", new Object[]{value.toString()}));
        return value.intValue();
    }

    private int getRequestMaxCount() {
        Integer value = GetJarConfig.getInstance(this._context).getIntegerValue(GetJarConfig.KEY_USAGE_REQUEST_SEND_MAX_COUNT, 10);
        if (value == null) {
            value = 10;
        }
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getRequestMaxCount: %1$s", new Object[]{value.toString()}));
        return value.intValue();
    }

    private String getRequestSort() {
        String value = GetJarConfig.getInstance(this._context).getDirectiveValue(GetJarConfig.KEY_USAGE_REQUEST_SEND_SORT, "duration");
        Logger.d(Area.USAGE.value() | Area.CONFIG.value(), String.format("UsageManager getRequestSort: %1$s", new Object[]{value}));
        return value;
    }

    public long startAppSession(String packageName, SessionEvent.Reason reason, String reasonDetails, String phoneSessionId, String appSessionId) {
        if (!isMonitoringEnabled()) {
            return -1;
        }
        long eventTimestamp = System.currentTimeMillis();
        try {
            UsageRollupDatabase.getInstance(this._context).collectAppSessionEvent(SessionEvent.Type.start, eventTimestamp, packageName, (Long) null);
        } catch (Exception e) {
            Logger.e(Area.USAGE.value(), "UsageManager: startAppSession() collectAppSessionEvent() failed", e);
            if (StringUtility.isNullOrEmpty(reasonDetails)) {
                reasonDetails = Logger.getThrowableDump(e);
            } else {
                reasonDetails = reasonDetails + " | " + Logger.getThrowableDump(e);
            }
        }
        return UsageDatabase.getInstance(this._context).appSessionStart(packageName, reason, reasonDetails, eventTimestamp, phoneSessionId, appSessionId);
    }

    public long stopAppSession(ApplicationSessionEvent startEvent, SessionEvent.Reason reason, String reasonDetails) {
        if (!isMonitoringEnabled()) {
            return -1;
        }
        long eventTimestamp = System.currentTimeMillis();
        try {
            UsageRollupDatabase.getInstance(this._context).collectAppSessionEvent(SessionEvent.Type.stop, eventTimestamp, startEvent.getPackageName(), Long.valueOf(startEvent.getTimestamp()));
        } catch (Exception e) {
            Logger.e(Area.USAGE.value(), "UsageManager: stopAppSession() collectAppSessionEvent() failed", e);
            if (StringUtility.isNullOrEmpty(reasonDetails)) {
                reasonDetails = Logger.getThrowableDump(e);
            } else {
                reasonDetails = reasonDetails + " | " + Logger.getThrowableDump(e);
            }
        }
        return UsageDatabase.getInstance(this._context).appSessionStop(startEvent.getPackageName(), reason, reasonDetails, eventTimestamp, startEvent.getPhoneSessionId(), startEvent.getSessionId());
    }

    public void startPhoneSession() {
        UsageMonitor.getInstance(this._context).startMonitoring();
    }

    public void stopPhoneSession() {
        UsageMonitor.getInstance(this._context).stopMonitoring();
    }

    public AggregateUsageReport getAggregateSessionsForReporting() {
        UsageRollupDatabase.getInstance(this._context).purgeObsoleteAggregationData();
        if (!isRequestSendEnabled()) {
            return null;
        }
        List<AggregateUsageRecord> sourceList = getCollapsedSortedAggregateSessions();
        List<AggregateUsageRecord> returnList = new ArrayList<>();
        for (AggregateUsageRecord sourceSession : sourceList) {
            if (!shouldFilterFromUsage(sourceSession.getPackageName())) {
                returnList.add(sourceSession);
                if (returnList.size() >= getRequestMaxCount()) {
                    break;
                }
            }
        }
        long[] minMax = UsageRollupDatabase.getInstance(this._context).getTotalReportingWindow();
        return new AggregateUsageReport(minMax[0], minMax[1], returnList);
    }

    public boolean shouldFilterFromUsage(String packageName) {
        Pattern filterPattern = getPackagePattern();
        if (filterPattern != null && filterPattern.matcher(packageName).matches()) {
            return true;
        }
        if (isFilterSystemEnabled()) {
            try {
                if ((((long) this._context.getPackageManager().getPackageInfo(packageName, 128).applicationInfo.flags) & 1) == 1) {
                    return true;
                }
            } catch (Exception e) {
                Logger.w(Area.USAGE.value(), String.format(Locale.US, "UsageManager: Failed to get app flags [packageName:'%1$s' error:'%2$s']", new Object[]{packageName, e.getClass().getName()}));
            }
        }
        return false;
    }

    public boolean shouldFilterTypeFromUsage(ReportUsageData.UsageType usageType) {
        if (usageType == null) {
            throw new IllegalArgumentException("'usageType' cannot be null");
        }
        synchronized (typeFilterLock) {
            String typeFilterCache = this._typeFilterCache;
            String typeFilter = getBackgroundTypeFilter();
            if (typeFilterCache == null || !typeFilterCache.equals(typeFilter)) {
                HashSet<ReportUsageData.UsageType> typeFilterSetCache = new HashSet<>();
                if (typeFilter != null) {
                    for (String type : typeFilter.trim().split("\\|")) {
                        if (type != null) {
                            try {
                                typeFilterSetCache.add(ReportUsageData.UsageType.valueOf(type.trim()));
                            } catch (IllegalArgumentException e) {
                                Logger.w(Area.USAGE.value(), String.format("Illegal value [%s] for usage type filter", new Object[]{type}), e);
                                typeFilterSetCache.addAll(Arrays.asList(ReportUsageData.UsageType.values()));
                            }
                        }
                    }
                }
                this._typeFilterSetCache = typeFilterSetCache;
                this._typeFilterCache = typeFilter;
            }
        }
        boolean result = false;
        if (this._typeFilterSetCache.contains(usageType)) {
            result = true;
        }
        Logger.d(Area.USAGE.value(), String.format(Locale.US, "UsageManager shouldFilterTypeFromUsage returning %s for %s", new Object[]{Boolean.toString(result), usageType.name()}));
        return result;
    }

    /* access modifiers changed from: protected */
    public void closeAllOpenAppSessions(SessionEvent.Reason reason, String reasonDetails, long eventTime) {
        UsageDatabase usageDB = UsageDatabase.getInstance(this._context);
        List<ApplicationSessionEvent> openSessions = usageDB.appSessionLoadOpenStarts();
        if (openSessions.size() > 0) {
            Logger.v(Area.USAGE.value(), String.format(Locale.US, "UsageManager: stopPhoneSession() Closing %1$d open app session(s)", new Object[]{Integer.valueOf(openSessions.size())}));
            for (ApplicationSessionEvent appEvent : openSessions) {
                try {
                    UsageRollupDatabase.getInstance(this._context).collectAppSessionEvent(SessionEvent.Type.stop, eventTime, appEvent.getPackageName(), Long.valueOf(appEvent.getTimestamp()));
                } catch (Exception e) {
                    Logger.e(Area.USAGE.value(), "UsageManager: closeAllOpenAppSessions() collectAppSessionEvent() failed", e);
                    if (StringUtility.isNullOrEmpty(reasonDetails)) {
                        reasonDetails = Logger.getThrowableDump(e);
                    } else {
                        reasonDetails = reasonDetails + " | " + Logger.getThrowableDump(e);
                    }
                }
                usageDB.appSessionStop(appEvent, reason, reasonDetails, eventTime);
            }
        }
    }

    private List<AggregateUsageRecord> getCollapsedSortedAggregateSessions() {
        Comparator<AggregateUsageRecord> comparatorToUse;
        List<AggregateSession> sourceList = UsageRollupDatabase.getInstance(this._context).loadAggregateSessions();
        Map<String, AggregateUsageRecord> collapsedRecords = new HashMap<>();
        for (AggregateSession session : sourceList) {
            if (!collapsedRecords.containsKey(session.getPackageName())) {
                collapsedRecords.put(session.getPackageName(), new AggregateUsageRecord(session.getPackageName(), session.getTimestampStart(), session.getTimestampStop(), session.getTotalUseDuration(), session.getTotalSessionsCount()));
            } else {
                AggregateUsageRecord record = collapsedRecords.get(session.getPackageName());
                record.setTimestampStart(Math.min(record.getTimestampStart(), session.getTimestampStart()));
                record.setTimestampStop(Math.max(record.getTimestampStop(), session.getTimestampStop()));
                record.setTotalUseDuration(record.getTotalUseDuration() + session.getTotalUseDuration());
                record.setTotalSessionsCount(record.getTotalSessionsCount() + session.getTotalSessionsCount());
            }
        }
        String requestSort = getRequestSort();
        if (Constants.META_PACKAGE_NAME.equals(requestSort)) {
            comparatorToUse = ComparatorPackageName;
        } else if ("start_timestamp".equals(requestSort)) {
            comparatorToUse = ComparatorTimestampStart;
        } else if ("stop_timestamp".equals(requestSort)) {
            comparatorToUse = ComparatorTimestampStop;
        } else if ("duration".equals(requestSort)) {
            comparatorToUse = ComparatorTotalUseDuration;
        } else if ("sessions".equals(requestSort)) {
            comparatorToUse = ComparatorTotalSessionsCount;
        } else {
            Logger.e(Area.USAGE.value(), String.format(Locale.US, "UsageManager: Unrecognized sort column '%1$s'", new Object[]{requestSort}));
            comparatorToUse = ComparatorTotalUseDuration;
        }
        List<AggregateUsageRecord> resultList = new ArrayList<>(collapsedRecords.values());
        Collections.sort(resultList, comparatorToUse);
        return resultList;
    }
}
