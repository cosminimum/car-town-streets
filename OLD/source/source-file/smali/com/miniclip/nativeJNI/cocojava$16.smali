.class final Lcom/miniclip/nativeJNI/cocojava$16;
.super Ljava/lang/Object;
.source "cocojava.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/cocojava;->spendTapPoints(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$points:I


# direct methods
.method constructor <init>(I)V
    .locals 0

    .prologue
    .line 1487
    iput p1, p0, Lcom/miniclip/nativeJNI/cocojava$16;->val$points:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 1489
    invoke-static {}, Lcom/tapjoy/TapjoyConnect;->getTapjoyConnectInstance()Lcom/tapjoy/TapjoyConnect;

    move-result-object v0

    iget v1, p0, Lcom/miniclip/nativeJNI/cocojava$16;->val$points:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/tapjoy/TapjoyConnect;->spendTapPoints(ILcom/tapjoy/TapjoySpendPointsNotifier;)V

    .line 1491
    return-void
.end method
