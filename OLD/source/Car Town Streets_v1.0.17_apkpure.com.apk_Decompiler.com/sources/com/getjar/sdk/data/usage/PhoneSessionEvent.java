package com.getjar.sdk.data.usage;

import android.database.Cursor;
import com.getjar.sdk.data.usage.SessionEvent;
import java.util.Locale;

public class PhoneSessionEvent extends SessionEvent {
    public PhoneSessionEvent(long id, long timestamp, SessionEvent.Type type, SessionEvent.Reason reason, String reasonDetails, String sessionId, boolean synced, boolean disposable) {
        super(id, timestamp, type, reason, reasonDetails, sessionId, synced, disposable);
    }

    protected static PhoneSessionEvent loadFromDB(Cursor cursor) {
        if (cursor == null) {
            throw new IllegalArgumentException("'cursor' cannot be NULL");
        }
        return new PhoneSessionEvent(cursor.getLong(0), cursor.getLong(1), SessionEvent.Type.valueOf(cursor.getString(2)), SessionEvent.Reason.valueOf(cursor.getString(3)), cursor.getString(4), cursor.getString(5), cursor.getLong(6) == 1, cursor.getLong(7) == 1);
    }

    public String toString() {
        return String.format(Locale.US, "id:%1$d timestamp:%2$d type:%3$s reason:%4$s reasonDetails:%5$s sessionId:%6$s synced:%7$s disposable:%8$s", new Object[]{Long.valueOf(getId()), Long.valueOf(getTimestamp()), getType().name(), getReason().name(), getReasonDetails(), getSessionId(), Boolean.valueOf(isSynced()), Boolean.valueOf(isDisposable())});
    }
}
