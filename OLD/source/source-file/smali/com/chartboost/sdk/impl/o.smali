.class public Lcom/chartboost/sdk/impl/o;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/o$a;
    }
.end annotation


# instance fields
.field public a:Lcom/chartboost/sdk/impl/o$a;

.field private b:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 19
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 21
    new-instance v0, Lcom/chartboost/sdk/impl/o$a;

    invoke-direct {v0, p0, p1}, Lcom/chartboost/sdk/impl/o$a;-><init>(Lcom/chartboost/sdk/impl/o;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/o;->a:Lcom/chartboost/sdk/impl/o$a;

    .line 22
    iget-object v0, p0, Lcom/chartboost/sdk/impl/o;->a:Lcom/chartboost/sdk/impl/o$a;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 24
    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 22
    invoke-virtual {v0, v1}, Lcom/chartboost/sdk/impl/o$a;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 25
    iget-object v0, p0, Lcom/chartboost/sdk/impl/o;->a:Lcom/chartboost/sdk/impl/o$a;

    invoke-virtual {p0, v0}, Lcom/chartboost/sdk/impl/o;->addView(Landroid/view/View;)V

    .line 27
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/chartboost/sdk/impl/o;->setFocusable(Z)V

    .line 28
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/o;)Z
    .locals 1

    .prologue
    .line 15
    iget-boolean v0, p0, Lcom/chartboost/sdk/impl/o;->b:Z

    return v0
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 40
    iget-object v0, p0, Lcom/chartboost/sdk/impl/o;->a:Lcom/chartboost/sdk/impl/o$a;

    invoke-virtual {p0, v0}, Lcom/chartboost/sdk/impl/o;->a(Landroid/view/View;)V

    .line 41
    return-void
.end method

.method public a(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 32
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 33
    const-wide/16 v1, 0x1fe

    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 34
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setFillAfter(Z)V

    .line 35
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 36
    return-void
.end method

.method public a(Z)V
    .locals 1

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/chartboost/sdk/impl/o;->b:Z

    .line 49
    iget-object v0, p0, Lcom/chartboost/sdk/impl/o;->a:Lcom/chartboost/sdk/impl/o$a;

    invoke-virtual {v0}, Lcom/chartboost/sdk/impl/o$a;->a()V

    .line 50
    return-void
.end method
