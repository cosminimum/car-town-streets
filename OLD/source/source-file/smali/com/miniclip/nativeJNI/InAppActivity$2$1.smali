.class Lcom/miniclip/nativeJNI/InAppActivity$2$1;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/nativeJNI/InAppActivity$2;->onQueryInventoryFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Inventory;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/miniclip/nativeJNI/InAppActivity$2;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity$2;)V
    .locals 0

    .prologue
    .line 133
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$2$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onConsumeMultiFinished(Ljava/util/List;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/miniclip/googlebilling/Purchase;",
            ">;",
            "Ljava/util/List",
            "<",
            "Lcom/miniclip/googlebilling/IabResult;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 136
    .local p1, "purchases":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/Purchase;>;"
    .local p2, "results":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/IabResult;>;"
    iget-object v0, p0, Lcom/miniclip/nativeJNI/InAppActivity$2$1;->this$1:Lcom/miniclip/nativeJNI/InAppActivity$2;

    iget-object v0, v0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 137
    return-void
.end method
