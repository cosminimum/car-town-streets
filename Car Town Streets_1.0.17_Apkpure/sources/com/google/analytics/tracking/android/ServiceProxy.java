package com.google.analytics.tracking.android;

import com.google.android.gms.analytics.internal.Command;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public interface ServiceProxy {
    void clearHits();

    void createService();

    void dispatch();

    void putHit(Map<String, String> map, long j, String str, List<Command> list);

    void setForceLocalDispatch();
}
