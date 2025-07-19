package com.getjar.sdk.rewards;

import android.os.Bundle;
import com.getjar.sdk.comm.CommContext;
import com.getjar.sdk.comm.CommManager;
import com.getjar.sdk.comm.auth.AuthManager;
import com.getjar.sdk.exceptions.AuthException;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.response.CloseResponse;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.GlobalActivityRegistrar;
import com.getjar.sdk.utilities.StringUtility;
import java.util.Locale;
/* loaded from: classes.dex */
public class GetJarUserAuthSubActivity extends GetJarSubActivityBase {
    private CommContext commContext;

    public GetJarUserAuthSubActivity(GetJarActivity getJarActivity) {
        super(getJarActivity);
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivityBase, com.getjar.sdk.rewards.GetJarSubActivity
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GlobalActivityRegistrar.getInstance().registerActivity(this.getJarActivity);
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivityBase, com.getjar.sdk.rewards.GetJarSubActivity
    public void onResume() {
        String authWithUiId = null;
        try {
            try {
                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() START");
                authWithUiId = this.getJarActivity.getIntent().getStringExtra(Constants.EXTRA_AUTH_WITH_UI_ID);
                if (!StringUtility.isNullOrEmpty(authWithUiId)) {
                    Logger.i(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "GetJarUserAuthSubActivity: onResume() authWithUiId: '%1$s'", authWithUiId));
                }
                CommManager.initialize(this.getJarActivity);
                String commContextId = this.getJarActivity.getIntent().getStringExtra(Constants.GETJAR_CONTEXT_ID_KEY);
                if (StringUtility.isNullOrEmpty(commContextId)) {
                    Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "The Intent used to start the GetJarActivity must contain a value for '%1$s' in its Extras", Constants.GETJAR_CONTEXT_ID_KEY));
                    this.getJarActivity.finish();
                    return;
                }
                this.commContext = CommManager.retrieveContext(commContextId);
                if (this.commContext == null) {
                    Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "No CommContext instance found for the ID '%1$s'", commContextId));
                    this.getJarActivity.finish();
                    try {
                        if (!StringUtility.isNullOrEmpty(authWithUiId)) {
                            AuthManager.initialize(this.commContext.getApplicationContext());
                            AuthManager.getInstance().observeAuthWithUiId(authWithUiId);
                        }
                        new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarUserAuthSubActivity.1
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    try {
                                        Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice START");
                                        AuthManager.initialize(GetJarUserAuthSubActivity.this.commContext.getApplicationContext());
                                        AuthManager.getInstance().waitOnAuth();
                                        Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                        GetJarUserAuthSubActivity.this.exitActivity();
                                    } catch (AuthException e) {
                                        Logger.w(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed [auth failed]");
                                        Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                        GetJarUserAuthSubActivity.this.exitActivity();
                                    } catch (Exception e2) {
                                        Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed", e2);
                                        Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                        GetJarUserAuthSubActivity.this.exitActivity();
                                    }
                                } catch (Throwable th) {
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                    throw th;
                                }
                            }
                        }, "GetJarUserAuthSubActivity Auth Wait Thread").start();
                    } catch (Exception e) {
                        Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread", e);
                        exitActivity();
                    }
                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() DONE");
                    return;
                }
                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), String.format(Locale.US, "GetJarUserAuthSubActivity: onResume() Using CommContext.ID: %1$s", this.commContext.getCommContextId()));
                waitDialogShow();
                this._waitDialogWasShowing = true;
                AuthManager.initialize(this.commContext.getApplicationContext());
                AuthManager.getInstance().ensureAuthWithUI(this);
                try {
                    if (!StringUtility.isNullOrEmpty(authWithUiId)) {
                        AuthManager.initialize(this.commContext.getApplicationContext());
                        AuthManager.getInstance().observeAuthWithUiId(authWithUiId);
                    }
                    new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarUserAuthSubActivity.1
                        @Override // java.lang.Runnable
                        public void run() {
                            try {
                                try {
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice START");
                                    AuthManager.initialize(GetJarUserAuthSubActivity.this.commContext.getApplicationContext());
                                    AuthManager.getInstance().waitOnAuth();
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                } catch (AuthException e2) {
                                    Logger.w(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed [auth failed]");
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                } catch (Exception e22) {
                                    Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed", e22);
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                }
                            } catch (Throwable th) {
                                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                GetJarUserAuthSubActivity.this.exitActivity();
                                throw th;
                            }
                        }
                    }, "GetJarUserAuthSubActivity Auth Wait Thread").start();
                } catch (Exception e2) {
                    Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread", e2);
                    exitActivity();
                }
                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() DONE");
            } finally {
                try {
                    if (!StringUtility.isNullOrEmpty(authWithUiId)) {
                        AuthManager.initialize(this.commContext.getApplicationContext());
                        AuthManager.getInstance().observeAuthWithUiId(authWithUiId);
                    }
                    new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarUserAuthSubActivity.1
                        @Override // java.lang.Runnable
                        public void run() {
                            try {
                                try {
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice START");
                                    AuthManager.initialize(GetJarUserAuthSubActivity.this.commContext.getApplicationContext());
                                    AuthManager.getInstance().waitOnAuth();
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                } catch (AuthException e22) {
                                    Logger.w(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed [auth failed]");
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                } catch (Exception e222) {
                                    Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed", e222);
                                    Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                    GetJarUserAuthSubActivity.this.exitActivity();
                                }
                            } catch (Throwable th) {
                                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                GetJarUserAuthSubActivity.this.exitActivity();
                                throw th;
                            }
                        }
                    }, "GetJarUserAuthSubActivity Auth Wait Thread").start();
                } catch (Exception e3) {
                    Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread", e3);
                    exitActivity();
                }
                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() DONE");
            }
        } catch (Exception e4) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() failed", e4);
            try {
                if (!StringUtility.isNullOrEmpty(authWithUiId)) {
                    AuthManager.initialize(this.commContext.getApplicationContext());
                    AuthManager.getInstance().observeAuthWithUiId(authWithUiId);
                }
                new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarUserAuthSubActivity.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            try {
                                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice START");
                                AuthManager.initialize(GetJarUserAuthSubActivity.this.commContext.getApplicationContext());
                                AuthManager.getInstance().waitOnAuth();
                                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                GetJarUserAuthSubActivity.this.exitActivity();
                            } catch (AuthException e22) {
                                Logger.w(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed [auth failed]");
                                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                GetJarUserAuthSubActivity.this.exitActivity();
                            } catch (Exception e222) {
                                Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice failed", e222);
                                Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                                GetJarUserAuthSubActivity.this.exitActivity();
                            }
                        } catch (Throwable th) {
                            Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: waitForUserDevice DONE");
                            GetJarUserAuthSubActivity.this.exitActivity();
                            throw th;
                        }
                    }
                }, "GetJarUserAuthSubActivity Auth Wait Thread").start();
            } catch (Exception e5) {
                Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() failed to start user auth wait thread", e5);
                exitActivity();
            }
            Logger.d(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: onResume() DONE");
        }
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivityBase, com.getjar.sdk.rewards.GetJarSubActivity
    public void onDestroy() {
        waitDialogHide();
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void exitActivity() {
        try {
            waitDialogHide();
            this.commContext.postResponse(new CloseResponse());
            this.getJarActivity.finish();
        } catch (Exception e) {
            Logger.e(Area.OS_ENTRY_POINT.value() | Area.AUTH.value() | Area.UI.value(), "GetJarUserAuthSubActivity: exitActivity() failed", e);
        }
    }
}
