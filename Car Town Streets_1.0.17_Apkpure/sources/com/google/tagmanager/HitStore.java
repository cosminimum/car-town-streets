package com.google.tagmanager;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public interface HitStore {
    void close();

    void dispatch();

    Dispatcher getDispatcher();

    void putHit(long j, String str);
}
