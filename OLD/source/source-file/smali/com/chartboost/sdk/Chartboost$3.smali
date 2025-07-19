.class Lcom/chartboost/sdk/Chartboost$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/j$c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Chartboost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/Chartboost;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$3;->a:Lcom/chartboost/sdk/Chartboost;

    .line 1109
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/chartboost/sdk/impl/k;)V
    .locals 5

    .prologue
    .line 1112
    iget-object v0, p1, Lcom/chartboost/sdk/impl/k;->b:Ljava/lang/String;

    const-string v1, "get"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1113
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$3;->a:Lcom/chartboost/sdk/Chartboost;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->b:Lcom/chartboost/sdk/impl/a$c;

    iget-object v2, p1, Lcom/chartboost/sdk/impl/k;->e:Lorg/json/JSONObject;

    const-string v3, "location"

    const-string v4, "Default"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a$c;Ljava/lang/String;)V

    .line 1118
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$3;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/a;

    move-result-object v0

    .line 1119
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/chartboost/sdk/a;->a()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1120
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/a;->a(Z)V

    .line 1121
    :cond_1
    return-void

    .line 1114
    :cond_2
    iget-object v0, p1, Lcom/chartboost/sdk/impl/k;->b:Ljava/lang/String;

    const-string v1, "more"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1115
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$3;->a:Lcom/chartboost/sdk/Chartboost;

    sget-object v1, Lcom/chartboost/sdk/impl/a$c;->c:Lcom/chartboost/sdk/impl/a$c;

    iget-object v2, p1, Lcom/chartboost/sdk/impl/k;->e:Lorg/json/JSONObject;

    const-string v3, "location"

    const-string v4, "Default"

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a$c;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public a(Lorg/json/JSONObject;Lcom/chartboost/sdk/impl/k;)V
    .locals 1

    .prologue
    .line 1125
    iget-object v0, p2, Lcom/chartboost/sdk/impl/k;->h:Lcom/chartboost/sdk/impl/k$a;

    if-eqz v0, :cond_0

    .line 1126
    iget-object v0, p2, Lcom/chartboost/sdk/impl/k;->h:Lcom/chartboost/sdk/impl/k$a;

    invoke-interface {v0, p1}, Lcom/chartboost/sdk/impl/k$a;->a(Lorg/json/JSONObject;)V

    .line 1127
    :cond_0
    return-void
.end method
