.class Lcom/chartboost/sdk/impl/s$1;
.super Landroid/view/OrientationEventListener;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/impl/s;-><init>(Landroid/content/Context;Lcom/chartboost/sdk/impl/s$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/impl/s;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/impl/s;Landroid/content/Context;I)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/impl/s$1;->a:Lcom/chartboost/sdk/impl/s;

    .line 32
    invoke-direct {p0, p2, p3}, Landroid/view/OrientationEventListener;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onOrientationChanged(I)V
    .locals 2
    .param p1, "orientation"    # I

    .prologue
    .line 34
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getForcedOrientationDifference()Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/chartboost/sdk/impl/s$1;->a:Lcom/chartboost/sdk/impl/s;

    invoke-static {v1}, Lcom/chartboost/sdk/impl/s;->a(Lcom/chartboost/sdk/impl/s;)Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    move-result-object v1

    if-ne v1, v0, :cond_0

    .line 39
    :goto_0
    return-void

    .line 36
    :cond_0
    iget-object v1, p0, Lcom/chartboost/sdk/impl/s$1;->a:Lcom/chartboost/sdk/impl/s;

    invoke-static {v1, v0}, Lcom/chartboost/sdk/impl/s;->a(Lcom/chartboost/sdk/impl/s;Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;)V

    .line 37
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s$1;->a:Lcom/chartboost/sdk/impl/s;

    invoke-static {v0}, Lcom/chartboost/sdk/impl/s;->b(Lcom/chartboost/sdk/impl/s;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/chartboost/sdk/impl/s$a;

    invoke-interface {v0}, Lcom/chartboost/sdk/impl/s$a;->a()V

    .line 38
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s$1;->a:Lcom/chartboost/sdk/impl/s;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/s;->invalidate()V

    goto :goto_0
.end method
