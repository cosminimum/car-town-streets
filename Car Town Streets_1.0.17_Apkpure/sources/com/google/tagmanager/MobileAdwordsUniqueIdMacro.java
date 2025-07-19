package com.google.tagmanager;

import android.content.Context;
import android.provider.Settings;
import com.google.analytics.containertag.common.FunctionType;
import com.google.analytics.midtier.proto.containertag.TypeSystem;
import com.google.android.gms.common.util.VisibleForTesting;
import com.tapjoy.TapjoyConstants;
import java.util.Map;
/* loaded from: classes.dex */
class MobileAdwordsUniqueIdMacro extends FunctionCallImplementation {
    private static final String ID = FunctionType.MOBILE_ADWORDS_UNIQUE_ID.toString();
    private final Context mContext;

    public static String getFunctionId() {
        return ID;
    }

    public MobileAdwordsUniqueIdMacro(Context context) {
        super(ID, new String[0]);
        this.mContext = context;
    }

    @Override // com.google.tagmanager.FunctionCallImplementation
    public boolean isCacheable() {
        return true;
    }

    @Override // com.google.tagmanager.FunctionCallImplementation
    public TypeSystem.Value evaluate(Map<String, TypeSystem.Value> parameters) {
        String androidId = getAndroidId(this.mContext);
        return androidId == null ? Types.getDefaultValue() : Types.objectToValue(androidId);
    }

    @VisibleForTesting
    protected String getAndroidId(Context context) {
        return Settings.Secure.getString(context.getContentResolver(), TapjoyConstants.TJC_ANDROID_ID);
    }
}
