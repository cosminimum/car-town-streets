package com.getjar.sdk.logging;

import android.content.Context;
import java.util.Collection;
import java.util.Collections;
import java.util.concurrent.ConcurrentLinkedQueue;

class BufferingAppender extends AppenderBase {
    private static volatile int _ApproximateBufferSize = 0;
    private static Object _ConfigurationLock = new Object();
    private static BufferingAppender _Instance = null;
    private static Object _InstanceLock = new Object();
    private static ConcurrentLinkedQueue<LogMessage> _LogBuffer = new ConcurrentLinkedQueue<>();
    private static final int _MaxBufferSize = 1024;

    private BufferingAppender() {
        super(false, 2, Area.ALL.value());
    }

    protected static BufferingAppender getInstance() {
        if (_Instance == null) {
            synchronized (_InstanceLock) {
                if (_Instance == null) {
                    _Instance = new BufferingAppender();
                }
            }
        }
        return _Instance;
    }

    public static Collection<LogMessage> getLogBuffer() {
        return Collections.unmodifiableCollection(_LogBuffer);
    }

    public void configureAppender(Context context) {
        logInternal(2, "BufferingAppender: configureAppender() START");
        synchronized (_ConfigurationLock) {
            logInternal(2, "BufferingAppender: configureAppender() FINISHED");
        }
    }

    public void log(LogMessage logMessage) {
        if (logMessage == null) {
            throw new IllegalArgumentException("'logMessage' cannot be NULL");
        } else if (isLevelActive(logMessage.getLevel()) && isAreaActive(logMessage.getAreas())) {
            _LogBuffer.add(logMessage);
            _ApproximateBufferSize++;
            while (_ApproximateBufferSize > 1024) {
                _LogBuffer.remove();
                _ApproximateBufferSize--;
            }
        }
    }
}
