package com.google.tagmanager;

import android.content.Context;
import android.util.DisplayMetrics;
import android.view.WindowManager;
import com.getjar.sdk.utilities.Constants;
import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import java.util.Map;

class ResolutionMacro extends FunctionCallImplementation {

    /* renamed from: ID */
    private static final String f3942ID = FunctionType.RESOLUTION.toString();
    private final Context mContext;

    public static String getFunctionId() {
        return f3942ID;
    }

    public ResolutionMacro(Context context) {
        super(f3942ID, new String[0]);
        this.mContext = context;
    }

    public boolean isCacheable() {
        return true;
    }

    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> map) {
        DisplayMetrics displayMetrics = new DisplayMetrics();
        ((WindowManager) this.mContext.getSystemService("window")).getDefaultDisplay().getMetrics(displayMetrics);
        int screenWidth = displayMetrics.widthPixels;
        return Types.objectToValue(screenWidth + Constants.f677X + displayMetrics.heightPixels);
    }
}
