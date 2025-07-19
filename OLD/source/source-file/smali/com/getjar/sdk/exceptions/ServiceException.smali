.class public Lcom/getjar/sdk/exceptions/ServiceException;
.super Lcom/getjar/sdk/GetJarException;
.source "ServiceException.java"


# instance fields
.field private _requestResult:Lcom/getjar/sdk/comm/Result;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/comm/Result;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "requestResult"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/String;)V

    .line 14
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/exceptions/ServiceException;->_requestResult:Lcom/getjar/sdk/comm/Result;

    .line 19
    iput-object p2, p0, Lcom/getjar/sdk/exceptions/ServiceException;->_requestResult:Lcom/getjar/sdk/comm/Result;

    .line 20
    return-void
.end method


# virtual methods
.method public getRequestResult()Lcom/getjar/sdk/comm/Result;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/getjar/sdk/exceptions/ServiceException;->_requestResult:Lcom/getjar/sdk/comm/Result;

    return-object v0
.end method
