package com.google.tagmanager;

import com.google.tagmanager.ResourceUtil;
import java.util.Set;
/* loaded from: classes.dex */
class NoopRuleEvaluationStepInfoBuilder implements RuleEvaluationStepInfoBuilder {
    @Override // com.google.tagmanager.RuleEvaluationStepInfoBuilder
    public void setEnabledFunctions(Set<ResourceUtil.ExpandedFunctionCall> enabledFunctions) {
    }

    @Override // com.google.tagmanager.RuleEvaluationStepInfoBuilder
    public ResolvedRuleBuilder createResolvedRuleBuilder() {
        return new NoopResolvedRuleBuilder();
    }
}
