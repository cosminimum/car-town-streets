package com.google.tagmanager;

import com.google.analytics.midtier.proto.containertag.TypeSystem;
/* loaded from: classes.dex */
class NoopResolvedFunctionCallBuilder implements ResolvedFunctionCallBuilder {
    @Override // com.google.tagmanager.ResolvedFunctionCallBuilder
    public ResolvedPropertyBuilder createResolvedPropertyBuilder(String key) {
        return new NoopResolvedPropertyBuilder();
    }

    @Override // com.google.tagmanager.ResolvedFunctionCallBuilder
    public void setFunctionResult(TypeSystem.Value functionResult) {
    }
}
