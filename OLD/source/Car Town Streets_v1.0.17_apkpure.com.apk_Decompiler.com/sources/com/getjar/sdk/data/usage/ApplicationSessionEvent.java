package com.getjar.sdk.data.usage;

import android.database.Cursor;
import com.getjar.sdk.data.usage.SessionEvent;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
import java.util.UUID;

public class ApplicationSessionEvent extends SessionEvent {
    private final String _packageName;
    private final String _phoneSessionId;

    public ApplicationSessionEvent(long id, String packageName, long timestamp, SessionEvent.Type type, SessionEvent.Reason reason, String reasonDetails, String sessionId, String phoneSessionId, boolean synced, boolean disposable) {
        super(id, timestamp, type, reason, reasonDetails, sessionId, synced, disposable);
        if (StringUtility.isNullOrEmpty(packageName)) {
            throw new IllegalArgumentException("'packageName' cannot be NULL or empty");
        } else if (StringUtility.isNullOrEmpty(phoneSessionId)) {
            throw new IllegalArgumentException("'phoneSessionId' cannot be NULL or empty");
        } else {
            UUID.fromString(phoneSessionId);
            this._packageName = packageName;
            this._phoneSessionId = phoneSessionId;
        }
    }

    public String getPackageName() {
        return this._packageName;
    }

    public String getPhoneSessionId() {
        return this._phoneSessionId;
    }

    protected static ApplicationSessionEvent loadFromDB(Cursor cursor) {
        if (cursor == null) {
            throw new IllegalArgumentException("'cursor' cannot be NULL");
        }
        return new ApplicationSessionEvent(cursor.getLong(0), cursor.getString(1), cursor.getLong(2), SessionEvent.Type.valueOf(cursor.getString(3)), SessionEvent.Reason.valueOf(cursor.getString(4)), cursor.getString(5), cursor.getString(6), cursor.getString(7), cursor.getLong(8) == 1, cursor.getLong(9) == 1);
    }

    public String toString() {
        return String.format(Locale.US, "id:%1$d packageName:%2$s timestamp:%3$d type:%4$s reason:%5$s reasonDetails:%6$s sessionId:%7$s phoneSessionId:%8$s synced:%9$s disposable:%10$s", new Object[]{Long.valueOf(getId()), getPackageName(), Long.valueOf(getTimestamp()), getType().name(), getReason().name(), getReasonDetails(), getSessionId(), getPhoneSessionId(), Boolean.valueOf(isSynced()), Boolean.valueOf(isDisposable())});
    }
}
