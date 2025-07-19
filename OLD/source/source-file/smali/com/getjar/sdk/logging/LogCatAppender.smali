.class public Lcom/getjar/sdk/logging/LogCatAppender;
.super Lcom/getjar/sdk/logging/AppenderBase;
.source "LogCatAppender.java"


# static fields
.field private static _ConfigurationLock:Ljava/lang/Object;

.field private static _Instance:Lcom/getjar/sdk/logging/LogCatAppender;

.field private static _InstanceLock:Ljava/lang/Object;

.field private static _PACKAGE_NAME:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 17
    sput-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_Instance:Lcom/getjar/sdk/logging/LogCatAppender;

    .line 18
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/LogCatAppender;->_InstanceLock:Ljava/lang/Object;

    .line 32
    sput-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_PACKAGE_NAME:Ljava/lang/String;

    .line 33
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/LogCatAppender;->_ConfigurationLock:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>()V
    .locals 4

    .prologue
    .line 16
    const/4 v0, 0x1

    const/4 v1, 0x2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/getjar/sdk/logging/AppenderBase;-><init>(ZIJ)V

    return-void
.end method

.method protected static getInstance()Lcom/getjar/sdk/logging/LogCatAppender;
    .locals 2

    .prologue
    .line 20
    sget-object v0, Lcom/getjar/sdk/logging/LogCatAppender;->_Instance:Lcom/getjar/sdk/logging/LogCatAppender;

    if-nez v0, :cond_1

    .line 21
    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_InstanceLock:Ljava/lang/Object;

    monitor-enter v1

    .line 22
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/logging/LogCatAppender;->_Instance:Lcom/getjar/sdk/logging/LogCatAppender;

    if-nez v0, :cond_0

    .line 23
    new-instance v0, Lcom/getjar/sdk/logging/LogCatAppender;

    invoke-direct {v0}, Lcom/getjar/sdk/logging/LogCatAppender;-><init>()V

    sput-object v0, Lcom/getjar/sdk/logging/LogCatAppender;->_Instance:Lcom/getjar/sdk/logging/LogCatAppender;

    .line 25
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    :cond_1
    sget-object v0, Lcom/getjar/sdk/logging/LogCatAppender;->_Instance:Lcom/getjar/sdk/logging/LogCatAppender;

    return-object v0

    .line 25
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public configureAppender(Landroid/content/Context;)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x2

    .line 40
    if-nez p1, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "\'context\' cannot be NULL or empty"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 42
    :cond_0
    const-string v5, "LogCatAppender: configureAppender() START"

    invoke-virtual {p0, v6, v5}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 43
    sget-object v6, Lcom/getjar/sdk/logging/LogCatAppender;->_ConfigurationLock:Ljava/lang/Object;

    monitor-enter v6

    .line 49
    :try_start_0
    sget-object v5, Lcom/getjar/sdk/logging/LogCatAppender;->_PACKAGE_NAME:Ljava/lang/String;

    if-nez v5, :cond_1

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lcom/getjar/sdk/logging/LogCatAppender;->_PACKAGE_NAME:Ljava/lang/String;

    .line 51
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "%1$s [%2$s]"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    sget-object v10, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x1

    sget-object v10, Lcom/getjar/sdk/logging/LogCatAppender;->_PACKAGE_NAME:Ljava/lang/String;

    aput-object v10, v8, v9

    invoke-static {v5, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    sput-object v5, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    :cond_1
    :goto_0
    const/4 v5, 0x2

    :try_start_1
    const-string v7, "LogCatAppender: configureAppender() GetJarConfig.getInstance() start"

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 59
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v3

    .line 60
    .local v3, "getJarConfig":Lcom/getjar/sdk/comm/GetJarConfig;
    const/4 v5, 0x2

    const-string v7, "LogCatAppender: configureAppender() GetJarConfig.getInstance() finished"

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 61
    const-string v5, "logging.logcat.enabled"

    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    .line 62
    .local v2, "enabled":Z
    const/4 v5, 0x2

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "LogCatAppender: configureAppender() got enabled = %1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 63
    const-string v5, "logging.logcat.level"

    const-string v7, "VERBOSE"

    invoke-virtual {v3, v5, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 64
    .local v4, "levelStr":Ljava/lang/String;
    const/4 v5, 0x2

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "LogCatAppender: configureAppender() got levelStr = %1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v4, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 65
    const-string v5, "logging.logcat.areas"

    sget-object v7, Lcom/getjar/sdk/logging/Area;->ALL:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->name()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v5, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 66
    .local v0, "areasStr":Ljava/lang/String;
    const/4 v5, 0x2

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "LogCatAppender: configureAppender() got areasStr = %1$s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v0, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 69
    const/4 v5, 0x2

    const-string v7, "LogCatAppender: configureAppender() calling AppenderBase.configureAppender()"

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 70
    invoke-super {p0, v2, v4, v0}, Lcom/getjar/sdk/logging/AppenderBase;->configureAppender(ZLjava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    const/4 v5, 0x2

    :try_start_2
    const-string v7, "LogCatAppender: configureAppender() FINISHED"

    invoke-virtual {p0, v5, v7}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    .line 76
    monitor-exit v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 77
    return-void

    .line 53
    .end local v0    # "areasStr":Ljava/lang/String;
    .end local v2    # "enabled":Z
    .end local v3    # "getJarConfig":Lcom/getjar/sdk/comm/GetJarConfig;
    .end local v4    # "levelStr":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 54
    .local v1, "e":Ljava/lang/Exception;
    const/4 v5, 0x6

    :try_start_3
    const-string v7, "configureAppender() failed to update the logging TAG with the package name"

    invoke-virtual {p0, v5, v7, v1}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto/16 :goto_0

    .line 73
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v5

    const/4 v7, 0x2

    :try_start_4
    const-string v8, "LogCatAppender: configureAppender() FINISHED"

    invoke-virtual {p0, v7, v8}, Lcom/getjar/sdk/logging/LogCatAppender;->logInternal(ILjava/lang/String;)V

    throw v5

    .line 76
    :catchall_1
    move-exception v5

    monitor-exit v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw v5
.end method

.method public bridge synthetic getAreas()J
    .locals 2

    .prologue
    .line 11
    invoke-super {p0}, Lcom/getjar/sdk/logging/AppenderBase;->getAreas()J

    move-result-wide v0

    return-wide v0
.end method

.method public bridge synthetic getLevel()I
    .locals 1

    .prologue
    .line 11
    invoke-super {p0}, Lcom/getjar/sdk/logging/AppenderBase;->getLevel()I

    move-result v0

    return v0
.end method

.method public bridge synthetic isAreaActive(J)Z
    .locals 1
    .param p1, "x0"    # J

    .prologue
    .line 11
    invoke-super {p0, p1, p2}, Lcom/getjar/sdk/logging/AppenderBase;->isAreaActive(J)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isEnabled()Z
    .locals 1

    .prologue
    .line 11
    invoke-super {p0}, Lcom/getjar/sdk/logging/AppenderBase;->isEnabled()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic isLevelActive(I)Z
    .locals 1
    .param p1, "x0"    # I

    .prologue
    .line 11
    invoke-super {p0, p1}, Lcom/getjar/sdk/logging/AppenderBase;->isLevelActive(I)Z

    move-result v0

    return v0
.end method

.method public log(Lcom/getjar/sdk/logging/LogMessage;)V
    .locals 8
    .param p1, "logMessage"    # Lcom/getjar/sdk/logging/LogMessage;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 84
    if-nez p1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'logMessage\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 87
    :cond_0
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v1

    invoke-virtual {p0, v1}, Lcom/getjar/sdk/logging/LogCatAppender;->isLevelActive(I)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v1

    invoke-virtual {p0, v1, v2}, Lcom/getjar/sdk/logging/LogCatAppender;->isAreaActive(J)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 88
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "%1$s: %2$s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v4

    invoke-static {v4, v5}, Lcom/getjar/sdk/logging/Area;->toString(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getMessage()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v7

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 89
    .local v0, "logCatMsg":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 106
    new-instance v1, Ljava/lang/IllegalArgumentException;

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "Unsupported log level [level:%1$d]"

    new-array v4, v7, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 91
    :pswitch_0
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_2

    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .end local v0    # "logCatMsg":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 91
    .restart local v0    # "logCatMsg":Ljava/lang/String;
    :cond_2
    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v1, v0, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 94
    :pswitch_1
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_3

    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_3
    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v1, v0, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 97
    :pswitch_2
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_4

    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_4
    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v1, v0, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 100
    :pswitch_3
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_5

    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_5
    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v1, v0, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 103
    :pswitch_4
    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_6

    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_6
    sget-object v1, Lcom/getjar/sdk/logging/LogCatAppender;->_TAG:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/getjar/sdk/logging/LogMessage;->getThrowable()Ljava/lang/Throwable;

    move-result-object v2

    invoke-static {v1, v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 89
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
