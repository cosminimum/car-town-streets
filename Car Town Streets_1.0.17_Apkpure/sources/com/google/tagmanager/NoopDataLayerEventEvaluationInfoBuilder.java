package com.google.tagmanager;
/* loaded from: classes.dex */
class NoopDataLayerEventEvaluationInfoBuilder implements DataLayerEventEvaluationInfoBuilder {
    @Override // com.google.tagmanager.DataLayerEventEvaluationInfoBuilder
    public ResolvedFunctionCallBuilder createAndAddResult() {
        return new NoopResolvedFunctionCallBuilder();
    }

    @Override // com.google.tagmanager.DataLayerEventEvaluationInfoBuilder
    public RuleEvaluationStepInfoBuilder createRulesEvaluation() {
        return new NoopRuleEvaluationStepInfoBuilder();
    }
}
