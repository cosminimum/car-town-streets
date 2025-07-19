package com.google.tagmanager;
/* loaded from: classes.dex */
class NoopMacroEvaluationInfoBuilder implements MacroEvaluationInfoBuilder {
    @Override // com.google.tagmanager.MacroEvaluationInfoBuilder
    public ResolvedFunctionCallBuilder createResult() {
        return new NoopResolvedFunctionCallBuilder();
    }

    @Override // com.google.tagmanager.MacroEvaluationInfoBuilder
    public RuleEvaluationStepInfoBuilder createRulesEvaluation() {
        return new NoopRuleEvaluationStepInfoBuilder();
    }
}
