.class Lcom/chartboost/sdk/impl/n$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/impl/n;->c(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic a:Lcom/chartboost/sdk/impl/n$a;

.field private final synthetic b:Lcom/chartboost/sdk/impl/a;


# direct methods
.method constructor <init>(Lcom/chartboost/sdk/impl/n$a;Lcom/chartboost/sdk/impl/a;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/impl/n$2;->a:Lcom/chartboost/sdk/impl/n$a;

    iput-object p2, p0, Lcom/chartboost/sdk/impl/n$2;->b:Lcom/chartboost/sdk/impl/a;

    .line 313
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 2
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 316
    iget-object v0, p0, Lcom/chartboost/sdk/impl/n$2;->a:Lcom/chartboost/sdk/impl/n$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/chartboost/sdk/impl/n$2;->a:Lcom/chartboost/sdk/impl/n$a;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/n$2;->b:Lcom/chartboost/sdk/impl/a;

    invoke-interface {v0, v1}, Lcom/chartboost/sdk/impl/n$a;->a(Lcom/chartboost/sdk/impl/a;)V

    .line 317
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 320
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 323
    return-void
.end method
