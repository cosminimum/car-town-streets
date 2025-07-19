.class public Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;
.super Ljava/lang/Object;
.source "EnforcedAccountUserAuthProvider.java"

# interfaces
.implements Lcom/getjar/sdk/comm/auth/UserAuthProvider;


# static fields
.field public static final KeyPreviousAccountName:Ljava/lang/String; = "enforced_android_account.previous_account_name"

.field public static final KeySourceAccountNameHash:Ljava/lang/String; = "enforced_android_account.account_name_hash"

.field public static final KeySourceAppToken:Ljava/lang/String; = "enforced_android_account.app_token"

.field public static final KeySourceUserAccessId:Ljava/lang/String; = "enforced_android_account.user_access_id"

.field public static final KeySourceUserDeviceId:Ljava/lang/String; = "enforced_android_account.user_device_id"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCurrentAccountName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    new-instance v0, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    invoke-virtual {v0, p0}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getCachedAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private getProviderData(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/util/Map;
    .locals 6
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p3, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;",
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
    .line 202
    if-nez p1, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'commContext\' cannot be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 203
    :cond_0
    if-nez p3, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'providerHint\' cannot be NULL"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 204
    :cond_1
    invoke-virtual {p3}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    if-nez v3, :cond_2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'providerHint\' must have data"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 205
    :cond_2
    invoke-virtual {p3}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v3

    const-string v4, "enforced_android_account.app_token"

    invoke-virtual {v3, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 206
    .local v2, "sourceAppToken":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'providerHint\' does not contain a value for \'enforced_android_account.app_token\'"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 209
    :cond_3
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getDeviceMetadata()Lcom/getjar/sdk/data/DeviceMetadata;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/data/DeviceMetadata;->getMetadataWithReliability()Ljava/util/Map;

    move-result-object v0

    .line 210
    .local v0, "deviceMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    if-eqz v0, :cond_4

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v3

    if-gtz v3, :cond_5

    .line 211
    :cond_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: getProviderData() failed to get device metadata"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 212
    const/4 v1, 0x0

    .line 228
    :goto_0
    return-object v1

    .line 216
    :cond_5
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 217
    .local v1, "providerData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue;>;"
    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 220
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/utilities/ScreenUtility;->getDisplayDetails(Landroid/content/Context;)Ljava/util/HashMap;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 223
    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthMetadataUtility;->addSDKMetadataValues(Ljava/util/Map;)V

    .line 226
    const-string v3, "enforced_android_account.app_token"

    new-instance v4, Lcom/getjar/sdk/data/MetadataValue;

    sget-object v5, Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;->AVAILABLE:Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;

    invoke-direct {v4, v2, v5}, Lcom/getjar/sdk/data/MetadataValue;-><init>(Ljava/lang/String;Lcom/getjar/sdk/data/MetadataValue$MetadataReliability;)V

    invoke-interface {v1, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method private makeWrappedProviderCall(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .locals 13
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "accountNameHash"    # Ljava/lang/String;
    .param p3, "currentAuthToken"    # Ljava/lang/String;
    .param p4, "authFlowId"    # Ljava/lang/String;
    .param p5, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p6, "previousAccountName"    # Ljava/lang/String;

    .prologue
    .line 165
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: makeWrappedProviderCall() for \'%1$s\'"

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    const/4 v12, 0x0

    aput-object p2, v11, v12

    invoke-static {v4, v5, v11}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 167
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2, p2}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getAccountNameFromHash(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 168
    .local v8, "localAccountName":Ljava/lang/String;
    invoke-static {v8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 169
    new-instance v9, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v9, v2, v3}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    .line 195
    :cond_0
    :goto_0
    return-object v9

    .line 173
    :cond_1
    new-instance v1, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;

    invoke-direct {v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;-><init>()V

    .line 174
    .local v1, "wrappedProvider":Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;
    new-instance v10, Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-direct {v10, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 175
    .local v10, "wrappedProviderData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "provider.skip_cache"

    const-string v3, "true"

    invoke-virtual {v10, v2, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 176
    const-string v2, "android_account.username_data_hash"

    invoke-virtual {v10, v2, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 177
    new-instance v6, Lcom/getjar/sdk/comm/auth/ProviderHint;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v6, v2, v10}, Lcom/getjar/sdk/comm/auth/ProviderHint;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .local v6, "providerHintForWrappedProvider":Lcom/getjar/sdk/comm/auth/ProviderHint;
    move-object/from16 v2, p3

    move-object v3, p1

    move-object/from16 v4, p4

    move-object/from16 v5, p5

    .line 178
    invoke-virtual/range {v1 .. v6}, Lcom/getjar/sdk/comm/auth/AndroidAccountUserAuthProvider;->ensureUser(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;

    move-result-object v9

    .line 182
    .local v9, "userAuthResult":Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :try_start_0
    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthResult$State;->SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getState()Lcom/getjar/sdk/comm/auth/AuthResult$State;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-static/range {p6 .. p6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    move-object/from16 v0, p6

    invoke-virtual {v8, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 186
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->getInstance()Lcom/getjar/sdk/comm/auth/AccountHistoryManager;

    move-result-object v2

    invoke-virtual {v9}, Lcom/getjar/sdk/comm/auth/UserAuthResult;->getUserAccessId()Ljava/lang/String;

    move-result-object v3

    sget-object v4, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v2, v3, v4}, Lcom/getjar/sdk/comm/auth/AccountHistoryManager;->addEvent(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AccountEventType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 188
    :catch_0
    move-exception v7

    .line 191
    .local v7, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "AccountHistoryManager work failed"

    invoke-static {v2, v3, v4, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public ensureUser(Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    .locals 29
    .param p1, "currentAuthToken"    # Ljava/lang/String;
    .param p2, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p3, "authFlowId"    # Ljava/lang/String;
    .param p4, "uiParent"    # Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;
    .param p5, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 61
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'currentAuthToken\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 62
    :cond_0
    if-nez p2, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'commContext\' cannot be NULL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 63
    :cond_1
    invoke-static/range {p3 .. p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'authFlowId\' cannot be NULL or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 64
    :cond_2
    if-nez p5, :cond_3

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'providerHint\' cannot be NULL"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 65
    :cond_3
    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v4

    if-nez v4, :cond_4

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'providerHint\' must have data"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 68
    :cond_4
    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v4

    const-string v5, "enforced_android_account.account_name_hash"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 69
    .local v6, "sourceAccountNameHash":Ljava/lang/String;
    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v4

    const-string v5, "enforced_android_account.app_token"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v28

    check-cast v28, Ljava/lang/String;

    .line 70
    .local v28, "sourceAppToken":Ljava/lang/String;
    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v4

    const-string v5, "enforced_android_account.user_access_id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 71
    .local v15, "sourceUserAccessId":Ljava/lang/String;
    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v4

    const-string v5, "enforced_android_account.user_device_id"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/lang/String;

    .line 72
    .local v16, "sourceUserDeviceId":Ljava/lang/String;
    invoke-virtual/range {p5 .. p5}, Lcom/getjar/sdk/comm/auth/ProviderHint;->getData()Ljava/util/HashMap;

    move-result-object v4

    const-string v5, "enforced_android_account.previous_account_name"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 74
    .local v10, "previousAccountName":Ljava/lang/String;
    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 75
    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_5

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'providerHint\' does not contain a value for \'enforced_android_account.app_token\' or \'enforced_android_account.account_name_hash\'"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 76
    :cond_5
    invoke-static {v15}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'providerHint\' does not contain a value for \'enforced_android_account.user_access_id\' or \'enforced_android_account.account_name_hash\'"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 77
    :cond_6
    invoke-static/range {v16 .. v16}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_7

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'providerHint\' does not contain a value for \'enforced_android_account.user_device_id\' or \'enforced_android_account.account_name_hash\'"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 80
    :cond_7
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() START"

    invoke-static {v4, v5, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 88
    :try_start_0
    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_8

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    move-object/from16 v7, p1

    move-object/from16 v8, p3

    move-object/from16 v9, p4

    .line 91
    invoke-direct/range {v4 .. v10}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->makeWrappedProviderCall(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v4

    .line 152
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 154
    :goto_0
    return-object v4

    .line 96
    :cond_8
    :try_start_1
    invoke-static {}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->getInstance()Lcom/getjar/sdk/comm/AuthorizationServiceProxy;

    move-result-object v11

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p4

    move-object/from16 v3, p5

    invoke-direct {v0, v1, v2, v3}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderData(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Lcom/getjar/sdk/comm/auth/ProviderHint;)Ljava/util/Map;

    move-result-object v17

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v18

    move-object/from16 v12, p2

    move-object/from16 v13, p3

    move-object/from16 v14, p1

    invoke-virtual/range {v11 .. v18}, Lcom/getjar/sdk/comm/AuthorizationServiceProxy;->generateSignature(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v25

    .line 104
    .local v25, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual/range {v25 .. v25}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v26

    .line 107
    .local v26, "result":Lcom/getjar/sdk/comm/Result;
    if-nez v26, :cond_9

    .line 110
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() failed to get results"

    invoke-static {v4, v5, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 111
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 152
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 113
    :cond_9
    :try_start_2
    invoke-virtual/range {v26 .. v26}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v4

    if-nez v4, :cond_c

    .line 116
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() got failure results"

    invoke-static {v4, v5, v7}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 119
    invoke-static/range {v26 .. v26}, Lcom/getjar/sdk/comm/RequestUtilities;->getServicesException(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/exceptions/ServiceException;

    move-result-object v27

    .line 120
    .local v27, "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    if-eqz v27, :cond_a

    .line 121
    move-object/from16 v0, p2

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    .line 125
    :cond_a
    move-object/from16 v0, v26

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/Result;->checkForBlacklistedOrUnsupported(Lcom/getjar/sdk/comm/CommContext;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 126
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() We are blacklisted or unsupported"

    invoke-static {v4, v5, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 127
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 152
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 129
    :cond_b
    :try_start_3
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 152
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 135
    .end local v27    # "servicesException":Lcom/getjar/sdk/exceptions/ServiceException;
    :cond_c
    const/16 v19, 0x0

    .line 136
    .local v19, "accountNameHash":Ljava/lang/String;
    :try_start_4
    invoke-virtual/range {v26 .. v26}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_d

    invoke-virtual/range {v26 .. v26}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "return"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-virtual/range {v26 .. v26}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "return"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "signature"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_d

    .line 140
    invoke-virtual/range {v26 .. v26}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "return"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "signature"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    :cond_d
    move-object/from16 v17, p0

    move-object/from16 v18, p2

    move-object/from16 v20, p1

    move-object/from16 v21, p3

    move-object/from16 v22, p4

    move-object/from16 v23, v10

    .line 144
    invoke-direct/range {v17 .. v23}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->makeWrappedProviderCall(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthUIParentInterface;Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/UserAuthResult;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v4

    .line 152
    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 149
    .end local v19    # "accountNameHash":Ljava/lang/String;
    .end local v25    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v26    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_0
    move-exception v24

    .line 150
    .local v24, "e":Ljava/lang/Exception;
    :try_start_5
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() failed"

    move-object/from16 v0, v24

    invoke-static {v4, v5, v7, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 152
    sget-object v4, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v7, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v4, v5, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 154
    new-instance v4, Lcom/getjar/sdk/comm/auth/UserAuthResult;

    invoke-virtual/range {p0 .. p0}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-direct {v4, v5, v7}, Lcom/getjar/sdk/comm/auth/UserAuthResult;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/auth/AuthResult$State;)V

    goto/16 :goto_0

    .line 152
    .end local v24    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    sget-object v5, Lcom/getjar/sdk/logging/Area;->AUTH:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v5, "AuthFlow: EnforcedAccountUserAuthProvider: ensureUser() DONE"

    invoke-static {v7, v8, v5}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v4
.end method

.method public getProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 47
    const-string v0, "android_account"

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
    .line 54
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "EnforcedAccountUserAuthProvider does not support proxied auth"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public isUINeeded(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/comm/auth/ProviderHint;)Z
    .locals 1
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "authFlowId"    # Ljava/lang/String;
    .param p3, "providerHint"    # Lcom/getjar/sdk/comm/auth/ProviderHint;

    .prologue
    .line 50
    const/4 v0, 0x0

    return v0
.end method
