package com.getjar.sdk.data.usage;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
/* loaded from: classes.dex */
public class AggregateUsageReport {
    private final List<AggregateUsageRecord> _records;
    private final long _timestampStart;
    private final long _timestampStop;

    /* JADX INFO: Access modifiers changed from: protected */
    public AggregateUsageReport(long timestampStart, long timestampStop, List<AggregateUsageRecord> records) {
        this._timestampStart = timestampStart;
        this._timestampStop = timestampStop;
        this._records = Collections.unmodifiableList(new ArrayList(records));
    }

    public long getTimestampStart() {
        return this._timestampStart;
    }

    public long getTimestampStop() {
        return this._timestampStop;
    }

    public List<AggregateUsageRecord> getRecords() {
        return this._records;
    }
}
