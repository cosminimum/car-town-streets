package com.getjar.sdk.data.package_events;

import android.database.Cursor;
import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.data.package_events.PackageEventManager;
import com.getjar.sdk.utilities.StringUtility;
/* loaded from: classes.dex */
public class PackageEventRecord extends DatabaseRecordBase {
    private final PackageEventManager.EventType _eventType;
    private final long _id;
    private final String _packageName;
    private final boolean _synced;
    private final long _timestamp;

    /* JADX INFO: Access modifiers changed from: protected */
    public static PackageEventRecord loadFromDB(Cursor cursor) {
        boolean z = true;
        long j = cursor.getLong(0);
        String string = cursor.getString(1);
        long j2 = cursor.getLong(2);
        PackageEventManager.EventType valueOf = PackageEventManager.EventType.valueOf(cursor.getString(3));
        if (cursor.getLong(4) != 1) {
            z = false;
        }
        return new PackageEventRecord(j, string, j2, valueOf, z);
    }

    private PackageEventRecord(long id, String packageName, long timestamp, PackageEventManager.EventType eventType, boolean synced) {
        if (id < 0) {
            throw new IllegalArgumentException("'id' cannot be negative");
        }
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        }
        if (timestamp < 0) {
            throw new IllegalArgumentException("'timestamp' cannot be negative");
        }
        if (eventType == null) {
            throw new IllegalArgumentException("'eventType' cannot be NULL");
        }
        this._id = id;
        this._packageName = packageName;
        this._timestamp = timestamp;
        this._eventType = eventType;
        this._synced = synced;
    }

    @Override // com.getjar.sdk.data.DatabaseRecordBase
    public long getId() {
        return this._id;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getPackageName() {
        return this._packageName;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long getTimestamp() {
        return this._timestamp;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public PackageEventManager.EventType getEventType() {
        return this._eventType;
    }

    protected boolean isSynced() {
        return this._synced;
    }

    public String toString() {
        return "PackageEventRecord [id:" + this._id + " packageName:" + this._packageName + " timestamp:" + this._timestamp + " eventType:" + this._eventType.name() + " synced:" + this._synced + "]";
    }
}
