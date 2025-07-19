package com.google.tagmanager;
/* loaded from: classes.dex */
class NoopEventInfoDistributor implements EventInfoDistributor {
    @Override // com.google.tagmanager.EventInfoDistributor
    public EventInfoBuilder createMacroEvalutionEventInfo(String key) {
        return new NoopEventInfoBuilder();
    }

    @Override // com.google.tagmanager.EventInfoDistributor
    public EventInfoBuilder createDataLayerEventEvaluationEventInfo(String event) {
        return new NoopEventInfoBuilder();
    }

    @Override // com.google.tagmanager.EventInfoDistributor
    public boolean debugMode() {
        return false;
    }
}
