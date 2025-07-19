package com.google.tagmanager;

import android.content.Context;
import com.google.analytics.tracking.android.GoogleAnalytics;
import com.google.analytics.tracking.android.Logger;
import com.google.analytics.tracking.android.Tracker;
import com.google.android.gms.common.util.VisibleForTesting;
import com.google.tagmanager.Logger;
/* loaded from: classes.dex */
class TrackerProvider {
    private Context mContext;
    private GoogleAnalytics mGoogleAnalytics;

    /* JADX INFO: Access modifiers changed from: package-private */
    public TrackerProvider(Context context) {
        this.mContext = context;
    }

    @VisibleForTesting
    TrackerProvider(GoogleAnalytics ga) {
        this.mGoogleAnalytics = ga;
        this.mGoogleAnalytics.setLogger(new LoggerImpl());
    }

    public Tracker getTracker(String trackingId) {
        initTrackProviderIfNecessary();
        return this.mGoogleAnalytics.getTracker(trackingId);
    }

    public void close(Tracker tracker) {
        this.mGoogleAnalytics.closeTracker(tracker.getName());
    }

    private synchronized void initTrackProviderIfNecessary() {
        if (this.mGoogleAnalytics == null) {
            this.mGoogleAnalytics = GoogleAnalytics.getInstance(this.mContext);
            this.mGoogleAnalytics.setLogger(new LoggerImpl());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class LoggerImpl implements com.google.analytics.tracking.android.Logger {
        LoggerImpl() {
        }

        @Override // com.google.analytics.tracking.android.Logger
        public void error(String message) {
            Log.e(message);
        }

        @Override // com.google.analytics.tracking.android.Logger
        public void error(Exception exception) {
            Log.e("", exception);
        }

        @Override // com.google.analytics.tracking.android.Logger
        public void info(String message) {
            Log.i(message);
        }

        @Override // com.google.analytics.tracking.android.Logger
        public void verbose(String message) {
            Log.v(message);
        }

        @Override // com.google.analytics.tracking.android.Logger
        public void warn(String message) {
            Log.w(message);
        }

        @Override // com.google.analytics.tracking.android.Logger
        public Logger.LogLevel getLogLevel() {
            Logger.LogLevel logLevel = Log.getLogLevel();
            return logLevel == null ? Logger.LogLevel.ERROR : toAnalyticsLogLevel(logLevel);
        }

        @Override // com.google.analytics.tracking.android.Logger
        public void setLogLevel(Logger.LogLevel logLevel) {
            Log.w("GA uses GTM logger. Please use TagManager.getLogger().setLogLevel(LogLevel) instead.");
        }

        private static Logger.LogLevel toAnalyticsLogLevel(Logger.LogLevel logLevel) {
            switch (logLevel) {
                case NONE:
                case ERROR:
                    return Logger.LogLevel.ERROR;
                case WARNING:
                    return Logger.LogLevel.WARNING;
                case INFO:
                case DEBUG:
                    return Logger.LogLevel.INFO;
                case VERBOSE:
                    return Logger.LogLevel.VERBOSE;
                default:
                    return Logger.LogLevel.ERROR;
            }
        }
    }
}
