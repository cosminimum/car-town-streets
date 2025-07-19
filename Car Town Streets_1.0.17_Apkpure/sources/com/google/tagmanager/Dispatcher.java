package com.google.tagmanager;

import java.util.List;
/* loaded from: classes.dex */
interface Dispatcher {
    void close();

    void dispatchHits(List<Hit> list);

    boolean okToDispatch();
}
