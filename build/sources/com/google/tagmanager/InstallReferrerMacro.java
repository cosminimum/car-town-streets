package com.google.tagmanager;

import android.content.Context;
import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.containertag.common.Key;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class InstallReferrerMacro extends FunctionCallImplementation {
    private static final String COMPONENT = Key.COMPONENT.toString();

    /* renamed from: ID */
    private static final String f3930ID = FunctionType.INSTALL_REFERRER.toString();
    private final Context context;

    public static String getFunctionId() {
        return f3930ID;
    }

    public InstallReferrerMacro(Context context2) {
        super(f3930ID, new String[0]);
        this.context = context2;
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> parameters) {
        String referrer = InstallReferrerUtil.getInstallReferrer(this.context, parameters.get(COMPONENT) != null ? Types.valueToString(parameters.get(COMPONENT)) : null);
        return referrer != null ? Types.objectToValue(referrer) : Types.getDefaultValue();
    }
}
