.class Lcom/getjar/sdk/comm/RequestLogger$2;
.super Ljava/lang/Object;
.source "RequestLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/RequestLogger;->logRequestBefore(Lcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/RequestLogger;

.field final synthetic val$authState:Ljava/lang/String;

.field final synthetic val$operation:Lcom/getjar/sdk/comm/Operation;

.field final synthetic val$stackTrace:Ljava/lang/String;

.field final synthetic val$tid:J


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/RequestLogger;JLcom/getjar/sdk/comm/Operation;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 228
    iput-object p1, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    iput-wide p2, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$tid:J

    iput-object p4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$operation:Lcom/getjar/sdk/comm/Operation;

    iput-object p5, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$stackTrace:Ljava/lang/String;

    iput-object p6, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$authState:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 234
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 235
    .local v0, "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v4, "op"

    const-string v5, "pre"

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    const-string v4, "timestamp"

    iget-object v5, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v5}, Lcom/getjar/sdk/comm/RequestLogger;->access$300(Lcom/getjar/sdk/comm/RequestLogger;)Ljava/lang/Long;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v5

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 237
    const-string v4, "tid"

    iget-wide v5, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$tid:J

    invoke-static {v5, v6}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v4, v0}, Lcom/getjar/sdk/comm/RequestLogger;->access$000(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V

    .line 240
    const/4 v3, 0x0

    .line 241
    .local v3, "requestSize":Ljava/lang/Integer;
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$operation:Lcom/getjar/sdk/comm/Operation;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-eqz v4, :cond_0

    .line 243
    :try_start_1
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$operation:Lcom/getjar/sdk/comm/Operation;

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Operation;->getRequest()Lcom/getjar/sdk/comm/Request;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/Request;->getEstimatedRequestSizeInBytes()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v3

    .line 248
    :cond_0
    :goto_0
    if-eqz v3, :cond_1

    .line 249
    :try_start_2
    const-string v4, "requestSize"

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 252
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v4}, Lcom/getjar/sdk/comm/RequestLogger;->access$100(Lcom/getjar/sdk/comm/RequestLogger;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 253
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    .line 254
    .local v1, "authToken":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_2

    .line 255
    const-string v4, "authToken"

    invoke-virtual {v0, v4, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 258
    :cond_2
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$stackTrace:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_3

    .line 259
    const-string v4, "stackTrace"

    iget-object v5, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$stackTrace:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 262
    :cond_3
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$authState:Ljava/lang/String;

    invoke-static {v4}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 263
    const-string v4, "authState"

    iget-object v5, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->val$authState:Ljava/lang/String;

    invoke-virtual {v0, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    :cond_4
    iget-object v4, p0, Lcom/getjar/sdk/comm/RequestLogger$2;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v4, v0}, Lcom/getjar/sdk/comm/RequestLogger;->access$200(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V

    .line 272
    .end local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "authToken":Ljava/lang/String;
    .end local v3    # "requestSize":Ljava/lang/Integer;
    :goto_1
    return-void

    .line 244
    .restart local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v3    # "requestSize":Ljava/lang/Integer;
    :catch_0
    move-exception v2

    .line 245
    .local v2, "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "RequestLogger: logRequestBefore() operation.getRequest().getEstimatedRequestSizeInBytes() failed"

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->w(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 268
    .end local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "e":Ljava/lang/Exception;
    .end local v3    # "requestSize":Ljava/lang/Integer;
    :catch_1
    move-exception v2

    .line 269
    .restart local v2    # "e":Ljava/lang/Exception;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "RequestLogger: logRequestBefore() failed"

    invoke-static {v4, v5, v6, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method
