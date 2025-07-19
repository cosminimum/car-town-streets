.class public Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;
.super Ljava/lang/Object;
.source "ProxyAccountUserAuthProvider.java"

# interfaces
.implements Lcom/getjar/sdk/comm/auth/UserAuthProvider;


# static fields
.field public static final _KeyProviderHintUserDeviceHash:Ljava/lang/String; = "android_account.user_device_hash"

.field public static final _KeyProviderHintUsernameDataHash:Ljava/lang/String; = "android_account.username_data_hash"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getProviderData(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/util/Map;
    .locals 6
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Lcom/getjar/sdk/comm/auth/ProviderHint;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 148
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'commContext\' cannot be NULL"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 149
    :cond_0
    invoke-direct {p0, p2}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->validateProviderHint(Lcom/getjar/sdk/comm/auth/ProviderHint;)V

    .line 152
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 153
    .local v1, "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    const-string v2, "source.provider_filter"

    new-instance v3, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v3, v4, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    const-string v3, "android_account.username_data_hash"

    new-instance v4, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v2

    const-string v5, "android_account.username_data_hash"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v4, v2, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 159
    const-string v3, "android_account.user_device_hash"

    new-instance v4, Lcom/getjar/sdk/data/MetadataValue;

    invoke-virtual {p2}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v2

    const-string v5, "android_account.user_device_hash"

    invoke-virtual {v2, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v4, v2, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataWithReliability()Ljava/util/Map;

    move-result-object v0

    .line 165
    .local v0, "deviceMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v2

    if-gtz v2, :cond_2

    .line 166
    :cond_1
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: getProviderData() failed to get device metadata"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 167
    const/4 v1, 0x0

    .line 179
    .end local v1    # "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    :goto_0
    return-object v1

    .line 171
    .restart local v1    # "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    :cond_2
    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 174
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/ScreenUtility;->getDisplayDetails(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 177
    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthMetadataUtility;->addSDKMetadataValues(Ljava/util/Map;)V

    goto :goto_0
.end method

.method private isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z
    .locals 2
    .param p1, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 199
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getFilter()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private validateProviderHint(Lcom/getjar/sdk/comm/auth/ProviderHint;)V
    .locals 2
    .param p1, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 187
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->isProviderHintForMe(Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "android_account.username_data_hash"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "android_account.username_data_hash"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "android_account.user_device_hash"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v0

    const-string v1, "android_account.user_device_hash"

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 193
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'providerHint\' does not contain required data"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 195
    :cond_1
    return-void
.end method


# virtual methods
.method public ensureUser(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .locals 23
    .param p1, "currentAuthToken"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "authFlowId"    # Ljava/lang/String;
    .param p4, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p5, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 48
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'currentAuthToken\' cannot be NULL or empty"

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 49
    :cond_0
    if-nez p2, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'commContext\' cannot be NULL"

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 50
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'authFlowId\' cannot be NULL or empty"

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 51
    :cond_2
    if-nez p5, :cond_3

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'providerHint\' cannot be NULL"

    invoke-direct {v4, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 52
    :cond_3
    move-object/from16 v0, p0

    move-object/from16 v1, p5

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->validateProviderHint(Lcom/getjar/sdk/comm/auth/ProviderHint;)V

    .line 54
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() START"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 58
    :try_start_0
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() Calling validateAuth()"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 59
    invoke-static {}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    move-result-object v3

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderData(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/util/Map;

    move-result-object v7

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v4, p2

    move-object/from16 v5, p3

    move-object/from16 v6, p1

    invoke-virtual/range {v3 .. v8}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->validateAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v14

    .line 65
    .local v14, "operation":Lcom/getjar/sdk/comm/Operation;
    const/4 v15, 0x0

    .line 67
    .local v15, "result":Lcom/getjar/sdk/comm/Result;
    :try_start_1
    invoke-virtual {v14}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v15

    .line 77
    if-nez v15, :cond_4

    .line 78
    :try_start_2
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() failed to get results"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 79
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 141
    .end local v14    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :goto_0
    return-object v3

    .line 68
    .restart local v14    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v15    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_0
    move-exception v13

    .line 69
    .local v13, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() operation.get() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 70
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 71
    .end local v13    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v13

    .line 72
    .local v13, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_4
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() operation.get() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 73
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 82
    .end local v13    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_4
    :try_start_5
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v4

    if-eqz v4, :cond_6

    .line 83
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() got successful results"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 86
    invoke-static {v15}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getClaimsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v9

    .line 87
    .local v9, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v15}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getSettingsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v10

    .line 88
    .local v10, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    invoke-static {v15}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getAuthTokenFromHeaders(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v8

    .line 89
    .local v8, "newAuthToken":Ljava/lang/String;
    const-wide/32 v17, 0xa4cb800

    move-wide/from16 v0, v17

    invoke-static {v9, v0, v1}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getTTLFromClaims(Ljava/util/Map;J)J

    move-result-wide v11

    .line 92
    .local v11, "ttl":J
    const/4 v5, 0x0

    .line 93
    .local v5, "userAccessId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 94
    .local v6, "userDeviceId":Ljava/lang/String;
    if-eqz v9, :cond_5

    .line 95
    const-string v4, "claims.user.user_access_id"

    invoke-interface {v9, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "userAccessId":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 96
    .restart local v5    # "userAccessId":Ljava/lang/String;
    const-string v4, "claims.user.device.id"

    invoke-interface {v9, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "userDeviceId":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;

    .line 100
    .restart local v6    # "userDeviceId":Ljava/lang/String;
    :cond_5
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Result;->isSuccessfulCreationResponse()Z

    move-result v7

    invoke-direct/range {v3 .. v12}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V

    .line 109
    .local v3, "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]"

    const/16 v19, 0x5

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserAccessId()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x1

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserDeviceId()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x2

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getClaims()Ljava/util/Map;

    move-result-object v21

    invoke-interface/range {v21 .. v21}, Ljava/util/Map;->size()I

    move-result v21

    invoke-static/range {v21 .. v21}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v21

    aput-object v21, v19, v20

    const/16 v20, 0x4

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getTTL()J

    move-result-wide v21

    invoke-static/range {v21 .. v22}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, v19

    invoke-static {v4, v7, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 118
    .end local v3    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .end local v5    # "userAccessId":Ljava/lang/String;
    .end local v6    # "userDeviceId":Ljava/lang/String;
    .end local v8    # "newAuthToken":Ljava/lang/String;
    .end local v9    # "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .end local v11    # "ttl":J
    :cond_6
    :try_start_6
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() got failure results"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 121
    invoke-static {v15}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v16

    .line 122
    .local v16, "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v16, :cond_7

    .line 123
    move-object/from16 v0, p2

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    .line 127
    :cond_7
    move-object/from16 v0, p2

    invoke-virtual {v15, v0}, Lcom/getjar/sdk/comm/Result;->checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z

    move-result v4

    if-eqz v4, :cond_8

    .line 128
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 129
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 131
    :cond_8
    :try_start_7
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 136
    .end local v14    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v15    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v16    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    :catch_2
    move-exception v13

    .line 137
    .local v13, "e":Ljava/lang/Exception;
    :try_start_8
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 139
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 141
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/ProxyAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    goto/16 :goto_0

    .line 139
    .end local v13    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v7, "AuthFlow: ProxyAccountUserAuthProvider: ensureUser() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v4
.end method

.method public getProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    const-string v0, "proxy_account"

    return-object v0
.end method

.method public getProxiableAuthData(Landroid/content/Context;)Ljava/util/Map;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 37
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "\'ProxyAccountUserAuthProvider\' does not support getHashedAuthData()"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isUINeeded(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/ProviderHint;)Z
    .locals 1
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 42
    const/4 v0, 0x0

    return v0
.end method
