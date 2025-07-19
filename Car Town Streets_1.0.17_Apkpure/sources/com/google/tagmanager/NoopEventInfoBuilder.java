package com.google.tagmanager;
/* loaded from: classes.dex */
class NoopEventInfoBuilder implements EventInfoBuilder {
    @Override // com.google.tagmanager.EventInfoBuilder
    public MacroEvaluationInfoBuilder createMacroEvaluationInfoBuilder() {
        return new NoopMacroEvaluationInfoBuilder();
    }

    @Override // com.google.tagmanager.EventInfoBuilder
    public DataLayerEventEvaluationInfoBuilder createDataLayerEventEvaluationInfoBuilder() {
        return new NoopDataLayerEventEvaluationInfoBuilder();
    }

    @Override // com.google.tagmanager.EventInfoBuilder
    public void processEventInfo() {
    }
}
