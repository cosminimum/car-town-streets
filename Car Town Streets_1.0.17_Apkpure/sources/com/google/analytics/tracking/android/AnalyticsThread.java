package com.google.analytics.tracking.android;

import java.util.Map;
import java.util.concurrent.LinkedBlockingQueue;
/* loaded from: classes.dex */
interface AnalyticsThread {
    void clearHits();

    void dispatch();

    LinkedBlockingQueue<Runnable> getQueue();

    Thread getThread();

    void sendHit(Map<String, String> map);

    void setForceLocalDispatch();
}
