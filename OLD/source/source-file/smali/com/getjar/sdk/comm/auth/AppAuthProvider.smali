.class Lcom/getjar/sdk/comm/auth/AppAuthProvider;
.super Ljava/lang/Object;
.source "AppAuthProvider.java"

# interfaces
.implements Lcom/getjar/sdk/comm/auth/AuthProvider;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private getProviderData(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/Map;
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            ")",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/MetadataValue;",
            ">;"
        }
    .end annotation

    .prologue
    .line 99
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 100
    .local v0, "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataWithReliability()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 103
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/utilities/ScreenUtility;->getDisplayDetails(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 106
    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthMetadataUtility;->addSDKMetadataValues(Ljava/util/Map;)V

    .line 108
    return-object v0
.end method


# virtual methods
.method protected authorizeApplication(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AuthResult;
    .locals 20
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;

    .prologue
    .line 24
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() START"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 27
    const/4 v10, 0x0

    .line 30
    .local v10, "isBlacklistedOrUnsupported":Z
    :try_start_0
    invoke-static {}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    move-result-object v3

    invoke-direct/range {p0 .. p1}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderData(Lcom/getjar/sdk/comm/CommContext;)Ljava/util/Map;

    move-result-object v13

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v3, v0, v1, v13, v14}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->authorize(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v11

    .line 37
    .local v11, "opBaseAuth":Lcom/getjar/sdk/comm/Operation;
    const/4 v12, 0x0

    .line 39
    .local v12, "result":Lcom/getjar/sdk/comm/Result;
    :try_start_1
    invoke-virtual {v11}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v12

    .line 47
    if-nez v12, :cond_0

    .line 48
    :try_start_2
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() Failed to get results, returning NULL"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 49
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 92
    .end local v11    # "opBaseAuth":Lcom/getjar/sdk/comm/Operation;
    .end local v12    # "result":Lcom/getjar/sdk/comm/Result;
    :goto_0
    return-object v2

    .line 40
    .restart local v11    # "opBaseAuth":Lcom/getjar/sdk/comm/Operation;
    .restart local v12    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_0
    move-exception v9

    .line 41
    .local v9, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() opBaseAuth.get() failed"

    invoke-static {v13, v14, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 42
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 43
    .end local v9    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v9

    .line 44
    .local v9, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() opBaseAuth.get() failed"

    invoke-static {v13, v14, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 52
    .end local v9    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_0
    :try_start_5
    invoke-virtual {v12}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 55
    invoke-static {v12}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getClaimsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v5

    .line 56
    .local v5, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static {v12}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getSettingsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v6

    .line 57
    .local v6, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    invoke-static {v12}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getAuthTokenFromHeaders(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v4

    .line 58
    .local v4, "authToken":Ljava/lang/String;
    const-wide/32 v13, 0xa4cb800

    invoke-static {v5, v13, v14}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getTTLFromClaims(Ljava/util/Map;J)J

    move-result-wide v7

    .line 61
    .local v7, "ttl":J
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    invoke-direct/range {v2 .. v8}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V

    .line 62
    .local v2, "authResult":Lcom/getjar/sdk/comm/auth/AuthResult;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v15, "AuthFlow: authorizeApplication() DONE [authToken:%1$s, claimsCount:%2$d, ttl:%3$d]"

    const/16 v16, 0x3

    move/from16 v0, v16

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x1

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthResult;->getClaims()Ljava/util/Map;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Map;->size()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v18

    aput-object v18, v16, v17

    const/16 v17, 0x2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthResult;->getTTL()J

    move-result-wide v18

    invoke-static/range {v18 .. v19}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v18

    aput-object v18, v16, v17

    move-object/from16 v0, v16

    invoke-static {v3, v15, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 75
    .end local v2    # "authResult":Lcom/getjar/sdk/comm/auth/AuthResult;
    .end local v4    # "authToken":Ljava/lang/String;
    .end local v5    # "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v6    # "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .end local v7    # "ttl":J
    :cond_1
    :try_start_6
    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Lcom/getjar/sdk/comm/Result;->checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result v10

    .line 80
    if-eqz v10, :cond_2

    .line 81
    :try_start_7
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() We are blacklisted or unsupported"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 82
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 76
    :catch_2
    move-exception v9

    .line 77
    .local v9, "e":Lorg/json/JSONException;
    :try_start_8
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() result.checkForBlacklistedOrUnsupported() failed"

    invoke-static {v13, v14, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 84
    .end local v9    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_9
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 87
    .end local v11    # "opBaseAuth":Lcom/getjar/sdk/comm/Operation;
    .end local v12    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_3
    move-exception v9

    .line 88
    .local v9, "e":Ljava/lang/Exception;
    :try_start_a
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() failed"

    invoke-static {v13, v14, v3, v9}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 90
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v3, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 92
    new-instance v2, Lcom/getjar/sdk/comm/auth/AuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v3

    sget-object v13, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v2, v3, v13}, Lcom/getjar/sdk/comm/auth/AuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    goto/16 :goto_0

    .line 90
    .end local v9    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    sget-object v13, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v13}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v13

    const-string v15, "AuthFlow: authorizeApplication() DONE"

    invoke-static {v13, v14, v15}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v3
.end method

.method public getProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 113
    const-string v0, "app"

    return-object v0
.end method
