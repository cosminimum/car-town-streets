.class Lcom/apsalar/sdk/LoadTriggerTask;
.super Landroid/os/AsyncTask;
.source "ApLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/os/AsyncTask",
        "<",
        "Ljava/lang/String;",
        "Ljava/lang/Void;",
        "[",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field private context:Landroid/content/Context;

.field private info:Lcom/apsalar/sdk/ApsalarSessionInfo;

.field private ready:Ljava/lang/Boolean;

.field private triggerName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Landroid/content/Context;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 27
    invoke-direct {p0}, Landroid/os/AsyncTask;-><init>()V

    .line 19
    iput-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 20
    iput-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->context:Landroid/content/Context;

    .line 21
    iput-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->ready:Ljava/lang/Boolean;

    .line 22
    iput-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->triggerName:Ljava/lang/String;

    .line 30
    iput-object p1, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 31
    iput-object p2, p0, Lcom/apsalar/sdk/LoadTriggerTask;->context:Landroid/content/Context;

    .line 32
    return-void
.end method


# virtual methods
.method protected bridge synthetic doInBackground([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 18
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/apsalar/sdk/LoadTriggerTask;->doInBackground([Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected varargs doInBackground([Ljava/lang/String;)[Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v1, 0x0

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 38
    iget-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    if-eqz v0, :cond_2

    array-length v0, p1

    if-lez v0, :cond_2

    sget-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_2

    .line 39
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    .line 42
    array-length v0, p1

    if-ne v0, v6, :cond_0

    .line 43
    new-instance v0, Lcom/apsalar/sdk/ApsalarTrigger;

    aget-object v2, p1, v5

    iget-object v3, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    invoke-direct {v0, v2, v3}, Lcom/apsalar/sdk/ApsalarTrigger;-><init>(Ljava/lang/String;Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 50
    :goto_0
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/apsalar/sdk/ApsalarTrigger;->REST(Ljava/lang/Boolean;)I

    move-result v2

    .line 53
    if-ne v2, v6, :cond_1

    .line 54
    aget-object v1, p1, v5

    iput-object v1, p0, Lcom/apsalar/sdk/LoadTriggerTask;->triggerName:Ljava/lang/String;

    .line 55
    new-array v1, v7, [Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    iget-object v0, v0, Lcom/apsalar/sdk/ApsalarTrigger;->returnData:Ljava/lang/String;

    aput-object v0, v1, v6

    move-object v0, v1

    .line 63
    :goto_1
    return-object v0

    .line 47
    :cond_0
    new-instance v0, Lcom/apsalar/sdk/ApsalarTrigger;

    aget-object v2, p1, v5

    aget-object v3, p1, v6

    iget-object v4, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    invoke-direct {v0, v2, v3, v4}, Lcom/apsalar/sdk/ApsalarTrigger;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    goto :goto_0

    .line 58
    :cond_1
    new-array v0, v7, [Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v5

    aput-object v1, v0, v6

    goto :goto_1

    :cond_2
    move-object v0, v1

    .line 63
    goto :goto_1
.end method

.method protected bridge synthetic onPostExecute(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 18
    check-cast p1, [Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/apsalar/sdk/LoadTriggerTask;->onPostExecute([Ljava/lang/String;)V

    return-void
.end method

.method protected onPostExecute([Ljava/lang/String;)V
    .locals 4

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 67
    if-eqz p1, :cond_0

    array-length v0, p1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    .line 68
    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    .line 108
    :cond_1
    :goto_0
    return-void

    .line 72
    :cond_2
    aget-object v0, p1, v3

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    .line 73
    aget-object v1, p1, v2

    .line 75
    if-ne v0, v2, :cond_6

    .line 77
    const-string v0, "callback:"

    invoke-virtual {v1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 80
    iget-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    if-eqz v0, :cond_3

    .line 81
    new-instance v2, Lcom/apsalar/sdk/CallbackURL;

    invoke-direct {v2, v1}, Lcom/apsalar/sdk/CallbackURL;-><init>(Ljava/lang/String;)V

    .line 82
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    iget-object v1, v2, Lcom/apsalar/sdk/CallbackURL;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 83
    const-string v0, "__click__"

    iget-object v1, v2, Lcom/apsalar/sdk/CallbackURL;->clickParams:Lorg/json/JSONObject;

    invoke-static {v0, v1}, Lcom/apsalar/sdk/Apsalar;->eventJSON(Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 84
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    iget-object v1, v2, Lcom/apsalar/sdk/CallbackURL;->signature:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apsalar/sdk/ApsalarItem;

    .line 85
    iget-object v0, v0, Lcom/apsalar/sdk/ApsalarItem;->val:Ljava/lang/Object;

    check-cast v0, Lcom/apsalar/sdk/ApCallback;

    .line 86
    iget-object v1, v2, Lcom/apsalar/sdk/CallbackURL;->argValsJSON:Lorg/json/JSONArray;

    invoke-interface {v0, v1}, Lcom/apsalar/sdk/ApCallback;->executeCallback(Lorg/json/JSONArray;)V

    .line 89
    :cond_3
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    .line 106
    :cond_4
    :goto_1
    iget-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->triggerName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 107
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->executed_triggers:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/apsalar/sdk/LoadTriggerTask;->triggerName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 95
    :cond_5
    iget-object v0, p0, Lcom/apsalar/sdk/LoadTriggerTask;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    if-eqz v0, :cond_4

    .line 96
    new-instance v0, Landroid/content/Intent;

    iget-object v2, p0, Lcom/apsalar/sdk/LoadTriggerTask;->context:Landroid/content/Context;

    const-class v3, Lcom/apsalar/sdk/Activity;

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 97
    const-string v2, "op"

    const-string v3, "ad"

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 98
    const-string v2, "content"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 99
    iget-object v1, p0, Lcom/apsalar/sdk/LoadTriggerTask;->context:Landroid/content/Context;

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_1

    .line 104
    :cond_6
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    sput-object v0, Lcom/apsalar/sdk/Apsalar;->triggerActive:Ljava/lang/Boolean;

    goto :goto_1
.end method
