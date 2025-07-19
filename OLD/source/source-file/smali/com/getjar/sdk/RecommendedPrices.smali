.class public Lcom/getjar/sdk/RecommendedPrices;
.super Ljava/lang/Object;
.source "RecommendedPrices.java"


# instance fields
.field private final prices:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/getjar/sdk/Pricing;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p1, "thePrices":Ljava/util/Map;, "Ljava/util/Map<Lcom/getjar/sdk/Pricing;Ljava/lang/Integer;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'thePrices\' cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_1
    iput-object p1, p0, Lcom/getjar/sdk/RecommendedPrices;->prices:Ljava/util/Map;

    .line 23
    return-void
.end method


# virtual methods
.method public count()I
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/RecommendedPrices;->prices:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public getRecommendedPrice(Lcom/getjar/sdk/Pricing;)Ljava/lang/Integer;
    .locals 2
    .param p1, "theLookup"    # Lcom/getjar/sdk/Pricing;

    .prologue
    .line 35
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theLookup cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/RecommendedPrices;->prices:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    return-object v0
.end method
