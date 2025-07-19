.class Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;
.super Ljava/lang/Object;
.source "AuthManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AuthManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AuthFlow"
.end annotation


# instance fields
.field private final _appProvider:Lcom/getjar/sdk/comm/auth/AppAuthProvider;

.field private final _authFlowId:Ljava/lang/String;

.field private final _authTTL:J

.field private final _authTimestamp:J

.field private final _authToken:Ljava/lang/String;

.field private final _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private final _providerHint:Lcom/getjar/sdk/comm/auth/ProviderHint;

.field private final _uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

.field private final _userAccessId:Ljava/lang/String;

.field private final _userDeviceId:Ljava/lang/String;

.field private final _userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

.field final synthetic this$0:Lcom/getjar/sdk/comm/auth/AuthManager;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/getjar/sdk/comm/auth/AppAuthProvider;Lcom/getjar/sdk/comm/auth/UserAuthProvider;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)V
    .locals 3
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "authToken"    # Ljava/lang/String;
    .param p4, "userAccessId"    # Ljava/lang/String;
    .param p5, "userDeviceId"    # Ljava/lang/String;
    .param p6, "authTTL"    # J
    .param p8, "authTimestamp"    # J
    .param p10, "appProvider"    # Lcom/getjar/sdk/comm/auth/AppAuthProvider;
    .param p11, "userProvider"    # Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    .param p12, "authFlowId"    # Ljava/lang/String;
    .param p13, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p14, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 503
    iput-object p1, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 504
    if-nez p2, :cond_0

    .line 505
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'commContext\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 507
    :cond_0
    if-nez p10, :cond_1

    .line 508
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'appProvider\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 510
    :cond_1
    if-nez p11, :cond_2

    .line 511
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'userProvider\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 513
    :cond_2
    invoke-static {p12}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 514
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'authFlowId\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 517
    :cond_3
    iput-object p2, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 518
    iput-object p12, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authFlowId:Ljava/lang/String;

    .line 519
    iput-object p3, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authToken:Ljava/lang/String;

    .line 520
    iput-object p4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userAccessId:Ljava/lang/String;

    .line 521
    iput-object p5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userDeviceId:Ljava/lang/String;

    .line 522
    iput-wide p6, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authTTL:J

    .line 523
    iput-wide p8, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authTimestamp:J

    .line 524
    iput-object p10, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_appProvider:Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    .line 525
    iput-object p11, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    .line 526
    move-object/from16 v0, p13

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    .line 527
    move-object/from16 v0, p14

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_providerHint:Lcom/getjar/sdk/comm/auth/ProviderHint;

    .line 528
    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/getjar/sdk/comm/auth/AppAuthProvider;Lcom/getjar/sdk/comm/auth/UserAuthProvider;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;Lcom/getjar/sdk/comm/auth/AuthManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager;
    .param p2, "x1"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "x2"    # Ljava/lang/String;
    .param p4, "x3"    # Ljava/lang/String;
    .param p5, "x4"    # Ljava/lang/String;
    .param p6, "x5"    # J
    .param p8, "x6"    # J
    .param p10, "x7"    # Lcom/getjar/sdk/comm/auth/AppAuthProvider;
    .param p11, "x8"    # Lcom/getjar/sdk/comm/auth/UserAuthProvider;
    .param p12, "x9"    # Ljava/lang/String;
    .param p13, "x10"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p14, "x11"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .param p15, "x12"    # Lcom/getjar/sdk/comm/auth/AuthManager$1;

    .prologue
    .line 488
    invoke-direct/range {p0 .. p14}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;-><init>(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JJLcom/getjar/sdk/comm/auth/AppAuthProvider;Lcom/getjar/sdk/comm/auth/UserAuthProvider;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)V

    return-void
.end method

.method private hasAuthData()Z
    .locals 1

    .prologue
    .line 698
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userAccessId:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userDeviceId:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authToken:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 699
    const/4 v0, 0x1

    .line 701
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isAuthExpired()Z
    .locals 9

    .prologue
    .line 709
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 710
    .local v3, "now":J
    iget-wide v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authTimestamp:J

    iget-wide v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authTTL:J

    add-long/2addr v5, v7

    const-wide/32 v7, 0x36ee80

    sub-long v1, v5, v7

    .line 711
    .local v1, "expiresOn":J
    cmp-long v5, v1, v3

    if-gez v5, :cond_0

    const/4 v0, 0x1

    .line 712
    .local v0, "authExpired":Z
    :goto_0
    return v0

    .line 711
    .end local v0    # "authExpired":Z
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private performAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .locals 10
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p4, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 581
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->APP_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v0, v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1602(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 582
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "AuthFlow: AuthFlow.performAuth() %1$s"

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 584
    const/4 v7, 0x0

    .line 585
    .local v7, "userResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_appProvider:Lcom/getjar/sdk/comm/auth/AppAuthProvider;

    invoke-virtual {v0, p1, p2}, Lcom/getjar/sdk/comm/auth/AppAuthProvider;->authorizeApplication(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AuthResult;

    move-result-object v6

    .line 586
    .local v6, "appResult":Lcom/getjar/sdk/comm/auth/AuthResult;
    if-eqz v6, :cond_0

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthResult;->getState()Lcom/getjar/sdk/comm/auth/AuthResult$State;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->succeeded()Z

    move-result v0

    if-nez v0, :cond_1

    .line 588
    :cond_0
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    const-string v2, "AuthFlow: AuthFlow.performAuth() AppAuthProvider.authorizeApplication() failed"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 589
    new-instance v7, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    .end local v7    # "userResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v0}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v7, v0, v1}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    .line 600
    .restart local v7    # "userResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :goto_0
    return-object v7

    .line 592
    :cond_1
    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthResult;->getSettings()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 593
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1800(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;

    move-result-object v0

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthResult;->getSettings()Ljava/util/Map;

    move-result-object v1

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthResult;->getTTL()J

    move-result-wide v2

    invoke-virtual {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthCachingManager;->setSettings(Ljava/util/Map;J)V

    .line 595
    :cond_2
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->USER_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v0, v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1602(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 596
    sget-object v0, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v3, "AuthFlow: AuthFlow.performAuth() %1$s"

    new-array v4, v9, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 597
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-virtual {v6}, Lcom/getjar/sdk/comm/auth/AuthResult;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-interface/range {v0 .. v5}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->ensureUser(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-result-object v7

    goto :goto_0
.end method

.method private validateAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .locals 23
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "authTokenToValidate"    # Ljava/lang/String;

    .prologue
    .line 604
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() START"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 607
    :try_start_0
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->VALIDATING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v4, v7}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1602(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 608
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AuthFlow.validateAuth() %1$s"

    const/16 v19, 0x1

    move/from16 v0, v19

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    move-object/from16 v21, v0

    invoke-static/range {v21 .. v21}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v21

    invoke-virtual/range {v21 .. v21}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v21

    aput-object v21, v19, v20

    move-object/from16 v0, v19

    invoke-static {v4, v7, v0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 610
    const/4 v14, 0x0

    .line 613
    .local v14, "isBlacklistedOrUnsupported":Z
    invoke-static {}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    move-result-object v4

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-virtual {v4, v0, v1, v2}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->validateAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v15

    .line 616
    .local v15, "operation":Lcom/getjar/sdk/comm/Operation;
    const/16 v16, 0x0

    .line 618
    .local v16, "result":Lcom/getjar/sdk/comm/Result;
    :try_start_1
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v16

    .line 626
    if-nez v16, :cond_0

    .line 627
    :try_start_2
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() Failed to get results, returning NULL"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 628
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 693
    .end local v14    # "isBlacklistedOrUnsupported":Z
    .end local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :goto_0
    return-object v3

    .line 619
    .restart local v14    # "isBlacklistedOrUnsupported":Z
    .restart local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_0
    move-exception v13

    .line 620
    .local v13, "e":Ljava/lang/InterruptedException;
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() opBaseAuth.get() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 621
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 622
    .end local v13    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v13

    .line 623
    .local v13, "e":Ljava/util/concurrent/ExecutionException;
    :try_start_4
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() opBaseAuth.get() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 624
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 631
    .end local v13    # "e":Ljava/util/concurrent/ExecutionException;
    :cond_0
    :try_start_5
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 634
    invoke-static/range {v16 .. v16}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getClaimsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v9

    .line 635
    .local v9, "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-static/range {v16 .. v16}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getSettingsFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/util/Map;

    move-result-object v10

    .line 636
    .local v10, "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    invoke-static/range {v16 .. v16}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getAuthTokenFromHeaders(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v8

    .line 637
    .local v8, "authTokenReturned":Ljava/lang/String;
    const-wide/32 v17, 0xa4cb800

    move-wide/from16 v0, v17

    invoke-static {v9, v0, v1}, Lcom/getjar/sdk/comm/auth/AuthUtilities;->getTTLFromClaims(Ljava/util/Map;J)J

    move-result-wide v11

    .line 640
    .local v11, "ttl":J
    const/4 v5, 0x0

    .line 641
    .local v5, "userAccessId":Ljava/lang/String;
    const/4 v6, 0x0

    .line 642
    .local v6, "userDeviceId":Ljava/lang/String;
    if-eqz v9, :cond_1

    .line 643
    const-string v4, "claims.user.user_access_id"

    invoke-interface {v9, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    .end local v5    # "userAccessId":Ljava/lang/String;
    check-cast v5, Ljava/lang/String;

    .line 644
    .restart local v5    # "userAccessId":Ljava/lang/String;
    const-string v4, "claims.user.device.id"

    invoke-interface {v9, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    .end local v6    # "userDeviceId":Ljava/lang/String;
    check-cast v6, Ljava/lang/String;
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 649
    .restart local v6    # "userDeviceId":Ljava/lang/String;
    :cond_1
    :try_start_6
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_VALIDATED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v4, v5, v7}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->addEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_2
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 657
    :goto_1
    :try_start_7
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-direct/range {v3 .. v12}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/util/Map;Ljava/util/Map;J)V

    .line 667
    .local v3, "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: validateAuth() DONE [userAccessId:%1$s, userDeviceId%2$s, authToken:%3$s, claimsCount:%4$d, ttl:%5$d]"

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
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 650
    .end local v3    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :catch_2
    move-exception v13

    .line 653
    .local v13, "e":Ljava/lang/Exception;
    :try_start_8
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AccountHistoryManager work failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_1

    .line 688
    .end local v5    # "userAccessId":Ljava/lang/String;
    .end local v6    # "userDeviceId":Ljava/lang/String;
    .end local v8    # "authTokenReturned":Ljava/lang/String;
    .end local v9    # "claims":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v10    # "settings":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/comm/auth/SettingsValue;>;"
    .end local v11    # "ttl":J
    .end local v13    # "e":Ljava/lang/Exception;
    .end local v14    # "isBlacklistedOrUnsupported":Z
    .end local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_3
    move-exception v13

    .line 689
    .restart local v13    # "e":Ljava/lang/Exception;
    :try_start_9
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 693
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    goto/16 :goto_0

    .line 676
    .end local v13    # "e":Ljava/lang/Exception;
    .restart local v14    # "isBlacklistedOrUnsupported":Z
    .restart local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_2
    :try_start_a
    move-object/from16 v0, v16

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/Result;->checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_4
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    move-result v14

    .line 681
    if-eqz v14, :cond_3

    .line 682
    :try_start_b
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() We are blacklisted or unsupported"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 683
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 677
    :catch_4
    move-exception v13

    .line 678
    .local v13, "e":Lorg/json/JSONException;
    :try_start_c
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() result.checkForBlacklistedOrUnsupported() failed"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4, v13}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 679
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_3
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 685
    .end local v13    # "e":Lorg/json/JSONException;
    :cond_3
    :try_start_d
    new-instance v3, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v3, v4, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_3
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    .line 691
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v4, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .end local v14    # "isBlacklistedOrUnsupported":Z
    .end local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :catchall_0
    move-exception v4

    sget-object v7, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v17

    const-string v7, "AuthFlow: validateAuth() DONE"

    move-wide/from16 v0, v17

    invoke-static {v0, v1, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v4
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x1

    const/4 v11, 0x0

    .line 533
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AuthFlow.run() START [state:%1$s]"

    new-array v8, v12, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v9}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 534
    const/4 v0, 0x0

    .line 537
    .local v0, "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :try_start_0
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    sget-object v5, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->DATA_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v4, v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1602(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 538
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AuthFlow.run() %1$s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v10}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v10

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 540
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->hasAuthData()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 542
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    sget-object v5, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->EXPIRY_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v4, v5}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1602(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 543
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AuthFlow.run() %1$s"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    iget-object v10, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v10}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v10

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 545
    new-instance v4, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v4}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v6, 0x0

    iget-object v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_providerHint:Lcom/getjar/sdk/comm/auth/ProviderHint;

    invoke-virtual {v4, v5, v6, v7}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->isUINeeded(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/ProviderHint;)Z

    move-result v2

    .line 546
    .local v2, "isUINeeded":Z
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->isAuthExpired()Z

    move-result v4

    if-nez v4, :cond_0

    if-eqz v2, :cond_4

    .line 548
    :cond_0
    if-nez v2, :cond_1

    .line 549
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authFlowId:Ljava/lang/String;

    iget-object v6, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authToken:Ljava/lang/String;

    invoke-direct {p0, v4, v5, v6}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->validateAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-result-object v0

    .line 552
    :cond_1
    if-nez v2, :cond_2

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getState()Lcom/getjar/sdk/comm/auth/AuthResult$State;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->succeeded()Z

    move-result v4

    if-nez v4, :cond_3

    .line 553
    :cond_2
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authFlowId:Ljava/lang/String;

    iget-object v6, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    iget-object v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_providerHint:Lcom/getjar/sdk/comm/auth/ProviderHint;

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->performAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 574
    .end local v2    # "isUINeeded":Z
    :goto_0
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AuthFlow.run() DONE %1$s"

    new-array v8, v12, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v9}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 575
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v4, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1700(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/UserAuthResult;)V

    .line 577
    :goto_1
    return-void

    .line 555
    .restart local v2    # "isUINeeded":Z
    :cond_3
    :try_start_1
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "AuthFlow: AuthFlow.run() Auth is current and succeeded"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 567
    .end local v2    # "isUINeeded":Z
    :catch_0
    move-exception v3

    move-object v1, v0

    .line 569
    .end local v0    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .local v1, "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .local v3, "t":Ljava/lang/Throwable;
    :try_start_2
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "AuthFlow: AuthFlow.run() failed"

    invoke-static {v4, v5, v6, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 570
    new-instance v0, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_userProvider:Lcom/getjar/sdk/comm/auth/UserAuthProvider;

    invoke-interface {v4}, Lcom/getjar/sdk/comm/auth/UserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v0, v4, v5}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 574
    .end local v1    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .restart local v0    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "AuthFlow: AuthFlow.run() DONE %1$s"

    new-array v8, v12, [Ljava/lang/Object;

    iget-object v9, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v9}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v8, v11

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 575
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v4, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1700(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/UserAuthResult;)V

    goto :goto_1

    .line 560
    .end local v3    # "t":Ljava/lang/Throwable;
    .restart local v2    # "isUINeeded":Z
    :cond_4
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "AuthFlow: AuthFlow.run() Auth is current and valid"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 574
    .end local v2    # "isUINeeded":Z
    :catchall_0
    move-exception v4

    :goto_2
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "AuthFlow: AuthFlow.run() DONE %1$s"

    new-array v9, v12, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v10}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1600(Lcom/getjar/sdk/comm/auth/AuthManager;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v10

    invoke-virtual {v10}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->name()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v11

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 575
    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->this$0:Lcom/getjar/sdk/comm/auth/AuthManager;

    invoke-static {v5, v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->access$1700(Lcom/getjar/sdk/comm/auth/AuthManager;Lcom/getjar/sdk/comm/auth/UserAuthResult;)V

    throw v4

    .line 564
    :cond_5
    :try_start_4
    iget-object v4, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    iget-object v5, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_authFlowId:Ljava/lang/String;

    iget-object v6, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_uiParent:Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;

    iget-object v7, p0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->_providerHint:Lcom/getjar/sdk/comm/auth/ProviderHint;

    invoke-direct {p0, v4, v5, v6, v7}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlow;->performAuth(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :try_end_4
    .catch Ljava/lang/Throwable; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v0

    goto/16 :goto_0

    .line 574
    .end local v0    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .restart local v1    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .restart local v3    # "t":Ljava/lang/Throwable;
    :catchall_1
    move-exception v4

    move-object v0, v1

    .end local v1    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .restart local v0    # "authResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    goto :goto_2
.end method
