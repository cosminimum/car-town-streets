package com.google.analytics.tracking.android;

import java.util.List;
/* loaded from: classes.dex */
interface Dispatcher {
    void close();

    int dispatchHits(List<Hit> list);

    boolean okToDispatch();

    void overrideHostUrl(String str);
}
