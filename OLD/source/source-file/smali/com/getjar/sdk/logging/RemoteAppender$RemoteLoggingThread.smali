.class Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;
.super Ljava/lang/Thread;
.source "RemoteAppender.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/logging/RemoteAppender;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RemoteLoggingThread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/logging/RemoteAppender;


# direct methods
.method private constructor <init>(Lcom/getjar/sdk/logging/RemoteAppender;)V
    .locals 0

    .prologue
    .line 227
    iput-object p1, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/getjar/sdk/logging/RemoteAppender;
    .param p2, "x1"    # Lcom/getjar/sdk/logging/RemoteAppender$1;

    .prologue
    .line 227
    invoke-direct {p0, p1}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;-><init>(Lcom/getjar/sdk/logging/RemoteAppender;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 14

    .prologue
    const/16 v13, 0x64

    const/4 v12, 0x3

    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 231
    :try_start_0
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v3, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STARTED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-static {v2, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->access$102(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;)Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 232
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    const/4 v3, 0x3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RemoteAppender: consumer starting [thread:%1$d]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 234
    :goto_0
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$200(Lcom/getjar/sdk/logging/RemoteAppender;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 236
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$300(Lcom/getjar/sdk/logging/RemoteAppender;)I

    move-result v2

    if-lez v2, :cond_1

    .line 247
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 248
    .local v1, "messagesToSend":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/logging/LogMessage;>;"
    :goto_1
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$400(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->isEmpty()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v2

    if-nez v2, :cond_0

    .line 250
    :try_start_1
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$400(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/ConcurrentLinkedQueue;->remove()Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 251
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$310(Lcom/getjar/sdk/logging/RemoteAppender;)I
    :try_end_1
    .catch Ljava/util/NoSuchElementException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    goto :goto_1

    .line 252
    :catch_0
    move-exception v2

    goto :goto_1

    .line 256
    :cond_0
    :try_start_2
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v3}, Lcom/getjar/sdk/logging/RemoteAppender;->access$400(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/util/concurrent/ConcurrentLinkedQueue;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v3

    invoke-static {v2, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->access$302(Lcom/getjar/sdk/logging/RemoteAppender;I)I

    .line 259
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 262
    invoke-static {}, Lcom/getjar/sdk/logging/RemoteAppender;->access$500()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v2

    if-le v2, v13, :cond_2

    .line 264
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    const/4 v3, 0x5

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RemoteAppender: queue of length %1$d exteeds max of %2$d, dropping messages [thread:%3$d]"

    const/4 v6, 0x3

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Lcom/getjar/sdk/logging/RemoteAppender;->access$500()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v8

    invoke-virtual {v8}, Ljava/util/concurrent/ThreadPoolExecutor;->getActiveCount()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    const/16 v8, 0x64

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x2

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 285
    .end local v1    # "messagesToSend":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/logging/LogMessage;>;"
    :cond_1
    :goto_2
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$700(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/lang/Object;

    move-result-object v3

    monitor-enter v3
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 286
    :try_start_3
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v2}, Lcom/getjar/sdk/logging/RemoteAppender;->access$700(Lcom/getjar/sdk/logging/RemoteAppender;)Ljava/lang/Object;

    move-result-object v2

    iget-object v4, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    invoke-static {v4}, Lcom/getjar/sdk/logging/RemoteAppender;->access$800(Lcom/getjar/sdk/logging/RemoteAppender;)J

    move-result-wide v4

    invoke-virtual {v2, v4, v5}, Ljava/lang/Object;->wait(J)V

    .line 287
    monitor-exit v3

    goto/16 :goto_0

    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw v2
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 290
    :catch_1
    move-exception v0

    .line 291
    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    const/4 v3, 0x6

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RemoteAppender: consumer failed [thread:%1$d]"

    const/4 v6, 0x1

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->getId()J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 293
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v3, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-static {v2, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->access$102(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;)Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 294
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "RemoteAppender: consumer exiting [thread:%1$d]"

    new-array v5, v11, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v12, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    .line 296
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_3
    return-void

    .line 273
    .restart local v1    # "messagesToSend":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/logging/LogMessage;>;"
    :cond_2
    :try_start_6
    invoke-static {}, Lcom/getjar/sdk/logging/RemoteAppender;->access$500()Ljava/util/concurrent/ThreadPoolExecutor;

    move-result-object v2

    new-instance v3, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;

    invoke-direct {v3, p0, v1}, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread$1;-><init>(Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    goto :goto_2

    .line 293
    .end local v1    # "messagesToSend":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/logging/LogMessage;>;"
    :catchall_1
    move-exception v2

    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v4, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-static {v3, v4}, Lcom/getjar/sdk/logging/RemoteAppender;->access$102(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;)Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 294
    iget-object v3, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "RemoteAppender: consumer exiting [thread:%1$d]"

    new-array v6, v11, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Thread;->getId()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v12, v4}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    throw v2

    .line 293
    :cond_3
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v3, Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;->STOPPED:Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    invoke-static {v2, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->access$102(Lcom/getjar/sdk/logging/RemoteAppender;Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;)Lcom/getjar/sdk/logging/RemoteAppender$ThreadState;

    .line 294
    iget-object v2, p0, Lcom/getjar/sdk/logging/RemoteAppender$RemoteLoggingThread;->this$0:Lcom/getjar/sdk/logging/RemoteAppender;

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "RemoteAppender: consumer exiting [thread:%1$d]"

    new-array v5, v11, [Ljava/lang/Object;

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->getId()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v12, v3}, Lcom/getjar/sdk/logging/RemoteAppender;->logInternal(ILjava/lang/String;)V

    goto :goto_3
.end method
