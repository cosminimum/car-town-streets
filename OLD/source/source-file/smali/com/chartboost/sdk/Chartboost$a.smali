.class Lcom/chartboost/sdk/Chartboost$a;
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
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/chartboost/sdk/Chartboost;

.field private b:I

.field private c:I

.field private d:I


# direct methods
.method private constructor <init>(Lcom/chartboost/sdk/Chartboost;)V
    .locals 2

    .prologue
    const/4 v1, -0x1

    .line 392
    iput-object p1, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 393
    invoke-static {p1}, Lcom/chartboost/sdk/Chartboost;->f(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/CBImpressionActivity;

    move-result-object v0

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    iput v0, p0, Lcom/chartboost/sdk/Chartboost$a;->b:I

    .line 394
    invoke-static {p1}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;)Landroid/app/Activity;

    move-result-object v0

    if-nez v0, :cond_1

    move v0, v1

    :goto_1
    iput v0, p0, Lcom/chartboost/sdk/Chartboost$a;->c:I

    .line 395
    invoke-static {p1}, Lcom/chartboost/sdk/Chartboost;->g(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-nez v0, :cond_2

    :goto_2
    iput v1, p0, Lcom/chartboost/sdk/Chartboost$a;->d:I

    .line 396
    return-void

    .line 393
    :cond_0
    invoke-static {p1}, Lcom/chartboost/sdk/Chartboost;->f(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/CBImpressionActivity;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    .line 394
    :cond_1
    invoke-static {p1}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_1

    .line 395
    :cond_2
    invoke-static {p1}, Lcom/chartboost/sdk/Chartboost;->g(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_2
.end method

.method synthetic constructor <init>(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/Chartboost$a;)V
    .locals 0

    .prologue
    .line 392
    invoke-direct {p0, p1}, Lcom/chartboost/sdk/Chartboost$a;-><init>(Lcom/chartboost/sdk/Chartboost;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 399
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->d(Lcom/chartboost/sdk/Chartboost;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/chartboost/sdk/Chartboost$a;->c:I

    if-ne v0, v1, :cond_0

    .line 400
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Landroid/app/Activity;)V

    .line 401
    :cond_0
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->f(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/CBImpressionActivity;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->f(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/CBImpressionActivity;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/chartboost/sdk/Chartboost$a;->b:I

    if-ne v0, v1, :cond_1

    .line 402
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/CBImpressionActivity;)V

    .line 403
    :cond_1
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->g(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0}, Lcom/chartboost/sdk/Chartboost;->g(Lcom/chartboost/sdk/Chartboost;)Lcom/chartboost/sdk/ChartboostDelegate;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    iget v1, p0, Lcom/chartboost/sdk/Chartboost$a;->d:I

    if-ne v0, v1, :cond_2

    .line 404
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-static {v0, v2}, Lcom/chartboost/sdk/Chartboost;->a(Lcom/chartboost/sdk/Chartboost;Lcom/chartboost/sdk/ChartboostDelegate;)V

    .line 406
    :cond_2
    iget-object v0, p0, Lcom/chartboost/sdk/Chartboost$a;->a:Lcom/chartboost/sdk/Chartboost;

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->clearImageCache()V

    .line 407
    return-void
.end method
