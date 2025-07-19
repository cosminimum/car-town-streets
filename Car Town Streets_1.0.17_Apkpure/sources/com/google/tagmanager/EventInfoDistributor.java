package com.google.tagmanager;
/* loaded from: classes.dex */
interface EventInfoDistributor {
    EventInfoBuilder createDataLayerEventEvaluationEventInfo(String str);

    EventInfoBuilder createMacroEvalutionEventInfo(String str);

    boolean debugMode();
}
