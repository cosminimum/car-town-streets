package com.google.tagmanager;
/* loaded from: classes.dex */
interface ValueBuilder {
    MacroEvaluationInfoBuilder createValueMacroEvaluationInfoExtension();

    ValueBuilder getListItem(int i);

    ValueBuilder getMapKey(int i);

    ValueBuilder getMapValue(int i);

    ValueBuilder getTemplateToken(int i);
}
