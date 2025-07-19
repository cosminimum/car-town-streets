package com.google.tagmanager;

import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;
/* loaded from: classes.dex */
class AdvertisingTrackingEnabledMacro extends FunctionCallImplementation {
    private static final String ID = FunctionType.ADVERTISING_TRACKING_ENABLED.toString();

    public static String getFunctionId() {
        return ID;
    }

    public AdvertisingTrackingEnabledMacro() {
        super(ID, new String[0]);
    }

    @Override // com.google.tagmanager.FunctionCallImplementation
    public boolean isCacheable() {
        return true;
    }

    @Override // com.google.tagmanager.FunctionCallImplementation
    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> parameters) {
        return Types.objectToValue(true);
    }
}
