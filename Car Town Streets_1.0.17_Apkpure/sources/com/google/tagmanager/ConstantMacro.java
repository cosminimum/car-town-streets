package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.containertag.common.Key;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;
/* loaded from: classes.dex */
class ConstantMacro extends FunctionCallImplementation {
    private static final String ID = FunctionType.CONSTANT.toString();
    private static final String VALUE = Key.VALUE.toString();

    public static String getFunctionId() {
        return ID;
    }

    public ConstantMacro() {
        super(ID, VALUE);
    }

    public static String getValueKey() {
        return VALUE;
    }

    @Override // com.google.tagmanager.FunctionCallImplementation
    public boolean isCacheable() {
        return true;
    }

    @Override // com.google.tagmanager.FunctionCallImplementation
    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> parameters) {
        return parameters.get(VALUE);
    }
}
