.class Lcom/chartboost/sdk/Chartboost$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/chartboost/sdk/impl/m$a;


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
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$1;->a:Lcom/chartboost/sdk/Chartboost;

    .line 948
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 951
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$1;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/a;

    move-result-object v0

    .line 952
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/chartboost/sdk/a;->a()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 953
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/a;->a(Z)V

    .line 954
    :cond_0
    return-void
.end method
