package com.google.tagmanager;

import com.google.analytics.midtier.proto.containertag.TypeSystem;
/* loaded from: classes.dex */
interface ResolvedRuleBuilder {
    ResolvedFunctionCallBuilder createNegativePredicate();

    ResolvedFunctionCallBuilder createPositivePredicate();

    ResolvedFunctionCallTranslatorList getAddedMacroFunctions();

    ResolvedFunctionCallTranslatorList getAddedTagFunctions();

    ResolvedFunctionCallTranslatorList getRemovedMacroFunctions();

    ResolvedFunctionCallTranslatorList getRemovedTagFunctions();

    void setValue(TypeSystem.Value value);
}
