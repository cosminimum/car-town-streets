.class public Lcom/getjar/sdk/GetJarContext;
.super Ljava/lang/Object;
.source "GetJarContext.java"


# instance fields
.field private _commContext:Lcom/getjar/sdk/comm/CommContext;


# direct methods
.method protected constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/GetJarContext;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 20
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 21
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/GetJarContext;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 22
    return-void
.end method


# virtual methods
.method public getAndroidContext()Landroid/content/Context;
    .locals 1

    .prologue
    .line 31
    iget-object v0, p0, Lcom/getjar/sdk/GetJarContext;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    return-object v0
.end method

.method protected getCommContext()Lcom/getjar/sdk/comm/CommContext;
    .locals 1

    .prologue
    .line 18
    iget-object v0, p0, Lcom/getjar/sdk/GetJarContext;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    return-object v0
.end method

.method public getGetJarContextId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/getjar/sdk/GetJarContext;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/CommContext;->getCommContextId()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
