.class public abstract Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Lcom/getjar/sdk/rewards/GetJarSubActivity;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;
    }
.end annotation


# static fields
.field private static final dialogLock:Ljava/lang/Object;


# instance fields
.field private _accountPickerDialog:Landroid/app/Dialog;

.field protected volatile _dialogsToManageLock:Ljava/lang/Object;

.field protected _isForeground:Z

.field private _unableToDownloadDialog:Landroid/app/AlertDialog;

.field private _unableToDownloadDialogWasShowing:Z

.field protected _waitDialogWasShowing:Z

.field private final dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/LinkedBlockingQueue",
            "<",
            "Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;",
            ">;"
        }
    .end annotation
.end field

.field protected getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

.field private pleaseWaitDialog:Landroid/app/ProgressDialog;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/rewards/GetJarActivity;)V
    .locals 3
    .param p1, "getJarActivity"    # Lcom/getjar/sdk/rewards/GetJarActivity;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_isForeground:Z

    .line 107
    iput-object v2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->pleaseWaitDialog:Landroid/app/ProgressDialog;

    .line 108
    iput-object v2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    .line 109
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_dialogsToManageLock:Ljava/lang/Object;

    .line 110
    iput-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    .line 111
    iput-boolean v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialogWasShowing:Z

    .line 112
    iput-object v2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_accountPickerDialog:Landroid/app/Dialog;

    .line 39
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    .line 40
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 41
    return-void
.end method

.method static synthetic access$002(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Landroid/app/Dialog;)Landroid/app/Dialog;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
    .param p1, "x1"    # Landroid/app/Dialog;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_accountPickerDialog:Landroid/app/Dialog;

    return-object p1
.end method

.method static synthetic access$100(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    .prologue
    .line 28
    iget-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialogWasShowing:Z

    return v0
.end method

.method static synthetic access$102(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;
    .param p1, "x1"    # Z

    .prologue
    .line 28
    iput-boolean p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialogWasShowing:Z

    return p1
.end method

.method static synthetic access$200(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Landroid/app/ProgressDialog;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Landroid/app/AlertDialog;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->iHaveWindowFocus()Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->processWaitDialogQueue()V

    return-void
.end method

.method private createPleaseWaitProgressDialog()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 391
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v0

    .line 392
    .local v0, "dialog":Landroid/app/ProgressDialog;
    if-eqz v0, :cond_0

    .line 393
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Please wait dialog not null. Creation cancelled"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 415
    :goto_0
    return-void

    .line 396
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Creating please wait dialog"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 401
    new-instance v0, Landroid/app/ProgressDialog;

    .end local v0    # "dialog":Landroid/app/ProgressDialog;
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 402
    .restart local v0    # "dialog":Landroid/app/ProgressDialog;
    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    .line 403
    const-string v1, "Please wait..."

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 404
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setIndeterminate(Z)V

    .line 405
    invoke-virtual {v0, v4}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 406
    const/4 v1, -0x2

    const-string v2, "Cancel"

    new-instance v3, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$5;

    invoke-direct {v3, p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$5;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/app/ProgressDialog;->setButton(ILjava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)V

    .line 414
    invoke-direct {p0, v0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->setPleaseWaitDialog(Landroid/app/ProgressDialog;)V

    goto :goto_0
.end method

.method private createUnableToDownloadDialog()V
    .locals 4

    .prologue
    .line 418
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    .line 430
    :goto_0
    return-void

    .line 421
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 422
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v1, "Unable to download at this time. Please try again later."

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string v2, "OK"

    new-instance v3, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$6;

    invoke-direct {v3, p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$6;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 428
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    .line 429
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "createUnableToDownloadDialog() finished"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private dialogHide()V
    .locals 4

    .prologue
    .line 338
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogHide start"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 340
    invoke-static {}, Lcom/getjar/sdk/utilities/Utility;->isCurrentThreadTheUIThread()Z

    move-result v1

    if-nez v1, :cond_0

    .line 342
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$4;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$4;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 364
    :goto_0
    return-void

    .line 358
    :cond_0
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->processWaitDialogQueue()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 361
    :catch_0
    move-exception v0

    .line 362
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogHide() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private dialogHideInternal(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V
    .locals 7
    .param p1, "dialogType"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    .prologue
    .line 369
    :try_start_0
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 370
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "dialogType is WAIT and isShowing:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v4

    invoke-virtual {v4}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 371
    if-nez p1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'dialogType\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 384
    :catch_0
    move-exception v0

    .line 385
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogHideInternal() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 387
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void

    .line 372
    :cond_1
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 373
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 374
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->dismiss()V

    goto :goto_0

    .line 376
    :cond_2
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 377
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 378
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->dismiss()V

    goto :goto_0

    .line 381
    :cond_3
    new-instance v1, Ljava/lang/IllegalStateException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Unrecognized dilaog type requested: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method private dialogShow()V
    .locals 3

    .prologue
    .line 243
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;

    invoke-direct {v1, p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V

    const-string v2, "dialogShow() thread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 285
    return-void
.end method

.method private dialogShowInternal(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V
    .locals 7
    .param p1, "dialogType"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    .prologue
    .line 314
    if-nez p1, :cond_1

    :try_start_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'dialogType\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 329
    :catch_0
    move-exception v0

    .line 330
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogShowInternal() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 332
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    :goto_0
    return-void

    .line 315
    :cond_1
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 316
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->createPleaseWaitProgressDialog()V

    .line 317
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_accountPickerDialog:Landroid/app/Dialog;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_accountPickerDialog:Landroid/app/Dialog;

    invoke-virtual {v1}, Landroid/app/Dialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 318
    :cond_2
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getPleaseWaitDialog()Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    goto :goto_0

    .line 320
    :cond_3
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 321
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->createUnableToDownloadDialog()V

    .line 322
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->isShowing()Z

    move-result v1

    if-nez v1, :cond_0

    .line 323
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialog:Landroid/app/AlertDialog;

    invoke-virtual {v1}, Landroid/app/AlertDialog;->show()V

    goto :goto_0

    .line 326
    :cond_4
    new-instance v1, Ljava/lang/IllegalStateException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Unrecognized dilaog type requested: %1$s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {p1}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->name()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
.end method

.method private getPleaseWaitDialog()Landroid/app/ProgressDialog;
    .locals 10

    .prologue
    const/4 v9, 0x3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 436
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "get please wait dialog() isNull: %3$s [thread:%1$d] [called-from:%2$s()]"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v7

    aget-object v7, v7, v9

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v0

    const/4 v7, 0x2

    iget-object v8, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->pleaseWaitDialog:Landroid/app/ProgressDialog;

    if-nez v8, :cond_0

    :goto_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 441
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->pleaseWaitDialog:Landroid/app/ProgressDialog;

    return-object v0

    :cond_0
    move v0, v1

    .line 436
    goto :goto_0
.end method

.method private iHaveWindowFocus()Z
    .locals 5

    .prologue
    .line 297
    const/4 v1, 0x1

    .line 299
    .local v1, "hasWindowFocus":Z
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GetJarActivity;->hasWindowFocus()Z
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 308
    :goto_0
    return v1

    .line 300
    :catch_0
    move-exception v0

    .line 303
    .local v0, "e":Ljava/lang/RuntimeException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "iHaveWindowFocus() failed"

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 306
    const-wide/16 v2, 0xc8

    :try_start_1
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_1
    move-exception v2

    goto :goto_0
.end method

.method private processWaitDialogQueue()V
    .locals 9

    .prologue
    .line 459
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "process wait dialog called: [thread:%1$d] [called-from:%2$s()]"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v7

    const/4 v8, 0x3

    aget-object v7, v7, v8

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 466
    sget-object v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogLock:Ljava/lang/Object;

    monitor-enter v2

    .line 468
    :goto_0
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    .line 469
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;

    .line 471
    .local v0, "dialogMetadata":Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;
    iget-boolean v1, v0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;->showDialog:Z

    if-eqz v1, :cond_0

    .line 472
    iget-object v1, v0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;->dialogType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-direct {p0, v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogShowInternal(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V

    goto :goto_0

    .line 477
    .end local v0    # "dialogMetadata":Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 474
    .restart local v0    # "dialogMetadata":Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;
    :cond_0
    :try_start_1
    iget-object v1, v0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;->dialogType:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-direct {p0, v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogHideInternal(Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V

    goto :goto_0

    .line 477
    .end local v0    # "dialogMetadata":Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;
    :cond_1
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 478
    return-void
.end method

.method private setPleaseWaitDialog(Landroid/app/ProgressDialog;)V
    .locals 10
    .param p1, "pleaseWaitDialog"    # Landroid/app/ProgressDialog;

    .prologue
    const/4 v9, 0x3

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 448
    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "set please wait dialog() isNull: %3$s [thread:%1$d] [called-from:%2$s()]"

    new-array v6, v9, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v7

    aget-object v7, v7, v9

    invoke-virtual {v7}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v0

    const/4 v7, 0x2

    if-nez p1, :cond_0

    :goto_0
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v0

    aput-object v0, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 454
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->pleaseWaitDialog:Landroid/app/ProgressDialog;

    .line 455
    return-void

    :cond_0
    move v0, v1

    .line 448
    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 0

    .prologue
    .line 101
    return-void
.end method

.method public getParentActivity()Landroid/app/Activity;
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getJarActivity:Lcom/getjar/sdk/rewards/GetJarActivity;

    return-object v0
.end method

.method public getTheTitle()Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    invoke-virtual {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->getParentActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    .line 62
    .local v0, "intent":Landroid/content/Intent;
    if-eqz v0, :cond_0

    .line 64
    const-string v2, "theTitle"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 65
    .local v1, "temp":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 70
    .end local v1    # "temp":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const-string v1, "Please select an account to use with Getjar."

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 0
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 54
    return-void
.end method

.method public onBackPressed()V
    .locals 0

    .prologue
    .line 95
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 83
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 80
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 92
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 74
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 86
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 89
    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "outState"    # Landroid/os/Bundle;

    .prologue
    .line 77
    return-void
.end method

.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .locals 0
    .param p1, "sharedPreferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    .line 98
    return-void
.end method

.method public relinquishUI()V
    .locals 2

    .prologue
    .line 155
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;

    invoke-direct {v1, p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$2;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 185
    return-void
.end method

.method public takeoverUI(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Landroid/app/Dialog;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 116
    .local p1, "dialogsToManage":Ljava/util/List;, "Ljava/util/List<Landroid/app/Dialog;>;"
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;

    invoke-direct {v1, p0, p1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$1;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;Ljava/util/List;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 151
    return-void
.end method

.method protected unableToDownloadDialogHide()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 201
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Hiding \'unable to download\' dialog [thread:%1$d] [called-from:%2$s()]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    const/4 v7, 0x3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 206
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogLock:Ljava/lang/Object;

    monitor-enter v1

    .line 207
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;

    const/4 v3, 0x0

    sget-object v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-direct {v2, p0, v3, v4}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;ZLcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 208
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_unableToDownloadDialogWasShowing:Z

    .line 209
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogHide()V

    .line 210
    monitor-exit v1

    .line 212
    return-void

    .line 210
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected unableToDownloadDialogShow()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 189
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Showing \'unable to download\' dialog [thread:%1$d] [called-from:%2$s()]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    const/4 v6, 0x3

    aget-object v5, v5, v6

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 193
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogLock:Ljava/lang/Object;

    monitor-enter v1

    .line 194
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;

    const/4 v3, 0x1

    sget-object v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-direct {v2, p0, v3, v4}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;ZLcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 195
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogShow()V

    .line 196
    monitor-exit v1

    .line 197
    return-void

    .line 196
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected waitDialogHide()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 229
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Hiding \'please wait\' dialog [thread:%1$d] [called-from:%2$s()]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getId()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v7

    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v6

    const/4 v7, 0x3

    aget-object v6, v6, v7

    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 234
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogLock:Ljava/lang/Object;

    monitor-enter v1

    .line 235
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;

    const/4 v3, 0x0

    sget-object v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-direct {v2, p0, v3, v4}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;ZLcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 236
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->_waitDialogWasShowing:Z

    .line 237
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogHide()V

    .line 238
    monitor-exit v1

    .line 239
    return-void

    .line 238
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method protected waitDialogShow()V
    .locals 9

    .prologue
    const/4 v8, 0x1

    .line 216
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Showing \'please wait\' dialog [thread:%1$d] [called-from:%2$s()]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v5

    const/4 v6, 0x3

    aget-object v5, v5, v6

    invoke-virtual {v5}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 221
    sget-object v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogLock:Ljava/lang/Object;

    monitor-enter v1

    .line 222
    :try_start_0
    iget-object v0, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogQueue:Ljava/util/concurrent/LinkedBlockingQueue;

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;

    const/4 v3, 0x1

    sget-object v4, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-direct {v2, p0, v3, v4}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$DialogQueueMetadata;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;ZLcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;)V

    invoke-virtual {v0, v2}, Ljava/util/concurrent/LinkedBlockingQueue;->add(Ljava/lang/Object;)Z

    .line 223
    invoke-direct {p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogShow()V

    .line 224
    monitor-exit v1

    .line 225
    return-void

    .line 224
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
