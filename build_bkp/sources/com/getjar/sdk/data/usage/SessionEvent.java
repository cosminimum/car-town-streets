package com.getjar.sdk.data.usage;

import com.getjar.sdk.data.DatabaseRecordBase;
import com.getjar.sdk.utilities.StringUtility;
import java.util.UUID;

public abstract class SessionEvent extends DatabaseRecordBase {
    private final boolean _disposable;
    private final long _id;
    private final Reason _reason;
    private final String _reasonDetails;
    private final String _sessionId;
    private final boolean _synced;
    private final long _timestamp;
    private final Type _type;

    public enum Reason {
        THREAD_START,
        THREAD_APP_DETECTION,
        THREAD_EXIT,
        THREAD_EXCEPTION,
        TESTING
    }

    public enum Type {
        start,
        stop
    }

    public SessionEvent(long id, long timestamp, Type type, Reason reason, String reasonDetails, String sessionId, boolean synced, boolean disposable) {
        if (id < 0) {
            throw new IllegalArgumentException("'id' cannot be less than zero");
        } else if (timestamp < 0) {
            throw new IllegalArgumentException("'timestamp' cannot be less than zero");
        } else if (type == null) {
            throw new IllegalArgumentException("'type' cannot be NULL");
        } else if (reason == null) {
            throw new IllegalArgumentException("'reason' cannot be NULL");
        } else if (StringUtility.isNullOrEmpty(sessionId)) {
            throw new IllegalArgumentException("'sessionId' cannot be NULL or empty");
        } else {
            UUID.fromString(sessionId);
            this._id = id;
            this._timestamp = timestamp;
            this._type = type;
            this._reason = reason;
            this._reasonDetails = reasonDetails;
            this._sessionId = sessionId;
            this._synced = synced;
            this._disposable = disposable;
        }
    }

    public long getId() {
        return this._id;
    }

    public long getTimestamp() {
        return this._timestamp;
    }

    public Type getType() {
        return this._type;
    }

    public String getSessionId() {
        return this._sessionId;
    }

    public Reason getReason() {
        return this._reason;
    }

    public String getReasonDetails() {
        return this._reasonDetails;
    }

    public boolean isSynced() {
        return this._synced;
    }

    public boolean isDisposable() {
        return this._disposable;
    }
}
