package com.getjar.sdk.comm.auth;

import android.content.Context;
import com.getjar.sdk.comm.CommContext;
import java.util.Map;
/* loaded from: classes.dex */
public interface UserAuthProvider extends AuthProvider {
    UserAuthResult ensureUser(String str, CommContext commContext, String str2, AuthUIParentInterface authUIParentInterface, ProviderHint providerHint);

    Map<String, String> getProxiableAuthData(Context context);

    boolean isUINeeded(CommContext commContext, String str, ProviderHint providerHint);
}
