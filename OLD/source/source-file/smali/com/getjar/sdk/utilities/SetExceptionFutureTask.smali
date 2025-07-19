.class public Lcom/getjar/sdk/utilities/SetExceptionFutureTask;
.super Ljava/util/concurrent/FutureTask;
.source "SetExceptionFutureTask.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/FutureTask",
        "<TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Callable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable",
            "<TV;>;)V"
        }
    .end annotation

    .prologue
    .line 14
    .local p0, "this":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<TV;>;"
    .local p1, "callable":Ljava/util/concurrent/Callable;, "Ljava/util/concurrent/Callable<TV;>;"
    invoke-direct {p0, p1}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 15
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 20
    .local p0, "this":Lcom/getjar/sdk/utilities/SetExceptionFutureTask;, "Lcom/getjar/sdk/utilities/SetExceptionFutureTask<TV;>;"
    :try_start_0
    invoke-super {p0}, Ljava/util/concurrent/FutureTask;->run()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    :goto_0
    return-void

    .line 21
    :catch_0
    move-exception v0

    .line 22
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p0, v0}, Lcom/getjar/sdk/utilities/SetExceptionFutureTask;->setException(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
