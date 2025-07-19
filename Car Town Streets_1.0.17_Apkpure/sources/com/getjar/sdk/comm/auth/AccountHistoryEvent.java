package com.getjar.sdk.comm.auth;

import android.database.Cursor;
/* loaded from: classes.dex */
public class AccountHistoryEvent {
    private final AccountEventType _eventType;
    private final int _id;
    private final int _timestamp;
    private final String _userAccessId;

    public AccountHistoryEvent(Cursor dbCursor) {
        if (dbCursor == null) {
            throw new IllegalArgumentException("'dbCursor' can not be NULL");
        }
        this._id = dbCursor.getInt(0);
        this._userAccessId = dbCursor.getString(1);
        this._eventType = AccountEventType.valueOf(dbCursor.getString(2));
        this._timestamp = dbCursor.getInt(3);
    }

    public int getId() {
        return this._id;
    }

    public String getUserAccessId() {
        return this._userAccessId;
    }

    public AccountEventType getEventType() {
        return this._eventType;
    }

    public int getTimestamp() {
        return this._timestamp;
    }
}
