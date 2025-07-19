.class Lcom/getjar/sdk/comm/ServiceProxyBase$1;
.super Ljava/lang/Object;
.source "ServiceProxyBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/ServiceProxyBase;->mapWaitToCallbacks(Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CallbackInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/ServiceProxyBase;

.field final synthetic val$callbacks:Lcom/getjar/sdk/comm/CallbackInterface;

.field final synthetic val$operation:Lcom/getjar/sdk/comm/Operation;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/ServiceProxyBase;Lcom/getjar/sdk/comm/Operation;Lcom/getjar/sdk/comm/CallbackInterface;)V
    .locals 0

    .prologue
    .line 197
    iput-object p1, p0, Lcom/getjar/sdk/comm/ServiceProxyBase$1;->this$0:Lcom/getjar/sdk/comm/ServiceProxyBase;

    iput-object p2, p0, Lcom/getjar/sdk/comm/ServiceProxyBase$1;->val$operation:Lcom/getjar/sdk/comm/Operation;

    iput-object p3, p0, Lcom/getjar/sdk/comm/ServiceProxyBase$1;->val$callbacks:Lcom/getjar/sdk/comm/CallbackInterface;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 201
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/ServiceProxyBase$1;->val$operation:Lcom/getjar/sdk/comm/Operation;

    iget-object v2, p0, Lcom/getjar/sdk/comm/ServiceProxyBase$1;->val$callbacks:Lcom/getjar/sdk/comm/CallbackInterface;

    invoke-virtual {v1, v2}, Lcom/getjar/sdk/comm/Operation;->mapResultToCallbacks(Lcom/getjar/sdk/comm/CallbackInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 205
    :goto_0
    return-void

    .line 202
    :catch_0
    move-exception v0

    .line 203
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Legacy Callback Mapping Thread failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
