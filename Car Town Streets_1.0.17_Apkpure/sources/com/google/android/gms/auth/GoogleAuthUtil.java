package com.google.android.gms.auth;

import android.accounts.AccountManager;
import android.app.Notification;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.RemoteException;
import android.text.TextUtils;
import android.util.Log;
import com.google.android.gms.R;
import com.google.android.gms.common.GooglePlayServicesNotAvailableException;
import com.google.android.gms.common.GooglePlayServicesRepairableException;
import com.google.android.gms.common.GooglePlayServicesUtil;
import com.google.android.gms.common.a;
import com.google.android.gms.internal.eg;
import com.google.android.gms.internal.o;
import java.io.IOException;
import java.net.URISyntaxException;
/* loaded from: classes.dex */
public final class GoogleAuthUtil {
    public static final String GOOGLE_ACCOUNT_TYPE = "com.google";
    public static final String KEY_ANDROID_PACKAGE_NAME;
    public static final String KEY_CALLER_UID;
    public static final String KEY_CLIENT_PACKAGE_NAME = "clientPackageName";
    public static final String KEY_REQUEST_ACTIONS = "request_visible_actions";
    @Deprecated
    public static final String KEY_REQUEST_VISIBLE_ACTIVITIES = "request_visible_actions";
    public static final String KEY_SUPPRESS_PROGRESS_SCREEN = "suppressProgressScreen";
    public static final String OEM_ONLY_KEY_TARGET_ANDROID_ID = "oauth2_target_device_id";
    public static final String OEM_ONLY_KEY_VERIFIER = "oauth2_authcode_verifier";
    public static final String OEM_ONLY_SCOPE_ACCOUNT_BOOTSTRAP = "_account_setup";
    private static final ComponentName kb;
    private static final ComponentName kc;
    private static final Intent kd;
    private static final Intent ke;

    static {
        KEY_CALLER_UID = Build.VERSION.SDK_INT >= 11 ? "callerUid" : "callerUid";
        KEY_ANDROID_PACKAGE_NAME = Build.VERSION.SDK_INT >= 14 ? "androidPackageName" : "androidPackageName";
        kb = new ComponentName(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE, "com.google.android.gms.auth.GetToken");
        kc = new ComponentName(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE, "com.google.android.gms.recovery.RecoveryService");
        kd = new Intent().setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE).setComponent(kb);
        ke = new Intent().setPackage(GooglePlayServicesUtil.GOOGLE_PLAY_SERVICES_PACKAGE).setComponent(kc);
    }

    private GoogleAuthUtil() {
    }

    private static String a(Context context, String str, String str2, Bundle bundle) throws IOException, UserRecoverableNotifiedException, GoogleAuthException {
        int i;
        ApplicationInfo applicationInfo;
        if (bundle == null) {
            bundle = new Bundle();
        }
        try {
            return getToken(context, str, str2, bundle);
        } catch (GooglePlayServicesAvailabilityException e) {
            PendingIntent errorPendingIntent = GooglePlayServicesUtil.getErrorPendingIntent(e.getConnectionStatusCode(), context, 0);
            Resources resources = context.getResources();
            Notification notification = new Notification(17301642, resources.getString(R.string.auth_client_play_services_err_notification_msg), System.currentTimeMillis());
            notification.flags |= 16;
            String str3 = context.getApplicationInfo().name;
            if (TextUtils.isEmpty(str3)) {
                str3 = context.getPackageName();
                PackageManager packageManager = context.getApplicationContext().getPackageManager();
                try {
                    applicationInfo = packageManager.getApplicationInfo(context.getPackageName(), 0);
                } catch (PackageManager.NameNotFoundException e2) {
                    applicationInfo = null;
                }
                if (applicationInfo != null) {
                    str3 = packageManager.getApplicationLabel(applicationInfo).toString();
                }
            }
            String string = resources.getString(R.string.auth_client_requested_by_msg, str3);
            switch (e.getConnectionStatusCode()) {
                case 1:
                    i = R.string.auth_client_needs_installation_title;
                    break;
                case 2:
                    i = R.string.auth_client_needs_update_title;
                    break;
                case 3:
                    i = R.string.auth_client_needs_enabling_title;
                    break;
                default:
                    i = R.string.auth_client_using_bad_version_title;
                    break;
            }
            notification.setLatestEventInfo(context, resources.getString(i), string, errorPendingIntent);
            ((NotificationManager) context.getSystemService("notification")).notify(39789, notification);
            throw new UserRecoverableNotifiedException("User intervention required. Notification has been pushed.");
        } catch (UserRecoverableAuthException e3) {
            throw new UserRecoverableNotifiedException("User intervention required. Notification has been pushed.");
        }
    }

    private static void b(Intent intent) {
        if (intent == null) {
            throw new IllegalArgumentException("Callack cannot be null.");
        }
        try {
            Intent.parseUri(intent.toUri(1), 1);
        } catch (URISyntaxException e) {
            throw new IllegalArgumentException("Parameter callback contains invalid data. It must be serializable using toUri() and parseUri().");
        }
    }

    public static String getToken(Context context, String accountName, String scope) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        return getToken(context, accountName, scope, new Bundle());
    }

    public static String getToken(Context context, String accountName, String scope, Bundle extras) throws IOException, UserRecoverableAuthException, GoogleAuthException {
        Context applicationContext = context.getApplicationContext();
        eg.O("Calling this from your main thread can lead to deadlock");
        m(applicationContext);
        Bundle extras2 = extras == null ? new Bundle() : new Bundle(extras);
        String str = context.getApplicationInfo().packageName;
        extras2.putString(KEY_CLIENT_PACKAGE_NAME, str);
        if (!extras2.containsKey(KEY_ANDROID_PACKAGE_NAME)) {
            extras2.putString(KEY_ANDROID_PACKAGE_NAME, str);
        }
        a aVar = new a();
        try {
            if (!applicationContext.bindService(kd, aVar, 1)) {
                throw new IOException("Could not bind to service with the given context.");
            }
            try {
                try {
                    Bundle a = o.a.a(aVar.bg()).a(accountName, scope, extras2);
                    String string = a.getString("authtoken");
                    if (!TextUtils.isEmpty(string)) {
                        return string;
                    }
                    String string2 = a.getString("Error");
                    Intent intent = (Intent) a.getParcelable("userRecoveryIntent");
                    if (x(string2)) {
                        throw new UserRecoverableAuthException(string2, intent);
                    }
                    if (!w(string2)) {
                        throw new GoogleAuthException(string2);
                    }
                    throw new IOException(string2);
                } catch (InterruptedException e) {
                    throw new GoogleAuthException("Interrupted");
                }
            } catch (RemoteException e2) {
                Log.i("GoogleAuthUtil", "GMS remote exception ", e2);
                throw new IOException("remote exception");
            }
        } finally {
            applicationContext.unbindService(aVar);
        }
    }

    public static String getTokenWithNotification(Context context, String accountName, String scope, Bundle extras) throws IOException, UserRecoverableNotifiedException, GoogleAuthException {
        if (extras == null) {
            extras = new Bundle();
        }
        extras.putBoolean("handle_notification", true);
        return a(context, accountName, scope, extras);
    }

    public static String getTokenWithNotification(Context context, String accountName, String scope, Bundle extras, Intent callback) throws IOException, UserRecoverableNotifiedException, GoogleAuthException {
        b(callback);
        if (extras == null) {
            extras = new Bundle();
        }
        extras.putParcelable("callback_intent", callback);
        extras.putBoolean("handle_notification", true);
        return a(context, accountName, scope, extras);
    }

    public static String getTokenWithNotification(Context context, String accountName, String scope, Bundle extras, String authority, Bundle syncBundle) throws IOException, UserRecoverableNotifiedException, GoogleAuthException {
        if (TextUtils.isEmpty(authority)) {
            throw new IllegalArgumentException("Authority cannot be empty or null.");
        }
        if (extras == null) {
            extras = new Bundle();
        }
        if (syncBundle == null) {
            syncBundle = new Bundle();
        }
        ContentResolver.validateSyncExtrasBundle(syncBundle);
        extras.putString("authority", authority);
        extras.putBundle("sync_extras", syncBundle);
        extras.putBoolean("handle_notification", true);
        return a(context, accountName, scope, extras);
    }

    public static void invalidateToken(Context context, String token) {
        AccountManager.get(context).invalidateAuthToken(GOOGLE_ACCOUNT_TYPE, token);
    }

    private static void m(Context context) throws GooglePlayServicesAvailabilityException, GoogleAuthException {
        try {
            GooglePlayServicesUtil.m(context);
        } catch (GooglePlayServicesNotAvailableException e) {
            throw new GoogleAuthException(e.getMessage());
        } catch (GooglePlayServicesRepairableException e2) {
            throw new GooglePlayServicesAvailabilityException(e2.getConnectionStatusCode(), e2.getMessage(), e2.getIntent());
        }
    }

    private static boolean w(String str) {
        return "NetworkError".equals(str) || "ServiceUnavailable".equals(str) || "Timeout".equals(str);
    }

    private static boolean x(String str) {
        return "BadAuthentication".equals(str) || "CaptchaRequired".equals(str) || "DeviceManagementRequiredOrSyncDisabled".equals(str) || "NeedPermission".equals(str) || "NeedsBrowser".equals(str) || "UserCancel".equals(str) || "AppDownloadRequired".equals(str);
    }
}
