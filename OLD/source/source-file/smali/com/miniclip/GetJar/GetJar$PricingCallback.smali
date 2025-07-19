.class Lcom/miniclip/GetJar/GetJar$PricingCallback;
.super Ljava/lang/Object;
.source "GetJar.java"

# interfaces
.implements Lcom/getjar/sdk/listener/RecommendedPricesListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/miniclip/GetJar/GetJar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "PricingCallback"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 262
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/miniclip/GetJar/GetJar$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/miniclip/GetJar/GetJar$1;

    .prologue
    .line 262
    invoke-direct {p0}, Lcom/miniclip/GetJar/GetJar$PricingCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public recommendedPricesEvent(Lcom/getjar/sdk/RecommendedPrices;)V
    .locals 7
    .param p1, "recommendedPrices"    # Lcom/getjar/sdk/RecommendedPrices;

    .prologue
    .line 267
    if-nez p1, :cond_1

    .line 284
    :cond_0
    return-void

    .line 270
    :cond_1
    invoke-static {}, Lcom/miniclip/GetJar/GetJar;->access$300()Ljava/util/Hashtable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/Hashtable;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 272
    .local v2, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;>;"
    :cond_2
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 274
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 276
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 277
    .local v1, "itemID":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v3

    .line 279
    .local v3, "price":I
    new-instance v5, Lcom/getjar/sdk/Pricing;

    invoke-direct {v5, v3}, Lcom/getjar/sdk/Pricing;-><init>(I)V

    invoke-virtual {p1, v5}, Lcom/getjar/sdk/RecommendedPrices;->getRecommendedPrice(Lcom/getjar/sdk/Pricing;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 281
    .local v4, "recommendedPrice":I
    if-eq v4, v3, :cond_2

    .line 282
    invoke-static {}, Lcom/miniclip/GetJar/GetJar;->access$300()Ljava/util/Hashtable;

    move-result-object v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v5, v1, v6}, Ljava/util/Hashtable;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method
