package com.getjar.sdk.data.install_state;

import android.database.Cursor;
import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.data.install_state.InstallStateManager;
import com.getjar.sdk.utilities.StringUtility;

class InstallStateRecord extends DatabaseRecordBase {
    private final long _id;
    private final String _packageName;
    private final InstallStateManager.InstallState _status;
    private final boolean _synced;
    private final long _timestamp;

    protected static InstallStateRecord loadFromDB(Cursor cursor) {
        boolean z = true;
        long j = cursor.getLong(0);
        String string = cursor.getString(1);
        long j2 = cursor.getLong(2);
        InstallStateManager.InstallState valueOf = InstallStateManager.InstallState.valueOf(cursor.getString(3));
        if (cursor.getLong(4) != 1) {
            z = false;
        }
        return new InstallStateRecord(j, string, j2, valueOf, z);
    }

    private InstallStateRecord(long id, String packageName, long timestamp, InstallStateManager.InstallState status, boolean synced) {
        if (id < 0) {
            throw new IllegalArgumentException("'id' cannot be negative");
        } else if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (timestamp < 0) {
            throw new IllegalArgumentException("'timestamp' cannot be negative");
        } else if (status == null) {
            throw new IllegalArgumentException("'status' cannot be NULL");
        } else {
            this._id = id;
            this._packageName = packageName;
            this._timestamp = timestamp;
            this._status = status;
            this._synced = synced;
        }
    }

    public long getId() {
        return this._id;
    }

    /* access modifiers changed from: protected */
    public String getPackageName() {
        return this._packageName;
    }

    /* access modifiers changed from: protected */
    public long getTimestamp() {
        return this._timestamp;
    }

    /* access modifiers changed from: protected */
    public InstallStateManager.InstallState getStatus() {
        return this._status;
    }

    /* access modifiers changed from: protected */
    public boolean isSynced() {
        return this._synced;
    }

    public String toString() {
        return "InstallStateRecord [" + "id:" + this._id + " packageName:" + this._packageName + " timestamp:" + this._timestamp + " status:" + this._status.name() + " synced:" + this._synced + "]";
    }
}
