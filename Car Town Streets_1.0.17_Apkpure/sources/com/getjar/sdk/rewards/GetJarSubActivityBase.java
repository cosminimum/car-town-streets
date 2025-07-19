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
/* loaded from: classes.dex */
public abstract class GetJarSubActivityBase implements GetJarSubActivity {
    private static final Object dialogLock = new Object();
    protected GetJarActivity getJarActivity;
    protected boolean _isForeground = false;
    private ProgressDialog pleaseWaitDialog = null;
    private AlertDialog _unableToDownloadDialog = null;
    protected volatile Object _dialogsToManageLock = new Object();
    protected boolean _waitDialogWasShowing = false;
    private boolean _unableToDownloadDialogWasShowing = false;
    private Dialog _accountPickerDialog = null;
    private final LinkedBlockingQueue<DialogQueueMetadata> dialogQueue = new LinkedBlockingQueue<>();

    public GetJarSubActivityBase(GetJarActivity getJarActivity) {
        this.getJarActivity = getJarActivity;
    }

    @Override // com.getjar.sdk.comm.auth.AuthUIParentInterface
    public Activity getParentActivity() {
        return this.getJarActivity;
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
    }

    @Override // com.getjar.sdk.comm.auth.AuthUIParentInterface
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

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onNewIntent(Intent intent) {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onSaveInstanceState(Bundle outState) {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onCreate(Bundle savedInstanceState) {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onConfigurationChanged(Configuration newConfig) {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onPause() {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onResume() {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onDestroy() {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onBackPressed() {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void onSharedPreferenceChanged(SharedPreferences sharedPreferences, String key) {
    }

    @Override // com.getjar.sdk.rewards.GetJarSubActivity
    public void close() {
    }

    @Override // com.getjar.sdk.comm.auth.AuthUIParentInterface
    public void takeoverUI(final List<Dialog> dialogsToManage) {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.1
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (dialogsToManage == null || dialogsToManage.isEmpty()) {
                        GetJarSubActivityBase.this._accountPickerDialog = null;
                    } else {
                        GetJarSubActivityBase.this._accountPickerDialog = (Dialog) dialogsToManage.get(0);
                    }
                    Logger.v(Area.UI.value(), String.format(Locale.US, "AuthFlow: takeoverUI() BEFORE waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)));
                    if (GetJarSubActivityBase.this.getPleaseWaitDialog() == null || !GetJarSubActivityBase.this.getPleaseWaitDialog().isShowing()) {
                        if (GetJarSubActivityBase.this._unableToDownloadDialog != null && GetJarSubActivityBase.this._unableToDownloadDialog.isShowing()) {
                            GetJarSubActivityBase.this.unableToDownloadDialogHide();
                            GetJarSubActivityBase.this._unableToDownloadDialogWasShowing = true;
                        }
                    } else {
                        GetJarSubActivityBase.this.waitDialogHide();
                        GetJarSubActivityBase.this._waitDialogWasShowing = true;
                    }
                    Logger.v(Area.UI.value(), String.format(Locale.US, "AuthFlow: takeoverUI() AFTER waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)));
                } catch (Exception e) {
                    Logger.e(Area.UI.value(), "AuthFlow: takeoverUI() failed", e);
                }
            }
        });
    }

    @Override // com.getjar.sdk.comm.auth.AuthUIParentInterface
    public void relinquishUI() {
        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.2
            @Override // java.lang.Runnable
            public void run() {
                try {
                    Logger.v(Area.UI.value(), String.format(Locale.US, "AuthFlow: relinquishUI() BEFORE waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)));
                    if (!GetJarSubActivityBase.this._waitDialogWasShowing) {
                        if (GetJarSubActivityBase.this._unableToDownloadDialogWasShowing) {
                            GetJarSubActivityBase.this.unableToDownloadDialogShow();
                        }
                    } else {
                        GetJarSubActivityBase.this.waitDialogShow();
                    }
                    GetJarSubActivityBase.this._waitDialogWasShowing = false;
                    GetJarSubActivityBase.this._unableToDownloadDialogWasShowing = false;
                    Logger.v(Area.UI.value(), String.format(Locale.US, "AuthFlow: relinquishUI() AFTER waitDialogWasShowing:%1$s, unableToDownloadDialogWasShowing:%2$s", Boolean.valueOf(GetJarSubActivityBase.this._waitDialogWasShowing), Boolean.valueOf(GetJarSubActivityBase.this._unableToDownloadDialogWasShowing)));
                } catch (Exception e) {
                    Logger.e(Area.UI.value(), "AuthFlow: relinquishUI() failed", e);
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void unableToDownloadDialogShow() {
        Logger.d(Area.UI.value(), String.format(Locale.US, "Showing 'unable to download' dialog [thread:%1$d] [called-from:%2$s()]", Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(true, GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD));
            dialogShow();
        }
    }

    protected void unableToDownloadDialogHide() {
        Logger.d(Area.UI.value(), String.format(Locale.US, "Hiding 'unable to download' dialog [thread:%1$d] [called-from:%2$s()]", Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(false, GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD));
            this._unableToDownloadDialogWasShowing = false;
            dialogHide();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void waitDialogShow() {
        Logger.d(Area.UI.value(), String.format(Locale.US, "Showing 'please wait' dialog [thread:%1$d] [called-from:%2$s()]", Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(true, GetJarWebViewSubActivity.DialogType.WAIT));
            dialogShow();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void waitDialogHide() {
        Logger.d(Area.UI.value(), String.format(Locale.US, "Hiding 'please wait' dialog [thread:%1$d] [called-from:%2$s()]", Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        synchronized (dialogLock) {
            this.dialogQueue.add(new DialogQueueMetadata(false, GetJarWebViewSubActivity.DialogType.WAIT));
            this._waitDialogWasShowing = false;
            dialogHide();
        }
    }

    private void dialogShow() {
        new Thread(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.3
            @Override // java.lang.Runnable
            public void run() {
                try {
                    if (!GetJarSubActivityBase.this.iHaveWindowFocus()) {
                        Thread.sleep(200L);
                    }
                    if (GetJarSubActivityBase.this.iHaveWindowFocus()) {
                        new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.3.1
                            @Override // java.lang.Runnable
                            public void run() {
                                try {
                                    GetJarSubActivityBase.this.processWaitDialogQueue();
                                } catch (Exception e) {
                                    Logger.e(Area.UI.value(), "dialogShow() failed", e);
                                }
                            }
                        });
                    } else {
                        Logger.d(Area.UI.value(), "Skipping dialog show because Activity is not in the foreground");
                    }
                } catch (Exception e) {
                    Logger.e(Area.UI.value(), "dialogShow() failed", e);
                }
            }
        }, "dialogShow() thread").start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean iHaveWindowFocus() {
        try {
            boolean hasWindowFocus = this.getJarActivity.hasWindowFocus();
            return hasWindowFocus;
        } catch (RuntimeException e) {
            Logger.w(Area.UI.value(), "iHaveWindowFocus() failed", e);
            try {
                Thread.sleep(200L);
                return true;
            } catch (Exception e2) {
                return true;
            }
        }
    }

    private void dialogShowInternal(GetJarWebViewSubActivity.DialogType dialogType) {
        try {
            if (dialogType == null) {
                throw new IllegalArgumentException("'dialogType' can not be NULL");
            }
            if (GetJarWebViewSubActivity.DialogType.WAIT.equals(dialogType)) {
                createPleaseWaitProgressDialog();
                if (getPleaseWaitDialog() == null || getPleaseWaitDialog().isShowing()) {
                    return;
                }
                if (this._accountPickerDialog == null || !this._accountPickerDialog.isShowing()) {
                    getPleaseWaitDialog().show();
                }
            } else if (GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD.equals(dialogType)) {
                createUnableToDownloadDialog();
                if (this._unableToDownloadDialog != null && !this._unableToDownloadDialog.isShowing()) {
                    this._unableToDownloadDialog.show();
                }
            } else {
                throw new IllegalStateException(String.format(Locale.US, "Unrecognized dilaog type requested: %1$s", dialogType.name()));
            }
        } catch (Exception e) {
            Logger.e(Area.UI.value(), "dialogShowInternal() failed", e);
        }
    }

    private void dialogHide() {
        try {
            Logger.d(Area.UI.value(), "dialogHide start");
            if (!Utility.isCurrentThreadTheUIThread()) {
                new Handler(Looper.getMainLooper()).post(new Runnable() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.4
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            GetJarSubActivityBase.this.processWaitDialogQueue();
                        } catch (Exception e) {
                            Logger.e(Area.UI.value(), "dialogHide() failed", e);
                        }
                    }
                });
            } else {
                processWaitDialogQueue();
            }
        } catch (Exception e) {
            Logger.e(Area.UI.value(), "dialogHide() failed", e);
        }
    }

    private void dialogHideInternal(GetJarWebViewSubActivity.DialogType dialogType) {
        try {
            if (getPleaseWaitDialog() != null) {
                Logger.d(Area.UI.value(), "dialogType is WAIT and isShowing:" + getPleaseWaitDialog().isShowing());
                if (dialogType == null) {
                    throw new IllegalArgumentException("'dialogType' can not be NULL");
                }
                if (GetJarWebViewSubActivity.DialogType.WAIT.equals(dialogType)) {
                    if (getPleaseWaitDialog() != null && getPleaseWaitDialog().isShowing()) {
                        getPleaseWaitDialog().dismiss();
                    }
                } else if (GetJarWebViewSubActivity.DialogType.UNABLE_TO_DOWNLOAD.equals(dialogType)) {
                    if (this._unableToDownloadDialog != null && this._unableToDownloadDialog.isShowing()) {
                        this._unableToDownloadDialog.dismiss();
                    }
                } else {
                    throw new IllegalStateException(String.format(Locale.US, "Unrecognized dilaog type requested: %1$s", dialogType.name()));
                }
            }
        } catch (Exception e) {
            Logger.e(Area.UI.value(), "dialogHideInternal() failed", e);
        }
    }

    private void createPleaseWaitProgressDialog() {
        if (getPleaseWaitDialog() != null) {
            Logger.d(Area.UI.value(), "Please wait dialog not null. Creation cancelled");
            return;
        }
        Logger.d(Area.UI.value(), "Creating please wait dialog");
        ProgressDialog dialog = new ProgressDialog(this.getJarActivity);
        dialog.setProgressStyle(0);
        dialog.setMessage(Constants.WAIT_DIALOG_MSG);
        dialog.setIndeterminate(true);
        dialog.setCancelable(false);
        dialog.setButton(-2, "Cancel", new DialogInterface.OnClickListener() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.5
            @Override // android.content.DialogInterface.OnClickListener
            public void onClick(DialogInterface arg0, int arg1) {
                Logger.d(Area.UI.value(), "User clicked CANCEL");
                GetJarSubActivityBase.this.close();
            }
        });
        setPleaseWaitDialog(dialog);
    }

    private void createUnableToDownloadDialog() {
        if (this._unableToDownloadDialog == null) {
            AlertDialog.Builder builder = new AlertDialog.Builder(this.getJarActivity);
            builder.setMessage("Unable to download at this time. Please try again later.").setCancelable(false).setPositiveButton("OK", new DialogInterface.OnClickListener() { // from class: com.getjar.sdk.rewards.GetJarSubActivityBase.6
                @Override // android.content.DialogInterface.OnClickListener
                public void onClick(DialogInterface dialog, int id) {
                    dialog.dismiss();
                }
            });
            this._unableToDownloadDialog = builder.create();
            Logger.d(Area.UI.value(), "createUnableToDownloadDialog() finished");
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
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
        Logger.d(value, String.format(locale, "get please wait dialog() isNull: %3$s [thread:%1$d] [called-from:%2$s()]", objArr));
        return this.pleaseWaitDialog;
    }

    private void setPleaseWaitDialog(ProgressDialog pleaseWaitDialog) {
        boolean z = true;
        long value = Area.UI.value();
        Locale locale = Locale.US;
        Object[] objArr = new Object[3];
        objArr[0] = Long.valueOf(Thread.currentThread().getId());
        objArr[1] = Thread.currentThread().getStackTrace()[3].getMethodName();
        if (pleaseWaitDialog != null) {
            z = false;
        }
        objArr[2] = String.valueOf(z);
        Logger.d(value, String.format(locale, "set please wait dialog() isNull: %3$s [thread:%1$d] [called-from:%2$s()]", objArr));
        this.pleaseWaitDialog = pleaseWaitDialog;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void processWaitDialogQueue() {
        Logger.d(Area.UI.value(), String.format(Locale.US, "process wait dialog called: [thread:%1$d] [called-from:%2$s()]", Long.valueOf(Thread.currentThread().getId()), Thread.currentThread().getStackTrace()[3].getMethodName()));
        synchronized (dialogLock) {
            while (!this.dialogQueue.isEmpty()) {
                DialogQueueMetadata dialogMetadata = this.dialogQueue.remove();
                if (dialogMetadata.showDialog) {
                    dialogShowInternal(dialogMetadata.dialogType);
                } else {
                    dialogHideInternal(dialogMetadata.dialogType);
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class DialogQueueMetadata {
        GetJarWebViewSubActivity.DialogType dialogType;
        boolean showDialog;

        public DialogQueueMetadata(boolean showDialog, GetJarWebViewSubActivity.DialogType dialogType) {
            this.showDialog = showDialog;
            this.dialogType = dialogType;
        }
    }
}
