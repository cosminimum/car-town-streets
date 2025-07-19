.class Lcom/miniclip/googlebilling/IabHelper$2$1;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/googlebilling/IabHelper$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/googlebilling/IabHelper$2;

.field final synthetic val$inv_f:Lcom/miniclip/googlebilling/Inventory;

.field final synthetic val$result_f:Lcom/miniclip/googlebilling/IabResult;


# direct methods
.method constructor <init>(Lcom/miniclip/googlebilling/IabHelper$2;Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Inventory;)V
    .locals 0

    .prologue
    .line 532
    iput-object p1, p0, Lcom/miniclip/googlebilling/IabHelper$2$1;->this$1:Lcom/miniclip/googlebilling/IabHelper$2;

    iput-object p2, p0, Lcom/miniclip/googlebilling/IabHelper$2$1;->val$result_f:Lcom/miniclip/googlebilling/IabResult;

    iput-object p3, p0, Lcom/miniclip/googlebilling/IabHelper$2$1;->val$inv_f:Lcom/miniclip/googlebilling/Inventory;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 534
    iget-object v0, p0, Lcom/miniclip/googlebilling/IabHelper$2$1;->this$1:Lcom/miniclip/googlebilling/IabHelper$2;

    iget-object v0, v0, Lcom/miniclip/googlebilling/IabHelper$2;->val$listener:Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;

    iget-object v1, p0, Lcom/miniclip/googlebilling/IabHelper$2$1;->val$result_f:Lcom/miniclip/googlebilling/IabResult;

    iget-object v2, p0, Lcom/miniclip/googlebilling/IabHelper$2$1;->val$inv_f:Lcom/miniclip/googlebilling/Inventory;

    invoke-interface {v0, v1, v2}, Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;->onQueryInventoryFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Inventory;)V

    .line 535
    return-void
.end method
