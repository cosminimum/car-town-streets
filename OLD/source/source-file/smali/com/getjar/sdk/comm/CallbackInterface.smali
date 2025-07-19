.class public interface abstract Lcom/getjar/sdk/comm/CallbackInterface;
.super Ljava/lang/Object;
.source "CallbackInterface.java"


# virtual methods
.method public abstract serviceRequestFailed(Lcom/getjar/sdk/comm/Result;Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
.end method

.method public abstract serviceRequestRetry(Ljava/lang/Exception;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;I)V
.end method

.method public abstract serviceRequestSucceeded(Lcom/getjar/sdk/comm/Result;Ljava/lang/String;Lcom/getjar/sdk/comm/CommContext;)V
.end method
