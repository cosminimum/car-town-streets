.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogShow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V
    .locals 0

    .prologue
    .line 244
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 250
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$400(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 251
    const-wide/16 v1, 0xc8

    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V

    .line 255
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$400(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 258
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3$1;

    invoke-direct {v2, p0}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3$1;-><init>(Lcom/getjar/sdk/rewards/GetJarSubActivityBase$3;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 281
    :goto_0
    return-void

    .line 273
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "Skipping dialog show because Activity is not in the foreground"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 276
    :catch_0
    move-exception v0

    .line 279
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogShow() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
