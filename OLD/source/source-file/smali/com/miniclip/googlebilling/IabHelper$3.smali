.class Lcom/miniclip/googlebilling/IabHelper$3;
.super Ljava/lang/Object;
.source "IabHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/miniclip/googlebilling/IabHelper;->consumeAsyncInternal(Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/googlebilling/IabHelper;

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$multiListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;

.field final synthetic val$purchases:Ljava/util/List;

.field final synthetic val$singleListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;


# direct methods
.method constructor <init>(Lcom/miniclip/googlebilling/IabHelper;Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;Landroid/os/Handler;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V
    .locals 0

    .prologue
    .line 857
    iput-object p1, p0, Lcom/miniclip/googlebilling/IabHelper$3;->this$0:Lcom/miniclip/googlebilling/IabHelper;

    iput-object p2, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$purchases:Ljava/util/List;

    iput-object p3, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$singleListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

    iput-object p4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$handler:Landroid/os/Handler;

    iput-object p5, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$multiListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 859
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 860
    .local v3, "results":Ljava/util/List;, "Ljava/util/List<Lcom/miniclip/googlebilling/IabResult;>;"
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$purchases:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/miniclip/googlebilling/Purchase;

    .line 862
    .local v2, "purchase":Lcom/miniclip/googlebilling/Purchase;
    :try_start_0
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->this$0:Lcom/miniclip/googlebilling/IabHelper;

    invoke-virtual {v4, v2}, Lcom/miniclip/googlebilling/IabHelper;->consume(Lcom/miniclip/googlebilling/Purchase;)V

    .line 863
    new-instance v4, Lcom/miniclip/googlebilling/IabResult;

    const/4 v5, 0x0

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Successful consume of sku "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lcom/miniclip/googlebilling/Purchase;->getSku()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v5, v6}, Lcom/miniclip/googlebilling/IabResult;-><init>(ILjava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/miniclip/googlebilling/IabException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 865
    :catch_0
    move-exception v0

    .line 866
    .local v0, "ex":Lcom/miniclip/googlebilling/IabException;
    invoke-virtual {v0}, Lcom/miniclip/googlebilling/IabException;->getResult()Lcom/miniclip/googlebilling/IabResult;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 870
    .end local v0    # "ex":Lcom/miniclip/googlebilling/IabException;
    .end local v2    # "purchase":Lcom/miniclip/googlebilling/Purchase;
    :cond_0
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->this$0:Lcom/miniclip/googlebilling/IabHelper;

    invoke-virtual {v4}, Lcom/miniclip/googlebilling/IabHelper;->flagEndAsync()V

    .line 871
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$singleListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeFinishedListener;

    if-eqz v4, :cond_1

    .line 872
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$handler:Landroid/os/Handler;

    new-instance v5, Lcom/miniclip/googlebilling/IabHelper$3$1;

    invoke-direct {v5, p0, v3}, Lcom/miniclip/googlebilling/IabHelper$3$1;-><init>(Lcom/miniclip/googlebilling/IabHelper$3;Ljava/util/List;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 878
    :cond_1
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$multiListener:Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;

    if-eqz v4, :cond_2

    .line 879
    iget-object v4, p0, Lcom/miniclip/googlebilling/IabHelper$3;->val$handler:Landroid/os/Handler;

    new-instance v5, Lcom/miniclip/googlebilling/IabHelper$3$2;

    invoke-direct {v5, p0, v3}, Lcom/miniclip/googlebilling/IabHelper$3$2;-><init>(Lcom/miniclip/googlebilling/IabHelper$3;Ljava/util/List;)V

    invoke-virtual {v4, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 885
    :cond_2
    return-void
.end method
