package com.google.tagmanager;
/* loaded from: classes.dex */
class NoopValueBuilder implements ValueBuilder {
    @Override // com.google.tagmanager.ValueBuilder
    public ValueBuilder getListItem(int index) {
        return new NoopValueBuilder();
    }

    @Override // com.google.tagmanager.ValueBuilder
    public ValueBuilder getMapKey(int index) {
        return new NoopValueBuilder();
    }

    @Override // com.google.tagmanager.ValueBuilder
    public ValueBuilder getMapValue(int index) {
        return new NoopValueBuilder();
    }

    @Override // com.google.tagmanager.ValueBuilder
    public ValueBuilder getTemplateToken(int index) {
        return new NoopValueBuilder();
    }

    @Override // com.google.tagmanager.ValueBuilder
    public MacroEvaluationInfoBuilder createValueMacroEvaluationInfoExtension() {
        return new NoopMacroEvaluationInfoBuilder();
    }
}
