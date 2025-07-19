package com.getjar.sdk.rewards;

import android.app.Activity;
import android.content.Intent;
import android.content.res.Configuration;
import android.os.Bundle;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.GlobalActivityRegistrar;
import com.getjar.sdk.utilities.StringUtility;
import java.util.UUID;

public class GetJarActivity extends Activity {
    private String _activityInstanceId = null;
    private GetJarSubActivity _getJarSubActivity = null;

    /* access modifiers changed from: protected */
    public void onCreate(Bundle savedInstanceState) {
        String str;
        Logger.i(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onCreate() START");
        super.onCreate(savedInstanceState);
        StringBuilder logMessage = new StringBuilder("onCreate");
        try {
            GlobalActivityRegistrar.getInstance().registerActivity(this);
            Class<?> activityTypeCache = null;
            if (this._getJarSubActivity != null) {
                activityTypeCache = this._getJarSubActivity.getClass();
            }
            if (!StringUtility.isNullOrEmpty(this._activityInstanceId)) {
                logMessage.append(".oldId.");
                logMessage.append(this._activityInstanceId);
            }
            this._activityInstanceId = UUID.randomUUID().toString();
            if (getIntent().getBooleanExtra(Constants.EXTRA_WEBVIEW, false)) {
                this._getJarSubActivity = new GetJarWebViewSubActivity(this);
                Logger.i(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: Using GetJarWebViewSubActivity");
            } else if (getIntent().getBooleanExtra(Constants.EXTRA_USER_AUTH, false)) {
                this._getJarSubActivity = new GetJarUserAuthSubActivity(this);
                Logger.i(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: Using GetJarUserAuthSubActivity");
            } else {
                Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: unknown UI requested");
                throw new IllegalStateException("GetJarActivity: unknown UI requested");
            }
            this._getJarSubActivity.onCreate(savedInstanceState);
            if (activityTypeCache != null) {
                logMessage.append(".oldType.");
                logMessage.append(activityTypeCache.getName());
            }
            logMessage.append(".type.");
            logMessage.append(this._getJarSubActivity.getClass().getName());
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onCreate() failed", e);
            finish();
        } finally {
            str = "GetJarActivity: onCreate() DONE";
            Logger.i(Area.OS_ENTRY_POINT.value() | Area.UI.value(), str);
        }
    }

    /* access modifiers changed from: protected */
    public void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        try {
            this._getJarSubActivity.onNewIntent(intent);
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onNewIntent() failed", e);
        }
    }

    /* access modifiers changed from: protected */
    public void onResume() {
        super.onResume();
        try {
            this._getJarSubActivity.onResume();
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onResume() failed", e);
        }
    }

    /* access modifiers changed from: protected */
    public void onPause() {
        try {
            this._getJarSubActivity.onPause();
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onPause() failed", e);
        } finally {
            super.onPause();
        }
    }

    /* access modifiers changed from: protected */
    public void onDestroy() {
        try {
            this._getJarSubActivity.onDestroy();
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onDestroy() failed", e);
        } finally {
            super.onDestroy();
        }
    }

    public void onBackPressed() {
        try {
            this._getJarSubActivity.onBackPressed();
        } catch (Exception e) {
            Logger.e(Area.UI.value(), "GetJarActivity: onBackPressed() failed", e);
        }
    }

    /* access modifiers changed from: protected */
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        this._getJarSubActivity.onActivityResult(requestCode, resultCode, data);
    }

    /* access modifiers changed from: protected */
    public void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        try {
            this._getJarSubActivity.onSaveInstanceState(outState);
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onSaveInstanceState() failed", e);
        }
    }

    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        try {
            this._getJarSubActivity.onConfigurationChanged(newConfig);
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onConfigurationChanged() failed", e);
        }
    }
}
