package com.getjar.sdk.data.usage;

import android.database.Cursor;

public class ReportingWindow {
    private final long _id;
    private final long _timestampStart;
    private final long _timestampStop;

    protected ReportingWindow(Cursor cursor) {
        this._id = cursor.getLong(0);
        this._timestampStart = cursor.getLong(1);
        this._timestampStop = cursor.getLong(2);
    }

    public long getId() {
        return this._id;
    }

    public long getTimestampStart() {
        return this._timestampStart;
    }

    public long getTimestampStop() {
        return this._timestampStop;
    }
}
