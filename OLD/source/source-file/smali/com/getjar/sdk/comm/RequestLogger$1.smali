.class Lcom/getjar/sdk/comm/RequestLogger$1;
.super Ljava/lang/Object;
.source "RequestLogger.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/RequestLogger;->logRewardsWallShow()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/RequestLogger;

.field final synthetic val$tid:J

.field final synthetic val$timestamp:J


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/RequestLogger;JJ)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    iput-wide p2, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->val$timestamp:J

    iput-wide p4, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->val$tid:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 171
    :try_start_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 172
    .local v0, "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v3, "op"

    const-string v4, "pre"

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string v3, "timestamp"

    iget-wide v4, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->val$timestamp:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    const-string v3, "tid"

    iget-wide v4, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->val$tid:J

    invoke-static {v4, v5}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v3, v0}, Lcom/getjar/sdk/comm/RequestLogger;->access$000(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V

    .line 177
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v3}, Lcom/getjar/sdk/comm/RequestLogger;->access$100(Lcom/getjar/sdk/comm/RequestLogger;)Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 178
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getAuthToken()Ljava/lang/String;

    move-result-object v1

    .line 179
    .local v1, "authToken":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 180
    const-string v3, "authToken"

    invoke-virtual {v0, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    :cond_0
    iget-object v3, p0, Lcom/getjar/sdk/comm/RequestLogger$1;->this$0:Lcom/getjar/sdk/comm/RequestLogger;

    invoke-static {v3, v0}, Lcom/getjar/sdk/comm/RequestLogger;->access$200(Lcom/getjar/sdk/comm/RequestLogger;Ljava/util/Map;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    .end local v0    # "args":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v1    # "authToken":Ljava/lang/String;
    :goto_0
    return-void

    .line 184
    :catch_0
    move-exception v2

    .line 185
    .local v2, "e":Ljava/lang/Exception;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "RequestLogger: logRequestBefore() failed"

    invoke-static {v3, v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
