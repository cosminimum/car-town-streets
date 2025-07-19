.class public Lcom/chartboost/sdk/impl/s;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/chartboost/sdk/impl/s$a;
    }
.end annotation


# instance fields
.field private a:Landroid/view/View;

.field private b:Lcom/chartboost/sdk/impl/o;

.field private c:Landroid/view/OrientationEventListener;

.field private d:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/chartboost/sdk/impl/s$a;)V
    .locals 3

    .prologue
    const/4 v2, -0x1

    .line 23
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 20
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/chartboost/sdk/impl/s;->d:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    .line 24
    check-cast p2, Landroid/view/View;

    iput-object p2, p0, Lcom/chartboost/sdk/impl/s;->a:Landroid/view/View;

    .line 25
    new-instance v0, Lcom/chartboost/sdk/impl/o;

    invoke-direct {v0, p1}, Lcom/chartboost/sdk/impl/o;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/s;->b:Lcom/chartboost/sdk/impl/o;

    .line 26
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->b:Lcom/chartboost/sdk/impl/o;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 27
    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 26
    invoke-virtual {p0, v0, v1}, Lcom/chartboost/sdk/impl/s;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->a:Landroid/view/View;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 29
    invoke-direct {v1, v2, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 28
    invoke-virtual {p0, v0, v1}, Lcom/chartboost/sdk/impl/s;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 31
    invoke-static {}, Lcom/chartboost/sdk/Chartboost;->sharedChartboost()Lcom/chartboost/sdk/Chartboost;

    move-result-object v0

    invoke-virtual {v0}, Lcom/chartboost/sdk/Chartboost;->getForcedOrientationDifference()Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    move-result-object v0

    iput-object v0, p0, Lcom/chartboost/sdk/impl/s;->d:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    .line 32
    new-instance v0, Lcom/chartboost/sdk/impl/s$1;

    const/4 v1, 0x3

    invoke-direct {v0, p0, p1, v1}, Lcom/chartboost/sdk/impl/s$1;-><init>(Lcom/chartboost/sdk/impl/s;Landroid/content/Context;I)V

    iput-object v0, p0, Lcom/chartboost/sdk/impl/s;->c:Landroid/view/OrientationEventListener;

    .line 41
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->c:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->enable()V

    .line 43
    new-instance v0, Lcom/chartboost/sdk/impl/s$2;

    invoke-direct {v0, p0}, Lcom/chartboost/sdk/impl/s$2;-><init>(Lcom/chartboost/sdk/impl/s;)V

    invoke-virtual {p0, v0}, Lcom/chartboost/sdk/impl/s;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 48
    return-void
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/s;)Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->d:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    return-object v0
.end method

.method static synthetic a(Lcom/chartboost/sdk/impl/s;Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;)V
    .locals 0

    .prologue
    .line 20
    iput-object p1, p0, Lcom/chartboost/sdk/impl/s;->d:Lcom/chartboost/sdk/Libraries/CBOrientation$Difference;

    return-void
.end method

.method static synthetic b(Lcom/chartboost/sdk/impl/s;)Landroid/view/View;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->a:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public a()V
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->c:Landroid/view/OrientationEventListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->c:Landroid/view/OrientationEventListener;

    invoke-virtual {v0}, Landroid/view/OrientationEventListener;->disable()V

    .line 52
    :cond_0
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/chartboost/sdk/impl/s;->c:Landroid/view/OrientationEventListener;

    .line 53
    return-void
.end method

.method public b()Lcom/chartboost/sdk/impl/o;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->b:Lcom/chartboost/sdk/impl/o;

    return-object v0
.end method

.method public c()Landroid/view/View;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/chartboost/sdk/impl/s;->a:Landroid/view/View;

    return-object v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1, "ev"    # Landroid/view/MotionEvent;

    .prologue
    .line 56
    const/4 v0, 0x1

    return v0
.end method
