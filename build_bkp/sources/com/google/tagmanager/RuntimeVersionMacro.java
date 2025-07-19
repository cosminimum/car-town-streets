package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class RuntimeVersionMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3945ID = FunctionType.RUNTIME_VERSION.toString();
    public static final long VERSION_NUMBER = 50788154;

    public static String getFunctionId() {
        return f3945ID;
    }

    public RuntimeVersionMacro() {
        super(f3945ID, new String[0]);
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        return Types.objectToValue(Long.valueOf(VERSION_NUMBER));
    }
}
