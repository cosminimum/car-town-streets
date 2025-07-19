package com.getjar.sdk.data.package_events;

import android.content.Context;
import com.getjar.sdk.comm.CommContext;
/* loaded from: classes.dex */
public class PackageEventManager {
    private static volatile PackageEventManager _Instance = null;
    private volatile Object _eventLock = new Object();

    /* loaded from: classes.dex */
    public enum EventType {
        INSTALLED,
        UNINSTALLED,
        FIRST_OPEN
    }

    private PackageEventManager(Context context) {
        PackageEventDatabase.initialize(context);
    }

    public static synchronized PackageEventManager getInstance(Context context) {
        PackageEventManager packageEventManager;
        synchronized (PackageEventManager.class) {
            if (context == null) {
                throw new IllegalArgumentException("'context' cannot be NULL");
            }
            if (_Instance == null) {
                _Instance = new PackageEventManager(context);
            }
            packageEventManager = _Instance;
        }
        return packageEventManager;
    }

    public void logEvent(String packageName, EventType eventType) {
        synchronized (this._eventLock) {
            PackageEventDatabase.getInstance().addRecord(packageName, eventType);
        }
    }

    public void sendUnsyncedEvents(CommContext commContext) {
        if (commContext == null) {
            throw new IllegalArgumentException("'commContext' cannot be NULL");
        }
        synchronized (this._eventLock) {
            PackageEventReporter.getInstance(commContext).sendUnsyncedData();
        }
    }
}
