.class Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"

# interfaces
.implements Lcom/getjar/sdk/comm/CallbackInterface;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "PurchaseCallback"
.end annotation


# instance fields
.field private _offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;


# direct methods
.method protected constructor <init>(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;)V
    .locals 1
    .param p2, "offer"    # Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    .prologue
    .line 1118
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1116
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    .line 1119
    iput-object p2, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    .line 1120
    return-void
.end method


# virtual methods
.method public serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 11
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p2, "cause"    # Ljava/lang/Exception;
    .param p3, "requestId"    # Ljava/lang/String;
    .param p4, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 1171
    :try_start_0
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1181
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1182
    .local v0, "b":Landroid/os/Bundle;
    const-string v4, "id"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1183
    const-string v4, "transactionId"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1184
    const-string v4, "price"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getAmount()J

    move-result-wide v5

    invoke-virtual {v0, v4, v5, v6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1185
    const-string v4, "name"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1188
    sget-object v4, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p2, v4}, Lcom/getjar/sdk/utilities/Utility;->getResponseSubstate(Ljava/lang/Exception;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1189
    .local v3, "substate":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->KEY()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1193
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long v5, v4, v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "JavaScriptAPI: PurchaseCallback: Request %1$s on CommContext %2$s resulted in a call to serviceRequestFailed(). %3$s"

    const/4 v4, 0x3

    new-array v9, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p3, v9, v4

    const/4 v10, 0x1

    if-nez p4, :cond_1

    const-string v4, ""

    :goto_0
    aput-object v4, v9, v10

    const/4 v10, 0x2

    if-nez p2, :cond_2

    const-string v4, ""

    :goto_1
    aput-object v4, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v6, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1198
    if-eqz p2, :cond_0

    .line 1199
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: purchase failed"

    invoke-static {v4, v5, v6, p2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1201
    :cond_0
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-static {v4, v0}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$402(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 1202
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 1203
    .local v2, "msg":Landroid/os/Message;
    const/4 v4, 0x1

    iput v4, v2, Landroid/os/Message;->what:I

    .line 1204
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$600(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1211
    :try_start_1
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 1217
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v2    # "msg":Landroid/os/Message;
    .end local v3    # "substate":Ljava/lang/String;
    :goto_2
    return-void

    .line 1193
    .restart local v0    # "b":Landroid/os/Bundle;
    .restart local v3    # "substate":Ljava/lang/String;
    :cond_1
    :try_start_2
    invoke-virtual {p4}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    :cond_2
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v4

    goto :goto_1

    .line 1212
    .restart local v2    # "msg":Landroid/os/Message;
    :catch_0
    move-exception v1

    .line 1213
    .local v1, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: failure"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1214
    invoke-virtual {p4, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1206
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "msg":Landroid/os/Message;
    .end local v3    # "substate":Ljava/lang/String;
    :catch_1
    move-exception v1

    .line 1207
    .restart local v1    # "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: failure"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1208
    invoke-virtual {p4, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1211
    :try_start_4
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_2

    .line 1212
    :catch_2
    move-exception v1

    .line 1213
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: failure"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1214
    invoke-virtual {p4, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1210
    .end local v1    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v4

    .line 1211
    :try_start_5
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v5, v5, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1215
    :goto_3
    throw v4

    .line 1212
    :catch_3
    move-exception v1

    .line 1213
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "JavaScriptAPI: failure"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1214
    invoke-virtual {p4, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_3
.end method

.method public serviceRequestRetry(Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;I)V
    .locals 0
    .param p1, "cause"    # Ljava/lang/Exception;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p4, "retryCount"    # I

    .prologue
    .line 1221
    return-void
.end method

.method public serviceRequestSucceeded(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    .locals 11
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;
    .param p2, "requestId"    # Ljava/lang/String;
    .param p3, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 1127
    :try_start_0
    sget-object v4, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {p1, v4}, Lcom/getjar/sdk/comm/TransactionManager;->getTransactionSubstate(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 1128
    .local v3, "substate":Ljava/lang/String;
    sget-object v4, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_INSUFFICIENT_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v4}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1130
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->setCurrentPurchaseClientTransactionId(Ljava/lang/String;)V

    .line 1131
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V

    .line 1133
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1134
    .local v0, "b":Landroid/os/Bundle;
    const-string v4, "id"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1135
    const-string v4, "transactionId"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getClientTransactionId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1136
    const-string v4, "price"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getAmount()J

    move-result-wide v5

    invoke-virtual {v0, v4, v5, v6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 1137
    const-string v4, "name"

    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->_offer:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ProductWithClientTransactionID;->getProduct()Lcom/getjar/sdk/Product;

    move-result-object v5

    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1138
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->KEY()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 1140
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long v5, v4, v6

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "JavaScriptAPI: PurchaseCallback: Request %1$s on CommContext %2$s resulted in a call to serviceRequestSucceeded()"

    const/4 v4, 0x2

    new-array v9, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object p2, v9, v4

    const/4 v10, 0x1

    if-nez p3, :cond_0

    const-string v4, ""

    :goto_0
    aput-object v4, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v6, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 1144
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-static {v4, v0}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$202(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;Landroid/os/Bundle;)Landroid/os/Bundle;

    .line 1145
    new-instance v2, Landroid/os/Message;

    invoke-direct {v2}, Landroid/os/Message;-><init>()V

    .line 1146
    .local v2, "msg":Landroid/os/Message;
    const/4 v4, 0x0

    iput v4, v2, Landroid/os/Message;->what:I

    .line 1147
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    invoke-static {v4}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->access$600(Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;)Landroid/os/Handler;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1158
    .end local v0    # "b":Landroid/os/Bundle;
    .end local v2    # "msg":Landroid/os/Message;
    :goto_1
    :try_start_1
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 1164
    .end local v3    # "substate":Ljava/lang/String;
    :goto_2
    return-void

    .line 1140
    .restart local v0    # "b":Landroid/os/Bundle;
    .restart local v3    # "substate":Ljava/lang/String;
    :cond_0
    :try_start_2
    invoke-virtual {p3}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v4

    goto :goto_0

    .line 1150
    .end local v0    # "b":Landroid/os/Bundle;
    :cond_1
    new-instance v4, Lcom/getjar/sdk/exceptions/ServiceException;

    invoke-direct {v4, v3, p1}, Lcom/getjar/sdk/exceptions/ServiceException;-><init>(Ljava/lang/String;Lcom/getjar/sdk/comm/Result;)V

    invoke-virtual {p0, p1, v4, p2, p3}, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    .line 1153
    .end local v3    # "substate":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 1154
    .local v1, "e":Ljava/lang/Exception;
    :try_start_3
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: failure"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1155
    invoke-virtual {p3, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1158
    :try_start_4
    iget-object v4, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v4, v4, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_2

    .line 1159
    :catch_1
    move-exception v1

    .line 1160
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: failure"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1161
    invoke-virtual {p3, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1159
    .end local v1    # "e":Ljava/lang/Exception;
    .restart local v3    # "substate":Ljava/lang/String;
    :catch_2
    move-exception v1

    .line 1160
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    const-string v6, "JavaScriptAPI: failure"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1161
    invoke-virtual {p3, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_2

    .line 1157
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v3    # "substate":Ljava/lang/String;
    :catchall_0
    move-exception v4

    .line 1158
    :try_start_5
    iget-object v5, p0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$PurchaseCallback;->this$0:Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;

    iget-object v5, v5, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;->_parentActivity:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;

    invoke-virtual {v5}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;->waitDialogHide()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 1162
    :goto_3
    throw v4

    .line 1159
    :catch_3
    move-exception v1

    .line 1160
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->JS_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Lcom/getjar/sdk/logging/Area;->TRANSACTION:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    const-string v7, "JavaScriptAPI: failure"

    invoke-static {v5, v6, v7, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 1161
    invoke-virtual {p3, v1}, Lcom/getjar/sdk/comm/CommContext;->addException(Ljava/lang/Throwable;)V

    goto :goto_3
.end method
