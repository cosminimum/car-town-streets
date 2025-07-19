.class Lcom/chartboost/sdk/a$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/n$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/a;->c(Lcom/chartboost/sdk/impl/a;)Lcom/chartboost/sdk/impl/n$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/a;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/a;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/a$1;->a:Lcom/chartboost/sdk/a;

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lcom/chartboost/sdk/impl/a;)V
    .locals 4

    .prologue
    .line 239
    iget-object v0, p0, Lcom/chartboost/sdk/a$1;->a:Lcom/chartboost/sdk/a;

    invoke-static {v0}, Lcom/chartboost/sdk/a;->a(Lcom/chartboost/sdk/a;)Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    iget-object v0, v0, Lcom/chartboost/sdk/Chartboost;->a:Landroid/os/Handler;

    .line 240
    new-instance v1, Lcom/chartboost/sdk/a$b;

    iget-object v2, p0, Lcom/chartboost/sdk/a$1;->a:Lcom/chartboost/sdk/a;

    const/4 v3, 0x0

    invoke-direct {v1, v2, p1, v3}, Lcom/chartboost/sdk/a$b;-><init>(Lcom/chartboost/sdk/a;Lcom/chartboost/sdk/impl/a;Z)V

    .line 239
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 241
    return-void
.end method
