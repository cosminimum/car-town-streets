package com.getjar.sdk.data.usage;

import java.util.Locale;
/* loaded from: classes.dex */
public class AggregateUsageRecord {
    private final String _packageName;
    private long _timestampStart;
    private long _timestampStop;
    private int _totalSessionsCount;
    private int _totalUseDuration;

    /* JADX INFO: Access modifiers changed from: protected */
    public AggregateUsageRecord(String packageName, long timestampStart, long timestampStop, int totalUseDuration, int totalSessionsCount) {
        this._packageName = packageName;
        this._timestampStart = timestampStart;
        this._timestampStop = timestampStop;
        this._totalUseDuration = totalUseDuration;
        this._totalSessionsCount = totalSessionsCount;
    }

    public String getPackageName() {
        return this._packageName;
    }

    public long getTimestampStart() {
        return this._timestampStart;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTimestampStart(long timestampStart) {
        if (timestampStart < 0) {
            throw new IllegalArgumentException("'timestampStart' cannot be negative");
        }
        this._timestampStart = timestampStart;
    }

    public long getTimestampStop() {
        return this._timestampStop;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTimestampStop(long timestampStop) {
        if (timestampStop < 0) {
            throw new IllegalArgumentException("'timestampStop' cannot be negative");
        }
        this._timestampStop = timestampStop;
    }

    public int getTotalUseDuration() {
        return this._totalUseDuration;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTotalUseDuration(int totalUseDuration) {
        if (totalUseDuration < 0) {
            throw new IllegalArgumentException("'totalUseDuration' cannot be negative");
        }
        this._totalUseDuration = totalUseDuration;
    }

    public int getTotalSessionsCount() {
        return this._totalSessionsCount;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setTotalSessionsCount(int totalSessionsCount) {
        if (totalSessionsCount < 0) {
            throw new IllegalArgumentException("'totalSessionsCount' cannot be negative");
        }
        this._totalSessionsCount = totalSessionsCount;
    }

    public String toString() {
        return String.format(Locale.US, "[packageName:%1$s sessions:%2$d duration:%3$d start:%4$d stop:%5$d]", this._packageName, Integer.valueOf(this._totalSessionsCount), Integer.valueOf(this._totalUseDuration), Long.valueOf(this._timestampStart), Long.valueOf(this._timestampStop));
    }
}
