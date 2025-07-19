.class Lcom/getjar/sdk/comm/RequestLogger$3;
.super Ljava/lang/Object;
.source "RequestLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/RequestLogger;->logRequestAfter(Lcom/getjar/sdk/comm/Operation;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Exception;IILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/RequestLogger;

.field final synthetic val$authState:Ljava/lang/String;

.field final synthetic val$delta:J

.field final synthetic val$exception:Ljava/lang/Exception;

.field final synthetic val$exceptionCount:I

.field final synthetic val$executionTime:Ljava/lang/Integer;

.field final synthetic val$operation:Lcom/getjar/sdk/comm/Operation;

.field final synthetic val$reauthCount:I

.field final synthetic val$responseCode:Ljava/lang/Integer;

.field final synthetic val$tid:J

.field final synthetic val$timestamp:J


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/RequestLogger;JIIJLcom/getjar/sdk/comm/Operation;JLjava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Exception;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 316
    iput-object p1, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    iput-wide p2, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$timestamp:J

    iput p4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$reauthCount:I

    iput p5, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$exceptionCount:I

    iput-wide p6, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$tid:J

    iput-object p8, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$operation:Lcom/getjar/sdk/comm/Operation;

    iput-wide p9, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$delta:J

    iput-object p11, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$responseCode:Ljava/lang/Integer;

    iput-object p12, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$executionTime:Ljava/lang/Integer;

    iput-object p13, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$exception:Ljava/lang/Exception;

    iput-object p14, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$authState:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 322
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 323
    .local v0, "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "op"

    const-string v4, "post"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 324
    const-string v3, "timestamp"

    iget-wide v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$timestamp:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 325
    const-string v3, "reauthCount"

    iget v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$reauthCount:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    const-string v3, "exceptionCount"

    iget v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$exceptionCount:I

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 327
    const-string v3, "tid"

    iget-wide v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$tid:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v3, v0}, Lcom/getjar/sdk/comm/RequestLogger;->access$000(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V

    .line 330
    const/4 v2, 0x0

    .line 331
    .local v2, "responseSize":Ljava/lang/Integer;
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$operation:Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v3, :cond_0

    .line 333
    :try_start_1
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Operation;->getResult()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/Result;->getEstimatedResponseSizeInBytes()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    .line 338
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    .line 339
    :try_start_2
    const-string v3, "responseSize"

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    :cond_1
    const-string v3, "timeDelta"

    iget-wide v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$delta:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$responseCode:Ljava/lang/Integer;

    if-eqz v3, :cond_2

    .line 345
    const-string v3, "responseCode"

    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$responseCode:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 347
    :cond_2
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$executionTime:Ljava/lang/Integer;

    if-eqz v3, :cond_3

    .line 348
    const-string v3, "executionTime"

    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$executionTime:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    :cond_3
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$exception:Ljava/lang/Exception;

    if-eqz v3, :cond_4

    .line 353
    const-string v3, "exception"

    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$exception:Ljava/lang/Exception;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    const-string v3, "stackTrace"

    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$exception:Ljava/lang/Exception;

    invoke-virtual {v4}, Ljava/lang/Exception;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/logging/Logger;->getShortStack([Ljava/lang/StackTraceElement;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    :cond_4
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$authState:Ljava/lang/String;

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 358
    const-string v3, "authState"

    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->val$authState:Ljava/lang/String;

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 361
    :cond_5
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$3;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v3, v0}, Lcom/getjar/sdk/comm/RequestLogger;->access$200(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V

    .line 367
    .end local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "responseSize":Ljava/lang/Integer;
    :goto_1
    return-void

    .line 334
    .restart local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v2    # "responseSize":Ljava/lang/Integer;
    :catch_0
    move-exception v1

    .line 335
    .local v1, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "RequestLogger: logRequestAfter() operation.getResult().getEstimatedResponseSizeInBytes() failed"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto/16 :goto_0

    .line 363
    .end local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "responseSize":Ljava/lang/Integer;
    :catch_1
    move-exception v1

    .line 364
    .restart local v1    # "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "RequestLogger: logRequestAfter() failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
