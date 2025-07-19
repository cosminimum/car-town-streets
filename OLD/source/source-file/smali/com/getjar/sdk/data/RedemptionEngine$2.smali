.class final Lcom/getjar/sdk/data/RedemptionEngine$2;
.super Ljava/lang/Object;
.source "RedemptionEngine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/data/RedemptionEngine;->showCheckoutPageFor34(Lcom/getjar/sdk/GetJarContext;Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$getJarContext:Lcom/getjar/sdk/GetJarContext;

.field final synthetic val$managedOfferDetails:Ljava/lang/String;

.field final synthetic val$sourceAppToken:Ljava/lang/String;

.field final synthetic val$sourceUserAccessId:Ljava/lang/String;

.field final synthetic val$sourceUserDeviceId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/GetJarContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 341
    iput-object p1, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$getJarContext:Lcom/getjar/sdk/GetJarContext;

    iput-object p2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceUserAccessId:Ljava/lang/String;

    iput-object p3, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceAppToken:Ljava/lang/String;

    iput-object p4, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceUserDeviceId:Ljava/lang/String;

    iput-object p5, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$managedOfferDetails:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .prologue
    .line 345
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() START"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 348
    iget-object v1, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$getJarContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 349
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "RedemptionEngine: showCheckoutPageFor34() [isAuthed:%1$s currentUserAccessId:%2$s sourceUserAccessId:%3$s]"

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v10, 0x0

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/auth/AuthManager;->isAuthed()Z

    move-result v11

    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v11

    aput-object v11, v5, v10

    const/4 v10, 0x1

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v11

    invoke-virtual {v11}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v11

    aput-object v11, v5, v10

    const/4 v10, 0x2

    iget-object v11, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceUserAccessId:Ljava/lang/String;

    aput-object v11, v5, v10

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 355
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->isAuthed()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserAccessId()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceUserAccessId:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 358
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() calling ensureAuthResetCurrent()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 359
    new-instance v8, Ljava/util/HashMap;

    const/4 v1, 0x3

    invoke-direct {v8, v1}, Ljava/util/HashMap;-><init>(I)V

    .line 360
    .local v8, "providerData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "enforced_android_account.app_token"

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceAppToken:Ljava/lang/String;

    invoke-virtual {v8, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    const-string v1, "enforced_android_account.user_access_id"

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceUserAccessId:Ljava/lang/String;

    invoke-virtual {v8, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 362
    const-string v1, "enforced_android_account.user_device_id"

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$sourceUserDeviceId:Ljava/lang/String;

    invoke-virtual {v8, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 363
    const-string v1, "enforced_android_account.previous_account_name"

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$getJarContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getCurrentAccountName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 364
    new-instance v9, Lcom/getjar/sdk/comm/auth/ProviderHint;

    new-instance v1, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;

    invoke-direct {v1}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;-><init>()V

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/EnforcedAccountUserAuthProvider;->getProviderFilter()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v9, v1, v8}, Lcom/getjar/sdk/comm/auth/ProviderHint;-><init>(Ljava/lang/String;Ljava/util/HashMap;)V

    .line 365
    .local v9, "providerHint":Lcom/getjar/sdk/comm/auth/ProviderHint;
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v9, v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->ensureAuthResetCurrent(Lcom/getjar/sdk/comm/auth/ProviderHint;Z)Z

    .line 366
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() called ensureAuthResetCurrent()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 370
    .end local v8    # "providerData":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "providerHint":Lcom/getjar/sdk/comm/auth/ProviderHint;
    :cond_1
    new-instance v0, Lcom/getjar/sdk/ConsumableProduct;

    const-string v1, "12312"

    const-string v2, "lightning Sword"

    const-string v3, "strike enemy with lightning"

    const-wide/16 v4, 0x2

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 371
    .local v0, "dummyProduct":Lcom/getjar/sdk/ConsumableProduct;
    new-instance v7, Landroid/content/Intent;

    iget-object v1, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$getJarContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v7, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 372
    .local v7, "intent":Landroid/content/Intent;
    const-string v1, "productList"

    new-instance v2, Ljava/util/ArrayList;

    const/4 v3, 0x1

    new-array v3, v3, [Lcom/getjar/sdk/ConsumableProduct;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 373
    const-string v1, "getjarContextId"

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$getJarContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/GetJarContext;->getGetJarContextId()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 374
    const-string v1, "lang"

    const-string v2, "en-us"

    const-string v3, "_"

    const-string v4, "-"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 375
    const-string v1, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    const/4 v2, 0x1

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 376
    const-string v1, "getjarIntentType"

    const-string v2, "showCheckout"

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 377
    const-string v1, "EXTRA_MANAGED_CHECKOUT_DATA"

    iget-object v2, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$managedOfferDetails:Ljava/lang/String;

    invoke-virtual {v7, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 378
    const/high16 v1, 0x34a00000

    invoke-virtual {v7, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 379
    iget-object v1, p0, Lcom/getjar/sdk/data/RedemptionEngine$2;->val$getJarContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v7}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 380
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() intent sent"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() FINISH"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 387
    .end local v0    # "dummyProduct":Lcom/getjar/sdk/ConsumableProduct;
    .end local v7    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 382
    :catch_0
    move-exception v6

    .line 383
    .local v6, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() failed"

    invoke-static {v1, v2, v3, v6}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 385
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "RedemptionEngine: showCheckoutPageFor34() FINISH"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .end local v6    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "RedemptionEngine: showCheckoutPageFor34() FINISH"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v1
.end method
