package com.getjar.sdk.data.earning;

import android.database.Cursor;
import com.getjar.sdk.data.earning.EarnStateDatabase;
import com.getjar.sdk.utilities.StringUtility;

public class EarnStateRecord {
    private final String _applicationMetadata;
    private final String _clientTransactionId;
    private final Long _earnAmount;
    private final EarnStateDatabase.EarnState _earnState;
    private final String _earnSubstate;
    private final String _friendlyName;
    private final long _id;
    private final EarnStateDatabase.NotificationState _notificationState;
    private final String _packageName;
    private final EarnStateDatabase.Status _status;
    private final long _timestampCreated;
    private final long _timestampModified;
    private final String _trackingMetadata;

    public EarnStateRecord(Cursor cursor) {
        this._id = cursor.getLong(0);
        this._clientTransactionId = cursor.getString(1);
        this._packageName = cursor.getString(2);
        this._timestampCreated = cursor.getLong(3);
        this._timestampModified = cursor.getLong(4);
        this._friendlyName = cursor.getString(5);
        this._applicationMetadata = cursor.getString(6);
        this._trackingMetadata = cursor.getString(7);
        this._status = EarnStateDatabase.Status.valueOf(cursor.getString(8));
        String earnStateStr = cursor.getString(9);
        this._earnSubstate = cursor.getString(10);
        this._earnAmount = Long.valueOf(cursor.getLong(11));
        String notificationStateStr = cursor.getString(12);
        if (StringUtility.isNullOrEmpty(earnStateStr)) {
            this._earnState = null;
        } else {
            this._earnState = EarnStateDatabase.EarnState.valueOf(earnStateStr);
        }
        if (StringUtility.isNullOrEmpty(notificationStateStr)) {
            this._notificationState = EarnStateDatabase.NotificationState.NONE;
        } else {
            this._notificationState = EarnStateDatabase.NotificationState.valueOf(notificationStateStr);
        }
    }

    public long getId() {
        return this._id;
    }

    public String getClientTransactionId() {
        return this._clientTransactionId;
    }

    public String getPackageName() {
        return this._packageName;
    }

    public long getTimestampCreated() {
        return this._timestampCreated;
    }

    public long getTimestampModified() {
        return this._timestampModified;
    }

    public String getFriendlyName() {
        return this._friendlyName;
    }

    public String getApplicationMetadata() {
        return this._applicationMetadata;
    }

    public String getTrackingMetadata() {
        return this._trackingMetadata;
    }

    public EarnStateDatabase.Status getStatus() {
        return this._status;
    }

    public EarnStateDatabase.EarnState getEarnState() {
        return this._earnState;
    }

    public String getEarnSubstate() {
        return this._earnSubstate;
    }

    public Long getEarnAmount() {
        return this._earnAmount;
    }

    public EarnStateDatabase.NotificationState getNotificationState() {
        return this._notificationState;
    }

    public boolean canShowInstallReminder() {
        return EarnStateDatabase.NotificationState.NONE.equals(this._notificationState);
    }

    public boolean canShowOpenReminder() {
        if (EarnStateDatabase.NotificationState.NONE.equals(this._notificationState) || EarnStateDatabase.NotificationState.INSTALL_REMINDER.equals(this._notificationState)) {
            return true;
        }
        return false;
    }

    public String toString() {
        return "EarnStateRecord [" + "id:" + this._id + " clientTransactionId:" + this._clientTransactionId + " packageName:" + this._packageName + " timestampCreated:" + this._timestampCreated + " timestampModified:" + this._timestampModified + " friendlyName:" + this._friendlyName + " applicationMetadata:" + this._applicationMetadata + " trackingMetadata:" + this._trackingMetadata + " status:" + this._status + " earnState:" + this._earnState + " earnSubstate:" + this._earnSubstate + " earnAmount:" + this._earnAmount + " notificationState:" + this._notificationState + "]";
    }
}
