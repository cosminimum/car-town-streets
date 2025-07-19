package com.google.tagmanager;
/* loaded from: classes.dex */
interface HitSendingThread {
    void queueToThread(Runnable runnable);

    void sendHit(String str);
}
