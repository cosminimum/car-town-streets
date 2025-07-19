.class public Lcom/miniclip/GetJar/PurchaseMethodAdapter;
.super Landroid/widget/BaseAdapter;
.source "PurchaseMethodAdapter.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private context:Landroid/content/Context;

.field private prefs:Landroid/content/SharedPreferences;

.field private products:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/Product;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/Product;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 25
    .local p2, "products":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/Product;>;"
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 26
    iput-object p1, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    .line 27
    iput-object p2, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->products:Ljava/util/List;

    .line 28
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->products:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 37
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "itemId"    # I

    .prologue
    .line 42
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 15
    .param p1, "position"    # I
    .param p2, "view"    # Landroid/view/View;
    .param p3, "arg2"    # Landroid/view/ViewGroup;

    .prologue
    .line 48
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    const-string v12, "layout_inflater"

    invoke-virtual {v11, v12}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/LayoutInflater;

    .line 50
    .local v4, "inflater":Landroid/view/LayoutInflater;
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "purchase_method"

    const-string v13, "layout"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 51
    .local v1, "dialogLayout":I
    const/4 v11, 0x0

    invoke-virtual {v4, v1, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p2

    .line 53
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->products:Ljava/util/List;

    move/from16 v0, p1

    invoke-interface {v11, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/getjar/sdk/Product;

    .line 54
    .local v5, "product":Lcom/getjar/sdk/Product;
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "product_info"

    const-string v13, "id"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 56
    .local v3, "id":I
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v9

    check-cast v9, Landroid/widget/TextView;

    .line 58
    .local v9, "productinfo":Landroid/widget/TextView;
    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getAmount()J

    move-result-wide v11

    invoke-static {v11, v12}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 60
    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductDescription()Ljava/lang/String;

    move-result-object v11

    const-string v12, "Google Play Store"

    if-ne v11, v12, :cond_1

    const/4 v2, 0x1

    .line 62
    .local v2, "gplayflag":Z
    :goto_0
    if-eqz v2, :cond_0

    .line 64
    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductId()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Lcom/miniclip/nativeJNI/cocojava;->getProductPrice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 66
    .local v10, "result":Ljava/lang/String;
    if-eqz v10, :cond_2

    invoke-virtual {v10}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/String;->length()I

    move-result v11

    if-lez v11, :cond_2

    .line 67
    invoke-virtual {v9, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 71
    .end local v10    # "result":Ljava/lang/String;
    :cond_0
    :goto_1
    const/4 v11, 0x1

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Landroid/view/View;->setEnabled(Z)V

    .line 72
    move-object/from16 v0, p2

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    move-object/from16 v0, p2

    invoke-virtual {v0, v5}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 75
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "product_name"

    const-string v13, "id"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 76
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v8

    check-cast v8, Landroid/widget/TextView;

    .line 77
    .local v8, "productName":Landroid/widget/TextView;
    invoke-virtual {v5}, Lcom/getjar/sdk/Product;->getProductDescription()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v8, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "product_desc"

    const-string v13, "id"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 80
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    .line 82
    .local v6, "productDesc":Landroid/widget/TextView;
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "product_img"

    const-string v13, "id"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 83
    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 85
    .local v7, "productImg":Landroid/widget/ImageView;
    if-eqz v2, :cond_3

    .line 86
    const-string v11, "Buy now"

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "icon_googlewallet"

    const-string v13, "drawable"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    .line 93
    :goto_2
    invoke-virtual {v7, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 95
    return-object p2

    .line 60
    .end local v2    # "gplayflag":Z
    .end local v6    # "productDesc":Landroid/widget/TextView;
    .end local v7    # "productImg":Landroid/widget/ImageView;
    .end local v8    # "productName":Landroid/widget/TextView;
    :cond_1
    const/4 v2, 0x0

    goto/16 :goto_0

    .line 68
    .restart local v2    # "gplayflag":Z
    .restart local v10    # "result":Ljava/lang/String;
    :cond_2
    const-string v11, "Buy"

    invoke-virtual {v9, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto/16 :goto_1

    .line 89
    .end local v10    # "result":Ljava/lang/String;
    .restart local v6    # "productDesc":Landroid/widget/TextView;
    .restart local v7    # "productImg":Landroid/widget/ImageView;
    .restart local v8    # "productName":Landroid/widget/TextView;
    :cond_3
    const-string v11, "Try apps to earn free"

    invoke-virtual {v6, v11}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 90
    iget-object v11, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v11}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    const-string v12, "icon_getjar"

    const-string v13, "drawable"

    iget-object v14, p0, Lcom/miniclip/GetJar/PurchaseMethodAdapter;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v11, v12, v13, v14}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v3

    goto :goto_2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 100
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 102
    :try_start_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/Product;

    .line 103
    .local v1, "product":Lcom/getjar/sdk/Product;
    invoke-virtual {v1}, Lcom/getjar/sdk/Product;->getProductDescription()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Getjar Gold"

    if-ne v2, v3, :cond_2

    .line 105
    const-string v2, "getjar"

    const-string v3, "showOfferWall"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    invoke-static {v1}, Lcom/miniclip/GetJar/GetJar;->showOfferWall(Lcom/getjar/sdk/Product;)V

    .line 114
    :cond_0
    :goto_0
    invoke-static {}, Lcom/miniclip/GetJar/GetJar;->dismissPickDialog()V

    .line 120
    .end local v1    # "product":Lcom/getjar/sdk/Product;
    :cond_1
    :goto_1
    return-void

    .line 108
    .restart local v1    # "product":Lcom/getjar/sdk/Product;
    :cond_2
    invoke-virtual {v1}, Lcom/getjar/sdk/Product;->getProductDescription()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Google Play Store"

    if-ne v2, v3, :cond_0

    .line 110
    const-string v2, "getjar"

    const-string v3, "gplay"

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    const/4 v2, 0x0

    invoke-static {v2}, Lcom/miniclip/GetJar/GetJar;->getJarResponce(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 116
    .end local v1    # "product":Lcom/getjar/sdk/Product;
    :catch_0
    move-exception v0

    .line 117
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
