.class public Lcom/getjar/sdk/data/package_events/PackageEventManager;
.super Ljava/lang/Object;
.source "PackageEventManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;
    }
.end annotation


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/data/package_events/PackageEventManager;


# instance fields
.field private volatile _eventLock:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_eventLock:Ljava/lang/Object;

    .line 21
    invoke-static {p1}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->initialize(Landroid/content/Context;)V

    .line 22
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/package_events/PackageEventManager;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const-class v1, Lcom/getjar/sdk/data/package_events/PackageEventManager;

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

    .line 26
    :cond_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventManager;

    if-nez v0, :cond_1

    .line 27
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/data/package_events/PackageEventManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventManager;

    .line 29
    :cond_1
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_Instance:Lcom/getjar/sdk/data/package_events/PackageEventManager;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit v1

    return-object v0
.end method


# virtual methods
.method public logEvent(Ljava/lang/String;Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "eventType"    # Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    .prologue
    .line 39
    iget-object v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_eventLock:Ljava/lang/Object;

    monitor-enter v1

    .line 40
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->getInstance()Lcom/getjar/sdk/data/package_events/PackageEventDatabase;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/getjar/sdk/data/package_events/PackageEventDatabase;->addRecord(Ljava/lang/String;Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;)V

    .line 41
    monitor-exit v1

    .line 42
    return-void

    .line 41
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public sendUnsyncedEvents(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 49
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventManager;->_eventLock:Ljava/lang/Object;

    monitor-enter v1

    .line 51
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->getInstance(Lcom/getjar/sdk/comm/CommContext;)Lcom/getjar/sdk/data/package_events/PackageEventReporter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/data/package_events/PackageEventReporter;->sendUnsyncedData()V

    .line 52
    monitor-exit v1

    .line 53
    return-void

    .line 52
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method
