.class public Lcom/getjar/sdk/comm/CommManager;
.super Ljava/lang/Object;
.source "CommManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;,
        Lcom/getjar/sdk/comm/CommManager$RequestCallable;,
        Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;,
        Lcom/getjar/sdk/comm/CommManager$LaunchWork;
    }
.end annotation


# static fields
.field public static final AuthProviderFilterDataKey:Ljava/lang/String; = "auth.provider_filter.data"

.field public static final AuthProviderFilterNameKey:Ljava/lang/String; = "auth.provider_filter.name"

.field private static _ActiveRequests:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation
.end field

.field private static final _CacheNamespace:Ljava/lang/String; = "commResultCache"

.field private static final _ConnectionTimeout:I = 0x7530

.field private static final _ExecutorService:Ljava/util/concurrent/ExecutorService;

.field private static final _ExecutorServiceForLaunchWork:Ljava/util/concurrent/ExecutorService;

.field private static _IdentifierToCommContextMap:Ljava/util/concurrent/ConcurrentHashMap; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentHashMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/CommContext;",
            ">;"
        }
    .end annotation
.end field

.field private static volatile _Instance:Lcom/getjar/sdk/comm/CommManager; = null

.field private static final _MaxNumberOfSimultaneousRequests:I = 0x2

.field private static volatile _RequestPipelineLock:Ljava/lang/Object; = null

.field private static _RequestQueue:Ljava/util/LinkedList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation
.end field

.field private static _RetryRequests:Ljava/util/ArrayList; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/comm/Operation;",
            ">;"
        }
    .end annotation
.end field

.field private static final _SocketTimeout:I = 0x7530

.field private static _WorkerThread:Ljava/lang/Thread;

.field private static _WorkerThreadLock:Ljava/lang/Object;

.field private static volatile _WorkerThreadStopping:Z


# instance fields
.field private final _cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

.field private final _context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 101
    sput-object v1, Lcom/getjar/sdk/comm/CommManager;->_Instance:Lcom/getjar/sdk/comm/CommManager;

    .line 124
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_IdentifierToCommContextMap:Ljava/util/concurrent/ConcurrentHashMap;

    .line 127
    sput-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    .line 128
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadLock:Ljava/lang/Object;

    .line 129
    const/4 v0, 0x0

    sput-boolean v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadStopping:Z

    .line 138
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 139
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_ExecutorServiceForLaunchWork:Ljava/util/concurrent/ExecutorService;

    .line 140
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_RequestQueue:Ljava/util/LinkedList;

    .line 141
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_ActiveRequests:Ljava/util/ArrayList;

    .line 142
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_RetryRequests:Ljava/util/ArrayList;

    .line 143
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 96
    :cond_0
    new-instance v0, Lcom/getjar/sdk/comm/ResultCachingManager;

    const-string v1, "commResultCache"

    invoke-direct {v0, p1, v1}, Lcom/getjar/sdk/comm/ResultCachingManager;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/getjar/sdk/comm/CommManager;->_cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

    .line 97
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommManager;->_context:Landroid/content/Context;

    .line 98
    invoke-static {p1}, Lcom/getjar/sdk/utilities/OverridesUtility;->initialize(Landroid/content/Context;)V

    .line 99
    invoke-direct {p0}, Lcom/getjar/sdk/comm/CommManager;->startWorker()V

    .line 100
    return-void
.end method

.method static synthetic access$1000()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_RetryRequests:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$1100(Lcom/getjar/sdk/comm/CommManager;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/CommManager;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommManager;->_context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$1200()Z
    .locals 1

    .prologue
    .line 80
    sget-boolean v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadStopping:Z

    return v0
.end method

.method static synthetic access$1300()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/getjar/sdk/comm/CommManager;)Lcom/getjar/sdk/comm/ResultCachingManager;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/CommManager;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/getjar/sdk/comm/CommManager;->_cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

    return-object v0
.end method

.method static synthetic access$1500(Lcom/getjar/sdk/comm/CommManager;)J
    .locals 2
    .param p0, "x0"    # Lcom/getjar/sdk/comm/CommManager;

    .prologue
    .line 80
    invoke-direct {p0}, Lcom/getjar/sdk/comm/CommManager;->getSleepTime()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$200()Ljava/util/concurrent/ConcurrentHashMap;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_IdentifierToCommContextMap:Ljava/util/concurrent/ConcurrentHashMap;

    return-object v0
.end method

.method static synthetic access$300()Ljava/lang/String;
    .locals 1

    .prologue
    .line 80
    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/CommManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/CommManager;->processesRequestWithRetries(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$500(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 80
    invoke-static {p0}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$600()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$700(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/CommManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 80
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/CommManager;->updateOperationStateFromResult(Lcom/getjar/sdk/comm/Operation;)V

    return-void
.end method

.method static synthetic access$800()Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_ActiveRequests:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$900()Ljava/util/LinkedList;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_RequestQueue:Ljava/util/LinkedList;

    return-object v0
.end method

.method public static createContext(Ljava/lang/String;Landroid/content/Context;Landroid/content/Intent;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;
    .locals 10
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "androidContext"    # Landroid/content/Context;
    .param p2, "getjarIntent"    # Landroid/content/Intent;
    .param p3, "launchWork"    # Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .prologue
    const/4 v1, 0x0

    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 1077
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationKey\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1078
    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1079
    :cond_1
    if-nez p2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getjarIntent\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1080
    :cond_2
    const-string v0, "getjar"

    invoke-virtual {p2, v0, v5}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_3

    .line 1081
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getjarIntent\' does not apear to be a Getjar Intent (must contain GetJarManager.GetjarIntentKey with a value of TRUE)"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1085
    :cond_3
    const-string v0, "auth.provider_filter.name"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 1086
    .local v7, "providerFilter":Ljava/lang/String;
    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 1087
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "\'getjarIntent\' does not contain a valid provider filter [%1$s]"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v7, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1091
    :cond_4
    const-string v0, "auth.provider_filter.data"

    invoke-virtual {p2, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1092
    .local v8, "providerFilterData":Ljava/lang/String;
    invoke-static {v8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1093
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'getjarIntent\' does not contain provider filter data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1097
    :cond_5
    invoke-static {v8}, Lcom/getjar/sdk/comm/auth/ProviderHint;->parseData(Ljava/lang/String;)Ljava/util/HashMap;

    move-result-object v9

    .line 1098
    .local v9, "providerFilterDataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v9, :cond_6

    invoke-virtual {v9}, Ljava/util/HashMap;->size()I

    move-result v0

    if-gtz v0, :cond_7

    .line 1099
    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "\'getjarIntent\' does not contain provider filter data that can be parsed [%1$s]"

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v8, v3, v5

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1103
    :cond_7
    new-instance v4, Lcom/getjar/sdk/comm/auth/ProviderHint;

    invoke-direct {v4, v7, v9}, Lcom/getjar/sdk/comm/auth/ProviderHint;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .local v4, "providerHint":Lcom/getjar/sdk/comm/auth/ProviderHint;
    move-object v0, p0

    move-object v2, p1

    move-object v3, v1

    move-object v5, p3

    .line 1104
    invoke-static/range {v0 .. v5}, Lcom/getjar/sdk/comm/CommManager;->createContextInternal(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/auth/ProviderHint;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v6

    .line 1105
    .local v6, "newContext":Lcom/getjar/sdk/comm/CommContext;
    return-object v6
.end method

.method public static createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;
    .locals 7
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "androidContext"    # Landroid/content/Context;
    .param p2, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p3, "launchWork"    # Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .prologue
    const/4 v1, 0x0

    .line 1023
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationKey\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1024
    :cond_0
    if-nez p1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, v1

    move-object v5, p3

    .line 1026
    invoke-static/range {v0 .. v5}, Lcom/getjar/sdk/comm/CommManager;->createContextInternal(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/auth/ProviderHint;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v6

    .line 1027
    .local v6, "newContext":Lcom/getjar/sdk/comm/CommContext;
    return-object v6
.end method

.method public static createContext(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;
    .locals 7
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "encryptionKey"    # Ljava/lang/String;
    .param p2, "androidContext"    # Landroid/content/Context;
    .param p3, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p4, "launchWork"    # Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .prologue
    .line 1052
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'applicationKey\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1053
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'appEncryptionPublicKey\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1054
    :cond_1
    if-nez p2, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1056
    :cond_2
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-static/range {v0 .. v5}, Lcom/getjar/sdk/comm/CommManager;->createContextInternal(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/auth/ProviderHint;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v6

    .line 1057
    .local v6, "newContext":Lcom/getjar/sdk/comm/CommContext;
    return-object v6
.end method

.method public static createContextForAuth(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;
    .locals 10
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    const/4 v9, 0x3

    .line 978
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'androidContext\' can not be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 981
    :cond_0
    invoke-static {p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getApplicationKey()Ljava/lang/String;

    move-result-object v0

    .line 982
    .local v0, "applicationKey":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "\'applicationKey\' can not be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 985
    :cond_1
    new-instance v1, Lcom/getjar/sdk/comm/CommContext;

    new-instance v2, Landroid/os/ResultReceiver;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Landroid/os/ResultReceiver;-><init>(Landroid/os/Handler;)V

    invoke-direct {v1, v0, p0, v2}, Lcom/getjar/sdk/comm/CommContext;-><init>(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V

    .line 986
    .local v1, "newContext":Lcom/getjar/sdk/comm/CommContext;
    sget-object v2, Lcom/getjar/sdk/comm/CommManager;->_IdentifierToCommContextMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 989
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Created a NEW CommContext for Auth from %2$s.%3$s() [PID:%4$d] [AppKey:%5$s] [CommContext.Id:%6$s]"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v8

    aget-object v8, v8, v9

    invoke-virtual {v8}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v8

    aget-object v8, v8, v9

    invoke-virtual {v8}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    const/4 v7, 0x4

    aput-object v0, v6, v7

    const/4 v7, 0x5

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 999
    return-object v1
.end method

.method private static createContextInternal(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/auth/ProviderHint;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;
    .locals 12
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "encryptionKey"    # Ljava/lang/String;
    .param p2, "androidContext"    # Landroid/content/Context;
    .param p3, "resultReceiver"    # Landroid/os/ResultReceiver;
    .param p4, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .param p5, "launchWork"    # Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .prologue
    .line 1127
    invoke-static {p0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 1130
    invoke-static {p2}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/getjar/sdk/comm/auth/ApplicationKeyDatabase;->setApplicationKey(Ljava/lang/String;)V

    .line 1133
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%1$s Calling configureAppenders()"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1135
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/getjar/sdk/logging/Logger;->configureAppenders(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1141
    :goto_0
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%1$s Creating CommContext instance"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 1142
    const/4 v3, 0x0

    .line 1143
    .local v3, "newContext":Lcom/getjar/sdk/comm/CommContext;
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1144
    new-instance v3, Lcom/getjar/sdk/comm/CommContext;

    .end local v3    # "newContext":Lcom/getjar/sdk/comm/CommContext;
    invoke-direct {v3, p0, p2, p3}, Lcom/getjar/sdk/comm/CommContext;-><init>(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V

    .line 1148
    .restart local v3    # "newContext":Lcom/getjar/sdk/comm/CommContext;
    :goto_1
    sget-object v4, Lcom/getjar/sdk/comm/CommManager;->_IdentifierToCommContextMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Ljava/util/concurrent/ConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1151
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%1$s Created a NEW CommContext from %2$s.%3$s() [PID:%4$d] [AppToken:%5$s] [CommContext.Id:%6$s]"

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v10

    const/4 v11, 0x3

    aget-object v10, v10, v11

    invoke-virtual {v10}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v10

    const/4 v11, 0x3

    aget-object v10, v10, v11

    invoke-virtual {v10}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x3

    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    aput-object p0, v8, v9

    const/4 v9, 0x5

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 1164
    :try_start_1
    invoke-static {p2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 1165
    const/4 v1, 0x0

    .line 1166
    .local v1, "authStartedSuccessfully":Z
    if-nez p4, :cond_3

    .line 1167
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuth()Z

    move-result v1

    .line 1173
    :goto_2
    if-eqz v1, :cond_0

    sget-object v4, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    move-object/from16 v0, p5

    invoke-virtual {v4, v0}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 1174
    sget-object v4, Lcom/getjar/sdk/comm/CommManager;->_ExecutorServiceForLaunchWork:Ljava/util/concurrent/ExecutorService;

    new-instance v5, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;

    move-object/from16 v0, p5

    invoke-direct {v5, p0, p1, p2, v0}, Lcom/getjar/sdk/comm/CommManager$DoLaunchWork;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)V

    invoke-interface {v4, v5}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1184
    :cond_0
    sget-object v4, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    move-object/from16 v0, p5

    invoke-virtual {v4, v0}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v4, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->DEALS:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    move-object/from16 v0, p5

    invoke-virtual {v4, v0}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p2, v4}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1188
    invoke-static {}, Lcom/getjar/sdk/comm/NetworkStateReceiver;->getInstance()Lcom/getjar/sdk/comm/NetworkStateReceiver;

    move-result-object v4

    invoke-virtual {v4, p2}, Lcom/getjar/sdk/comm/NetworkStateReceiver;->registerReceiver(Landroid/content/Context;)V

    .line 1191
    :cond_1
    return-object v3

    .line 1136
    .end local v1    # "authStartedSuccessfully":Z
    .end local v3    # "newContext":Lcom/getjar/sdk/comm/CommContext;
    :catch_0
    move-exception v2

    .line 1137
    .local v2, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "configureAppenders() failed"

    invoke-static {v4, v5, v6, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 1146
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v3    # "newContext":Lcom/getjar/sdk/comm/CommContext;
    :cond_2
    new-instance v3, Lcom/getjar/sdk/comm/CommContext;

    .end local v3    # "newContext":Lcom/getjar/sdk/comm/CommContext;
    invoke-direct {v3, p0, p1, p2, p3}, Lcom/getjar/sdk/comm/CommContext;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)V

    .restart local v3    # "newContext":Lcom/getjar/sdk/comm/CommContext;
    goto/16 :goto_1

    .line 1169
    .restart local v1    # "authStartedSuccessfully":Z
    :cond_3
    :try_start_2
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    const/4 v5, 0x0

    move-object/from16 v0, p4

    invoke-virtual {v4, v0, v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthResetCurrent(Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    move-result v1

    goto :goto_2

    .line 1177
    .end local v1    # "authStartedSuccessfully":Z
    :catch_1
    move-exception v2

    .line 1178
    .local v2, "e":Ljava/lang/RuntimeException;
    throw v2

    .line 1179
    .end local v2    # "e":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v2

    .line 1180
    .local v2, "e":Ljava/lang/Exception;
    new-instance v4, Lcom/getjar/sdk/exceptions/AuthException;

    invoke-direct {v4, v2}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/Throwable;)V

    throw v4
.end method

.method private enqueueOperationForRetry(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Operation;
    .locals 2
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 205
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'operation\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 206
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v0

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v0, v1, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "enqueueOperationForRetry() can not be called on an operation that is not in the RETRYING state"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 207
    :cond_1
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/getjar/sdk/comm/CommManager;->enqueueRequest(Lcom/getjar/sdk/comm/Operation;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v0

    return-object v0
.end method

.method private enqueueRequest(Lcom/getjar/sdk/comm/Operation;Z)Lcom/getjar/sdk/comm/Operation;
    .locals 17
    .param p1, "newOperation"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "isRetry"    # Z

    .prologue
    .line 220
    if-nez p1, :cond_0

    new-instance v9, Ljava/lang/IllegalArgumentException;

    const-string v10, "\'newOperation\' can not be NULL"

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 221
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v9

    sget-object v10, Lcom/getjar/sdk/comm/Operation$Status;->CREATED:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v9, v10, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v9

    sget-object v10, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v9, v10, :cond_1

    .line 222
    new-instance v9, Ljava/lang/IllegalStateException;

    const-string v10, "enqueueRequest() can not be called on an operation that is not in the CREATED or RETRYING state"

    invoke-direct {v9, v10}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 225
    :cond_1
    const/4 v8, 0x0

    .line 226
    .local v8, "workPending":Z
    const/4 v7, 0x0

    .line 228
    .local v7, "returnOperation":Lcom/getjar/sdk/comm/Operation;
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v11, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v12, "%1$s Adding [isRetry:%2$s]"

    const/4 v13, 0x2

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v15

    aput-object v15, v13, v14

    const/4 v14, 0x1

    invoke-static/range {p2 .. p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v11, v12, v13}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v9, v10, v11}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 229
    sget-object v10, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    monitor-enter v10

    .line 231
    const/4 v2, 0x0

    .line 234
    .local v2, "existingOperation":Lcom/getjar/sdk/comm/Operation;
    :try_start_0
    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_ActiveRequests:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 235
    .local v3, "index":I
    if-ltz v3, :cond_4

    .line 236
    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_ActiveRequests:Ljava/util/ArrayList;

    invoke-virtual {v9, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Lcom/getjar/sdk/comm/Operation;

    move-object v2, v0

    .line 244
    :cond_2
    :goto_0
    if-eqz v2, :cond_6

    .line 247
    move-object v7, v2

    .line 248
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "%1$s Returning preexisting enqueued"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {v2}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v9, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 249
    .local v4, "logMsg":Ljava/lang/String;
    if-eqz p2, :cond_5

    .line 250
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    invoke-static {v11, v12, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 292
    .end local v4    # "logMsg":Ljava/lang/String;
    :goto_1
    if-eqz v8, :cond_3

    .line 293
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "%1$s kicking worker thread"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static {v7}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v9, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v11, v12, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 294
    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    invoke-virtual {v9}, Ljava/lang/Object;->notify()V

    .line 296
    :cond_3
    monitor-exit v10

    .line 298
    return-object v7

    .line 240
    :cond_4
    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_RequestQueue:Ljava/util/LinkedList;

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result v3

    .line 241
    if-ltz v3, :cond_2

    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_RequestQueue:Ljava/util/LinkedList;

    invoke-virtual {v9, v3}, Ljava/util/LinkedList;->get(I)Ljava/lang/Object;

    move-result-object v9

    move-object v0, v9

    check-cast v0, Lcom/getjar/sdk/comm/Operation;

    move-object v2, v0

    goto :goto_0

    .line 252
    .restart local v4    # "logMsg":Ljava/lang/String;
    :cond_5
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    invoke-static {v11, v12, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_1

    .line 296
    .end local v3    # "index":I
    .end local v4    # "logMsg":Ljava/lang/String;
    :catchall_0
    move-exception v9

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v9

    .line 259
    .restart local v3    # "index":I
    :cond_6
    const/4 v6, 0x0

    .line 260
    .local v6, "requestResult":Lcom/getjar/sdk/comm/Result;
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isDoNotCache()Z

    move-result v9

    if-nez v9, :cond_7

    .line 261
    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/CommManager;->_cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Lcom/getjar/sdk/comm/ResultCachingManager;->getRequestResult(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;

    move-result-object v6

    .line 263
    :cond_7
    if-eqz v6, :cond_9

    .line 264
    move-object/from16 v0, p1

    invoke-virtual {v0, v6}, Lcom/getjar/sdk/comm/Operation;->setResult(Lcom/getjar/sdk/comm/Result;)V

    .line 265
    sget-object v9, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 266
    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "%1$s Returning cached results"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v9, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 267
    .restart local v4    # "logMsg":Ljava/lang/String;
    if-eqz p2, :cond_8

    .line 268
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    invoke-static {v11, v12, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 288
    .end local v4    # "logMsg":Ljava/lang/String;
    :goto_2
    move-object/from16 v7, p1

    goto/16 :goto_1

    .line 270
    .restart local v4    # "logMsg":Ljava/lang/String;
    :cond_8
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    invoke-static {v11, v12, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_2

    .line 275
    .end local v4    # "logMsg":Ljava/lang/String;
    :cond_9
    new-instance v5, Ljava/util/concurrent/FutureTask;

    new-instance v9, Lcom/getjar/sdk/comm/CommManager$RequestCallable;

    const/4 v11, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v9, v0, v1, v11}, Lcom/getjar/sdk/comm/CommManager$RequestCallable;-><init>(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CommManager$1;)V

    invoke-direct {v5, v9}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 276
    .local v5, "requestFuture":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lcom/getjar/sdk/comm/Result;>;"
    move-object/from16 v0, p1

    invoke-virtual {v0, v5}, Lcom/getjar/sdk/comm/Operation;->setFuture(Ljava/util/concurrent/FutureTask;)V

    .line 277
    if-eqz p2, :cond_a

    .line 278
    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_RetryRequests:Ljava/util/ArrayList;

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 279
    sget-object v9, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 280
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "%1$s Returning new Request, added to retry pool"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v9, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v11, v12, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 286
    :goto_3
    const/4 v8, 0x1

    goto :goto_2

    .line 282
    :cond_a
    sget-object v9, Lcom/getjar/sdk/comm/CommManager;->_RequestQueue:Ljava/util/LinkedList;

    move-object/from16 v0, p1

    invoke-virtual {v9, v0}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 283
    sget-object v9, Lcom/getjar/sdk/comm/Operation$Status;->WAITING:Lcom/getjar/sdk/comm/Operation$Status;

    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 284
    sget-object v9, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v11

    sget-object v9, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v13, "%1$s Returning new Request, added to priority queue"

    const/4 v14, 0x1

    new-array v14, v14, [Ljava/lang/Object;

    const/4 v15, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v16

    aput-object v16, v14, v15

    invoke-static {v9, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v11, v12, v9}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/CommManager;
    .locals 2

    .prologue
    .line 114
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_Instance:Lcom/getjar/sdk/comm/CommManager;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "CommManager.initialize() must be called first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_Instance:Lcom/getjar/sdk/comm/CommManager;

    return-object v0
.end method

.method private static final getLoggingPrefix()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v3, 0x3

    .line 1334
    const-string v0, ""

    .line 1335
    .local v0, "methodName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 1336
    .local v1, "stackTrace":[Ljava/lang/StackTraceElement;
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lt v2, v3, :cond_0

    .line 1337
    aget-object v2, v1, v3

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 1339
    :cond_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "CommManager: %1$s() [thread:%2$d]"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2
.end method

.method private static final getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;
    .locals 10
    .param p0, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    const/4 v7, 0x3

    .line 1345
    const-string v0, ""

    .line 1346
    .local v0, "methodName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 1347
    .local v2, "stackTrace":[Ljava/lang/StackTraceElement;
    if-eqz v2, :cond_0

    array-length v3, v2

    if-lt v3, v7, :cond_0

    .line 1348
    aget-object v3, v2, v7

    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 1351
    :cond_0
    const-string v1, ""

    .line 1352
    .local v1, "requestId":Ljava/lang/String;
    if-eqz p0, :cond_1

    .line 1353
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, " [request:%1$d]"

    new-array v5, v9, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1356
    :cond_1
    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "CommManager: %1$s() [thread:%2$d]%3$s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object v0, v5, v8

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v9

    const/4 v6, 0x2

    aput-object v1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private getSleepTime()J
    .locals 15

    .prologue
    .line 948
    const-wide v6, 0x7fffffffffffffffL

    .line 949
    .local v6, "sleepTime":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 950
    .local v3, "now":J
    sget-object v8, Lcom/getjar/sdk/comm/CommManager;->_RetryRequests:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/comm/Operation;

    .line 951
    .local v5, "retryOperation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v5}, Lcom/getjar/sdk/comm/Operation;->getRetryAfterTimestamp()J

    move-result-wide v8

    sub-long v0, v8, v3

    .line 952
    .local v0, "delta":J
    cmp-long v8, v0, v6

    if-gez v8, :cond_0

    move-wide v6, v0

    goto :goto_0

    .line 954
    .end local v0    # "delta":J
    .end local v5    # "retryOperation":Lcom/getjar/sdk/comm/Operation;
    :cond_1
    const-wide/16 v8, 0xa

    cmp-long v8, v6, v8

    if-gez v8, :cond_2

    const-wide/16 v6, 0xa

    .line 955
    :cond_2
    const-wide v8, 0x7fffffffffffffffL

    cmp-long v8, v6, v8

    if-nez v8, :cond_3

    .line 956
    sget-object v8, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "%1$s returning a sleep time of MAX_VALUE"

    const/4 v12, 0x1

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 960
    :goto_1
    return-wide v6

    .line 958
    :cond_3
    sget-object v8, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    sget-object v10, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "%1$s returning a sleep time of %2$d milliseconds"

    const/4 v12, 0x2

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v10, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_1
.end method

.method public static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 2
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 107
    const-class v1, Lcom/getjar/sdk/comm/CommManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_Instance:Lcom/getjar/sdk/comm/CommManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/CommManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/CommManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_Instance:Lcom/getjar/sdk/comm/CommManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    :cond_0
    monitor-exit v1

    return-void

    .line 107
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private processesRequest(Lcom/getjar/sdk/comm/Operation;I)Lcom/getjar/sdk/comm/Result;
    .locals 52
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;
    .param p2, "failureRetryCount"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 592
    if-nez p1, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'operation\' can not be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 594
    :cond_0
    const/16 v44, 0x0

    .line 595
    .local v44, "uriToUse":Ljava/net/URI;
    const/16 v36, 0x0

    .line 598
    .local v36, "result":Lcom/getjar/sdk/comm/Result;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v40

    .line 606
    .local v40, "start":J
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getUriForRequest()Ljava/net/URI;

    move-result-object v44

    .line 616
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v7, v8, :cond_1

    .line 617
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Operation was cancelled, returning last result"

    const/16 v48, 0x1

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 618
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    move-object v7, v3

    move-object/from16 v3, v36

    .line 884
    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .local v3, "result":Lcom/getjar/sdk/comm/Result;
    :goto_0
    return-object v7

    .line 622
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v7, v8, :cond_2

    .line 623
    new-instance v7, Ljava/lang/IllegalStateException;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v46, "processesRequestWithRetries() for an operation in the %1$s state"

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v49

    invoke-virtual/range {v49 .. v49}, Lcom/getjar/sdk/comm/Operation$Status;->name()Ljava/lang/String;

    move-result-object v49

    aput-object v49, v47, v48

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v8, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catch Ljava/net/URISyntaxException; {:try_start_0 .. :try_end_0} :catch_0

    .line 872
    :catch_0
    move-exception v15

    move-object/from16 v3, v36

    .line 874
    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .local v15, "e":Ljava/net/URISyntaxException;
    :goto_1
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v15}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 626
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v15    # "e":Ljava/net/URISyntaxException;
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_2
    :try_start_1
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Starting Request %2$d"

    const/16 v48, 0x2

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v50

    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    aput-object v50, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_0

    .line 630
    const/16 v6, 0x1a2

    .line 631
    .local v6, "responseCode":I
    :try_start_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Making a request to: \'%2$s\'"

    const/16 v48, 0x2

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    aput-object v44, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 633
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getSdkUserAgent()Ljava/lang/String;

    move-result-object v7

    const/16 v8, 0x7530

    const/16 v46, 0x7530

    move/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/comm/GetJarHttpClient;->newInstance(Ljava/lang/String;II)Lcom/getjar/sdk/comm/GetJarHttpClient;
    :try_end_2
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_2} :catch_a
    .catchall {:try_start_2 .. :try_end_2} :catchall_5

    move-result-object v23

    .line 634
    .local v23, "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    const/16 v24, 0x0

    .line 638
    .local v24, "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    :try_start_3
    sget-object v7, Lcom/getjar/sdk/comm/Request$HttpMethod;->POST:Lcom/getjar/sdk/comm/Request$HttpMethod;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/Request;->getHttpMethod()Lcom/getjar/sdk/comm/Request$HttpMethod;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/Request$HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_a

    .line 639
    new-instance v25, Lorg/apache/http/client/methods/HttpPost;

    move-object/from16 v0, v25

    move-object/from16 v1, v44

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/net/URI;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 641
    .end local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .local v25, "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getPostData()Ljava/util/Map;

    move-result-object v7

    if-eqz v7, :cond_1b

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getPostData()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->size()I

    move-result v7

    if-lez v7, :cond_1b

    .line 642
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getPostData()Ljava/util/Map;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/comm/RequestUtilities;->getPostDataBlob(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v33

    .line 643
    .local v33, "postDataBlob":Ljava/lang/String;
    invoke-static/range {v33 .. v33}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_4

    .line 644
    const-string v7, "UTF-8"

    move-object/from16 v0, v33

    invoke-virtual {v0, v7}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v34

    .line 646
    .local v34, "postDataBytes":[B
    move-object/from16 v0, v25

    check-cast v0, Lorg/apache/http/client/methods/HttpPost;

    move-object v7, v0

    const-string v8, "Content-Language"

    const-string v46, "en-US"

    move-object/from16 v0, v46

    invoke-virtual {v7, v8, v0}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 647
    move-object/from16 v0, v25

    check-cast v0, Lorg/apache/http/client/methods/HttpPost;

    move-object v7, v0

    const-string v8, "Content-Type"

    const-string v46, "application/x-www-form-urlencoded"

    move-object/from16 v0, v46

    invoke-virtual {v7, v8, v0}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 649
    const/16 v38, 0x0

    .line 651
    .local v38, "serviceRequestCompress":Z
    :try_start_5
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "service.request.compress"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z
    :try_end_5
    .catch Lcom/getjar/sdk/exceptions/ConfigurationException; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-result v38

    .line 656
    :goto_2
    const/16 v39, 0x100

    .line 658
    .local v39, "serviceRequestUncompressedLimit":I
    :try_start_6
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v7

    const/4 v8, 0x0

    invoke-static {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v7

    const-string v8, "service.request.uncompressed_limit"

    invoke-virtual {v7, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_6
    .catch Lcom/getjar/sdk/exceptions/ConfigurationException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_5
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    move-result v39

    .line 667
    :goto_3
    if-eqz v38, :cond_9

    :try_start_7
    move-object/from16 v0, v34

    array-length v7, v0

    move/from16 v0, v39

    if-le v7, v0, :cond_9

    .line 669
    move-object/from16 v0, v25

    check-cast v0, Lorg/apache/http/client/methods/HttpPost;

    move-object v7, v0

    const-string v8, "Content-Encoding"

    const-string v46, "gzip"

    move-object/from16 v0, v46

    invoke-virtual {v7, v8, v0}, Lorg/apache/http/client/methods/HttpPost;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 670
    new-instance v12, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v12}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 671
    .local v12, "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    const/16 v19, 0x0

    .line 673
    .local v19, "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    :try_start_8
    new-instance v20, Ljava/util/zip/GZIPOutputStream;

    move-object/from16 v0, v20

    invoke-direct {v0, v12}, Ljava/util/zip/GZIPOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    .line 674
    .end local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .local v20, "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    :try_start_9
    move-object/from16 v0, v20

    move-object/from16 v1, v34

    invoke-virtual {v0, v1}, Ljava/util/zip/GZIPOutputStream;->write([B)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 677
    if-eqz v20, :cond_3

    .line 679
    :try_start_a
    invoke-virtual/range {v20 .. v20}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_8
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 685
    :cond_3
    :goto_4
    :try_start_b
    invoke-virtual {v12}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v21

    .line 686
    .local v21, "gzippedPostData":[B
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Gzipping POST data [Original length: %2$d: Gzipped Length: %3$d]:\r\n%4$s"

    const/16 v48, 0x4

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v50, v0

    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x2

    move-object/from16 v0, v21

    array-length v0, v0

    move/from16 v50, v0

    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x3

    aput-object v33, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 693
    move-object/from16 v0, v25

    check-cast v0, Lorg/apache/http/client/methods/HttpPost;

    move-object v7, v0

    new-instance v8, Lorg/apache/http/entity/ByteArrayEntity;

    move-object/from16 v0, v21

    invoke-direct {v8, v0}, Lorg/apache/http/entity/ByteArrayEntity;-><init>([B)V

    invoke-virtual {v7, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .end local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v20    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .end local v21    # "gzippedPostData":[B
    .end local v34    # "postDataBytes":[B
    .end local v38    # "serviceRequestCompress":Z
    .end local v39    # "serviceRequestUncompressedLimit":I
    :cond_4
    :goto_5
    move-object/from16 v24, v25

    .line 710
    .end local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .end local v33    # "postDataBlob":Ljava/lang/String;
    .restart local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    :goto_6
    :try_start_c
    const-string v7, "Accept-Encoding"

    const-string v8, "gzip"

    move-object/from16 v0, v24

    invoke-virtual {v0, v7, v8}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 711
    const-string v7, "Cache-Control"

    const-string v8, "no-transform"

    move-object/from16 v0, v24

    invoke-virtual {v0, v7, v8}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 712
    const-string v7, "User-Agent"

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/CommContext;->getSdkUserAgent()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, v24

    invoke-virtual {v0, v7, v8}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 713
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 714
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v10

    .line 715
    .local v10, "authToken":Ljava/lang/String;
    invoke-static {v10}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    .line 716
    const-string v7, "Authorization"

    move-object/from16 v0, v24

    invoke-virtual {v0, v7, v10}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 721
    :cond_5
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getRequestHeaders()Ljava/util/Map;

    move-result-object v7

    if-eqz v7, :cond_b

    .line 722
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getRequestHeaders()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v27

    .local v27, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_7
    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_b

    invoke-interface/range {v27 .. v27}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Ljava/lang/String;

    .line 723
    .local v32, "name":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/Request;->getRequestHeaders()Ljava/util/Map;

    move-result-object v7

    move-object/from16 v0, v32

    invoke-interface {v7, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v45

    check-cast v45, Ljava/lang/String;

    .line 724
    .local v45, "value":Ljava/lang/String;
    invoke-static/range {v32 .. v32}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_6

    invoke-static/range {v45 .. v45}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_6

    .line 725
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Adding header [%2$s = %3$s]"

    const/16 v48, 0x3

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    aput-object v32, v48, v49

    const/16 v49, 0x2

    aput-object v45, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 726
    move-object/from16 v0, v24

    move-object/from16 v1, v32

    move-object/from16 v2, v45

    invoke-virtual {v0, v1, v2}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    goto :goto_7

    .line 839
    .end local v10    # "authToken":Ljava/lang/String;
    .end local v27    # "i$":Ljava/util/Iterator;
    .end local v32    # "name":Ljava/lang/String;
    .end local v45    # "value":Ljava/lang/String;
    :catchall_0
    move-exception v7

    move-object/from16 v3, v36

    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    :goto_8
    :try_start_d
    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/comm/GetJarHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    throw v7
    :try_end_d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_1

    .line 855
    :catch_1
    move-exception v15

    .line 856
    .end local v23    # "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    .end local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .local v15, "e":Ljava/io/UnsupportedEncodingException;
    :goto_9
    :try_start_e
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v15}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    .line 858
    .end local v15    # "e":Ljava/io/UnsupportedEncodingException;
    :catchall_1
    move-exception v7

    :goto_a
    :try_start_f
    sget-object v8, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v46

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v48, "%1$s Finished Request"

    const/16 v49, 0x1

    move/from16 v0, v49

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v49, v0

    const/16 v50, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v51

    aput-object v51, v49, v50

    move-object/from16 v0, v48

    move-object/from16 v1, v49

    invoke-static {v8, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    move-wide/from16 v0, v46

    invoke-static {v0, v1, v8}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 861
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v46

    sub-long v46, v46, v40

    move-wide/from16 v0, v46

    long-to-int v0, v0

    move/from16 v42, v0

    .line 863
    .local v42, "timeDelta":I
    if-eqz v3, :cond_7

    move/from16 v0, v42

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/comm/Result;->setResponseTime(I)V

    .line 864
    :cond_7
    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s REQUEST TIMING: %2$d [TO: %3$s]"

    const/4 v8, 0x3

    new-array v0, v8, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/4 v8, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v49

    aput-object v49, v48, v8

    const/4 v8, 0x1

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v49

    aput-object v49, v48, v8

    const/16 v49, 0x2

    if-eqz v44, :cond_19

    move-object/from16 v8, v44

    :goto_b
    aput-object v8, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v43

    .line 865
    .local v43, "timingLogMessage":Ljava/lang/String;
    const/16 v8, 0x3e8

    move/from16 v0, v42

    if-le v0, v8, :cond_1a

    .line 866
    sget-object v8, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v46

    move-wide/from16 v0, v46

    move-object/from16 v2, v43

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 870
    :goto_c
    throw v7
    :try_end_f
    .catch Ljava/net/URISyntaxException; {:try_start_f .. :try_end_f} :catch_2

    .line 872
    .end local v42    # "timeDelta":I
    .end local v43    # "timingLogMessage":Ljava/lang/String;
    :catch_2
    move-exception v15

    goto/16 :goto_1

    .line 652
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v23    # "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    .restart local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v33    # "postDataBlob":Ljava/lang/String;
    .restart local v34    # "postDataBytes":[B
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v38    # "serviceRequestCompress":Z
    :catch_3
    move-exception v15

    .line 653
    .local v15, "e":Lcom/getjar/sdk/exceptions/ConfigurationException;
    :try_start_10
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v46, "CommManager processesRequest using default value for serviceRequestCompress"

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto/16 :goto_2

    .line 839
    .end local v15    # "e":Lcom/getjar/sdk/exceptions/ConfigurationException;
    .end local v33    # "postDataBlob":Ljava/lang/String;
    .end local v34    # "postDataBytes":[B
    .end local v38    # "serviceRequestCompress":Z
    :catchall_2
    move-exception v7

    move-object/from16 v24, v25

    .end local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    move-object/from16 v3, v36

    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    goto/16 :goto_8

    .line 659
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v33    # "postDataBlob":Ljava/lang/String;
    .restart local v34    # "postDataBytes":[B
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v38    # "serviceRequestCompress":Z
    .restart local v39    # "serviceRequestUncompressedLimit":I
    :catch_4
    move-exception v15

    .line 660
    .restart local v15    # "e":Lcom/getjar/sdk/exceptions/ConfigurationException;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v46, "CommManager processesRequest using default value for serviceRequestUncompressedLimit"

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    goto/16 :goto_3

    .line 662
    .end local v15    # "e":Lcom/getjar/sdk/exceptions/ConfigurationException;
    :catch_5
    move-exception v15

    .line 663
    .local v15, "e":Ljava/lang/NumberFormatException;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v46, "CommManager processesRequest using default value for serviceRequestUncompressedLimit"

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    goto/16 :goto_3

    .line 677
    .end local v15    # "e":Ljava/lang/NumberFormatException;
    .restart local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    :catchall_3
    move-exception v7

    :goto_d
    if-eqz v19, :cond_8

    .line 679
    :try_start_11
    invoke-virtual/range {v19 .. v19}, Ljava/util/zip/GZIPOutputStream;->close()V
    :try_end_11
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_9
    .catchall {:try_start_11 .. :try_end_11} :catchall_2

    .line 682
    :cond_8
    :goto_e
    :try_start_12
    throw v7

    .line 695
    .end local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    :cond_9
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s NOT Gzipping POST data [length: %2$d]:\r\n%3$s"

    const/16 v48, 0x3

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v50, v0

    invoke-static/range {v50 .. v50}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x2

    aput-object v33, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 700
    move-object/from16 v0, v25

    check-cast v0, Lorg/apache/http/client/methods/HttpPost;

    move-object v7, v0

    new-instance v8, Lorg/apache/http/entity/StringEntity;

    move-object/from16 v0, v33

    invoke-direct {v8, v0}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v8}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    goto/16 :goto_5

    .line 705
    .end local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .end local v33    # "postDataBlob":Ljava/lang/String;
    .end local v34    # "postDataBytes":[B
    .end local v38    # "serviceRequestCompress":Z
    .end local v39    # "serviceRequestUncompressedLimit":I
    .restart local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    :cond_a
    :try_start_13
    new-instance v25, Lorg/apache/http/client/methods/HttpGet;

    move-object/from16 v0, v25

    move-object/from16 v1, v44

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/net/URI;)V

    .end local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    move-object/from16 v24, v25

    .end local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    goto/16 :goto_6

    .line 732
    .restart local v10    # "authToken":Ljava/lang/String;
    :cond_b
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isDoNotCache()Z

    move-result v7

    if-nez v7, :cond_c

    .line 733
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/getjar/sdk/comm/CommManager;->_cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromCache(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v16

    .line 734
    .local v16, "eTag":Ljava/lang/String;
    invoke-static/range {v16 .. v16}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_c

    .line 737
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Adding the \'If-None-Match\' header [ETag = %2$s]"

    const/16 v48, 0x2

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    aput-object v16, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 738
    const-string v7, "If-None-Match"

    move-object/from16 v0, v24

    move-object/from16 v1, v16

    invoke-virtual {v0, v7, v1}, Lorg/apache/http/client/methods/HttpRequestBase;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 744
    .end local v16    # "eTag":Ljava/lang/String;
    :cond_c
    :try_start_14
    new-instance v22, Lorg/apache/http/HttpHost;

    invoke-virtual/range {v24 .. v24}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {v24 .. v24}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/URI;->getPort()I

    move-result v8

    invoke-virtual/range {v24 .. v24}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v46

    invoke-virtual/range {v46 .. v46}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v22

    move-object/from16 v1, v46

    invoke-direct {v0, v7, v8, v1}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 745
    .local v22, "host":Lorg/apache/http/HttpHost;
    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/comm/GetJarHttpClient;->getRoutePlanner()Lorg/apache/http/conn/routing/HttpRoutePlanner;

    move-result-object v7

    const/4 v8, 0x0

    move-object/from16 v0, v22

    move-object/from16 v1, v24

    invoke-interface {v7, v0, v1, v8}, Lorg/apache/http/conn/routing/HttpRoutePlanner;->determineRoute(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v37

    .line 746
    .local v37, "route":Lorg/apache/http/conn/routing/HttpRoute;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s ROUTE [ResolvedIP: %2$s  ProxyHost: %3$s  TargetHoust: %4$s  Secured: %5$s  Tunnelled: %6$s]"

    const/16 v48, 0x6

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    invoke-virtual/range {v24 .. v24}, Lorg/apache/http/client/methods/HttpRequestBase;->getURI()Ljava/net/URI;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v50

    invoke-static/range {v50 .. v50}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v50

    invoke-virtual/range {v50 .. v50}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x2

    invoke-virtual/range {v37 .. v37}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x3

    invoke-virtual/range {v37 .. v37}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x4

    invoke-virtual/range {v37 .. v37}, Lorg/apache/http/conn/routing/HttpRoute;->isSecure()Z

    move-result v50

    invoke-static/range {v50 .. v50}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x5

    invoke-virtual/range {v37 .. v37}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v50

    invoke-static/range {v50 .. v50}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v50

    aput-object v50, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_6
    .catchall {:try_start_14 .. :try_end_14} :catchall_0

    .line 756
    .end local v22    # "host":Lorg/apache/http/HttpHost;
    .end local v37    # "route":Lorg/apache/http/conn/routing/HttpRoute;
    :goto_f
    :try_start_15
    invoke-static/range {v24 .. v24}, Lcom/getjar/sdk/comm/RequestUtilities;->debugDumpRequestProperties(Lorg/apache/http/client/methods/HttpRequestBase;)V

    .line 757
    invoke-virtual/range {v23 .. v24}, Lcom/getjar/sdk/comm/GetJarHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v26

    .line 758
    .local v26, "httpResponse":Lorg/apache/http/HttpResponse;
    if-nez v26, :cond_d

    .line 759
    new-instance v7, Ljava/lang/IllegalStateException;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v46, "Failed to get a response from a service call [URL:%1$s]"

    const/16 v47, 0x1

    move/from16 v0, v47

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v47, v0

    const/16 v48, 0x0

    aput-object v44, v47, v48

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v8, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 753
    .end local v26    # "httpResponse":Lorg/apache/http/HttpResponse;
    :catch_6
    move-exception v15

    .local v15, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Failed to resolve and log the request route for \'%2$s\'"

    const/16 v48, 0x2

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    aput-object v44, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0, v15}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_f

    .line 763
    .end local v15    # "e":Ljava/lang/Exception;
    .restart local v26    # "httpResponse":Lorg/apache/http/HttpResponse;
    :cond_d
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    if-eqz v7, :cond_e

    .line 764
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v6

    .line 767
    :cond_e
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Result code: %2$d"

    const/16 v48, 0x2

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    aput-object v50, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 770
    const/4 v4, 0x0

    .line 771
    .local v4, "resultText":Ljava/lang/String;
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v17

    .line 774
    .local v17, "entity":Lorg/apache/http/HttpEntity;
    if-eqz v17, :cond_11

    .line 775
    invoke-interface/range {v17 .. v17}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v28

    .line 777
    .local v28, "instream":Ljava/io/InputStream;
    const-string v7, "Content-Encoding"

    move-object/from16 v0, v26

    invoke-interface {v0, v7}, Lorg/apache/http/HttpResponse;->getFirstHeader(Ljava/lang/String;)Lorg/apache/http/Header;

    move-result-object v13

    .line 778
    .local v13, "contentEncoding":Lorg/apache/http/Header;
    if-eqz v13, :cond_f

    invoke-interface {v13}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_f

    invoke-interface {v13}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v7

    const-string v8, "gzip"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_f

    .line 779
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v46, "CommManager processesRequest gzipped data received"

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 780
    new-instance v29, Ljava/util/zip/GZIPInputStream;

    move-object/from16 v0, v29

    move-object/from16 v1, v28

    invoke-direct {v0, v1}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_0

    .end local v28    # "instream":Ljava/io/InputStream;
    .local v29, "instream":Ljava/io/InputStream;
    move-object/from16 v28, v29

    .line 787
    .end local v29    # "instream":Ljava/io/InputStream;
    .restart local v28    # "instream":Ljava/io/InputStream;
    :goto_10
    :try_start_16
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v7, ""

    invoke-direct {v11, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 788
    .local v11, "buffer":Ljava/lang/StringBuilder;
    new-instance v35, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    move-object/from16 v0, v28

    invoke-direct {v7, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    move-object/from16 v0, v35

    invoke-direct {v0, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 789
    .local v35, "reader":Ljava/io/BufferedReader;
    invoke-virtual/range {v35 .. v35}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v31

    .line 790
    .local v31, "line":Ljava/lang/String;
    :goto_11
    if-eqz v31, :cond_10

    .line 791
    move-object/from16 v0, v31

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 792
    invoke-virtual/range {v35 .. v35}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;
    :try_end_16
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_16} :catch_7
    .catchall {:try_start_16 .. :try_end_16} :catchall_4

    move-result-object v31

    goto :goto_11

    .line 783
    .end local v11    # "buffer":Ljava/lang/StringBuilder;
    .end local v31    # "line":Ljava/lang/String;
    .end local v35    # "reader":Ljava/io/BufferedReader;
    :cond_f
    :try_start_17
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v46, "CommManager processesRequest received data not gzipped "

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_0

    goto :goto_10

    .line 794
    .restart local v11    # "buffer":Ljava/lang/StringBuilder;
    .restart local v31    # "line":Ljava/lang/String;
    .restart local v35    # "reader":Ljava/io/BufferedReader;
    :cond_10
    :try_start_18
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_18
    .catch Ljava/lang/RuntimeException; {:try_start_18 .. :try_end_18} :catch_7
    .catchall {:try_start_18 .. :try_end_18} :catchall_4

    move-result-object v4

    .line 804
    :try_start_19
    invoke-virtual/range {v28 .. v28}, Ljava/io/InputStream;->close()V

    .line 809
    .end local v11    # "buffer":Ljava/lang/StringBuilder;
    .end local v13    # "contentEncoding":Lorg/apache/http/Header;
    .end local v28    # "instream":Ljava/io/InputStream;
    .end local v31    # "line":Ljava/lang/String;
    .end local v35    # "reader":Ljava/io/BufferedReader;
    :cond_11
    new-instance v5, Ljava/util/HashMap;

    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 810
    .local v5, "headerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface/range {v26 .. v26}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v9

    .local v9, "arr$":[Lorg/apache/http/Header;
    array-length v0, v9

    move/from16 v30, v0

    .local v30, "len$":I
    const/16 v27, 0x0

    .local v27, "i$":I
    :goto_12
    move/from16 v0, v27

    move/from16 v1, v30

    if-ge v0, v1, :cond_13

    aget-object v14, v9, v27

    .line 811
    .local v14, "curHeader":Lorg/apache/http/Header;
    invoke-interface {v14}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_12

    .line 812
    invoke-interface {v14}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v7

    new-instance v8, Ljava/util/ArrayList;

    const/16 v46, 0x1

    move/from16 v0, v46

    invoke-direct {v8, v0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v5, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 814
    :cond_12
    invoke-interface {v14}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    invoke-interface {v14}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v7, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_0

    .line 810
    add-int/lit8 v27, v27, 0x1

    goto :goto_12

    .line 795
    .end local v5    # "headerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v9    # "arr$":[Lorg/apache/http/Header;
    .end local v14    # "curHeader":Lorg/apache/http/Header;
    .end local v27    # "i$":I
    .end local v30    # "len$":I
    .restart local v13    # "contentEncoding":Lorg/apache/http/Header;
    .restart local v28    # "instream":Ljava/io/InputStream;
    :catch_7
    move-exception v18

    .line 799
    .local v18, "ex":Ljava/lang/RuntimeException;
    :try_start_1a
    invoke-virtual/range {v24 .. v24}, Lorg/apache/http/client/methods/HttpRequestBase;->abort()V

    .line 800
    throw v18
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_4

    .line 804
    .end local v18    # "ex":Ljava/lang/RuntimeException;
    :catchall_4
    move-exception v7

    :try_start_1b
    invoke-virtual/range {v28 .. v28}, Ljava/io/InputStream;->close()V

    throw v7

    .line 818
    .end local v13    # "contentEncoding":Lorg/apache/http/Header;
    .end local v28    # "instream":Ljava/io/InputStream;
    .restart local v5    # "headerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .restart local v9    # "arr$":[Lorg/apache/http/Header;
    .restart local v27    # "i$":I
    .restart local v30    # "len$":I
    :cond_13
    new-instance v3, Lcom/getjar/sdk/comm/Result;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getSuppressInternalCallbacks()Z

    move-result v8

    invoke-direct/range {v3 .. v8}, Lcom/getjar/sdk/comm/Result;-><init>(Ljava/lang/String;Ljava/util/Map;ILjava/lang/String;Z)V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_0

    .line 824
    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    :try_start_1c
    move-object/from16 v0, p1

    invoke-virtual {v0, v3}, Lcom/getjar/sdk/comm/Operation;->setResult(Lcom/getjar/sdk/comm/Result;)V

    .line 826
    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v7

    if-eqz v7, :cond_14

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v7

    if-nez v7, :cond_14

    .line 827
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Received a bad response from a service call [URL:%2$s] [RESPONSE_CODE: %3$d] [RESPONSE:%4$s]"

    const/16 v48, 0x4

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x1

    aput-object v44, v48, v49

    const/16 v49, 0x2

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v50

    aput-object v50, v48, v49

    const/16 v49, 0x3

    aput-object v4, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_6

    .line 839
    :cond_14
    :try_start_1d
    invoke-virtual/range {v23 .. v23}, Lcom/getjar/sdk/comm/GetJarHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 843
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isDoNotCache()Z

    move-result v7

    if-nez v7, :cond_15

    .line 844
    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/getjar/sdk/comm/CommManager;->_cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

    move-object/from16 v0, p1

    invoke-virtual {v7, v0}, Lcom/getjar/sdk/comm/ResultCachingManager;->addResultToCache(Lcom/getjar/sdk/comm/Operation;)V
    :try_end_1d
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1d .. :try_end_1d} :catch_1
    .catchall {:try_start_1d .. :try_end_1d} :catchall_1

    .line 858
    :cond_15
    :try_start_1e
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v46, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v47, "%1$s Finished Request"

    const/16 v48, 0x1

    move/from16 v0, v48

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v48, v0

    const/16 v49, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v50

    aput-object v50, v48, v49

    invoke-static/range {v46 .. v48}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v46

    move-object/from16 v0, v46

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 861
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    sub-long v7, v7, v40

    long-to-int v0, v7

    move/from16 v42, v0

    .line 863
    .restart local v42    # "timeDelta":I
    if-eqz v3, :cond_16

    move/from16 v0, v42

    invoke-virtual {v3, v0}, Lcom/getjar/sdk/comm/Result;->setResponseTime(I)V

    .line 864
    :cond_16
    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v46, "%1$s REQUEST TIMING: %2$d [TO: %3$s]"

    const/4 v7, 0x3

    new-array v0, v7, [Ljava/lang/Object;

    move-object/from16 v47, v0

    const/4 v7, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v48

    aput-object v48, v47, v7

    const/4 v7, 0x1

    invoke-static/range {v42 .. v42}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v48

    aput-object v48, v47, v7

    const/16 v48, 0x2

    if-eqz v44, :cond_17

    move-object/from16 v7, v44

    :goto_13
    aput-object v7, v47, v48

    move-object/from16 v0, v46

    move-object/from16 v1, v47

    invoke-static {v8, v0, v1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v43

    .line 865
    .restart local v43    # "timingLogMessage":Ljava/lang/String;
    const/16 v7, 0x3e8

    move/from16 v0, v42

    if-le v0, v7, :cond_18

    .line 866
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    move-object/from16 v0, v43

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    :goto_14
    move-object v7, v3

    .line 884
    goto/16 :goto_0

    .line 864
    .end local v43    # "timingLogMessage":Ljava/lang/String;
    :cond_17
    const-string v7, ""

    goto :goto_13

    .line 868
    .restart local v43    # "timingLogMessage":Ljava/lang/String;
    :cond_18
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    move-object/from16 v0, v43

    invoke-static {v7, v8, v0}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_14

    .line 864
    .end local v4    # "resultText":Ljava/lang/String;
    .end local v5    # "headerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v9    # "arr$":[Lorg/apache/http/Header;
    .end local v10    # "authToken":Ljava/lang/String;
    .end local v17    # "entity":Lorg/apache/http/HttpEntity;
    .end local v23    # "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    .end local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .end local v26    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v27    # "i$":I
    .end local v30    # "len$":I
    .end local v43    # "timingLogMessage":Ljava/lang/String;
    :cond_19
    const-string v8, ""

    goto/16 :goto_b

    .line 868
    .restart local v43    # "timingLogMessage":Ljava/lang/String;
    :cond_1a
    sget-object v8, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v46

    move-wide/from16 v0, v46

    move-object/from16 v2, v43

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_1e
    .catch Ljava/net/URISyntaxException; {:try_start_1e .. :try_end_1e} :catch_2

    goto/16 :goto_c

    .line 680
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v42    # "timeDelta":I
    .end local v43    # "timingLogMessage":Ljava/lang/String;
    .restart local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v20    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v23    # "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    .restart local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v33    # "postDataBlob":Ljava/lang/String;
    .restart local v34    # "postDataBytes":[B
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v38    # "serviceRequestCompress":Z
    .restart local v39    # "serviceRequestUncompressedLimit":I
    :catch_8
    move-exception v7

    goto/16 :goto_4

    .end local v20    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    :catch_9
    move-exception v8

    goto/16 :goto_e

    .line 858
    .end local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .end local v23    # "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    .end local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .end local v33    # "postDataBlob":Ljava/lang/String;
    .end local v34    # "postDataBytes":[B
    .end local v38    # "serviceRequestCompress":Z
    .end local v39    # "serviceRequestUncompressedLimit":I
    :catchall_5
    move-exception v7

    move-object/from16 v3, v36

    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    goto/16 :goto_a

    .line 855
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_a
    move-exception v15

    move-object/from16 v3, v36

    .end local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v3    # "result":Lcom/getjar/sdk/comm/Result;
    goto/16 :goto_9

    .line 839
    .restart local v4    # "resultText":Ljava/lang/String;
    .restart local v5    # "headerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .restart local v9    # "arr$":[Lorg/apache/http/Header;
    .restart local v10    # "authToken":Ljava/lang/String;
    .restart local v17    # "entity":Lorg/apache/http/HttpEntity;
    .restart local v23    # "httpClient":Lcom/getjar/sdk/comm/GetJarHttpClient;
    .restart local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v26    # "httpResponse":Lorg/apache/http/HttpResponse;
    .restart local v27    # "i$":I
    .restart local v30    # "len$":I
    :catchall_6
    move-exception v7

    goto/16 :goto_8

    .line 677
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v4    # "resultText":Ljava/lang/String;
    .end local v5    # "headerMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v9    # "arr$":[Lorg/apache/http/Header;
    .end local v10    # "authToken":Ljava/lang/String;
    .end local v17    # "entity":Lorg/apache/http/HttpEntity;
    .end local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .end local v26    # "httpResponse":Lorg/apache/http/HttpResponse;
    .end local v27    # "i$":I
    .end local v30    # "len$":I
    .restart local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .restart local v20    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v33    # "postDataBlob":Ljava/lang/String;
    .restart local v34    # "postDataBytes":[B
    .restart local v36    # "result":Lcom/getjar/sdk/comm/Result;
    .restart local v38    # "serviceRequestCompress":Z
    .restart local v39    # "serviceRequestUncompressedLimit":I
    :catchall_7
    move-exception v7

    move-object/from16 v19, v20

    .end local v20    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .restart local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    goto/16 :goto_d

    .end local v12    # "byteArrayOutputStream":Ljava/io/ByteArrayOutputStream;
    .end local v19    # "gzipOutputStream":Ljava/util/zip/GZIPOutputStream;
    .end local v33    # "postDataBlob":Ljava/lang/String;
    .end local v34    # "postDataBytes":[B
    .end local v38    # "serviceRequestCompress":Z
    .end local v39    # "serviceRequestUncompressedLimit":I
    :cond_1b
    move-object/from16 v24, v25

    .end local v25    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    .restart local v24    # "httpRequest":Lorg/apache/http/client/methods/HttpRequestBase;
    goto/16 :goto_6
.end method

.method private processesRequestWithRetries(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;
    .locals 21
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 457
    if-nez p1, :cond_0

    new-instance v14, Ljava/lang/IllegalArgumentException;

    const-string v15, "\'operation\' can not be NULL"

    invoke-direct {v14, v15}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 460
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v14

    sget-object v15, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v14, v15, :cond_2

    .line 461
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation was cancelled, returning last result"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 462
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v11

    .line 587
    :cond_1
    :goto_0
    return-object v11

    .line 466
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v14

    sget-object v15, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v14, v15, :cond_3

    .line 467
    new-instance v14, Ljava/lang/IllegalStateException;

    sget-object v15, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v16, "processesRequestWithRetries() for an operation in the %1$s state"

    const/16 v17, 0x1

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/Operation$Status;->name()Ljava/lang/String;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-static/range {v15 .. v17}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 476
    :cond_3
    const/4 v12, 0x0

    .line 477
    .local v12, "retry":Z
    const/4 v8, 0x0

    .line 478
    .local v8, "reportNetworkFailure":Z
    const/4 v9, 0x0

    .line 479
    .local v9, "reportServiceFailure":Z
    const/4 v11, 0x0

    .line 480
    .local v11, "requestResult":Lcom/getjar/sdk/comm/Result;
    const/4 v5, 0x0

    .line 482
    .local v5, "failureRetryCount":I
    :goto_1
    const/4 v12, 0x0

    .line 483
    const/4 v8, 0x0

    .line 484
    const/4 v9, 0x0

    .line 490
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v10

    .line 491
    .local v10, "requestId":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isCancelled()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 492
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation was cancelled, returning NULL"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 493
    const/4 v11, 0x0

    goto :goto_0

    .line 495
    :cond_4
    sget-object v14, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "%1$s Starting request %2$s for CommContext %3$s [Attempt %4$d]"

    const/16 v16, 0x4

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    aput-object v10, v16, v17

    const/16 v17, 0x2

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x3

    add-int/lit8 v18, v5, 0x1

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    invoke-static/range {v14 .. v16}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 501
    .local v7, "msg":Ljava/lang/String;
    if-lez v5, :cond_5

    .line 504
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    invoke-static {v14, v15, v7}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 509
    :goto_2
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isCancelled()Z

    move-result v14

    if-eqz v14, :cond_8

    .line 510
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation was cancelled, returning NULL"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 511
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 506
    :cond_5
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    invoke-static {v14, v15, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 546
    .end local v7    # "msg":Ljava/lang/String;
    .end local v10    # "requestId":Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 547
    .local v4, "exc":Ljava/lang/Exception;
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation failed [failureRetryCount:%2$d details:\'%3$s - %4$s\']"

    const/16 v18, 0x4

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x1

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x2

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    const/16 v19, 0x3

    invoke-virtual {v4}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 555
    const/4 v8, 0x1

    .line 556
    const/4 v9, 0x0

    .line 557
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isIdempotent()Z

    move-result v14

    invoke-static {v4, v14}, Lcom/getjar/sdk/comm/RequestUtilities;->checkForRetryOnException(Ljava/lang/Exception;Z)Z

    move-result v12

    .line 558
    if-eqz v12, :cond_6

    const/4 v14, 0x5

    if-lt v5, v14, :cond_c

    .line 559
    :cond_6
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation failed, not retrying, returning NULL"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 562
    const/4 v11, 0x0

    .line 563
    move-object/from16 v0, p1

    invoke-virtual {v0, v4}, Lcom/getjar/sdk/comm/Operation;->setException(Ljava/lang/Exception;)V

    .line 573
    .end local v4    # "exc":Ljava/lang/Exception;
    :cond_7
    :goto_3
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isCancelled()Z

    move-result v14

    if-eqz v14, :cond_e

    .line 574
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation was cancelled, returning NULL"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 575
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 515
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v10    # "requestId":Ljava/lang/String;
    :cond_8
    :try_start_1
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/CommManager;->processesRequest(Lcom/getjar/sdk/comm/Operation;I)Lcom/getjar/sdk/comm/Result;

    move-result-object v11

    .line 517
    if-nez v11, :cond_9

    .line 518
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s processesRequest() returned NULL"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 519
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getException()Ljava/lang/Exception;

    move-result-object v14

    if-eqz v14, :cond_7

    .line 520
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getException()Ljava/lang/Exception;

    move-result-object v14

    throw v14

    .line 524
    :cond_9
    invoke-static {v11}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 525
    .local v4, "exc":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v4, :cond_7

    .line 528
    const/4 v2, 0x0

    .line 529
    .local v2, "blacklisted":Z
    const/4 v13, 0x0

    .line 530
    .local v13, "unsupported":Z
    :try_start_2
    invoke-virtual {v4}, Lcom/getjar/sdk/exceptions/ServiceException;->getRequestResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/Result;->checkForBlacklisted()Z
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    move-result v2

    .line 531
    :goto_4
    :try_start_3
    invoke-virtual {v4}, Lcom/getjar/sdk/exceptions/ServiceException;->getRequestResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/Result;->checkForUnsupported()Z
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    move-result v13

    .line 532
    :goto_5
    :try_start_4
    invoke-virtual {v4}, Lcom/getjar/sdk/exceptions/ServiceException;->getRequestResult()Lcom/getjar/sdk/comm/Result;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    move-result-object v14

    if-eqz v14, :cond_b

    if-nez v2, :cond_a

    if-eqz v13, :cond_b

    .line 535
    :cond_a
    const/4 v8, 0x0

    .line 536
    const/4 v9, 0x0

    goto/16 :goto_3

    .line 540
    :cond_b
    const/4 v8, 0x0

    .line 541
    const/4 v9, 0x1

    goto/16 :goto_3

    .line 565
    .end local v2    # "blacklisted":Z
    .end local v7    # "msg":Ljava/lang/String;
    .end local v10    # "requestId":Ljava/lang/String;
    .end local v13    # "unsupported":Z
    .local v4, "exc":Ljava/lang/Exception;
    :cond_c
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->isCancelled()Z

    move-result v14

    if-eqz v14, :cond_d

    .line 566
    sget-object v14, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v14}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v14

    sget-object v16, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v17, "%1$s Operation was cancelled, returning NULL"

    const/16 v18, 0x1

    move/from16 v0, v18

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v18, v0

    const/16 v19, 0x0

    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v20

    aput-object v20, v18, v19

    invoke-static/range {v16 .. v18}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    invoke-static/range {v14 .. v16}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 567
    const/4 v11, 0x0

    goto/16 :goto_0

    .line 569
    :cond_d
    const-wide/16 v14, 0x7d0

    :try_start_5
    invoke-static {v14, v15}, Ljava/lang/Thread;->sleep(J)V
    :try_end_5
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_3

    :catch_1
    move-exception v3

    .local v3, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v3}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto/16 :goto_3

    .line 578
    .end local v3    # "e":Ljava/lang/InterruptedException;
    .end local v4    # "exc":Ljava/lang/Exception;
    :cond_e
    if-eqz v12, :cond_f

    add-int/lit8 v6, v5, 0x1

    .end local v5    # "failureRetryCount":I
    .local v6, "failureRetryCount":I
    const/4 v14, 0x5

    if-lt v5, v14, :cond_11

    move v5, v6

    .line 581
    .end local v6    # "failureRetryCount":I
    .restart local v5    # "failureRetryCount":I
    :cond_f
    if-eqz v8, :cond_10

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getSuppressInternalCallbacks()Z

    move-result v14

    if-nez v14, :cond_10

    .line 582
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v14

    invoke-virtual {v14}, Lcom/getjar/sdk/comm/CommContext;->makeNetworkFailureCallbacks()V

    goto/16 :goto_0

    .line 583
    :cond_10
    if-eqz v9, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getSuppressInternalCallbacks()Z

    move-result v14

    if-nez v14, :cond_1

    .line 584
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v14

    invoke-virtual {v14, v11}, Lcom/getjar/sdk/comm/CommContext;->makeServiceFailureCallbacks(Lcom/getjar/sdk/comm/Result;)V

    goto/16 :goto_0

    .line 531
    .restart local v2    # "blacklisted":Z
    .local v4, "exc":Lcom/getjar/sdk/exceptions/ServiceException;
    .restart local v7    # "msg":Ljava/lang/String;
    .restart local v10    # "requestId":Ljava/lang/String;
    .restart local v13    # "unsupported":Z
    :catch_2
    move-exception v14

    goto :goto_5

    .line 530
    :catch_3
    move-exception v14

    goto :goto_4

    .end local v2    # "blacklisted":Z
    .end local v4    # "exc":Lcom/getjar/sdk/exceptions/ServiceException;
    .end local v5    # "failureRetryCount":I
    .end local v7    # "msg":Ljava/lang/String;
    .end local v10    # "requestId":Ljava/lang/String;
    .end local v13    # "unsupported":Z
    .restart local v6    # "failureRetryCount":I
    :cond_11
    move v5, v6

    .end local v6    # "failureRetryCount":I
    .restart local v5    # "failureRetryCount":I
    goto/16 :goto_1
.end method

.method public static retrieveContext(Ljava/lang/String;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "contextId"    # Ljava/lang/String;

    .prologue
    .line 1196
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_IdentifierToCommContextMap:Ljava/util/concurrent/ConcurrentHashMap;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method private startWorker()V
    .locals 8

    .prologue
    const/4 v4, 0x1

    const/4 v6, 0x0

    .line 892
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$s startWorker()"

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 893
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadLock:Ljava/lang/Object;

    monitor-enter v1

    .line 894
    const/4 v0, 0x0

    :try_start_0
    sput-boolean v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadStopping:Z

    .line 895
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    .line 896
    new-instance v0, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/getjar/sdk/comm/CommManager$RequestPipelineManagementRunnable;-><init>(Lcom/getjar/sdk/comm/CommManager;Lcom/getjar/sdk/comm/CommManager$1;)V

    const-string v3, "CommManager Worker Thread"

    invoke-direct {v0, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    .line 898
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-nez v0, :cond_1

    .line 899
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 900
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s Thread started"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 904
    :goto_0
    monitor-exit v1

    .line 905
    return-void

    .line 902
    :cond_1
    sget-object v0, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s Thread already running"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v0, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 904
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private stopWorker()V
    .locals 10

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 910
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s stopWorker()"

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 911
    sget-object v2, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadLock:Ljava/lang/Object;

    monitor-enter v2

    .line 914
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    if-nez v1, :cond_0

    .line 915
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Thread already stopped"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 916
    monitor-exit v2

    .line 938
    :goto_0
    return-void

    .line 920
    :cond_0
    const/4 v1, 0x1

    sput-boolean v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThreadStopping:Z

    .line 921
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s kicking worker thread"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 922
    sget-object v3, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 926
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    const-wide/16 v3, 0x7d0

    invoke-virtual {v1, v3, v4}, Ljava/lang/Thread;->join(J)V

    .line 927
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    .line 928
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->join()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 934
    const/4 v1, 0x0

    :try_start_3
    sput-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    .line 935
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Thread stopped"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 937
    :goto_1
    monitor-exit v2

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v1

    .line 922
    :catchall_1
    move-exception v1

    :try_start_4
    monitor-exit v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :try_start_5
    throw v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 929
    :catch_0
    move-exception v0

    .line 930
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_6
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s Thread \'%2$s\' received an interrupt"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 934
    const/4 v1, 0x0

    :try_start_7
    sput-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    .line 935
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Thread stopped"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_1

    .line 931
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v0

    .line 932
    .local v0, "e":Ljava/lang/Exception;
    :try_start_8
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s failed"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Object;

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 934
    const/4 v1, 0x0

    :try_start_9
    sput-object v1, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    .line 935
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "%1$s Thread stopped"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v1, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 934
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_2
    move-exception v1

    const/4 v3, 0x0

    sput-object v3, Lcom/getjar/sdk/comm/CommManager;->_WorkerThread:Ljava/lang/Thread;

    .line 935
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "%1$s Thread stopped"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    throw v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0
.end method

.method private updateOperationStateFromResult(Lcom/getjar/sdk/comm/Operation;)V
    .locals 8
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 379
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'operation\' can not be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 380
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    if-nez v1, :cond_2

    .line 423
    :cond_1
    :goto_0
    return-void

    .line 382
    :cond_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getRetryAfterCount()I

    move-result v1

    const/4 v2, 0x5

    if-ge v1, v2, :cond_4

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v1

    const/16 v2, 0xca

    if-eq v1, v2, :cond_3

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v1

    const/16 v2, 0x1f7

    if-ne v1, v2, :cond_4

    .line 385
    :cond_3
    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {p1, v1}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    goto :goto_0

    .line 386
    :cond_4
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v1

    const/16 v2, 0x130

    if-ne v1, v2, :cond_6

    .line 389
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->isDoNotCache()Z

    move-result v1

    if-nez v1, :cond_5

    .line 390
    iget-object v1, p0, Lcom/getjar/sdk/comm/CommManager;->_cachingManager:Lcom/getjar/sdk/comm/ResultCachingManager;

    invoke-virtual {v1, p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->refreshCacheEntry(Lcom/getjar/sdk/comm/Operation;)V

    .line 392
    :cond_5
    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {p1, v1}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    goto :goto_0

    .line 393
    :cond_6
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v1

    if-eqz v1, :cond_7

    .line 396
    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {p1, v1}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    goto :goto_0

    .line 401
    :cond_7
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getReauthThenRetryCount()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/Result;->checkForUnauthorizedAndOKToReAuth(Lcom/getjar/sdk/comm/CommContext;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 404
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->updateStateForRetryAfterReauth()V

    .line 405
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getCommContext()Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 409
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lcom/getjar/sdk/comm/CommManager$1;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/comm/CommManager$1;-><init>(Lcom/getjar/sdk/comm/CommManager;)V

    const-string v3, "Re-Auth Thread"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 419
    :catch_0
    move-exception v0

    .line 420
    .local v0, "e":Lorg/json/JSONException;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s updateOperationStateFromResult() re-auth retry check failed"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {p1}, Lcom/getjar/sdk/comm/CommManager;->getLoggingPrefix(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto/16 :goto_0
.end method

.method public static validateManifestFile(Landroid/content/Context;Z)V
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "enforceRequired"    # Z

    .prologue
    const/high16 v5, 0x10000

    .line 1554
    if-nez p0, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'context\' cannot be null"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1556
    :cond_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "CommManager checkManifestFile started"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 1558
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 1565
    .local v1, "packageManager":Landroid/content/pm/PackageManager;
    const-string v2, "android.permission.INTERNET"

    invoke-static {p0, v2}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 1566
    const-string v0, "Your application MUST have the \'android.permission.INTERNET\' permission to use the GetJar Rewards SDK"

    .line 1567
    .local v0, "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1568
    new-instance v2, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1572
    .end local v0    # "msg":Ljava/lang/String;
    :cond_1
    const-string v2, "android.permission.GET_ACCOUNTS"

    invoke-static {p0, v2}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 1573
    if-eqz p1, :cond_2

    .line 1574
    const-string v0, "Your application MUST have the \'android.permission.GET_ACCOUNTS\' permission to use the GetJar Rewards SDK"

    .line 1575
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1576
    new-instance v2, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1578
    .end local v0    # "msg":Ljava/lang/String;
    :cond_2
    const-string v0, "[OPTIONAL] The \'android.permission.GET_ACCOUNTS\' permission not found in AndroidManifest.xml"

    .line 1579
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1584
    .end local v0    # "msg":Ljava/lang/String;
    :cond_3
    const-string v2, "android.permission.GET_TASKS"

    invoke-static {p0, v2}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 1585
    if-eqz p1, :cond_4

    .line 1586
    const-string v0, "Your application MUST have the \'android.permission.GET_TASKS\' permission to use the GetJar Rewards SDK"

    .line 1587
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1588
    new-instance v2, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1590
    .end local v0    # "msg":Ljava/lang/String;
    :cond_4
    const-string v0, "[OPTIONAL] The \'android.permission.GET_TASKS\' permission not found in AndroidManifest.xml"

    .line 1591
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1596
    .end local v0    # "msg":Ljava/lang/String;
    :cond_5
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/getjar/sdk/data/metadata/PackageMonitor;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 1597
    const-string v0, "Could not find the com.getjar.sdk.data.metadata.PackageMonitor defined inside AndroidManifest.xml"

    .line 1598
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1599
    new-instance v2, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1603
    .end local v0    # "msg":Ljava/lang/String;
    :cond_6
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 1604
    const-string v0, "Could not find the com.getjar.sdk.rewards.GetJarActivity defined inside AndroidManifest.xml"

    .line 1605
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1606
    new-instance v2, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1610
    .end local v0    # "msg":Ljava/lang/String;
    :cond_7
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/getjar/sdk/rewards/GetJarService;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 1611
    if-eqz p1, :cond_8

    .line 1612
    const-string v0, "Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml"

    .line 1613
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 1614
    new-instance v2, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1616
    .end local v0    # "msg":Ljava/lang/String;
    :cond_8
    const-string v0, "[OPTIONAL] Could not find the com.getjar.sdk.rewards.GetJarService defined inside AndroidManifest.xml"

    .line 1617
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1625
    .end local v0    # "msg":Ljava/lang/String;
    :cond_9
    const-string v2, "com.android.vending.BILLING"

    invoke-static {p0, v2}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_a

    .line 1626
    const-string v0, "[OPTIONAL] Your application MUST have the \'com.android.vending.BILLING\' permission in order to use the Buy Gold feature in GetJar Rewards SDK"

    .line 1627
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1631
    .end local v0    # "msg":Ljava/lang/String;
    :cond_a
    const-string v2, "android.permission.READ_PHONE_STATE"

    invoke-static {p0, v2}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 1632
    const-string v0, "[OPTIONAL] The READ_PHONE_STATE permission not found in AndroidManifest.xml. It helps Getjar SDK detect unique devices that the app is running on."

    .line 1633
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1637
    .end local v0    # "msg":Ljava/lang/String;
    :cond_b
    const-string v2, "android.permission.ACCESS_NETWORK_STATE"

    invoke-static {p0, v2}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 1638
    const-string v0, "[OPTIONAL] The ACCESS_NETWORK_STATE permission not found in AndroidManifest.xml. It helps the Getjar SDK run efficiently by detecting whether the device is connected to the internet."

    .line 1639
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1643
    .end local v0    # "msg":Ljava/lang/String;
    :cond_c
    new-instance v2, Landroid/content/Intent;

    const-class v3, Lcom/getjar/sdk/rewards/GetJarReceiver;

    invoke-direct {v2, p0, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v1, v2, v5}, Landroid/content/pm/PackageManager;->queryBroadcastReceivers(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_d

    .line 1644
    const-string v0, "[OPTIONAL] Could not find the com.getjar.sdk.rewards.GetJarReceiver defined inside AndroidManifest.xml. It is required if there is no other implementation of Google Play billing."

    .line 1646
    .restart local v0    # "msg":Ljava/lang/String;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-static {v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 1648
    .end local v0    # "msg":Ljava/lang/String;
    :cond_d
    return-void
.end method


# virtual methods
.method protected cancelRequest(Lcom/getjar/sdk/comm/Operation;)Z
    .locals 3
    .param p1, "operationToCancel"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    .line 432
    sget-object v1, Lcom/getjar/sdk/comm/CommManager;->_RequestPipelineLock:Ljava/lang/Object;

    monitor-enter v1

    .line 433
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v0

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v0, v2, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v0

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v0, v2, :cond_1

    .line 438
    :cond_0
    const/4 v0, 0x0

    monitor-exit v1

    .line 450
    :goto_0
    return v0

    .line 446
    :cond_1
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_ActiveRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 447
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_RequestQueue:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    .line 448
    sget-object v0, Lcom/getjar/sdk/comm/CommManager;->_RetryRequests:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 449
    sget-object v0, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {p1, v0}, Lcom/getjar/sdk/comm/Operation;->setState(Lcom/getjar/sdk/comm/Operation$Status;)V

    .line 450
    const/4 v0, 0x1

    monitor-exit v1

    goto :goto_0

    .line 452
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public enqueueOperation(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;ZZZLjava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    .locals 13
    .param p1, "serviceName"    # Lcom/getjar/sdk/comm/Request$ServiceName;
    .param p2, "requestType"    # Ljava/lang/String;
    .param p3, "requestUri"    # Ljava/net/URI;
    .param p4, "httpMethod"    # Lcom/getjar/sdk/comm/Request$HttpMethod;
    .param p7, "priority"    # Lcom/getjar/sdk/comm/Operation$Priority;
    .param p8, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p9, "suppressInternalCallbacks"    # Z
    .param p10, "doNotCache"    # Z
    .param p11, "isIdempotent"    # Z
    .param p12, "authFlowId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/Request$ServiceName;",
            "Ljava/lang/String;",
            "Ljava/net/URI;",
            "Lcom/getjar/sdk/comm/Request$HttpMethod;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/getjar/sdk/comm/Operation$Priority;",
            "Lcom/getjar/sdk/comm/CommContext;",
            "ZZZ",
            "Ljava/lang/String;",
            ")",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 181
    .local p5, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p6, "requestHeaders":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v0, Lcom/getjar/sdk/comm/Operation;

    move-object v1, p1

    move-object v2, p2

    move-object/from16 v3, p3

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move/from16 v9, p9

    move/from16 v10, p10

    move/from16 v11, p11

    move-object/from16 v12, p12

    invoke-direct/range {v0 .. v12}, Lcom/getjar/sdk/comm/Operation;-><init>(Lcom/getjar/sdk/comm/Request$ServiceName;Ljava/lang/String;Ljava/net/URI;Lcom/getjar/sdk/comm/Request$HttpMethod;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;ZZZLjava/lang/String;)V

    .line 194
    .local v0, "newOperation":Lcom/getjar/sdk/comm/Operation;
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/getjar/sdk/comm/CommManager;->enqueueRequest(Lcom/getjar/sdk/comm/Operation;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v1

    return-object v1
.end method

.method protected waitOnOperation(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Result;
    .locals 15
    .param p1, "operation"    # Lcom/getjar/sdk/comm/Operation;

    .prologue
    const/4 v10, 0x1

    const/4 v12, 0x0

    .line 310
    if-nez p1, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'operation\' can not be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 313
    :cond_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v7, v8, :cond_1

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v7, v8, :cond_2

    .line 314
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    .line 372
    :goto_0
    return-object v3

    .line 318
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v7, v8, :cond_3

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v7, v8, :cond_3

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v8, Lcom/getjar/sdk/comm/Operation$Status;->WAITING:Lcom/getjar/sdk/comm/Operation$Status;

    if-eq v7, v8, :cond_3

    .line 322
    new-instance v7, Ljava/lang/IllegalStateException;

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "waitOnOperation() for an operation in the %1$s state"

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v11

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/Operation$Status;->name()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v10, v12

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 325
    :cond_3
    const/4 v3, 0x0

    .line 326
    .local v3, "result":Lcom/getjar/sdk/comm/Result;
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getFuture()Ljava/util/concurrent/FutureTask;

    move-result-object v8

    monitor-enter v8

    .line 328
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getFuture()Ljava/util/concurrent/FutureTask;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Lcom/getjar/sdk/comm/Result;

    move-object v3, v0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 336
    :try_start_1
    invoke-direct/range {p0 .. p1}, Lcom/getjar/sdk/comm/CommManager;->updateOperationStateFromResult(Lcom/getjar/sdk/comm/Operation;)V

    .line 337
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    .line 340
    :goto_1
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getState()Lcom/getjar/sdk/comm/Operation$Status;

    move-result-object v7

    sget-object v9, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    if-ne v7, v9, :cond_5

    .line 343
    const-wide/16 v5, 0x2

    .line 344
    .local v5, "tryAgainInSeconds":J
    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v7

    if-eqz v7, :cond_4

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v7

    const-string v9, "Retry-After"

    invoke-interface {v7, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-eqz v7, :cond_4

    .line 346
    :try_start_2
    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getHeaders()Ljava/util/Map;

    move-result-object v7

    const-string v9, "Retry-After"

    invoke-interface {v7, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    const/4 v9, 0x0

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 347
    .local v4, "retryAfterStr":Ljava/lang/String;
    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v5

    .line 352
    .end local v4    # "retryAfterStr":Ljava/lang/String;
    :cond_4
    :goto_2
    :try_start_3
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v11, "Request %1$d resulted in a %2$d, retrying in %3$d seconds"

    const/4 v12, 0x3

    new-array v12, v12, [Ljava/lang/Object;

    const/4 v13, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getId()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x1

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v12, v13

    const/4 v13, 0x2

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v14

    aput-object v14, v12, v13

    invoke-static {v7, v11, v12}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v10, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 355
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->tickRetryAfterCount()V

    .line 356
    const-wide/16 v9, 0x3e8

    mul-long/2addr v9, v5

    move-object/from16 v0, p1

    invoke-virtual {v0, v9, v10}, Lcom/getjar/sdk/comm/Operation;->updateRetryAfterTimestamp(J)V

    .line 359
    invoke-direct/range {p0 .. p1}, Lcom/getjar/sdk/comm/CommManager;->enqueueOperationForRetry(Lcom/getjar/sdk/comm/Operation;)Lcom/getjar/sdk/comm/Operation;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 363
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/Operation;->getFuture()Ljava/util/concurrent/FutureTask;

    move-result-object v7

    invoke-virtual {v7}, Ljava/util/concurrent/FutureTask;->get()Ljava/lang/Object;

    move-result-object v7

    move-object v0, v7

    check-cast v0, Lcom/getjar/sdk/comm/Result;

    move-object v3, v0
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    goto :goto_1

    .line 329
    .end local v5    # "tryAgainInSeconds":J
    :catch_0
    move-exception v2

    .line 330
    .local v2, "e1":Ljava/lang/InterruptedException;
    :try_start_5
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 371
    .end local v2    # "e1":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v7

    monitor-exit v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    throw v7

    .line 331
    :catch_1
    move-exception v2

    .line 332
    .local v2, "e1":Ljava/util/concurrent/ExecutionException;
    :try_start_6
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 348
    .end local v2    # "e1":Ljava/util/concurrent/ExecutionException;
    .restart local v5    # "tryAgainInSeconds":J
    :catch_2
    move-exception v1

    .line 349
    .local v1, "e":Ljava/lang/Exception;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    const-string v7, "\'Retry-After\' header found, but failed to parse as long (as delta in seconds)"

    invoke-static {v9, v10, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 364
    .end local v1    # "e":Ljava/lang/Exception;
    :catch_3
    move-exception v2

    .line 365
    .local v2, "e1":Ljava/lang/InterruptedException;
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 366
    .end local v2    # "e1":Ljava/lang/InterruptedException;
    :catch_4
    move-exception v2

    .line 367
    .local v2, "e1":Ljava/util/concurrent/ExecutionException;
    new-instance v7, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v7, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 371
    .end local v2    # "e1":Ljava/util/concurrent/ExecutionException;
    .end local v5    # "tryAgainInSeconds":J
    :cond_5
    monitor-exit v8
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto/16 :goto_0
.end method
