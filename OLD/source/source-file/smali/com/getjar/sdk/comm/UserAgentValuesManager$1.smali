.class Lcom/getjar/sdk/comm/UserAgentValuesManager$1;
.super Ljava/lang/Object;
.source "UserAgentValuesManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/getjar/sdk/comm/UserAgentValuesManager;->getWebKitUserAgent(Landroid/content/Context;)Ljava/lang/String;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

.field final synthetic val$prefs:Landroid/content/SharedPreferences;

.field final synthetic val$xThreadContext:Landroid/content/Context;


# direct methods
.method constructor <init>(Lcom/getjar/sdk/comm/UserAgentValuesManager;Landroid/content/Context;Landroid/content/SharedPreferences;)V
    .locals 0

    .prologue
    .line 140
    iput-object p1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    iput-object p2, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->val$xThreadContext:Landroid/content/Context;

    iput-object p3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 143
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "UserAgentValuesManager: getWebKitUserAgent() work starting on UI thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 147
    :try_start_0
    iget-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    iget-object v2, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    iget-object v3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->val$xThreadContext:Landroid/content/Context;

    invoke-static {v2, v3}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$100(Lcom/getjar/sdk/comm/UserAgentValuesManager;Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$002(Lcom/getjar/sdk/comm/UserAgentValuesManager;Ljava/lang/String;)Ljava/lang/String;

    .line 150
    iget-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    invoke-static {v1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$000(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 151
    iget-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->val$prefs:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "UserAgent"

    iget-object v3, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    invoke-static {v3}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$000(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 159
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "UserAgentValuesManager: getWebKitUserAgent() work finished on UI thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    invoke-static {v1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$200(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Lcom/getjar/sdk/utilities/ManualResetEvent;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    .line 162
    :goto_0
    return-void

    .line 154
    :catch_0
    move-exception v0

    .line 157
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "UserAgentValuesManager: getWebKitUserAgent() failed"

    invoke-static {v1, v2, v3, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    sget-object v1, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "UserAgentValuesManager: getWebKitUserAgent() work finished on UI thread"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 160
    iget-object v1, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    invoke-static {v1}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$200(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Lcom/getjar/sdk/utilities/ManualResetEvent;

    move-result-object v1

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    goto :goto_0

    .line 159
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v1

    sget-object v2, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "UserAgentValuesManager: getWebKitUserAgent() work finished on UI thread"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 160
    iget-object v2, p0, Lcom/getjar/sdk/comm/UserAgentValuesManager$1;->this$0:Lcom/getjar/sdk/comm/UserAgentValuesManager;

    invoke-static {v2}, Lcom/getjar/sdk/comm/UserAgentValuesManager;->access$200(Lcom/getjar/sdk/comm/UserAgentValuesManager;)Lcom/getjar/sdk/utilities/ManualResetEvent;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/utilities/ManualResetEvent;->open()V

    throw v1
.end method
