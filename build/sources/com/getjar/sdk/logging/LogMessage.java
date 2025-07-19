package com.getjar.sdk.logging;

import java.util.Locale;

public class LogMessage {
    private final long _areas;
    private final int _level;
    private final String _message;
    private final Throwable _throwable;
    private final long _timestamp;

    public LogMessage(int level, long areas, String message) {
        this(level, areas, message, (Throwable) null);
    }

    public LogMessage(int level, long areas, String message, Throwable throwable) {
        if (level != 7 && level != 3 && level != 6 && level != 4 && level != 2 && level != 5) {
            throw new IllegalArgumentException(String.format(Locale.US, "Unsupported log level: %1$d", new Object[]{Integer.valueOf(level)}));
        } else if (areas <= 0) {
            throw new IllegalArgumentException("'area' cannot be less than or equal to 0");
        } else if (message == null) {
            throw new IllegalArgumentException("'message' cannot be NULL");
        } else {
            this._level = level;
            this._areas = areas;
            this._message = message;
            this._throwable = throwable;
            this._timestamp = System.currentTimeMillis();
        }
    }

    public int getLevel() {
        return this._level;
    }

    public long getAreas() {
        return this._areas;
    }

    public String getMessage() {
        return this._message;
    }

    public Throwable getThrowable() {
        return this._throwable;
    }

    public long getTimestamp() {
        return this._timestamp;
    }

    public String toString() {
        if (this._throwable == null) {
            return String.format(Locale.US, "%1$s:%2$s:%3$s", new Object[]{Logger.levelToName(getLevel()), Area.toString(getAreas()), getMessage()});
        }
        return String.format(Locale.US, "%1$s:%2$s:%3$s:%4$s", new Object[]{Logger.levelToName(getLevel()), Area.toString(getAreas()), getMessage(), Logger.getThrowableDump(this._throwable)});
    }
}
