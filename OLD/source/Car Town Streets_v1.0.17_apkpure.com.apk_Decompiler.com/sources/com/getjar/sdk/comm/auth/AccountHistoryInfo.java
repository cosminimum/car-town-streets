package com.getjar.sdk.comm.auth;

import android.database.Cursor;

public class AccountHistoryInfo {
    private final String _accountName;
    private final int _id;
    private final String _providerFilter;
    private final int _timestampCreated;
    private final int _timestampLastAuth;
    private final String _userAccessId;
    private final String _userDeviceId;

    public AccountHistoryInfo(Cursor dbCursor) {
        if (dbCursor == null) {
            throw new IllegalArgumentException("'dbCursor' can not be NULL");
        }
        this._id = dbCursor.getInt(0);
        this._userAccessId = dbCursor.getString(1);
        this._userDeviceId = dbCursor.getString(2);
        this._providerFilter = dbCursor.getString(3);
        this._accountName = dbCursor.getString(4);
        this._timestampLastAuth = dbCursor.getInt(5);
        this._timestampCreated = dbCursor.getInt(6);
    }

    public int getId() {
        return this._id;
    }

    public String getUserAccessId() {
        return this._userAccessId;
    }

    public String getUserDeviceId() {
        return this._userDeviceId;
    }

    public String getProviderFilter() {
        return this._providerFilter;
    }

    public String getAccountName() {
        return this._accountName;
    }

    public int getTimestampLastAuth() {
        return this._timestampLastAuth;
    }

    public int getTimestampCreated() {
        return this._timestampCreated;
    }
}
