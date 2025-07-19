.class Lcom/getjar/sdk/comm/CommManager$1;
.super Ljava/lang/Object;
.source "CommManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/CommManager;->updateOperationStateFromResult(Lcom/getjar/sdk/comm/Operation;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/CommManager;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/CommManager;)V
    .locals 0

    .prologue
    .line 410
    iput-object p1, p0, Lcom/getjar/sdk/comm/CommManager$1;->this$0:Lcom/getjar/sdk/comm/CommManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 413
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager;->reAuth()V

    .line 414
    return-void
.end method
