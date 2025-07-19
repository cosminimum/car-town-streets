.class Lcom/miniclip/nativeJNI/InAppActivity$2;
.super Ljava/lang/Object;
.source "InAppActivity.java"

# interfaces
.implements Lcom/miniclip/googlebilling/IabHelper$QueryInventoryFinishedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/nativeJNI/InAppActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/miniclip/nativeJNI/InAppActivity;


# direct methods
.method constructor <init>(Lcom/miniclip/nativeJNI/InAppActivity;)V
    .locals 0

    .prologue
    .line 106
    iput-object p1, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryInventoryFinished(Lcom/miniclip/googlebilling/IabResult;Lcom/miniclip/googlebilling/Inventory;)V
    .locals 11
    .param p1, "result"    # Lcom/miniclip/googlebilling/IabResult;
    .param p2, "inventory"    # Lcom/miniclip/googlebilling/Inventory;

    .prologue
    const/4 v10, 0x0

    .line 108
    const-string v7, "InAppActivity"

    const-string v8, "Query inventory finished."

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    invoke-virtual {p1}, Lcom/miniclip/googlebilling/IabResult;->isFailure()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 110
    iget-object v7, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Failed to query inventory: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/miniclip/nativeJNI/InAppActivity;->complain(Ljava/lang/String;)V

    .line 140
    :cond_0
    :goto_0
    return-void

    .line 114
    :cond_1
    const-string v7, "InAppActivity"

    const-string v8, "Query inventory was successful."

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    iget-object v7, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v7, p2}, Lcom/miniclip/nativeJNI/InAppActivity;->syncInventory(Lcom/miniclip/googlebilling/Inventory;)V

    .line 118
    invoke-virtual {p2}, Lcom/miniclip/googlebilling/Inventory;->getAllOwnedSkus()Ljava/util/List;

    move-result-object v5

    .line 119
    .local v5, "products":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 120
    .local v4, "product":Ljava/lang/String;
    const-string v7, "InAppActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Inventory item: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 122
    .end local v4    # "product":Ljava/lang/String;
    :cond_2
    iget-object v7, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v7}, Lcom/miniclip/nativeJNI/InAppActivity;->getOwnedItems()[Ljava/lang/String;

    move-result-object v6

    .line 123
    .local v6, "productsStored":[Ljava/lang/String;
    move-object v1, v6

    .local v1, "arr$":[Ljava/lang/String;
    array-length v3, v1

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_2
    if-ge v2, v3, :cond_3

    aget-object v4, v1, v2

    .line 124
    .restart local v4    # "product":Ljava/lang/String;
    const-string v7, "InAppActivity"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Inventory item stored: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 126
    .end local v4    # "product":Ljava/lang/String;
    :cond_3
    iget-object v7, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-virtual {v7, v10}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 127
    const-string v7, "InAppActivity"

    const-string v8, "Initial inventory query finished."

    invoke-static {v7, v8}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 131
    .local v0, "CLEAR_PURCHASES":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 132
    iget-object v7, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/miniclip/nativeJNI/InAppActivity;->setWaitScreen(Z)V

    .line 133
    iget-object v7, p0, Lcom/miniclip/nativeJNI/InAppActivity$2;->this$0:Lcom/miniclip/nativeJNI/InAppActivity;

    invoke-static {v7}, Lcom/miniclip/nativeJNI/InAppActivity;->access$000(Lcom/miniclip/nativeJNI/InAppActivity;)Lcom/miniclip/googlebilling/IabHelper;

    move-result-object v7

    invoke-virtual {p2}, Lcom/miniclip/googlebilling/Inventory;->getAllPurchases()Ljava/util/List;

    move-result-object v8

    new-instance v9, Lcom/miniclip/nativeJNI/InAppActivity$2$1;

    invoke-direct {v9, p0}, Lcom/miniclip/nativeJNI/InAppActivity$2$1;-><init>(Lcom/miniclip/nativeJNI/InAppActivity$2;)V

    invoke-virtual {v7, v8, v9}, Lcom/miniclip/googlebilling/IabHelper;->consumeAsync(Ljava/util/List;Lcom/miniclip/googlebilling/IabHelper$OnConsumeMultiFinishedListener;)V

    goto/16 :goto_0
.end method
