.class public Lcom/getjar/sdk/data/install_state/InstallStateManager;
.super Ljava/lang/Object;
.source "InstallStateManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;
    }
.end annotation


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/install_state/InstallStateManager;


# instance fields
.field private final _context:Landroid/content/Context;

.field private volatile _installStateLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_installStateLock:Ljava/lang/Object;

    .line 28
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_context:Landroid/content/Context;

    .line 29
    invoke-static {p1}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->initialize(Landroid/content/Context;)V

    .line 30
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/install_state/InstallStateManager;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 33
    const-class v1, Lcom/getjar/sdk/data/install_state/InstallStateManager;

    monitor-enter v1

    if-nez p0, :cond_0

    :try_start_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'context\' cannot be NULL"

    invoke-direct {v0, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    .line 34
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateManager;

    if-nez v0, :cond_1

    .line 35
    new-instance v0, Lcom/getjar/sdk/data/install_state/InstallStateManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/install_state/InstallStateManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateManager;

    .line 37
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_Instance:Lcom/getjar/sdk/data/install_state/InstallStateManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method


# virtual methods
.method public sendCurrentStateDeltas(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 92
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_installStateLock:Ljava/lang/Object;

    monitor-enter v1

    .line 94
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->getInstance(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/data/install_state/InstallStateReporter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/install_state/InstallStateReporter;->sendUnsyncedData()V

    .line 95
    monitor-exit v1

    .line 96
    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public updateCurrentState()V
    .locals 11

    .prologue
    .line 53
    iget-object v7, p0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_installStateLock:Ljava/lang/Object;

    monitor-enter v7

    .line 56
    :try_start_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .local v2, "installedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v6, p0, Lcom/getjar/sdk/data/install_state/InstallStateManager;->_context:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    const/16 v8, 0x80

    invoke-virtual {v6, v8}, Landroid/content/pm/PackageManager;->getInstalledApplications(I)Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/pm/ApplicationInfo;

    .line 58
    .local v0, "appInfo":Landroid/content/pm/ApplicationInfo;
    iget-object v6, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v2, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 59
    iget-object v6, v0, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    invoke-interface {v2, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 84
    .end local v0    # "appInfo":Landroid/content/pm/ApplicationInfo;
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "installedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catchall_0
    move-exception v6

    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v6

    .line 64
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "installedPackageNames":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    :try_start_1
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 65
    .local v4, "packageNameToDBRecord":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/install_state/InstallStateRecord;>;"
    invoke-static {}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    move-result-object v6

    invoke-virtual {v6}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->loadAllRecords()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/data/install_state/InstallStateRecord;

    .line 66
    .local v5, "record":Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    invoke-virtual {v5}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 67
    invoke-virtual {v5}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v4, v6, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 72
    .end local v5    # "record":Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    :cond_3
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 73
    .local v3, "packageName":Ljava/lang/String;
    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 74
    invoke-static {}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->addRecord(Ljava/lang/String;)V

    goto :goto_2

    .line 79
    .end local v3    # "packageName":Ljava/lang/String;
    :cond_5
    invoke-interface {v4}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/data/install_state/InstallStateRecord;

    .line 80
    .restart local v5    # "record":Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    sget-object v6, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_INSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-virtual {v5}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getStatus()Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    move-result-object v8

    invoke-virtual {v6, v8}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-virtual {v5}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v2, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_6

    .line 81
    invoke-static {}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->getInstance()Lcom/getjar/sdk/data/install_state/InstallStateDatabase;

    move-result-object v6

    invoke-virtual {v5}, Lcom/getjar/sdk/data/install_state/InstallStateRecord;->getId()J

    move-result-wide v8

    sget-object v10, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-virtual {v6, v8, v9, v10}, Lcom/getjar/sdk/data/install_state/InstallStateDatabase;->updateState(JLcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;)V

    goto :goto_3

    .line 84
    .end local v5    # "record":Lcom/getjar/sdk/data/install_state/InstallStateRecord;
    :cond_7
    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 85
    return-void
.end method
