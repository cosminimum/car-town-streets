package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class AdvertisingTrackingEnabledMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3910ID = FunctionType.ADVERTISING_TRACKING_ENABLED.toString();

    public static String getFunctionId() {
        return f3910ID;
    }

    public AdvertisingTrackingEnabledMacro() {
        super(f3910ID, new String[0]);
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        return Types.objectToValue(true);
    }
}
