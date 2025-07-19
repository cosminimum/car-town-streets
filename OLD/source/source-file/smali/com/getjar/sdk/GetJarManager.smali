.class public Lcom/getjar/sdk/GetJarManager;
.super Ljava/lang/Object;
.source "GetJarManager.java"


# static fields
.field public static final GetjarIntentKey:Ljava/lang/String; = "getjar"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)Lcom/getjar/sdk/GetJarContext;
    .locals 3
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "resultReceiver"    # Landroid/os/ResultReceiver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'applicationToken\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 107
    :cond_0
    if-nez p1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'context\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 109
    :cond_1
    const/4 v1, 0x1

    invoke-static {p1, v1}, Lcom/getjar/sdk/comm/CommManager;->validateManifestFile(Landroid/content/Context;Z)V

    .line 110
    sget-object v1, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->ALL:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {p0, p1, p2, v1}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v0

    .line 111
    .local v0, "commContext":Lcom/getjar/sdk/comm/CommContext;
    new-instance v1, Lcom/getjar/sdk/GetJarContext;

    invoke-direct {v1, v0}, Lcom/getjar/sdk/GetJarContext;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    return-object v1
.end method

.method public static createContext(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;)Lcom/getjar/sdk/GetJarContext;
    .locals 3
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "encryptionKey"    # Ljava/lang/String;
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "resultReceiver"    # Landroid/os/ResultReceiver;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 139
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'applicationToken\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 140
    :cond_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'encryptionKey\' cannot be null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 141
    :cond_1
    if-nez p2, :cond_2

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'context\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 143
    :cond_2
    const/4 v1, 0x1

    invoke-static {p2, v1}, Lcom/getjar/sdk/comm/CommManager;->validateManifestFile(Landroid/content/Context;Z)V

    .line 144
    sget-object v1, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->ALL:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {p0, p1, p2, p3, v1}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;Landroid/os/ResultReceiver;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v0

    .line 145
    .local v0, "commContext":Lcom/getjar/sdk/comm/CommContext;
    new-instance v1, Lcom/getjar/sdk/GetJarContext;

    invoke-direct {v1, v0}, Lcom/getjar/sdk/GetJarContext;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    return-object v1
.end method

.method public static varargs handleIntent(Ljava/lang/String;Landroid/content/Context;Landroid/content/Intent;Ljava/lang/String;[Lcom/getjar/sdk/listener/GetJarListener;)V
    .locals 13
    .param p0, "applicationToken"    # Ljava/lang/String;
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "getjarIntent"    # Landroid/content/Intent;
    .param p3, "developerPayload"    # Ljava/lang/String;
    .param p4, "callbacks"    # [Lcom/getjar/sdk/listener/GetJarListener;

    .prologue
    .line 192
    invoke-static {p0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'applicationToken\' cannot be NULL or empty"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 193
    :cond_0
    if-nez p1, :cond_1

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'context\' cannot be NULL"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 194
    :cond_1
    if-nez p2, :cond_2

    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'getjarIntent\' cannot be NULL"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 195
    :cond_2
    if-eqz p4, :cond_3

    move-object/from16 v0, p4

    array-length v6, v0

    if-gtz v6, :cond_4

    :cond_3
    new-instance v6, Ljava/lang/IllegalArgumentException;

    const-string v7, "\'callbacks\' cannot be NULL or empty"

    invoke-direct {v6, v7}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 198
    :cond_4
    const/4 v6, 0x0

    invoke-static {p1, v6}, Lcom/getjar/sdk/comm/CommManager;->validateManifestFile(Landroid/content/Context;Z)V

    .line 201
    const-string v6, "getjar"

    const/4 v7, 0x0

    invoke-virtual {p2, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 204
    const-string v6, "redeemDeal"

    const-string v7, "getjarIntentType"

    invoke-virtual {p2, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 205
    sget-object v6, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v9, "handleIntent() handling an Intent of type \'%1$s\'"

    const/4 v10, 0x1

    new-array v10, v10, [Ljava/lang/Object;

    const/4 v11, 0x0

    const-string v12, "redeemDeal"

    aput-object v12, v10, v11

    invoke-static {v8, v9, v10}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 210
    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 211
    .local v5, "voucherRedemptionListeners":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/listener/VoucherRedemptionListener;>;"
    move-object/from16 v1, p4

    .local v1, "arr$":[Lcom/getjar/sdk/listener/GetJarListener;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_6

    aget-object v4, v1, v2

    .line 212
    .local v4, "listener":Lcom/getjar/sdk/listener/GetJarListener;
    const-class v6, Lcom/getjar/sdk/listener/VoucherRedemptionListener;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 213
    check-cast v4, Lcom/getjar/sdk/listener/VoucherRedemptionListener;

    .end local v4    # "listener":Lcom/getjar/sdk/listener/GetJarListener;
    invoke-interface {v5, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 211
    :cond_5
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 218
    :cond_6
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_8

    .line 221
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    const/4 v7, 0x1

    if-le v6, v7, :cond_7

    .line 222
    sget-object v6, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    sget-object v8, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    sget-object v8, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v8}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v8

    or-long/2addr v6, v8

    const-string v8, "%1$d VoucherRedemptionListener instances where passed to handleIntent(), was this intentional?"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v7, v8}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V

    .line 228
    :cond_7
    new-instance v6, Lcom/getjar/sdk/data/RedemptionEngine;

    invoke-direct {v6, p0, p1}, Lcom/getjar/sdk/data/RedemptionEngine;-><init>(Ljava/lang/String;Landroid/content/Context;)V

    move-object/from16 v0, p3

    invoke-virtual {v6, v0, p2, v5}, Lcom/getjar/sdk/data/RedemptionEngine;->redeemVoucherFromIntent(Ljava/lang/String;Landroid/content/Intent;Ljava/util/List;)V

    .line 235
    .end local v1    # "arr$":[Lcom/getjar/sdk/listener/GetJarListener;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    .end local v5    # "voucherRedemptionListeners":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/listener/VoucherRedemptionListener;>;"
    :cond_8
    return-void
.end method

.method public static retrieveContext(Ljava/lang/String;)Lcom/getjar/sdk/GetJarContext;
    .locals 2
    .param p0, "contextId"    # Ljava/lang/String;

    .prologue
    .line 244
    new-instance v0, Lcom/getjar/sdk/GetJarContext;

    invoke-static {p0}, Lcom/getjar/sdk/comm/CommManager;->retrieveContext(Ljava/lang/String;)Lcom/getjar/sdk/comm/CommContext;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/getjar/sdk/GetJarContext;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    return-object v0
.end method
