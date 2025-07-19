.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3$1;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;)V
    .locals 0

    .prologue
    .line 259
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3$1;->this$1:Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 262
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3$1;->this$1:Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;

    iget-object v1, v1, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$500(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 268
    :goto_0
    return-void

    .line 263
    :catch_0
    move-exception v0

    .line 266
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogShow() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
