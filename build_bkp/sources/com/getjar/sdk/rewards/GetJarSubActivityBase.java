package com.getjar.sdk.rewards;

import android.app.Activity;
import android.app.AlertDialog;
import android.app.Dialog;
import android.app.ProgressDialog;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.res.Configuration;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import com.getjar.sdk.logging.Area;
import com.getjar.sdk.logging.Logger;
import com.getjar.sdk.rewards.GetJarWebViewSubActivity;
import com.getjar.sdk.utilities.Constants;
import com.getjar.sdk.utilities.StringUtility;
import com.getjar.sdk.utilities.Utility;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.LinkedBlockingQueue;

public abstract class GetJarSubActivityBase implements GetJarSubActivity {
    private static final Object dialogLock = new Object();
    /* access modifiers changed from: private */
    public Dialog _accountPickerDialog = null;
    protected volatile Object _dialogsToManageLock = new Object();
    protected boolean _isForeground = false;
    /* access modifiers changed from: private */
    public AlertDialog _unableToDownloadDialog = null;
    /* access modifiers changed from: private */
    public boolean _unableToDownloadDialogWasShowing = false;
    protected boolean _waitDialogWasShowing = false;
    private final LinkedBlockingQueue<DialogQueueMetadata> dialogQueue;
    protected GetJarActivity getJarActivity;
    private ProgressDialog pleaseWaitDialog = null;

    public GetJarSubActivityBase(GetJarActivity getJarActivity2) {
        this.getJarActivity = getJarActivity2;
        this.dialogQueue = new LinkedBlockingQueue<>();
    }

    public Activity getParentActivity() {
        return this.getJarActivity;
    }

    public void onActivityResult(int requestCode, int resultCode, Intent data) {
    }

    public String getTheTitle() {
        Intent intent = getParentActivity().getIntent();
        if (intent != null) {
            String temp = intent.getStringExtra(Constants.EXTRA_TITLE);
            if (!StringUtility.isNullOrEmpty(temp)) {
                return temp;
            }
        }
        return "Please select an account to use with Getjar.";
    }

    public void onNewIntent(Intent intent) {
    }

    public void onSaveInstanceState(Bundle outState) {
    }

    public void onCreate(Bundle savedInstanceState) {
    }

    public void onConfigurationChanged(Configuration newConfig) {
    }

    public void onPause() {
    }

    public void onResume() {
    }

    public void onDestroy() {
    }

    public void onBackPressed() {
    }

    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
    }

    public void close() {
    }

    public void takeoverUI(final List<Dialog> dialogsToManage) {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            public void run() {
                try {
                    if (dialogsToManage == null || dialogsToManage.isEmpty()) {
                        Dialog unused = GetJarSubActivityBase.this._accountPickerDialog = null;
                    } else {
                        Dialog unused2 = GetJarSubActivityBase.this._accountPickerDialog = (Dialog) dialogsToManage.get(0);
                    }
                    Logger.m646v(Area.UI.value(), String.format(Locale.US, "AuthFlow: takeoverUI() BEFORE waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", new Object[]{Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)}));
                    if (GetJarSubActivityBase.this.getPleaseWaitDialog() != null && GetJarSubActivityBase.this.getPleaseWaitDialog().isShowing()) {
                        GetJarSubActivityBase.this.waitDialogHide();
                        GetJarSubActivityBase.this._waitDialogWasShowing = true;
                    } else if (GetJarSubActivityBase.this._unableToDownloadDialog != null && GetJarSubActivityBase.this._unableToDownloadDialog.isShowing()) {
                        GetJarSubActivityBase.this.unableToDownloadDialogHide();
                        boolean unused3 = GetJarSubActivityBase.this._unableToDownloadDialogWasShowing = true;
                    }
                    Logger.m646v(Area.UI.value(), String.format(Locale.US, "AuthFlow: takeoverUI() AFTER waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", new Object[]{Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)}));
                } catch (Exception e) {
                    Logger.m643e(Area.UI.value(), "AuthFlow: takeoverUI() failed", e);
                }
            }
        });
    }

    public void relinquishUI() {
        new Handler(Looper.getMainLooper()).post(new Runnable() {
            public void run() {
                try {
                    Logger.m646v(Area.UI.value(), String.format(Locale.US, "AuthFlow: relinquishUI() BEFORE waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", new Object[]{Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)}));
                    if (GetJarSubActivityBase.this._waitDialogWasShowing) {
                        GetJarSubActivityBase.this.waitDialogShow();
                    } else if (GetJarSubActivityBase.this._unableToDownloadDialogWasShowing) {
                        GetJarSubActivityBase.this.unableToDownloadDialogShow();
                    }
                    GetJarSubActivityBase.this._waitDialogWasShowing = false;
                    boolean unused = GetJarSubActivityBase.this._unableToDownloadDialogWasShowing = false;
                    Logger.m646v(Area.UI.value(), String.format(Locale.US, "AuthFlow: relinquishUI() AFTER waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", new Object[]{Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)}));
                } catch (Exception e) {
                    Logger.m643e(Area.UI.value(), "AuthFlow: relinquishUI() failed", e);
                }
            }
        });
    }

    /* access modifiers changed from: protected */
    public void unableToDownloadDialogShow() {
        Logger.m640d(Area.UI.value(), String.format(Locale.US, "Showing 'unable to download' dialog [thread:%1$d] [called-from:%2$s()]", new Object[]{Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()}));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(true, GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD));
            dialogShow();
        }
    }

    /* access modifiers changed from: protected */
    public void unableToDownloadDialogHide() {
        Logger.m640d(Area.UI.value(), String.format(Locale.US, "Hiding 'unable to download' dialog [thread:%1$d] [called-from:%2$s()]", new Object[]{Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()}));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(false, GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD));
            this._unableToDownloadDialogWasShowing = false;
            dialogHide();
        }
    }

    /* access modifiers changed from: protected */
    public void waitDialogShow() {
        Logger.m640d(Area.UI.value(), String.format(Locale.US, "Showing 'please wait' dialog [thread:%1$d] [called-from:%2$s()]", new Object[]{Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()}));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(true, GetJarWebViewSubActivity.DialogType.WAIT));
            dialogShow();
        }
    }

    /* access modifiers changed from: protected */
    public void waitDialogHide() {
        Logger.m640d(Area.UI.value(), String.format(Locale.US, "Hiding 'please wait' dialog [thread:%1$d] [called-from:%2$s()]", new Object[]{Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()}));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(false, GetJarWebViewSubActivity.DialogType.WAIT));
            this._waitDialogWasShowing = false;
            dialogHide();
        }
    }

    private void dialogShow() {
        new Thread(new Runnable() {
            public void run() {
                try {
                    if (!GetJarSubActivityBase.this.iHaveWindowFocus()) {
                        Thread.sleep(200);
                    }
                    if (GetJarSubActivityBase.this.iHaveWindowFocus()) {
                        new Handler(Looper.getMainLooper()).post(new Runnable() {
                            public void run() {
                                try {
                                    GetJarSubActivityBase.this.processWaitDialogQueue();
                                } catch (Exception e) {
                                    Logger.m643e(Area.UI.value(), "dialogShow() failed", e);
                                }
                            }
                        });
                    } else {
                        Logger.m640d(Area.UI.value(), "Skipping dialog show because Activity is not in the foreground");
                    }
                } catch (Exception e) {
                    Logger.m643e(Area.UI.value(), "dialogShow() failed", e);
                }
            }
        }, "dialogShow() thread").start();
    }

    /* access modifiers changed from: private */
    public boolean iHaveWindowFocus() {
        try {
            return this.getJarActivity.hasWindowFocus();
        } catch (RuntimeException e) {
            Logger.m649w(Area.UI.value(), "iHaveWindowFocus() failed", e);
            try {
                Thread.sleep(200);
                return true;
            } catch (Exception e2) {
                return true;
            }
        }
    }

    private void dialogShowInternal(GetJarWebViewSubActivity.DialogType dialogType) {
        if (dialogType == null) {
            try {
                throw new IllegalArgumentException("'dialogType' can not be NULL");
            } catch (Exception e) {
                Logger.m643e(Area.UI.value(), "dialogShowInternal() failed", e);
            }
        } else if (GetJarWebViewSubActivity.DialogType.WAIT.equals(dialogType)) {
            createPleaseWaitProgressDialog();
            if (getPleaseWaitDialog() != null && !getPleaseWaitDialog().isShowing()) {
                if (this._accountPickerDialog == null || !this._accountPickerDialog.isShowing()) {
                    getPleaseWaitDialog().show();
                }
            }
        } else if (GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD.equals(dialogType)) {
            createUnableToDownloadDialog();
            if (this._unableToDownloadDialog != null && !this._unableToDownloadDialog.isShowing()) {
                this._unableToDownloadDialog.show();
            }
        } else {
            throw new IllegalStateException(String.format(Locale.US, "Unrecognized dilaog type requested: %1$s", new Object[]{dialogType.name()}));
        }
    }

    private void dialogHide() {
        try {
            Logger.m640d(Area.UI.value(), "dialogHide start");
            if (!Utility.isCurrentThreadTheUIThread()) {
                new Handler(Looper.getMainLooper()).post(new Runnable() {
                    public void run() {
                        try {
                            GetJarSubActivityBase.this.processWaitDialogQueue();
                        } catch (Exception e) {
                            Logger.m643e(Area.UI.value(), "dialogHide() failed", e);
                        }
                    }
                });
            } else {
                processWaitDialogQueue();
            }
        } catch (Exception e) {
            Logger.m643e(Area.UI.value(), "dialogHide() failed", e);
        }
    }

    private void dialogHideInternal(GetJarWebViewSubActivity.DialogType dialogType) {
        try {
            if (getPleaseWaitDialog() != null) {
                Logger.m640d(Area.UI.value(), "dialogType is WAIT and isShowing:" + getPleaseWaitDialog().isShowing());
                if (dialogType == null) {
                    throw new IllegalArgumentException("'dialogType' can not be NULL");
                } else if (GetJarWebViewSubActivity.DialogType.WAIT.equals(dialogType)) {
                    if (getPleaseWaitDialog() != null && getPleaseWaitDialog().isShowing()) {
                        getPleaseWaitDialog().dismiss();
                    }
                } else if (!GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD.equals(dialogType)) {
                    throw new IllegalStateException(String.format(Locale.US, "Unrecognized dilaog type requested: %1$s", new Object[]{dialogType.name()}));
                } else if (this._unableToDownloadDialog != null && this._unableToDownloadDialog.isShowing()) {
                    this._unableToDownloadDialog.dismiss();
                }
            }
        } catch (Exception e) {
            Logger.m643e(Area.UI.value(), "dialogHideInternal() failed", e);
        }
    }

    private void createPleaseWaitProgressDialog() {
        if (getPleaseWaitDialog() != null) {
            Logger.m640d(Area.UI.value(), "Please wait dialog not null. Creation cancelled");
            return;
        }
        Logger.m640d(Area.UI.value(), "Creating please wait dialog");
        ProgressDialog dialog = new ProgressDialog(this.getJarActivity);
        dialog.setProgressStyle(0);
        dialog.setMessage(Constants.WAIT_DIALOG_MSG);
        dialog.setIndeterminate(true);
        dialog.setCancelable(false);
        dialog.setButton(-2, "Cancel", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface arg0, int arg1) {
                Logger.m640d(Area.UI.value(), "User clicked CANCEL");
                GetJarSubActivityBase.this.close();
            }
        });
        setPleaseWaitDialog(dialog);
    }

    private void createUnableToDownloadDialog() {
        if (this._unableToDownloadDialog == null) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this.getJarActivity);
            builder.setMessage("Unable to download at this time. Please try again later.").setCancelable(false).setPositiveButton("OK", new DialogInterface.OnClickListener() {
                public void onClick(DialogInterface dialog, int id) {
                    dialog.dismiss();
                }
            });
            this._unableToDownloadDialog = builder.create();
            Logger.m640d(Area.UI.value(), "createUnableToDownloadDialog() finished");
        }
    }

    /* access modifiers changed from: private */
    public ProgressDialog getPleaseWaitDialog() {
        boolean z = true;
        long value = Area.UI.value();
        Locale locale = Locale.US;
        Object[] objArr = new Object[3];
        objArr[0] = Long.valueOf(Thread.currentThread().getId());
        objArr[1] = Thread.currentThread().getStackTrace()[3].getMethodName();
        if (this.pleaseWaitDialog != null) {
            z = false;
        }
        objArr[2] = String.valueOf(z);
        Logger.m640d(value, String.format(locale, "get please wait dialog() isNull: %3$s [thread:%1$d] [called-from:%2$s()]", objArr));
        return this.pleaseWaitDialog;
    }

    private void setPleaseWaitDialog(ProgressDialog pleaseWaitDialog2) {
        boolean z = true;
        long value = Area.UI.value();
        Locale locale = Locale.US;
        Object[] objArr = new Object[3];
        objArr[0] = Long.valueOf(Thread.currentThread().getId());
        objArr[1] = Thread.currentThread().getStackTrace()[3].getMethodName();
        if (pleaseWaitDialog2 != null) {
            z = false;
        }
        objArr[2] = String.valueOf(z);
        Logger.m640d(value, String.format(locale, "set please wait dialog() isNull: %3$s [thread:%1$d] [called-from:%2$s()]", objArr));
        this.pleaseWaitDialog = pleaseWaitDialog2;
    }

    /* access modifiers changed from: private */
    public void processWaitDialogQueue() {
        Logger.m640d(Area.UI.value(), String.format(Locale.US, "process wait dialog called: [thread:%1$d] [called-from:%2$s()]", new Object[]{Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()}));
        synchronized (dialogLock) {
            while (!this.dialogQueue.isEmpty()) {
                DialogQueueMetadata dialogMetadata = (DialogQueueMetadata) this.dialogQueue.remove();
                if (dialogMetadata.showDialog) {
                    dialogShowInternal(dialogMetadata.dialogType);
                } else {
                    dialogHideInternal(dialogMetadata.dialogType);
                }
            }
        }
    }

    private class DialogQueueMetadata {
        GetJarWebViewSubActivity.DialogType dialogType;
        boolean showDialog;

        public DialogQueueMetadata(boolean showDialog2, GetJarWebViewSubActivity.DialogType dialogType2) {
            this.showDialog = showDialog2;
            this.dialogType = dialogType2;
        }
    }
}
