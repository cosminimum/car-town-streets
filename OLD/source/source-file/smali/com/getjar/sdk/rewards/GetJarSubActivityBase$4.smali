.class Lcom/getjar/sdk/rewards/GetJarSubActivityBase$4;
.super Ljava/lang/Object;
.source "GetJarSubActivityBase.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->dialogHide()V
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
    .line 343
    iput-object p1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$4;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 346
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/rewards/GetJarSubActivityBase$4;->this$0:Lcom/getjar/sdk/rewards/GetJarSubActivityBase;

    invoke-static {v1}, Lcom/getjar/sdk/rewards/GetJarSubActivityBase;->access$500(Lcom/getjar/sdk/rewards/GetJarSubActivityBase;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 352
    :goto_0
    return-void

    .line 347
    :catch_0
    move-exception v0

    .line 350
    .local v0, "e":Ljava/lang/Exception;
    sget-object v1, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "dialogHide() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
