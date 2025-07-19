package com.google.tagmanager;

import com.google.analytics.midtier.proto.containertag.TypeSystem;
/* loaded from: classes.dex */
class NoopResolvedPropertyBuilder implements ResolvedPropertyBuilder {
    @Override // com.google.tagmanager.ResolvedPropertyBuilder
    public ValueBuilder createPropertyValueBuilder(TypeSystem.Value propertyValue) {
        return new NoopValueBuilder();
    }
}
