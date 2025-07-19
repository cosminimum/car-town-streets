.class Lcom/chartboost/sdk/Chartboost$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/chartboost/sdk/Chartboost;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/chartboost/sdk/Chartboost;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 484
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$b;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 485
    iput-object p2, p0, Lcom/chartboost/sdk/Chartboost$b;->b:Ljava/lang/String;

    .line 486
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 490
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$b;->a:Lcom/chartboost/sdk/Chartboost;

    iget-object v1, p0, Lcom/chartboost/sdk/Chartboost$b;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/Chartboost;->hasCachedInterstitial(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 491
    iget-object v1, p0, Lcom/chartboost/sdk/Chartboost$b;->a:Lcom/chartboost/sdk/Chartboost;

    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$b;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->b(Lcom/chartboost/sdk/Chartboost;)Ljava/util/Map;

    move-result-object v0

    iget-object v2, p0, Lcom/chartboost/sdk/Chartboost$b;->b:Ljava/lang/String;

    invoke-interface {v0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/chartboost/sdk/impl/a;

    invoke-static {v1, v0}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    .line 495
    :goto_0
    return-void

    .line 493
    :cond_0
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$b;->a:Lcom/chartboost/sdk/Chartboost;

    iget-object v1, p0, Lcom/chartboost/sdk/Chartboost$b;->b:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Ljava/lang/String;Z)V

    goto :goto_0
.end method
