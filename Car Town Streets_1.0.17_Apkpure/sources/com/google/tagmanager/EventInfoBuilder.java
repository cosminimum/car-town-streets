package com.google.tagmanager;
/* loaded from: classes.dex */
interface EventInfoBuilder {
    DataLayerEventEvaluationInfoBuilder createDataLayerEventEvaluationInfoBuilder();

    MacroEvaluationInfoBuilder createMacroEvaluationInfoBuilder();

    void processEventInfo();
}
