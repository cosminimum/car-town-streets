package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class PlatformMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3938ID = FunctionType.PLATFORM.toString();
    private static final TypeSystem.Value PLATFORM = Types.objectToValue("Android");

    public static String getFunctionId() {
        return f3938ID;
    }

    public PlatformMacro() {
        super(f3938ID, new String[0]);
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        return PLATFORM;
    }
}
