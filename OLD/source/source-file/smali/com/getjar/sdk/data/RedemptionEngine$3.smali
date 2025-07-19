.class Lcom/getjar/sdk/data/RedemptionEngine$3;
.super Ljava/lang/Object;
.source "RedemptionEngine.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/data/RedemptionEngine;->redeemVoucherFromIntent(Ljava/lang/String;Landroid/content/Intent;Ljava/util/List;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/data/RedemptionEngine;

.field final synthetic val$callbacks:Ljava/util/List;

.field final synthetic val$developerPayload:Ljava/lang/String;

.field final synthetic val$getjarIntent:Landroid/content/Intent;

.field final synthetic val$voucherToken:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/util/List;Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 415
    iput-object p1, p0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    iput-object p2, p0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$callbacks:Ljava/util/List;

    iput-object p3, p0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$getjarIntent:Landroid/content/Intent;

    iput-object p4, p0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$voucherToken:Ljava/lang/String;

    iput-object p5, p0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$developerPayload:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    .prologue
    .line 419
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v5

    .line 420
    .local v5, "workId":Ljava/lang/String;
    sget-object v13, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->GENERAL:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 422
    .local v13, "failureReason":Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
    :try_start_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() START [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 425
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$callbacks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .local v14, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    :try_end_0
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 427
    .local v10, "callback":Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() making callback.redeemStarted() [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 428
    invoke-interface {v10, v5}, Lcom/getjar/sdk/listener/VoucherRedemptionListener;->redeemStarted(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 429
    :catch_0
    move-exception v11

    .line 430
    .local v11, "ce":Ljava/lang/Exception;
    :try_start_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() callback.redeemStarted() failed [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1, v11}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_2
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 497
    .end local v10    # "callback":Lcom/getjar/sdk/listener/VoucherRedemptionListener;
    .end local v11    # "ce":Ljava/lang/Exception;
    .end local v14    # "i$":Ljava/util/Iterator;
    :catch_1
    move-exception v12

    .line 501
    .local v12, "e":Lcom/getjar/sdk/exceptions/AuthException;
    :try_start_3
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    sget-object v3, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->NETWORK:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$callbacks:Ljava/util/List;

    invoke-static {v1, v5, v3, v4}, Lcom/getjar/sdk/data/RedemptionEngine;->access$500(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V

    .line 502
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1, v12}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 509
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 511
    .end local v12    # "e":Lcom/getjar/sdk/exceptions/AuthException;
    :goto_1
    return-void

    .line 435
    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_0
    :try_start_4
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() creating CommContext for redemption work [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 436
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    invoke-static {v1}, Lcom/getjar/sdk/data/RedemptionEngine;->access$000(Lcom/getjar/sdk/data/RedemptionEngine;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    invoke-static {v3}, Lcom/getjar/sdk/data/RedemptionEngine;->access$100(Lcom/getjar/sdk/data/RedemptionEngine;)Landroid/content/Context;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$getjarIntent:Landroid/content/Intent;

    sget-object v6, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->DEALS:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {v1, v3, v4, v6}, Lcom/getjar/sdk/comm/CommManager;->createContext(Ljava/lang/String;Landroid/content/Context;Landroid/content/Intent;Lcom/getjar/sdk/comm/CommManager$LaunchWork;)Lcom/getjar/sdk/comm/CommContext;
    :try_end_4
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v2

    .line 439
    .local v2, "commContext":Lcom/getjar/sdk/comm/CommContext;
    :try_start_5
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    invoke-static {v1}, Lcom/getjar/sdk/data/RedemptionEngine;->access$100(Lcom/getjar/sdk/data/RedemptionEngine;)Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 440
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_2
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 452
    :goto_2
    :try_start_6
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$voucherToken:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$callbacks:Ljava/util/List;

    invoke-static {v1, v5, v3, v4}, Lcom/getjar/sdk/data/RedemptionEngine;->access$200(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 453
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() handled as test voucher [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V
    :try_end_6
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_6 .. :try_end_6} :catch_1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 509
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 441
    :catch_2
    move-exception v12

    .line 446
    .local v12, "e":Ljava/lang/Exception;
    :try_start_7
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() A canceled auth flow has failed"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    invoke-virtual {v12}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V
    :try_end_7
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_7 .. :try_end_7} :catch_1
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_2

    .line 503
    .end local v2    # "commContext":Lcom/getjar/sdk/comm/CommContext;
    .end local v12    # "e":Ljava/lang/Exception;
    .end local v14    # "i$":Ljava/util/Iterator;
    :catch_3
    move-exception v12

    .line 506
    .restart local v12    # "e":Ljava/lang/Exception;
    :try_start_8
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$callbacks:Ljava/util/List;

    invoke-static {v1, v5, v13, v3}, Lcom/getjar/sdk/data/RedemptionEngine;->access$500(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;Ljava/util/List;)V

    .line 507
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() failed [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1, v12}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 509
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1

    .line 458
    .end local v12    # "e":Ljava/lang/Exception;
    .restart local v2    # "commContext":Lcom/getjar/sdk/comm/CommContext;
    .restart local v14    # "i$":Ljava/util/Iterator;
    :cond_1
    :try_start_9
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() making redeemVoucher service call [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 459
    invoke-static {}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->getInstance()Lcom/getjar/sdk/comm/VoucherServiceProxy;

    move-result-object v1

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$voucherToken:Ljava/lang/String;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$developerPayload:Ljava/lang/String;

    const/4 v6, 0x1

    invoke-virtual/range {v1 .. v6}, Lcom/getjar/sdk/comm/VoucherServiceProxy;->redeemVoucher(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Lcom/getjar/sdk/comm/Operation;

    move-result-object v15

    .line 460
    .local v15, "operation":Lcom/getjar/sdk/comm/Operation;
    invoke-virtual {v15}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v16

    .line 463
    .local v16, "result":Lcom/getjar/sdk/comm/Result;
    if-nez v16, :cond_2

    .line 466
    sget-object v13, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->NETWORK:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 467
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Failed to redeem voucher token \'%1$s\' [%2$s]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$voucherToken:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v13}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_9
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_9 .. :try_end_9} :catch_1
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 509
    .end local v2    # "commContext":Lcom/getjar/sdk/comm/CommContext;
    .end local v14    # "i$":Ljava/util/Iterator;
    .end local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :catchall_0
    move-exception v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v6, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v5, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v4, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    throw v1

    .line 468
    .restart local v2    # "commContext":Lcom/getjar/sdk/comm/CommContext;
    .restart local v14    # "i$":Ljava/util/Iterator;
    .restart local v15    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v16    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_2
    :try_start_a
    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v1

    if-nez v1, :cond_6

    .line 471
    sget-object v13, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->GENERAL:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 476
    const-string v1, "CALLER_NOT_FOUND"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getErrorResponseCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    const-string v1, "CALLER_BAD_INPUT"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getErrorResponseCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    const-string v1, "INVALID_VOUCHER_TOKEN"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getErrorResponseSubcode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 479
    :cond_3
    sget-object v13, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->INVALID_VOUCHER:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 483
    :cond_4
    :goto_3
    new-instance v1, Lcom/getjar/sdk/exceptions/CommunicationException;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "Failed to redeem voucher token \'%1$s\' [%2$s]"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$voucherToken:Ljava/lang/String;

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {v13}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->name()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v3, v4, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 480
    :cond_5
    const-string v1, "CALLER_BAD_STATE"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getErrorResponseCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    const-string v1, "ALREADY_REDEEMED"

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getErrorResponseSubcode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 481
    sget-object v13, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->ALREADY_REDEEMED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    goto :goto_3

    .line 487
    :cond_6
    new-instance v1, Lcom/getjar/sdk/data/LicenseEngine;

    invoke-direct {v1, v2}, Lcom/getjar/sdk/data/LicenseEngine;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    move-object/from16 v0, v16

    invoke-virtual {v1, v0}, Lcom/getjar/sdk/data/LicenseEngine;->updateLicenseState(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;

    .line 490
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->this$0:Lcom/getjar/sdk/data/RedemptionEngine;

    move-object/from16 v0, v16

    invoke-static {v1, v0}, Lcom/getjar/sdk/data/RedemptionEngine;->access$300(Lcom/getjar/sdk/data/RedemptionEngine;Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getSignedPayload()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {v16 .. v16}, Lcom/getjar/sdk/comm/Result;->getSignature()Ljava/lang/String;

    move-result-object v8

    move-object/from16 v0, p0

    iget-object v9, v0, Lcom/getjar/sdk/data/RedemptionEngine$3;->val$callbacks:Ljava/util/List;

    invoke-static/range {v4 .. v9}, Lcom/getjar/sdk/data/RedemptionEngine;->access$400(Lcom/getjar/sdk/data/RedemptionEngine;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    :try_end_a
    .catch Lcom/getjar/sdk/exceptions/AuthException; {:try_start_a .. :try_end_a} :catch_1
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_3
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 509
    sget-object v1, Lcom/getjar/sdk/logging/Area;->REDEEM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v1, Lcom/getjar/sdk/logging/Area;->OFFER:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v3, v6

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "RedemptionEngine: redeemVoucherFromIntent() FINISH [%1$s]"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v5, v7, v8

    invoke-static {v1, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v3, v4, v1}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_1
.end method
