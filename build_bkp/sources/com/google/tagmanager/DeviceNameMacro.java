package com.google.tagmanager;

import android.os.Build;
import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class DeviceNameMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3921ID = FunctionType.DEVICE_NAME.toString();

    public static String getFunctionId() {
        return f3921ID;
    }

    public DeviceNameMacro() {
        super(f3921ID, new String[0]);
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        String manufacturer = Build.MANUFACTURER;
        String model = Build.MODEL;
        if (!model.startsWith(manufacturer) && !manufacturer.equals("unknown")) {
            model = manufacturer + " " + model;
        }
        return Types.objectToValue(model);
    }
}
