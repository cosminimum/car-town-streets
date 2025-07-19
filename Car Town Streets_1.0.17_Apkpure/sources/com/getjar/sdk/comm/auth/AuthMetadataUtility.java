package com.getjar.sdk.comm.auth;

import com.getjar.sdk.data.MetadataValue;
import com.getjar.sdk.utilities.BuildVersion;
import com.getjar.sdk.utilities.Constants;
import java.util.Map;
/* loaded from: classes.dex */
public final class AuthMetadataUtility {
    private static final String KEY_SDK_LEVEL = "sdk.level";
    private static final String KEY_SDK_NAME = "sdk.name";
    private static final String KEY_SDK_VERSION = "sdk.version";
    public static final String SDK_LEVEL = "10";

    private AuthMetadataUtility() {
    }

    public static void addSDKMetadataValues(Map<String, MetadataValue> providerData) {
        if (providerData == null) {
            throw new IllegalArgumentException("'providerData' cannot be NULL");
        }
        providerData.put(KEY_SDK_NAME, new MetadataValue(Constants.USER_AGENT_APP, MetadataValue.MetadataReliability.AVAILABLE));
        providerData.put(KEY_SDK_VERSION, new MetadataValue(BuildVersion.BUILD_VERSION, MetadataValue.MetadataReliability.AVAILABLE));
        providerData.put(KEY_SDK_LEVEL, new MetadataValue(SDK_LEVEL, MetadataValue.MetadataReliability.AVAILABLE));
    }
}
