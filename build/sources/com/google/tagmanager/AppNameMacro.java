package com.google.tagmanager;

import android.content.Context;
import android.content.pm.PackageManager;
import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class AppNameMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3913ID = FunctionType.APP_NAME.toString();
    private final Context mContext;

    public static String getFunctionId() {
        return f3913ID;
    }

    public AppNameMacro(Context context) {
        super(f3913ID, new String[0]);
        this.mContext = context;
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        try {
            PackageManager packageManager = this.mContext.getPackageManager();
            return Types.objectToValue(packageManager.getApplicationLabel(packageManager.getApplicationInfo(this.mContext.getPackageName(), 0)).toString());
        } catch (PackageManager.NameNotFoundException e) {
            Log.m4389e("App name is not found.", e);
            return Types.getDefaultValue();
        }
    }
}
