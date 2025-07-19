package com.getjar.sdk.comm;

import android.content.Context;
import com.getjar.sdk.data.DBRequestStatistics;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import java.util.Locale;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class StatisticsTracker {
    private static ConcurrentHashMap<String, Integer> _SessionRequestCounts = new ConcurrentHashMap<>();
    private static long _Start = System.currentTimeMillis();

    public static void dumpAllStatsToLogCat(Context androidContext) {
        try {
            dumpSessionRatesToLogCat();
            Map<String, Float> stats = DBRequestStatistics.getInstance(androidContext).getAnalyticData();
            for (String name : stats.keySet()) {
                System.out.println(String.format(Locale.US, "STATS: %1$s = %2$f", new Object[]{name, stats.get(name)}));
            }
        } catch (Exception e) {
            Logger.m643e(Area.USAGE.value(), "StatisticsTracker: dumpAllStatsToLogCat() failed", e);
        }
    }

    private static void dumpSessionRatesToLogCat() {
        try {
            float deltaSeconds = ((float) (System.currentTimeMillis() - _Start)) / 1000.0f;
            for (String name : _SessionRequestCounts.keySet()) {
                int value = _SessionRequestCounts.get(name).intValue();
                Logger.m644i(Area.USAGE.value(), String.format(Locale.US, "STATS: %1$s has been called %2$d times in %3$f seconds (%4$f requests per second)", new Object[]{name, Integer.valueOf(value), Float.valueOf(deltaSeconds), Float.valueOf(((float) value) / deltaSeconds)}));
            }
        } catch (Exception e) {
            Logger.m643e(Area.USAGE.value(), "StatisticsTracker: dumpSessionRatesToLogCat() failed", e);
        }
    }

    public static void logRequest(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        }
        int count = 0;
        try {
            String srcKey = String.format(Locale.US, "%1$s:%2$s", new Object[]{operation.getRequest().getServiceName().name(), operation.getRequest().getRequestType()});
            if (_SessionRequestCounts.containsKey(srcKey)) {
                count = _SessionRequestCounts.get(srcKey).intValue();
            }
            _SessionRequestCounts.put(srcKey, Integer.valueOf(count + 1));
            DBRequestStatistics.getInstance(operation.getCommContext().getApplicationContext()).upsertRequestRecord(operation.getRequest());
        } catch (Exception e) {
            Logger.m643e(Area.USAGE.value(), "StatisticsTracker: logRequest() failed", e);
        }
    }

    public static void logResponse(Operation operation) {
        if (operation == null) {
            throw new IllegalArgumentException("'operation' can not be NULL");
        } else if (operation.getResult() == null) {
            throw new IllegalStateException("logResponse() can not be called with an operation that has no result");
        } else {
            try {
                DBRequestStatistics.getInstance(operation.getCommContext().getApplicationContext()).addResponseRecord(operation.getRequest(), operation.getResult());
            } catch (Exception e) {
                Logger.m643e(Area.USAGE.value(), "StatisticsTracker: logResponse() failed", e);
            }
        }
    }
}
