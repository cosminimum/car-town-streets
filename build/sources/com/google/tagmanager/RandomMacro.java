package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class RandomMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3939ID = FunctionType.RANDOM.toString();

    public static String getFunctionId() {
        return f3939ID;
    }

    public RandomMacro() {
        super(f3939ID, new String[0]);
    }

    public boolean isCacheable() {
        return false;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        return Types.objectToValue(Long.valueOf(Math.round(Math.random() * 2.147483647E9d)));
    }
}
