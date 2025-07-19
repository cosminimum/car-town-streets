.class Lcom/chartboost/sdk/impl/n$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/chartboost/sdk/impl/n;->b(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic a:Landroid/view/View;

.field private final synthetic b:Lcom/chartboost/sdk/impl/n$b;

.field private final synthetic c:Lcom/chartboost/sdk/impl/a;

.field private final synthetic d:Lcom/chartboost/sdk/impl/n$a;

.field private final synthetic e:Ljava/lang/Boolean;


# direct methods
.method constructor <init>(Landroid/view/View;Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/chartboost/sdk/impl/n$1;->a:Landroid/view/View;

    iput-object p2, p0, Lcom/chartboost/sdk/impl/n$1;->b:Lcom/chartboost/sdk/impl/n$b;

    iput-object p3, p0, Lcom/chartboost/sdk/impl/n$1;->c:Lcom/chartboost/sdk/impl/a;

    iput-object p4, p0, Lcom/chartboost/sdk/impl/n$1;->d:Lcom/chartboost/sdk/impl/n$a;

    iput-object p5, p0, Lcom/chartboost/sdk/impl/n$1;->e:Ljava/lang/Boolean;

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 4

    .prologue
    .line 75
    iget-object v0, p0, Lcom/chartboost/sdk/impl/n$1;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 76
    iget-object v0, p0, Lcom/chartboost/sdk/impl/n$1;->b:Lcom/chartboost/sdk/impl/n$b;

    iget-object v1, p0, Lcom/chartboost/sdk/impl/n$1;->c:Lcom/chartboost/sdk/impl/a;

    iget-object v2, p0, Lcom/chartboost/sdk/impl/n$1;->d:Lcom/chartboost/sdk/impl/n$a;

    iget-object v3, p0, Lcom/chartboost/sdk/impl/n$1;->e:Ljava/lang/Boolean;

    invoke-static {v0, v1, v2, v3}, Lcom/chartboost/sdk/impl/n;->a(Lcom/chartboost/sdk/impl/n$b;Lcom/chartboost/sdk/impl/a;Lcom/chartboost/sdk/impl/n$a;Ljava/lang/Boolean;)V

    .line 77
    return-void
.end method
