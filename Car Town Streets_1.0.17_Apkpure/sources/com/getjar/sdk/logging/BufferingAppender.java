package com.getjar.sdk.logging;

import android.content.Context;
import java.util.Collection;
import java.util.Collections;
import java.util.concurrent.ConcurrentLinkedQueue;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class BufferingAppender extends AppenderBase {
    private static final int _MaxBufferSize = 1024;
    private static BufferingAppender _Instance = null;
    private static Object _InstanceLock = new Object();
    private static volatile int _ApproximateBufferSize = 0;
    private static ConcurrentLinkedQueue<LogMessage> _LogBuffer = new ConcurrentLinkedQueue<>();
    private static Object _ConfigurationLock = new Object();

    private BufferingAppender() {
        super(false, 2, Area.ALL.value());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static BufferingAppender getInstance() {
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

    @Override // com.getjar.sdk.logging.AppenderInterface
    public void configureAppender(Context context) {
        logInternal(2, "BufferingAppender: configureAppender() START");
        synchronized (_ConfigurationLock) {
            logInternal(2, "BufferingAppender: configureAppender() FINISHED");
        }
    }

    @Override // com.getjar.sdk.logging.AppenderInterface
    public void log(LogMessage logMessage) {
        if (logMessage == null) {
            throw new IllegalArgumentException("'logMessage' cannot be NULL");
        }
        if (isLevelActive(logMessage.getLevel()) && isAreaActive(logMessage.getAreas())) {
            _LogBuffer.add(logMessage);
            _ApproximateBufferSize++;
            while (_ApproximateBufferSize > 1024) {
                _LogBuffer.remove();
                _ApproximateBufferSize--;
            }
        }
    }
}
