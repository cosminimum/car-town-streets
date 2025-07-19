.class Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
.super Ljava/lang/Object;
.source "AndroidAccountUserAuthProvider.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AndroidAccountResolver"
.end annotation


# instance fields
.field private _accountNameFromUI:Ljava/lang/String;

.field private volatile _asyncAccountResolutionMonitorObject:Ljava/lang/Object;

.field private volatile _asyncAccountResolutionWasSignalled:Z

.field private volatile _asyncDialogCreationMonitorObject:Ljava/lang/Object;

.field private volatile _asyncDialogCreationWasSignalled:Z

.field private _createdDialog:Landroid/app/AlertDialog;

.field final synthetic this$0:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 555
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->this$0:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 560
    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    .line 561
    iput-boolean v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionWasSignalled:Z

    .line 562
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionMonitorObject:Ljava/lang/Object;

    .line 564
    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_createdDialog:Landroid/app/AlertDialog;

    .line 565
    iput-boolean v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationWasSignalled:Z

    .line 566
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationMonitorObject:Ljava/lang/Object;

    .line 555
    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;
    .param p2, "x1"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$1;

    .prologue
    .line 553
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;)V

    return-void
.end method

.method static synthetic access$100(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 553
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getCachedAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$1002(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/app/AlertDialog;)Landroid/app/AlertDialog;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Landroid/app/AlertDialog;

    .prologue
    .line 553
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_createdDialog:Landroid/app/AlertDialog;

    return-object p1
.end method

.method static synthetic access$1100(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    .prologue
    .line 553
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncDialogCreationNotify()V

    return-void
.end method

.method static synthetic access$200(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "x2"    # Ljava/lang/CharSequence;

    .prologue
    .line 553
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->validateAccountAgainstCache(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$300(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 553
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getAndroidAccountNameViaHint(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Landroid/accounts/Account;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 553
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getAndroidAccountFromName(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Landroid/accounts/Account;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    .prologue
    .line 553
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getAndroidAccountNameViaUI(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$700(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;

    .prologue
    .line 553
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncAccountResolutionNotify()V

    return-void
.end method

.method static synthetic access$800(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "x2"    # Ljava/lang/CharSequence;

    .prologue
    .line 553
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->accountResolved(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$900(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Ljava/lang/CharSequence;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;
    .param p1, "x1"    # Ljava/lang/CharSequence;
    .param p2, "x2"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 553
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->accountSelected(Ljava/lang/CharSequence;Lcom/getjar/sdk/comm/CommContext;)V

    return-void
.end method

.method private declared-synchronized accountResolved(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V
    .locals 7
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "accountName"    # Ljava/lang/CharSequence;

    .prologue
    .line 875
    monitor-enter p0

    if-eqz p2, :cond_0

    .line 876
    :try_start_0
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    .line 877
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "AuthFlow: AndroidAccountResolver: accountResolved(): \'%1$s\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 884
    :try_start_1
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncAccountResolutionNotify()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 885
    :goto_0
    monitor-exit p0

    return-void

    .line 879
    :cond_0
    const/4 v0, 0x0

    :try_start_2
    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    .line 880
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "AuthFlow: AndroidAccountResolver: accountResolved(): No account was resolved for use"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 884
    :try_start_3
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncAccountResolutionNotify()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 875
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 884
    :catchall_1
    move-exception v0

    :try_start_4
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncAccountResolutionNotify()V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0
.end method

.method private accountSelected(Ljava/lang/CharSequence;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 3
    .param p1, "accountName"    # Ljava/lang/CharSequence;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 835
    invoke-direct {p0, p2, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->accountResolved(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V

    .line 839
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$7;

    invoke-direct {v1, p0, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$7;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;)V

    const-string v2, "Refresh License Cache Thread"

    invoke-direct {v0, v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 863
    return-void
.end method

.method private asyncAccountResolutionNotify()V
    .locals 2

    .prologue
    .line 901
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionMonitorObject:Ljava/lang/Object;

    monitor-enter v1

    .line 902
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionWasSignalled:Z

    .line 903
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionMonitorObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 904
    monitor-exit v1

    .line 905
    return-void

    .line 904
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private asyncAccountResolutionWait()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 888
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionMonitorObject:Ljava/lang/Object;

    monitor-enter v2

    .line 889
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionWasSignalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 891
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionMonitorObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 892
    :catch_0
    move-exception v0

    .line 893
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 897
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 896
    :cond_0
    const/4 v1, 0x0

    :try_start_3
    iput-boolean v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncAccountResolutionWasSignalled:Z

    .line 897
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 898
    return-void
.end method

.method private asyncDialogCreationNotify()V
    .locals 2

    .prologue
    .line 823
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationMonitorObject:Ljava/lang/Object;

    monitor-enter v1

    .line 824
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationWasSignalled:Z

    .line 825
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationMonitorObject:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->notify()V

    .line 826
    monitor-exit v1

    .line 827
    return-void

    .line 826
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private asyncDialogCreationWait()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 810
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationMonitorObject:Ljava/lang/Object;

    monitor-enter v2

    .line 811
    :goto_0
    :try_start_0
    iget-boolean v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationWasSignalled:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 813
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationMonitorObject:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 814
    :catch_0
    move-exception v0

    .line 815
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 819
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    .line 818
    :cond_0
    const/4 v1, 0x0

    :try_start_3
    iput-boolean v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_asyncDialogCreationWasSignalled:Z

    .line 819
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 820
    return-void
.end method

.method private getAndroidAccountFromName(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)Landroid/accounts/Account;
    .locals 5
    .param p1, "accountName"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 574
    invoke-virtual {p2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAndroidAccounts(Landroid/content/Context;)[Landroid/accounts/Account;

    move-result-object v1

    .local v1, "arr$":[Landroid/accounts/Account;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v0, v1, v2

    .line 575
    .local v0, "account":Landroid/accounts/Account;
    iget-object v4, v0, Landroid/accounts/Account;->name:Ljava/lang/String;

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 579
    .end local v0    # "account":Landroid/accounts/Account;
    :goto_1
    return-object v0

    .line 574
    .restart local v0    # "account":Landroid/accounts/Account;
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 579
    .end local v0    # "account":Landroid/accounts/Account;
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method private getAndroidAccountNameViaHint(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/lang/String;
    .locals 3
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 619
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaHint() START"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 620
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 621
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerHint\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 622
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v2, "android_account.username_data_hash"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAccountNameFromHash(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getAndroidAccountNameViaUI(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Ljava/lang/String;
    .locals 11
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    .prologue
    const/4 v4, 0x0

    const/4 v9, 0x1

    const/4 v10, 0x0

    .line 630
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() START"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 633
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAndroidAccountNames(Landroid/content/Context;)[Ljava/lang/CharSequence;

    move-result-object v0

    .line 634
    .local v0, "accountNames":[Ljava/lang/CharSequence;
    array-length v5, v0

    if-ne v5, v9, :cond_0

    aget-object v5, v0, v10

    invoke-direct {p0, p1, v5}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->validateAccountAgainstCache(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 636
    aget-object v4, v0, v10

    invoke-direct {p0, p1, v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->accountResolved(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V

    .line 637
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    .line 683
    :goto_0
    return-object v4

    .line 641
    :cond_0
    if-eqz p2, :cond_5

    .line 642
    iput-object v4, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    .line 643
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getAndroidAccountUI(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Landroid/app/AlertDialog;

    move-result-object v1

    .line 644
    .local v1, "dialog":Landroid/app/AlertDialog;
    if-eqz v1, :cond_1

    .line 645
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 646
    .local v2, "dlgList":Ljava/util/List;, "Ljava/util/List<Landroid/app/Dialog;>;"
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 647
    invoke-interface {p2, v2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->takeoverUI(Ljava/util/List;)V

    .line 651
    .end local v2    # "dlgList":Ljava/util/List;, "Ljava/util/List<Landroid/app/Dialog;>;"
    :cond_1
    if-eqz v1, :cond_2

    .line 653
    :try_start_0
    new-instance v4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v5, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;

    invoke-direct {v5, p0, v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$1;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/app/AlertDialog;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 669
    :cond_2
    :try_start_1
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncAccountResolutionWait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 675
    if-eqz v1, :cond_3

    .line 676
    invoke-interface {p2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->relinquishUI()V

    .line 679
    :cond_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() FINISHED Returning %1$s"

    new-array v8, v9, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    aput-object v9, v8, v10

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 680
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_accountNameFromUI:Ljava/lang/String;

    goto :goto_0

    .line 670
    :catch_0
    move-exception v3

    .line 671
    .local v3, "e":Ljava/lang/InterruptedException;
    :try_start_2
    new-instance v4, Lcom/getjar/sdk/exceptions/AuthException;

    invoke-direct {v4, v3}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/Throwable;)V

    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 675
    .end local v3    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v4

    if-eqz v1, :cond_4

    .line 676
    invoke-interface {p2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->relinquishUI()V

    :cond_4
    throw v4

    .line 682
    .end local v1    # "dialog":Landroid/app/AlertDialog;
    :cond_5
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() FINISHED Returning NULL"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0
.end method

.method private getAndroidAccountUI(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Landroid/app/AlertDialog;
    .locals 10
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 694
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "AuthFlow: AndroidAccountResolver: getAndroidAccountUI() starting"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 695
    const/4 v2, 0x0

    .line 698
    .local v2, "resultDialog":Landroid/app/AlertDialog;
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAndroidAccountNames(Landroid/content/Context;)[Ljava/lang/CharSequence;

    move-result-object v3

    .line 700
    .local v3, "selectionItems":[Ljava/lang/CharSequence;
    if-eqz v3, :cond_0

    array-length v4, v3

    if-gtz v4, :cond_1

    .line 703
    :cond_0
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-interface {p2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->getParentActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 704
    .local v0, "builder":Landroid/app/AlertDialog$Builder;
    const-string v4, "You must create or sign in to a GMail account in order to use Getjar."

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 705
    new-instance v4, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;

    invoke-direct {v4, p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$2;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 714
    const-string v4, "OK"

    new-instance v5, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;

    invoke-direct {v5, p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$3;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V

    invoke-virtual {v0, v4, v5}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 728
    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getDialogInstance(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    move-result-object v2

    .line 766
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    :goto_0
    if-eqz v2, :cond_4

    .line 767
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "AuthFlow: AndroidAccountResolver: getAndroidAccountUI() returning an AlertDialog instance"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 771
    :goto_1
    return-object v2

    .line 730
    :cond_1
    array-length v4, v3

    if-ne v4, v9, :cond_2

    aget-object v4, v3, v8

    invoke-direct {p0, p1, v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->validateAccountAgainstCache(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 733
    aget-object v4, v3, v8

    invoke-direct {p0, p1, v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->accountResolved(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 738
    :cond_2
    invoke-interface {p2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->getTheTitle()Ljava/lang/String;

    move-result-object v1

    .line 739
    .local v1, "dialogTitle":Ljava/lang/String;
    array-length v4, v3

    if-ne v4, v9, :cond_3

    aget-object v4, v3, v8

    invoke-direct {p0, p1, v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->validateAccountAgainstCache(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 740
    const-string v1, "Account missing. Restore or pick new account."

    .line 744
    :cond_3
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-interface {p2}, Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;->getParentActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v0, v4}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 745
    .restart local v0    # "builder":Landroid/app/AlertDialog$Builder;
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    .line 746
    new-instance v4, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$4;

    invoke-direct {v4, p0, v3, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$4;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;[Ljava/lang/CharSequence;Lcom/getjar/sdk/comm/CommContext;)V

    invoke-virtual {v0, v3, v4}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    .line 754
    new-instance v4, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$5;

    invoke-direct {v4, p0, p1, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$5;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V

    invoke-virtual {v0, v4}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    .line 762
    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getDialogInstance(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;

    move-result-object v2

    goto :goto_0

    .line 769
    .end local v0    # "builder":Landroid/app/AlertDialog$Builder;
    .end local v1    # "dialogTitle":Ljava/lang/String;
    :cond_4
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "AuthFlow: AndroidAccountResolver: getAndroidAccountUI() returning null"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_1
.end method

.method private getCachedAccountName(Landroid/content/Context;)Ljava/lang/String;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 586
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->this$0:Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-static {v2, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->access$600(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;

    move-result-object v0

    .line 587
    .local v0, "cachedAccountData":Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 588
    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/UserAuthProviderAndDataCacheEntry;->getCachedProviderData()Ljava/util/HashMap;

    move-result-object v2

    const-string v3, "android.account.name"

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 589
    .local v1, "cachedAccountName":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 593
    .end local v1    # "cachedAccountName":Ljava/lang/String;
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private declared-synchronized getDialogInstance(Landroid/app/AlertDialog$Builder;)Landroid/app/AlertDialog;
    .locals 5
    .param p1, "builder"    # Landroid/app/AlertDialog$Builder;

    .prologue
    .line 779
    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: getDialogInstance() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 782
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_createdDialog:Landroid/app/AlertDialog;

    .line 783
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$6;

    invoke-direct {v2, p0, p1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver$6;-><init>(Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;Landroid/app/AlertDialog$Builder;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 801
    :try_start_1
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->asyncDialogCreationWait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 805
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "AuthFlow: AndroidAccountResolver: getDialogInstance() FINISHED"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 806
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->_createdDialog:Landroid/app/AlertDialog;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    monitor-exit p0

    return-object v1

    .line 802
    :catch_0
    move-exception v0

    .line 803
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v1, Lcom/getjar/sdk/exceptions/AuthException;

    invoke-direct {v1, v0}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/Throwable;)V

    throw v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 779
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method private validateAccountAgainstCache(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/CharSequence;)Z
    .locals 8
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "accountName"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 602
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider$AndroidAccountResolver;->getCachedAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 603
    .local v0, "cachedAccountName":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 604
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    or-long/2addr v3, v5

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "AuthFlow: AndroidAccountResolver: getAndroidAccountNameViaUI() cached account and available account do not match [cache:%1$s available:%2$s]"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    aput-object v0, v7, v1

    aput-object p2, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 610
    :goto_0
    return v1

    :cond_0
    move v1, v2

    goto :goto_0
.end method
