package com.google.tagmanager;

import com.google.analytics.midtier.proto.containertag.TypeSystem;
/* loaded from: classes.dex */
interface ResolvedFunctionCallBuilder {
    ResolvedPropertyBuilder createResolvedPropertyBuilder(String str);

    void setFunctionResult(TypeSystem.Value value);
}
