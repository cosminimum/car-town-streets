package com.google.tagmanager;

import com.google.analytics.midtier.proto.containertag.TypeSystem;
/* loaded from: classes.dex */
interface ResolvedPropertyBuilder {
    ValueBuilder createPropertyValueBuilder(TypeSystem.Value value);
}
