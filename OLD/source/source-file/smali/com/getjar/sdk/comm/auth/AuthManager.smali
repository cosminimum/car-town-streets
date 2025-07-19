.class public Lcom/getjar/sdk/comm/auth/AuthManager;
.super Ljava/lang/Object;
.source "AuthManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/auth/AuthManager$1;,
        Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;,
        Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;,
        Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;,
        Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    }
.end annotation


# static fields
.field public static final AUTHORIZATION_HEADER:Ljava/lang/String; = "Authorization"

.field public static final AUTHORIZATION_HEADER_LOWER:Ljava/lang/String; = "authorization"

.field public static final AUTHORIZATION_HEADER_UPPER:Ljava/lang/String; = "AUTHORIZATION"

.field private static final PROVIDER_FILTER_FAILSAFE_TTL:J = 0x5265c00L

.field private static _ExecutorService:Ljava/util/concurrent/ExecutorService;

.field private static volatile _Instance:Lcom/getjar/sdk/comm/auth/AuthManager;

.field private static final _ObservedAuthWithUiIds:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final _authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

.field private _authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

.field private final _authFlowLock:Ljava/lang/Object;

.field private volatile _authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field private _authTTL:J

.field private _authTimestamp:J

.field private _authToken:Ljava/lang/String;

.field private final _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private _isNewUser:Z

.field private _userAccessId:Ljava/lang/String;

.field private _userAuthProviderFilter:Ljava/lang/String;

.field private _userDeviceId:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_Instance:Lcom/getjar/sdk/comm/auth/AuthManager;

    .line 102
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getExecutorServiceInstance()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 103
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_ObservedAuthWithUiIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 10
    .param p1, "androidContext"    # Landroid/content/Context;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v8, 0x0

    const/4 v3, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 112
    iput-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    .line 113
    iput-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    .line 114
    iput-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    .line 115
    iput-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    .line 116
    iput-boolean v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_isNewUser:Z

    .line 117
    iput-wide v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    .line 118
    iput-wide v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J

    .line 135
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowLock:Ljava/lang/Object;

    .line 136
    new-instance v2, Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-direct {v2, v8}, Lcom/getjar/sdk/utilities/ManualResetEvent;-><init>(Z)V

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    .line 137
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->UNKNOWN:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 51
    invoke-static {p1}, Lcom/getjar/sdk/comm/CommManager;->createContextForAuth(Landroid/content/Context;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 54
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-direct {v2, p0, v3}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;-><init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$1;)V

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    .line 57
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$100(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    .line 58
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$200(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    .line 59
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$300(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    .line 60
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$400(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    .line 61
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$500(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/Long;

    move-result-object v1

    .line 62
    .local v1, "ttl":Ljava/lang/Long;
    if-eqz v1, :cond_0

    .line 63
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    .line 65
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$600(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/Long;

    move-result-object v0

    .line 66
    .local v0, "timestamp":Ljava/lang/Long;
    if-eqz v0, :cond_1

    .line 67
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J

    .line 70
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: AuthManager initialized [userAuthProviderFilter:%1$s authToken:%2$s userAccessId:%3$s userDeviceId:%4$s authTTL:%5$d authTimestamp:%6$d]"

    const/4 v6, 0x6

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    aput-object v7, v6, v8

    const/4 v7, 0x1

    iget-object v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x2

    iget-object v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x3

    iget-object v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x4

    iget-wide v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x5

    iget-wide v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 71
    return-void
.end method

.method static synthetic access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    return-object v0
.end method

.method static synthetic access$1602(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .prologue
    .line 44
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    return-object p1
.end method

.method static synthetic access$1700(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/UserAuthResult;)V
    .locals 0
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;
    .param p1, "x1"    # Lcom/getjar/sdk/comm/auth/UserAuthResult;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->notifyAuthCompleted(Lcom/getjar/sdk/comm/auth/UserAuthResult;)V

    return-void
.end method

.method static synthetic access$1800(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    return-object v0
.end method

.method static synthetic access$1900(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/CommContext;
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method private ensureAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z
    .locals 23
    .param p1, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p2, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .param p3, "reAuth"    # Z

    .prologue
    .line 310
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() START [state:%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 313
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v14

    .line 315
    .local v14, "authFlowId":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowLock:Ljava/lang/Object;

    move-object/from16 v21, v0

    monitor-enter v21

    .line 318
    if-nez p3, :cond_0

    :try_start_0
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$1100(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 319
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() finishing with state:%1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 320
    const/16 v18, 0x1

    monitor-exit v21

    .line 389
    :goto_0
    return v18

    .line 323
    :cond_0
    const/16 v18, 0x0

    .line 324
    .local v18, "authStarted":Z
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->access$900(Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v2

    if-nez v2, :cond_a

    .line 326
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/ManualResetEvent;->close()V

    .line 327
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->STARTING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 330
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "AuthFlow: ensureAuthInternal() uiParent is %1$s, authFlowId: %2$s, reAuth: %3$s, called from [%4$s], %5$s"

    const/4 v2, 0x5

    new-array v7, v2, [Ljava/lang/Object;

    const/4 v8, 0x0

    if-nez p1, :cond_4

    const-string v2, "null"

    :goto_1
    aput-object v2, v7, v8

    const/4 v2, 0x1

    aput-object v14, v7, v2

    const/4 v2, 0x2

    invoke-static/range {p3 .. p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v8

    aput-object v8, v7, v2

    const/4 v2, 0x3

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v2

    const/4 v2, 0x4

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v2

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v4, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 333
    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->resolveProviders(Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;

    move-result-object v19

    .line 336
    .local v19, "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    if-nez p3, :cond_1

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    move-result-object v2

    instance-of v2, v2, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;

    if-nez v2, :cond_1

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    move-result-object v2

    instance-of v2, v2, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;

    if-eqz v2, :cond_2

    .line 342
    :cond_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$1000(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)V

    .line 343
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    .line 344
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    .line 345
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    .line 346
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    .line 347
    const/4 v2, 0x0

    move-object/from16 v0, p0

    iput-boolean v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_isNewUser:Z

    .line 348
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    .line 349
    const-wide/16 v2, 0x0

    move-object/from16 v0, p0

    iput-wide v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J

    .line 353
    :cond_2
    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getAppProvider()Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    move-result-object v2

    if-nez v2, :cond_5

    .line 354
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() Failed to resolved an AppAuthProvider to use %1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 378
    :goto_2
    if-nez v18, :cond_3

    .line 379
    :try_start_2
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 380
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 382
    :cond_3
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() finishing with state:%1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 389
    .end local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :goto_3
    monitor-exit v21

    goto/16 :goto_0

    .line 390
    .end local v18    # "authStarted":Z
    :catchall_0
    move-exception v2

    monitor-exit v21
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v2

    .line 330
    .restart local v18    # "authStarted":Z
    :cond_4
    :try_start_3
    const-string v2, "not null"

    goto/16 :goto_1

    .line 356
    .restart local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :cond_5
    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    move-result-object v2

    if-nez v2, :cond_7

    .line 357
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() Failed to resolved a UserAuthProvider to use, state:%1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_2

    .line 374
    .end local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :catch_0
    move-exception v20

    .line 375
    .local v20, "t":Ljava/lang/Throwable;
    :try_start_4
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AuthFlow: ensureAuthInternal() failed"

    move-object/from16 v0, v20

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 376
    const/16 v18, 0x0

    .line 378
    if-nez v18, :cond_6

    .line 379
    :try_start_5
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 380
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 382
    :cond_6
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() finishing with state:%1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_3

    .line 359
    .end local v20    # "t":Ljava/lang/Throwable;
    .restart local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :cond_7
    :try_start_6
    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v0, p2

    invoke-interface {v2, v3, v14, v0}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->isUINeeded(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v2

    if-eqz v2, :cond_9

    if-nez p1, :cond_9

    .line 360
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() \'uiParent\' is NULL and %1$s currently requires UI, state:%2$s"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 361
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AuthFlow: ensureAuthInternal() [unable to auth]"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto/16 :goto_2

    .line 378
    .end local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :catchall_1
    move-exception v2

    if-nez v18, :cond_8

    .line 379
    :try_start_7
    sget-object v3, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-object/from16 v0, p0

    iput-object v3, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 380
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v3}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 382
    :cond_8
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "AuthFlow: ensureAuthInternal() finishing with state:%1$s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    throw v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 364
    .restart local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :cond_9
    :try_start_8
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: ensureAuthInternal() state:%1$s"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 365
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AuthFlow: ensureAuthInternal() [running auth-flow]"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 367
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->STARTED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-object/from16 v0, p0

    iput-object v2, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 370
    sget-object v22, Lcom/getjar/sdk/comm/auth/AuthManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v6, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v7, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-wide v8, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    move-object/from16 v0, p0

    iget-wide v10, v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getAppProvider()Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    move-result-object v12

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;->getUserProvider()Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    move-result-object v13

    const/16 v17, 0x0

    move-object/from16 v3, p0

    move-object/from16 v15, p1

    move-object/from16 v16, p2

    invoke-direct/range {v2 .. v17}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;-><init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/getjar/sdk/comm/auth/AppAuthProvider;Lcom/getjar/sdk/comm/auth/UserAuthProvider;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Lcom/getjar/sdk/comm/auth/AuthManager$1;)V

    move-object/from16 v0, v22

    invoke-interface {v0, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_8
    .catch Ljava/lang/Throwable; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 371
    const/16 v18, 0x1

    goto/16 :goto_2

    .line 386
    .end local v19    # "providers":Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    :cond_a
    const/16 v18, 0x1

    goto/16 :goto_3
.end method

.method private static getExecutorServiceInstance()Ljava/util/concurrent/ExecutorService;
    .locals 1

    .prologue
    .line 174
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;
    .locals 2

    .prologue
    .line 90
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_Instance:Lcom/getjar/sdk/comm/auth/AuthManager;

    if-nez v0, :cond_0

    .line 91
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "AuthManager.initialize() must be called first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 93
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_Instance:Lcom/getjar/sdk/comm/auth/AuthManager;

    return-object v0
.end method

.method private static final getLoggingPrefix()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v3, 0x3

    .line 933
    const-string v0, ""

    .line 934
    .local v0, "methodName":Ljava/lang/String;
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v1

    .line 935
    .local v1, "stackTrace":[Ljava/lang/StackTraceElement;
    if-eqz v1, :cond_0

    array-length v2, v1

    if-lt v2, v3, :cond_0

    .line 936
    aget-object v2, v1, v3

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v0

    .line 938
    :cond_0
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "AuthFlow: %1$s() [thread:%2$d]"

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

.method public static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 2
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 80
    const-class v1, Lcom/getjar/sdk/comm/auth/AuthManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_Instance:Lcom/getjar/sdk/comm/auth/AuthManager;

    if-nez v0, :cond_0

    .line 81
    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/auth/AuthManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_Instance:Lcom/getjar/sdk/comm/auth/AuthManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 83
    :cond_0
    monitor-exit v1

    return-void

    .line 80
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private notifyAuthCompleted(Lcom/getjar/sdk/comm/auth/UserAuthResult;)V
    .locals 11
    .param p1, "authResult"    # Lcom/getjar/sdk/comm/auth/UserAuthResult;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 401
    const/4 v0, 0x0

    .line 403
    .local v0, "authSucceeded":Z
    :try_start_0
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: notifyAuthCompleted() START [state:%1$s]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    iget-object v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 407
    if-nez p1, :cond_1

    .line 408
    const/4 v0, 0x1

    .line 459
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowLock:Ljava/lang/Object;

    monitor-enter v3

    .line 460
    if-eqz v0, :cond_7

    .line 461
    :try_start_1
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 465
    :goto_1
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 466
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 468
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: notifyAuthCompleted() DONE [state:%1$s]"

    new-array v6, v10, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 470
    :goto_2
    return-void

    .line 409
    :cond_1
    :try_start_2
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getState()Lcom/getjar/sdk/comm/auth/AuthResult$State;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->succeeded()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 412
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getProviderFilter()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 413
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "UserAuthResult succeeded with NULL or empty provider filter"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 455
    :catch_0
    move-exception v1

    .line 456
    .local v1, "t":Ljava/lang/Throwable;
    const/4 v0, 0x0

    .line 459
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowLock:Ljava/lang/Object;

    monitor-enter v3

    .line 460
    if-eqz v0, :cond_8

    .line 461
    :try_start_3
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 465
    :goto_3
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 466
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 468
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: notifyAuthCompleted() DONE [state:%1$s]"

    new-array v6, v10, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_2

    .line 415
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_2
    :try_start_4
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 416
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "UserAuthResult succeeded with NULL or empty auth token"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 459
    :catchall_0
    move-exception v2

    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowLock:Ljava/lang/Object;

    monitor-enter v3

    .line 460
    if-eqz v0, :cond_9

    .line 461
    :try_start_5
    sget-object v4, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 465
    :goto_4
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 466
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 468
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "AuthFlow: notifyAuthCompleted() DONE [state:%1$s]"

    new-array v7, v10, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v2

    .line 418
    :cond_3
    :try_start_6
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserAccessId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 419
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "UserAuthResult succeeded with NULL or empty user access ID"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 421
    :cond_4
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserDeviceId()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 422
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "UserAuthResult succeeded with NULL or empty user device ID"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 424
    :cond_5
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_6

    .line 425
    new-instance v2, Ljava/lang/IllegalStateException;

    const-string v3, "UserAuthResult succeeded with a TTL less than zero"

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 430
    :cond_6
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$700(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;Ljava/lang/Long;)V

    .line 431
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$1300(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;Ljava/lang/Long;)V

    .line 432
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserAccessId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v4

    invoke-static {v2, v3, v4, v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$1400(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;J)V

    .line 433
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserDeviceId()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$1500(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;)V

    .line 434
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getClaims()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setClaims(Ljava/util/Map;J)V

    .line 435
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getSettings()Ljava/util/Map;

    move-result-object v3

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v4

    invoke-virtual {v2, v3, v4, v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setSettings(Ljava/util/Map;J)V

    .line 441
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->updateSettingsDependentState()V

    .line 444
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getProviderFilter()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    .line 445
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    .line 446
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserAccessId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    .line 447
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserDeviceId()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    .line 448
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->isNewUser()Z

    move-result v2

    iput-boolean v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_isNewUser:Z

    .line 449
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    .line 450
    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$600(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J
    :try_end_6
    .catch Ljava/lang/Throwable; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 452
    const/4 v0, 0x1

    goto/16 :goto_0

    .line 463
    :cond_7
    :try_start_7
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    goto/16 :goto_1

    .line 466
    :catchall_1
    move-exception v2

    monitor-exit v3
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    throw v2

    .line 463
    .restart local v1    # "t":Ljava/lang/Throwable;
    :cond_8
    :try_start_8
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    goto/16 :goto_3

    .line 466
    :catchall_2
    move-exception v2

    monitor-exit v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    throw v2

    .line 463
    .end local v1    # "t":Ljava/lang/Throwable;
    :cond_9
    :try_start_9
    sget-object v4, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    goto/16 :goto_4

    .line 466
    :catchall_3
    move-exception v2

    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    throw v2
.end method

.method private reAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V
    .locals 8
    .param p1, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    .prologue
    const/4 v7, 0x0

    const/4 v6, 0x1

    .line 906
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$s REAUTHORIZING"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 909
    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_0
    invoke-direct {p0, p1, v0, v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 912
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "%1$s REAUTHORIZATION FINISHED"

    new-array v4, v6, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 914
    return-void

    .line 912
    :catchall_0
    move-exception v0

    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "%1$s REAUTHORIZATION FINISHED"

    new-array v5, v6, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getLoggingPrefix()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    throw v0
.end method

.method private resetCurrentAuthFlow()V
    .locals 7

    .prologue
    const/4 v5, 0x1

    const/4 v6, 0x0

    .line 234
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->access$900(Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 235
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "resetCurrentAuthFlow(): Starting reset of auth from a state of \'%1$s\'"

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 239
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 240
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getExecutorServiceInstance()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_ExecutorService:Ljava/util/concurrent/ExecutorService;

    .line 243
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$1000(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)V

    .line 244
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    .line 245
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    .line 246
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    .line 247
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    .line 248
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_isNewUser:Z

    .line 249
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTTL:J

    .line 250
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authTimestamp:J

    .line 253
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->UNKNOWN:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 256
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v0}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "resetCurrentAuthFlow(): Finished reset of auth to a state of \'%1$s\'"

    new-array v3, v5, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 262
    :cond_0
    return-void

    .line 259
    :catchall_0
    move-exception v0

    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "resetCurrentAuthFlow(): Finished reset of auth to a state of \'%1$s\'"

    new-array v4, v5, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    throw v0
.end method

.method private resolveProviders(Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;
    .locals 5
    .param p1, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 814
    new-instance v0, Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;-><init>()V

    .line 817
    .local v0, "appAuthorizer":Lcom/getjar/sdk/comm/auth/AppAuthProvider;
    const/4 v2, 0x0

    .line 820
    .local v2, "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    const/4 v1, 0x0

    .line 821
    .local v1, "useEnforcedAuth":Z
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 822
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "enforced_android_account.account_name_hash"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 823
    const/4 v1, 0x1

    .line 832
    :cond_0
    :goto_0
    if-eqz v1, :cond_2

    .line 835
    new-instance v2, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;

    .end local v2    # "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    invoke-direct {v2}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;-><init>()V

    .line 846
    .restart local v2    # "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    :goto_1
    new-instance v3, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;

    invoke-direct {v3, p0, v0, v2}, Lcom/getjar/sdk/comm/auth/AuthManager$ProvidersBucket;-><init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AppAuthProvider;Lcom/getjar/sdk/comm/auth/UserAuthProvider;)V

    return-object v3

    .line 824
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "enforced_android_account.app_token"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "enforced_android_account.user_access_id"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "enforced_android_account.user_device_id"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 828
    const/4 v1, 0x1

    goto :goto_0

    .line 836
    :cond_2
    iget-object v3, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    const-string v4, "android.permission.GET_ACCOUNTS"

    invoke-static {v3, v4}, Lcom/getjar/sdk/utilities/RewardUtility;->checkPermission(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 839
    new-instance v2, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;

    .end local v2    # "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    invoke-direct {v2}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;-><init>()V

    .restart local v2    # "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    goto :goto_1

    .line 843
    :cond_3
    new-instance v2, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    .end local v2    # "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    invoke-direct {v2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    .restart local v2    # "userAuthProvider":Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    goto :goto_1
.end method

.method private updateSettingsDependentState()V
    .locals 5

    .prologue
    .line 477
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getInstance()Lcom/getjar/sdk/logging/Logger;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/logging/Logger;->configureAppenders(Landroid/content/Context;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 483
    :goto_0
    return-void

    .line 478
    :catch_0
    move-exception v0

    .line 481
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "updateSettingsDependentState() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public ensureAuth()Z
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 270
    const/4 v0, 0x0

    invoke-direct {p0, v1, v1, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z

    move-result v0

    return v0
.end method

.method public ensureAuthResetCurrent(Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z
    .locals 2
    .param p1, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .param p2, "forceAuth"    # Z

    .prologue
    .line 294
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerHint\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 295
    :cond_0
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->resetCurrentAuthFlow()V

    .line 296
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z

    move-result v0

    return v0
.end method

.method public ensureAuthWithUI(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)Z
    .locals 2
    .param p1, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    .prologue
    .line 281
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'uiParent\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 282
    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z

    move-result v0

    return v0
.end method

.method public fixUpgradedMissingUserAuthProviderFilter(Ljava/lang/String;)V
    .locals 3
    .param p1, "providerFilter"    # Ljava/lang/String;

    .prologue
    .line 188
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerFilter\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 189
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    const-wide/32 v1, 0x5265c00

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$700(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;Ljava/lang/String;Ljava/lang/Long;)V

    .line 190
    return-void
.end method

.method public getAuthToken()Ljava/lang/String;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authToken:Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilities()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1276
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$2000(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 927
    invoke-static {p1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->initialize(Landroid/content/Context;)V

    .line 928
    invoke-static {}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->getInstance()Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v0

    return-object v0
.end method

.method public getSettings()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/auth/SettingsValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1285
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authCachingManager:Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->access$2100(Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;)Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getUserAccessId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 204
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAccessId:Ljava/lang/String;

    return-object v0
.end method

.method public getUserAuthProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 179
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userAuthProviderFilter:Ljava/lang/String;

    return-object v0
.end method

.method public getUserDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 199
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_userDeviceId:Ljava/lang/String;

    return-object v0
.end method

.method public isAuthed()Z
    .locals 1

    .prologue
    .line 215
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->access$800(Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Z

    move-result v0

    return v0
.end method

.method public isNewUser()Z
    .locals 1

    .prologue
    .line 210
    iget-boolean v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_isNewUser:Z

    return v0
.end method

.method public observeAuthWithUiId(Ljava/lang/String;)V
    .locals 6
    .param p1, "authWithUiId"    # Ljava/lang/String;

    .prologue
    .line 800
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 801
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'authWithUiId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 803
    :cond_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "UserAuth: observeAuthWithUiId() observing authWithUiId: \'%1$s\'"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object p1, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 804
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_ObservedAuthWithUiIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 805
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager;->_ObservedAuthWithUiIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v0, p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    .line 807
    :cond_1
    return-void
.end method

.method public reAuth()V
    .locals 1

    .prologue
    .line 893
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->reAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V

    .line 894
    return-void
.end method

.method public reAuthWithUI(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V
    .locals 2
    .param p1, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 880
    if-nez p1, :cond_0

    .line 881
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'uiParent\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 883
    :cond_0
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/AuthManager;->reAuthInternal(Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;)V

    .line 884
    return-void
.end method

.method public waitOnAuth()V
    .locals 9

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 724
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: waitOnAuth() START [stack:%1$s]"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 729
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowEvent:Lcom/getjar/sdk/utilities/ManualResetEvent;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ManualResetEvent;->waitForOpen()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 737
    :goto_0
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_authFlowState:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    if-ne v1, v2, :cond_0

    .line 738
    new-instance v1, Lcom/getjar/sdk/exceptions/AuthException;

    const-string v2, "AuthFlowState = FAILED after _authFlowEvent.waitForOpen()"

    invoke-direct {v1, v2}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 742
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: waitOnAuth() FINISHED [stack:%1$s]"

    new-array v6, v7, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v1

    .line 730
    :catch_0
    move-exception v0

    .line 731
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "AuthFlow: waitOnAuth() waitForOpen() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 732
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 742
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "AuthFlow: waitOnAuth() FINISHED [stack:%1$s]"

    new-array v5, v7, [Ljava/lang/Object;

    invoke-static {}, Lcom/getjar/sdk/logging/Logger;->getShortStack()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 744
    return-void
.end method

.method public waitOnAuthWithUI(Ljava/lang/String;)V
    .locals 11
    .param p1, "theTitle"    # Ljava/lang/String;

    .prologue
    .line 756
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "UserAuth: waitOnAuthWithUI() START"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 761
    :try_start_0
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V
    :try_end_0
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 794
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "UserAuth: waitOnAuthWithUI() FINISHED"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 796
    :goto_0
    return-void

    .line 763
    :catch_0
    move-exception v1

    .line 764
    .local v1, "e":Lcom/getjar/sdk/exceptions/AuthException;
    :try_start_1
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "UserAuth: waitOnAuthWithUI() waitOnAuth() failed"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 768
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    .line 769
    .local v0, "authWithUiId":Ljava/lang/String;
    new-instance v2, Landroid/content/Intent;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    const-class v6, Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v2, v5, v6}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 770
    .local v2, "intent":Landroid/content/Intent;
    const/high16 v5, 0x10800000

    invoke-virtual {v2, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 771
    const-string v5, "theTitle"

    invoke-virtual {v2, v5, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 772
    const-string v5, "getjarContextId"

    iget-object v6, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 773
    const-string v5, "com.getjar.sdk.rewards.GetJarUserAuthSubActivity"

    const/4 v6, 0x1

    invoke-virtual {v2, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 774
    const-string v5, "auth.with.ui.id"

    invoke-virtual {v2, v5, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 775
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 778
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "UserAuth: waitOnAuthWithUI() waiting on authWithUiId: \'%1$s\'"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 779
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 780
    .local v3, "start":J
    :goto_1
    sget-object v5, Lcom/getjar/sdk/comm/auth/AuthManager;->_ObservedAuthWithUiIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v5, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v5

    sub-long/2addr v5, v3

    const-wide/16 v7, 0x2710

    cmp-long v5, v5, v7

    if-gez v5, :cond_0

    .line 782
    const-wide/16 v5, 0xfa

    :try_start_2
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 783
    :catch_1
    move-exception v1

    .line 784
    .local v1, "e":Ljava/lang/InterruptedException;
    :try_start_3
    new-instance v5, Lcom/getjar/sdk/exceptions/AuthException;

    invoke-direct {v5, v1}, Lcom/getjar/sdk/exceptions/AuthException;-><init>(Ljava/lang/Throwable;)V

    throw v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 794
    .end local v0    # "authWithUiId":Ljava/lang/String;
    .end local v1    # "e":Ljava/lang/InterruptedException;
    .end local v2    # "intent":Landroid/content/Intent;
    .end local v3    # "start":J
    :catchall_0
    move-exception v5

    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "UserAuth: waitOnAuthWithUI() FINISHED"

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v5

    .line 787
    .restart local v0    # "authWithUiId":Ljava/lang/String;
    .local v1, "e":Lcom/getjar/sdk/exceptions/AuthException;
    .restart local v2    # "intent":Landroid/content/Intent;
    .restart local v3    # "start":J
    :cond_0
    :try_start_4
    sget-object v5, Lcom/getjar/sdk/comm/auth/AuthManager;->_ObservedAuthWithUiIds:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v5, v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove(Ljava/lang/Object;)Z

    .line 788
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "UserAuth: waitOnAuthWithUI() finished waiting on authWithUiId: \'%1$s\'"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 791
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 794
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "UserAuth: waitOnAuthWithUI() FINISHED"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_0
.end method
