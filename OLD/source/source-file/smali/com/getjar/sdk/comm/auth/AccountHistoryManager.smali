.class public Lcom/getjar/sdk/comm/auth/AccountHistoryManager;
.super Ljava/lang/Object;
.source "AccountHistoryManager.java"


# static fields
.field private static volatile _Instance:Lcom/getjar/sdk/comm/auth/AccountHistoryManager;


# instance fields
.field private final _context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 17
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_Instance:Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    .line 21
    return-void
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;
    .locals 2

    .prologue
    .line 39
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_Instance:Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    if-nez v0, :cond_0

    .line 40
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "AccountHistoryManager.initialize() must be called first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_Instance:Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    return-object v0
.end method

.method public static declared-synchronized initialize(Landroid/content/Context;)V
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 29
    const-class v1, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_Instance:Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_Instance:Lcom/getjar/sdk/comm/auth/AccountHistoryManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    :cond_0
    monitor-exit v1

    return-void

    .line 29
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;)V
    .locals 3
    .param p1, "userAccessId"    # Ljava/lang/String;
    .param p2, "eventType"    # Lcom/getjar/sdk/comm/auth/AccountEventType;

    .prologue
    .line 150
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'userAccessId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 151
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'eventType\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, p1, p2, v1, v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->insertEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;J)V

    .line 154
    return-void
.end method

.method public ensureAccountEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "userAccessId"    # Ljava/lang/String;
    .param p2, "userDeviceId"    # Ljava/lang/String;
    .param p3, "accountName"    # Ljava/lang/String;
    .param p4, "providerFilter"    # Ljava/lang/String;

    .prologue
    .line 138
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'userAccessId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 139
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'userDeviceId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 140
    :cond_1
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'accountName\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 141
    :cond_2
    invoke-static {p4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerFilter\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_3
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v5

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-virtual/range {v0 .. v6}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->ensureAccountEntry(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 144
    return-void
.end method

.method public getAccounts()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;",
            ">;"
        }
    .end annotation

    .prologue
    .line 49
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getAccounts()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getCurrentAccountName()Ljava/lang/String;
    .locals 11

    .prologue
    .line 56
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getEvents()Ljava/util/List;

    move-result-object v2

    .line 57
    .local v2, "events":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;

    .line 58
    .local v1, "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AccountEventType;->isAuthEvent()Z

    move-result v4

    if-nez v4, :cond_1

    sget-object v4, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/auth/AccountEventType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 59
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v4

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getUserAccessId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getAccount(Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;

    move-result-object v0

    .line 60
    .local v0, "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    if-nez v0, :cond_2

    .line 61
    sget-object v4, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "getCurrentAccountName() Failed to load an account info record for user access ID \'%1$s\'"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getUserAccessId()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 65
    :cond_2
    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getAccountName()Ljava/lang/String;

    move-result-object v4

    .line 69
    .end local v0    # "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    .end local v1    # "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    :goto_1
    return-object v4

    :cond_3
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public getPreviousAccountName()Ljava/lang/String;
    .locals 12

    .prologue
    .line 79
    const/4 v1, 0x0

    .line 80
    .local v1, "currentUserAccessId":Ljava/lang/String;
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getEvents()Ljava/util/List;

    move-result-object v3

    .line 91
    .local v3, "events":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_4

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;

    .line 92
    .local v2, "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    if-nez v1, :cond_1

    .line 93
    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getUserAccessId()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 94
    :cond_1
    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getUserAccessId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AccountEventType;->isAuthEvent()Z

    move-result v5

    if-nez v5, :cond_2

    sget-object v5, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/auth/AccountEventType;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 97
    :cond_2
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v5

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getUserAccessId()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getAccount(Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;

    move-result-object v0

    .line 98
    .local v0, "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    if-nez v0, :cond_3

    .line 99
    sget-object v5, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "getPreviousAccountName() Failed to load an account info record for user access ID \'%1$s\'"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getUserAccessId()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_0

    .line 103
    :cond_3
    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->getAccountName()Ljava/lang/String;

    move-result-object v5

    .line 107
    .end local v0    # "account":Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
    .end local v2    # "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    :goto_1
    return-object v5

    :cond_4
    const/4 v5, 0x0

    goto :goto_1
.end method

.method public isUserSwitchedUINeeded(Ljava/lang/String;)Z
    .locals 6
    .param p1, "userAccessId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 114
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'userAccessId\' can not be NULL or empty"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 117
    :cond_0
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->_context:Landroid/content/Context;

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/getjar/sdk/comm/auth/AccountHistoryDatabase;->getEvents(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 118
    .local v1, "events":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;>;"
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;

    .line 119
    .local v0, "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    sget-object v4, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/auth/AccountEventType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 123
    const/4 v3, 0x1

    .line 128
    .end local v0    # "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    :cond_2
    :goto_0
    return v3

    .line 124
    .restart local v0    # "event":Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
    :cond_3
    sget-object v4, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED_UI_COMPLETED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/comm/auth/AccountEventType;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    goto :goto_0
.end method
