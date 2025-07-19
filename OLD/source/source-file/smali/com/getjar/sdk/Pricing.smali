.class public Lcom/getjar/sdk/Pricing;
.super Ljava/lang/Object;
.source "Pricing.java"


# instance fields
.field private final basePrice:I

.field private maxDiscount:Ljava/lang/Float;

.field private maxMarkup:Ljava/lang/Float;


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "theBasePrice"    # I

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    if-gez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theBasePrice should be greater than or equal to 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    iput p1, p0, Lcom/getjar/sdk/Pricing;->basePrice:I

    .line 43
    return-void
.end method

.method public constructor <init>(ILjava/lang/Float;Ljava/lang/Float;)V
    .locals 3
    .param p1, "theBasePrice"    # I
    .param p2, "theMaxDiscountPercent"    # Ljava/lang/Float;
    .param p3, "theMaxMarkupPercent"    # Ljava/lang/Float;

    .prologue
    const/4 v2, 0x0

    .line 24
    invoke-direct {p0, p1}, Lcom/getjar/sdk/Pricing;-><init>(I)V

    .line 26
    if-eqz p2, :cond_1

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    cmpg-float v0, v0, v2

    if-ltz v0, :cond_0

    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_1

    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theMaxDiscountPercent should be between 0 and 1"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 27
    :cond_1
    if-eqz p3, :cond_3

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v0

    cmpg-float v0, v0, v2

    if-ltz v0, :cond_2

    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    cmpl-float v0, v0, v1

    if-lez v0, :cond_3

    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "theMaxMarkupPercent should be between 0 and 2"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 29
    :cond_3
    iput-object p2, p0, Lcom/getjar/sdk/Pricing;->maxDiscount:Ljava/lang/Float;

    .line 30
    iput-object p3, p0, Lcom/getjar/sdk/Pricing;->maxMarkup:Ljava/lang/Float;

    .line 31
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 68
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-class v3, Lcom/getjar/sdk/Pricing;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 70
    check-cast v0, Lcom/getjar/sdk/Pricing;

    .line 71
    .local v0, "obj":Lcom/getjar/sdk/Pricing;
    invoke-virtual {v0}, Lcom/getjar/sdk/Pricing;->hashCode()I

    move-result v2

    invoke-virtual {p0}, Lcom/getjar/sdk/Pricing;->hashCode()I

    move-result v3

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    .line 73
    .end local v0    # "obj":Lcom/getjar/sdk/Pricing;
    :cond_0
    return v1
.end method

.method public getBasePrice()I
    .locals 1

    .prologue
    .line 49
    iget v0, p0, Lcom/getjar/sdk/Pricing;->basePrice:I

    return v0
.end method

.method public getMaxDiscountPercent()Ljava/lang/Float;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/getjar/sdk/Pricing;->maxDiscount:Ljava/lang/Float;

    return-object v0
.end method

.method public getMaxMarkupPercent()Ljava/lang/Float;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/getjar/sdk/Pricing;->maxMarkup:Ljava/lang/Float;

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 78
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .local v0, "builder":Ljava/lang/StringBuilder;
    iget v1, p0, Lcom/getjar/sdk/Pricing;->basePrice:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 80
    iget-object v1, p0, Lcom/getjar/sdk/Pricing;->maxDiscount:Ljava/lang/Float;

    if-eqz v1, :cond_0

    .line 82
    iget-object v1, p0, Lcom/getjar/sdk/Pricing;->maxDiscount:Ljava/lang/Float;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    :cond_0
    iget-object v1, p0, Lcom/getjar/sdk/Pricing;->maxMarkup:Ljava/lang/Float;

    if-eqz v1, :cond_1

    .line 86
    iget-object v1, p0, Lcom/getjar/sdk/Pricing;->maxMarkup:Ljava/lang/Float;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    return v1
.end method
