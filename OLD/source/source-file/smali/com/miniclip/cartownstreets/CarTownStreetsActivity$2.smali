.class final Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;
.super Ljava/lang/Object;
.source "CarTownStreetsActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->sendAdxPurchase(Ljava/lang/String;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$productId:Ljava/lang/String;

.field final synthetic val$purchaseType:I


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 371
    iput-object p1, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;->val$productId:Ljava/lang/String;

    iput p2, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;->val$purchaseType:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 373
    invoke-static {}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->access$000()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;

    iget-object v1, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;->val$productId:Ljava/lang/String;

    iget v2, p0, Lcom/miniclip/cartownstreets/CarTownStreetsActivity$2;->val$purchaseType:I

    invoke-virtual {v0, v1, v2}, Lcom/miniclip/cartownstreets/CarTownStreetsActivity;->sendAdxPurchaseImpl(Ljava/lang/String;I)V

    .line 374
    return-void
.end method
