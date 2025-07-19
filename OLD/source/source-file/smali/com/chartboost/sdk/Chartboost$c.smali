.class Lcom/chartboost/sdk/Chartboost$c;
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
    name = "c"
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;


# direct methods
.method private constructor <init>(Lcom/chartboost/sdk/Chartboost;)V
    .locals 0

    .prologue
    .line 546
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$c;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/Chartboost$c;)V
    .locals 0

    .prologue
    .line 546
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/Chartboost$c;-><init>(Lcom/chartboost/sdk/Chartboost;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 549
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$c;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->c(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/impl/a;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 550
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$c;->a:Lcom/chartboost/sdk/Chartboost;

    iget-object v1, p0, Lcom/chartboost/sdk/Chartboost$c;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v1}, Lcom/chartboost/sdk/Chartboost;->c(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/impl/a;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/chartboost/sdk/Chartboost;->b(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/impl/a;)V

    .line 554
    :goto_0
    return-void

    .line 552
    :cond_0
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$c;->a:Lcom/chartboost/sdk/Chartboost;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Z)V

    goto :goto_0
.end method
