package com.facebook;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.content.pm.Signature;
import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.internal.Utility;
import java.util.ArrayList;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class NativeProtocol {
    static final String ACTION_LOGIN_DIALOG = "com.facebook.platform.action.request.LOGIN_DIALOG";
    static final String ACTION_LOGIN_DIALOG_REPLY = "com.facebook.platform.action.reply.LOGIN_DIALOG";
    static final String AUDIENCE_EVERYONE = "EVERYONE";
    static final String AUDIENCE_FRIENDS = "ALL_FRIENDS";
    static final String AUDIENCE_ME = "SELF";
    private static final String BASIC_INFO = "basic_info";
    static final String ERROR_APPLICATION_ERROR = "ApplicationError";
    static final String ERROR_NETWORK_ERROR = "NetworkError";
    static final String ERROR_PERMISSION_DENIED = "PermissionDenied";
    static final String ERROR_PROTOCOL_ERROR = "ProtocolError";
    static final String ERROR_SERVICE_DISABLED = "ServiceDisabled";
    static final String ERROR_UNKNOWN_ERROR = "UnknownError";
    static final String ERROR_USER_CANCELED = "UserCanceled";
    static final String EXTRA_ACCESS_TOKEN = "com.facebook.platform.extra.ACCESS_TOKEN";
    static final String EXTRA_APPLICATION_ID = "com.facebook.platform.extra.APPLICATION_ID";
    static final String EXTRA_EXPIRES_SECONDS_SINCE_EPOCH = "com.facebook.platform.extra.EXPIRES_SECONDS_SINCE_EPOCH";
    static final String EXTRA_PERMISSIONS = "com.facebook.platform.extra.PERMISSIONS";
    static final String EXTRA_PROTOCOL_ACTION = "com.facebook.platform.protocol.PROTOCOL_ACTION";
    static final String EXTRA_PROTOCOL_VERSION = "com.facebook.platform.protocol.PROTOCOL_VERSION";
    static final String EXTRA_WRITE_PRIVACY = "com.facebook.platform.extra.WRITE_PRIVACY";
    static final String INTENT_ACTION_PLATFORM_ACTIVITY = "com.facebook.platform.PLATFORM_ACTIVITY";
    static final String INTENT_ACTION_PLATFORM_SERVICE = "com.facebook.platform.PLATFORM_SERVICE";
    static final String KATANA_PACKAGE = "com.facebook.katana";
    static final String KATANA_PROXY_AUTH_ACTIVITY = "com.facebook.katana.ProxyAuth";
    public static final String KATANA_PROXY_AUTH_APP_ID_KEY = "client_id";
    public static final String KATANA_PROXY_AUTH_PERMISSIONS_KEY = "scope";
    static final String KATANA_SIGNATURE = "30820268308201d102044a9c4610300d06092a864886f70d0101040500307a310b3009060355040613025553310b3009060355040813024341311230100603550407130950616c6f20416c746f31183016060355040a130f46616365626f6f6b204d6f62696c653111300f060355040b130846616365626f6f6b311d301b0603550403131446616365626f6f6b20436f72706f726174696f6e3020170d3039303833313231353231365a180f32303530303932353231353231365a307a310b3009060355040613025553310b3009060355040813024341311230100603550407130950616c6f20416c746f31183016060355040a130f46616365626f6f6b204d6f62696c653111300f060355040b130846616365626f6f6b311d301b0603550403131446616365626f6f6b20436f72706f726174696f6e30819f300d06092a864886f70d010101050003818d0030818902818100c207d51df8eb8c97d93ba0c8c1002c928fab00dc1b42fca5e66e99cc3023ed2d214d822bc59e8e35ddcf5f44c7ae8ade50d7e0c434f500e6c131f4a2834f987fc46406115de2018ebbb0d5a3c261bd97581ccfef76afc7135a6d59e8855ecd7eacc8f8737e794c60a761c536b72b11fac8e603f5da1a2d54aa103b8a13c0dbc10203010001300d06092a864886f70d0101040500038181005ee9be8bcbb250648d3b741290a82a1c9dc2e76a0af2f2228f1d9f9c4007529c446a70175c5a900d5141812866db46be6559e2141616483998211f4a673149fb2232a10d247663b26a9031e15f84bc1c74d141ff98a02d76f85b2c8ab2571b6469b232d8e768a7f7ca04f7abe4a775615916c07940656b58717457b42bd928a2";
    static final String KATANA_TOKEN_REFRESH_ACTIVITY = "com.facebook.katana.platform.TokenRefreshService";
    static final int MESSAGE_GET_ACCESS_TOKEN_REPLY = 65537;
    static final int MESSAGE_GET_ACCESS_TOKEN_REQUEST = 65536;
    static final int PROTOCOL_VERSION_20121101 = 20121101;
    static final String STATUS_ERROR_CODE = "com.facebook.platform.status.ERROR_CODE";
    static final String STATUS_ERROR_DESCRIPTION = "com.facebook.platform.status.ERROR_DESCRIPTION";
    static final String STATUS_ERROR_JSON = "com.facebook.platform.status.ERROR_JSON";
    static final String STATUS_ERROR_SUBCODE = "com.facebook.platform.status.ERROR_SUBCODE";
    static final String STATUS_ERROR_TYPE = "com.facebook.platform.status.ERROR_TYPE";

    NativeProtocol() {
    }

    static final boolean validateSignature(Context context, String packageName) {
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(packageName, 64);
            Signature[] arr$ = packageInfo.signatures;
            for (Signature signature : arr$) {
                if (signature.toCharsString().equals("30820268308201d102044a9c4610300d06092a864886f70d0101040500307a310b3009060355040613025553310b3009060355040813024341311230100603550407130950616c6f20416c746f31183016060355040a130f46616365626f6f6b204d6f62696c653111300f060355040b130846616365626f6f6b311d301b0603550403131446616365626f6f6b20436f72706f726174696f6e3020170d3039303833313231353231365a180f32303530303932353231353231365a307a310b3009060355040613025553310b3009060355040813024341311230100603550407130950616c6f20416c746f31183016060355040a130f46616365626f6f6b204d6f62696c653111300f060355040b130846616365626f6f6b311d301b0603550403131446616365626f6f6b20436f72706f726174696f6e30819f300d06092a864886f70d010101050003818d0030818902818100c207d51df8eb8c97d93ba0c8c1002c928fab00dc1b42fca5e66e99cc3023ed2d214d822bc59e8e35ddcf5f44c7ae8ade50d7e0c434f500e6c131f4a2834f987fc46406115de2018ebbb0d5a3c261bd97581ccfef76afc7135a6d59e8855ecd7eacc8f8737e794c60a761c536b72b11fac8e603f5da1a2d54aa103b8a13c0dbc10203010001300d06092a864886f70d0101040500038181005ee9be8bcbb250648d3b741290a82a1c9dc2e76a0af2f2228f1d9f9c4007529c446a70175c5a900d5141812866db46be6559e2141616483998211f4a673149fb2232a10d247663b26a9031e15f84bc1c74d141ff98a02d76f85b2c8ab2571b6469b232d8e768a7f7ca04f7abe4a775615916c07940656b58717457b42bd928a2")) {
                    return true;
                }
            }
            return false;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }

    static Intent validateKatanaActivityIntent(Context context, Intent intent) {
        ResolveInfo resolveInfo;
        if (intent == null || (resolveInfo = context.getPackageManager().resolveActivity(intent, 0)) == null || !validateSignature(context, resolveInfo.activityInfo.packageName)) {
            return null;
        }
        return intent;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent validateKatanaServiceIntent(Context context, Intent intent) {
        ResolveInfo resolveInfo;
        if (intent == null || (resolveInfo = context.getPackageManager().resolveService(intent, 0)) == null || !validateSignature(context, resolveInfo.serviceInfo.packageName)) {
            return null;
        }
        return intent;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent createProxyAuthIntent(Context context, String applicationId, List<String> permissions) {
        Intent intent = new Intent().setClassName(KATANA_PACKAGE, KATANA_PROXY_AUTH_ACTIVITY).putExtra("client_id", applicationId);
        if (!Utility.isNullOrEmpty(permissions)) {
            intent.putExtra("scope", TextUtils.join(",", permissions));
        }
        return validateKatanaActivityIntent(context, intent);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent createTokenRefreshIntent(Context context) {
        Intent intent = new Intent();
        intent.setClassName(KATANA_PACKAGE, KATANA_TOKEN_REFRESH_ACTIVITY);
        return validateKatanaServiceIntent(context, intent);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Intent createLoginDialog20121101Intent(Context context, String applicationId, ArrayList<String> permissions, String audience) {
        Intent intent = new Intent().setAction(INTENT_ACTION_PLATFORM_ACTIVITY).addCategory("android.intent.category.DEFAULT").putExtra(EXTRA_PROTOCOL_VERSION, PROTOCOL_VERSION_20121101).putExtra(EXTRA_PROTOCOL_ACTION, ACTION_LOGIN_DIALOG).putExtra(EXTRA_APPLICATION_ID, applicationId).putStringArrayListExtra(EXTRA_PERMISSIONS, ensureDefaultPermissions(permissions)).putExtra(EXTRA_WRITE_PRIVACY, ensureDefaultAudience(audience));
        return validateKatanaActivityIntent(context, intent);
    }

    private static String ensureDefaultAudience(String audience) {
        if (Utility.isNullOrEmpty(audience)) {
            return AUDIENCE_ME;
        }
        return audience;
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.util.ArrayList<java.lang.String> ensureDefaultPermissions(java.util.ArrayList<java.lang.String> r4) {
        /*
            boolean r3 = com.facebook.internal.Utility.isNullOrEmpty(r4)
            if (r3 == 0) goto L12
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>()
        Lb:
            java.lang.String r3 = "basic_info"
            r2.add(r3)
            r4 = r2
        L11:
            return r4
        L12:
            java.util.Iterator r0 = r4.iterator()
        L16:
            boolean r3 = r0.hasNext()
            if (r3 == 0) goto L31
            java.lang.Object r1 = r0.next()
            java.lang.String r1 = (java.lang.String) r1
            boolean r3 = com.facebook.Session.isPublishPermission(r1)
            if (r3 != 0) goto L11
            java.lang.String r3 = "basic_info"
            boolean r3 = r3.equals(r1)
            if (r3 == 0) goto L16
            goto L11
        L31:
            java.util.ArrayList r2 = new java.util.ArrayList
            r2.<init>(r4)
            goto Lb
        */
        throw new UnsupportedOperationException("Method not decompiled: com.facebook.NativeProtocol.ensureDefaultPermissions(java.util.ArrayList):java.util.ArrayList");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isServiceDisabledResult20121101(Intent data) {
        int protocolVersion = data.getIntExtra(EXTRA_PROTOCOL_VERSION, 0);
        String errorType = data.getStringExtra(STATUS_ERROR_TYPE);
        return PROTOCOL_VERSION_20121101 == protocolVersion && ERROR_SERVICE_DISABLED.equals(errorType);
    }

    static AccessTokenSource getAccessTokenSourceFromNative(Bundle extras) {
        long actual = extras.getInt(EXTRA_PROTOCOL_VERSION, 0);
        return 20121101 == actual ? AccessTokenSource.FACEBOOK_APPLICATION_NATIVE : AccessTokenSource.FACEBOOK_APPLICATION_WEB;
    }
}
