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
/* loaded from: classes.dex */
public class GetJarActivity extends Activity {
    private GetJarSubActivity _getJarSubActivity = null;
    private String _activityInstanceId = null;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
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
            Logger.i(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onCreate() DONE");
        }
    }

    @Override // android.app.Activity
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        try {
            this._getJarSubActivity.onNewIntent(intent);
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onNewIntent() failed", e);
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        try {
            this._getJarSubActivity.onResume();
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onResume() failed", e);
        }
    }

    @Override // android.app.Activity
    protected void onPause() {
        try {
            try {
                this._getJarSubActivity.onPause();
                super.onPause();
            } catch (Exception e) {
                Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onPause() failed", e);
                super.onPause();
            }
        } catch (Throwable th) {
            super.onPause();
            throw th;
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        try {
            try {
                this._getJarSubActivity.onDestroy();
                super.onDestroy();
            } catch (Exception e) {
                Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onDestroy() failed", e);
                super.onDestroy();
            }
        } catch (Throwable th) {
            super.onDestroy();
            throw th;
        }
    }

    @Override // android.app.Activity
    public void onBackPressed() {
        try {
            this._getJarSubActivity.onBackPressed();
        } catch (Exception e) {
            Logger.e(Area.UI.value(), "GetJarActivity: onBackPressed() failed", e);
        }
    }

    @Override // android.app.Activity
    protected void onActivityResult(int requestCode, int resultCode, Intent data) {
        super.onActivityResult(requestCode, resultCode, data);
        this._getJarSubActivity.onActivityResult(requestCode, resultCode, data);
    }

    @Override // android.app.Activity
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        try {
            this._getJarSubActivity.onSaveInstanceState(outState);
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onSaveInstanceState() failed", e);
        }
    }

    @Override // android.app.Activity, android.content.ComponentCallbacks
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        try {
            this._getJarSubActivity.onConfigurationChanged(newConfig);
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.UI.value(), "GetJarActivity: onConfigurationChanged() failed", e);
        }
    }
}
