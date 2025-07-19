.class public final Lcom/getjar/sdk/GetJarPage;
.super Ljava/lang/Object;
.source "GetJarPage.java"


# instance fields
.field private _lang:Ljava/lang/String;

.field private final mGjContext:Lcom/getjar/sdk/GetJarContext;

.field private mProducts:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Product;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/GetJarContext;)V
    .locals 4
    .param p1, "getJarContext"    # Lcom/getjar/sdk/GetJarContext;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 45
    const-string v0, "en-us"

    iput-object v0, p0, Lcom/getjar/sdk/GetJarPage;->_lang:Ljava/lang/String;

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 55
    sget-object v0, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "GetJarPage"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 56
    if-nez p1, :cond_0

    .line 57
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Must have a valid context."

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/GetJarPage;->mGjContext:Lcom/getjar/sdk/GetJarContext;

    .line 60
    return-void
.end method


# virtual methods
.method public getProducts()Ljava/util/Collection;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Product;",
            ">;"
        }
    .end annotation

    .prologue
    .line 227
    sget-object v0, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v0}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v0

    sget-object v2, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    sget-object v2, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    or-long/2addr v0, v2

    const-string v2, "GetJarPage.getProducts()"

    invoke-static {v0, v1, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 228
    iget-object v0, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    return-object v0
.end method

.method public setConsumableProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 7
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J

    .prologue
    .line 168
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarPage.setProduct()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 171
    new-instance v0, Lcom/getjar/sdk/ConsumableProduct;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 172
    .local v0, "newProduct":Lcom/getjar/sdk/Product;
    new-instance v6, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v6, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 173
    .local v6, "newProducts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 174
    invoke-static {v6}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 175
    return-void
.end method

.method public setConsumableProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V
    .locals 8
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I

    .prologue
    .line 194
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarPage.setProduct()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 197
    new-instance v0, Lcom/getjar/sdk/ConsumableProduct;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/ConsumableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JI)V

    .line 198
    .local v0, "newProduct":Lcom/getjar/sdk/Product;
    new-instance v7, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 199
    .local v7, "newProducts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 200
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 201
    return-void
.end method

.method public setGoogleInAppBillingKey(Ljava/lang/String;)V
    .locals 5
    .param p1, "publicKey"    # Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .prologue
    .line 213
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'publicKey\' cannot be null or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 215
    :cond_0
    iget-object v2, p0, Lcom/getjar/sdk/GetJarPage;->mGjContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "GetJarClientPrefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 216
    .local v1, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 217
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "BILLING_PUBLIC_KEY"

    invoke-interface {v0, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 218
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 219
    return-void
.end method

.method public setLicensableProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILcom/getjar/sdk/License$LicenseScope;)V
    .locals 9
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "imageResourceId"    # I
    .param p7, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 143
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarPage.setProduct()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 146
    new-instance v0, Lcom/getjar/sdk/LicensableProduct;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move v6, p6

    move-object/from16 v7, p7

    invoke-direct/range {v0 .. v7}, Lcom/getjar/sdk/LicensableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JILcom/getjar/sdk/License$LicenseScope;)V

    .line 147
    .local v0, "newProduct":Lcom/getjar/sdk/Product;
    new-instance v8, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v8, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 148
    .local v8, "newProducts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    invoke-virtual {v8, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 149
    invoke-static {v8}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 150
    return-void
.end method

.method public setLicensableProduct(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/getjar/sdk/License$LicenseScope;)V
    .locals 8
    .param p1, "theProductId"    # Ljava/lang/String;
    .param p2, "theProductName"    # Ljava/lang/String;
    .param p3, "theProductDescription"    # Ljava/lang/String;
    .param p4, "theAmount"    # J
    .param p6, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    .line 113
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarPage.setProduct()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 116
    new-instance v0, Lcom/getjar/sdk/LicensableProduct;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-wide v4, p4

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/getjar/sdk/LicensableProduct;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLcom/getjar/sdk/License$LicenseScope;)V

    .line 117
    .local v0, "newProduct":Lcom/getjar/sdk/Product;
    new-instance v7, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v7, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 118
    .local v7, "newProducts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    invoke-virtual {v7, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 119
    invoke-static {v7}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 120
    return-void
.end method

.method public setProduct(Lcom/getjar/sdk/Product;)V
    .locals 5
    .param p1, "product"    # Lcom/getjar/sdk/Product;

    .prologue
    .line 84
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarPage.setProduct()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 85
    if-nez p1, :cond_0

    .line 86
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'product\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 88
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 89
    .local v0, "newProducts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 90
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 91
    return-void
.end method

.method public setProducts(Ljava/util/Collection;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/getjar/sdk/Product;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 68
    .local p1, "products":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/getjar/sdk/Product;>;"
    sget-object v1, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    sget-object v3, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    const-string v3, "GetJarPage.setProducts()"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 69
    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    if-nez v1, :cond_1

    .line 70
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "need a list of products to offer"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 72
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 73
    .local v0, "newProducts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/Product;>;"
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v1

    iput-object v1, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    .line 75
    return-void
.end method

.method public showPage()V
    .locals 14

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x1

    .line 238
    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "showPage() -- deviceObject Id:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/getjar/sdk/GetJarPage;->mGjContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/utilities/Utility;->getDeviceObjectId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 241
    iget-object v4, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->size()I

    move-result v4

    if-gtz v4, :cond_1

    .line 242
    :cond_0
    new-instance v4, Ljava/lang/IllegalStateException;

    const-string v5, "Product list not set"

    invoke-direct {v4, v5}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 246
    :cond_1
    iget-object v4, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/getjar/sdk/Product;

    .line 247
    .local v3, "product":Lcom/getjar/sdk/Product;
    const-string v2, ""

    .line 248
    .local v2, "licenseScope":Ljava/lang/String;
    instance-of v4, v3, Lcom/getjar/sdk/LicensableProduct;

    if-eqz v4, :cond_2

    .line 249
    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, " LicenseScope:%1$s"

    new-array v7, v12, [Ljava/lang/Object;

    move-object v4, v3

    check-cast v4, Lcom/getjar/sdk/LicensableProduct;

    invoke-virtual {v4}, Lcom/getjar/sdk/LicensableProduct;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v7, v13

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 251
    :cond_2
    sget-object v4, Lcom/getjar/sdk/logging/Area;->PURCHASE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Lcom/getjar/sdk/logging/Area;->UI:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Lcom/getjar/sdk/logging/Area;->DEVELOPER_API:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    or-long/2addr v4, v6

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "GetJarPage: showPage() PRODUCT [ProductName:\'%1$s\' ProductDescription:\'%2$s\' ProductId:\'%3$s\' ProductAmount:%4$d ProductImageResourceId:%5$d%6$s]"

    const/4 v8, 0x6

    new-array v8, v8, [Ljava/lang/Object;

    iget-object v9, v3, Lcom/getjar/sdk/Product;->mProductName:Ljava/lang/String;

    aput-object v9, v8, v13

    iget-object v9, v3, Lcom/getjar/sdk/Product;->mProductDescription:Ljava/lang/String;

    aput-object v9, v8, v12

    const/4 v9, 0x2

    iget-object v10, v3, Lcom/getjar/sdk/Product;->mProductId:Ljava/lang/String;

    aput-object v10, v8, v9

    const/4 v9, 0x3

    iget-wide v10, v3, Lcom/getjar/sdk/Product;->mProductAmount:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x4

    iget-object v10, v3, Lcom/getjar/sdk/Product;->mProductImageResourceId:Ljava/lang/Integer;

    aput-object v10, v8, v9

    const/4 v9, 0x5

    aput-object v2, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 262
    .end local v2    # "licenseScope":Ljava/lang/String;
    .end local v3    # "product":Lcom/getjar/sdk/Product;
    :cond_3
    new-instance v1, Landroid/content/Intent;

    iget-object v4, p0, Lcom/getjar/sdk/GetJarPage;->mGjContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    const-class v5, Lcom/getjar/sdk/rewards/GetJarActivity;

    invoke-direct {v1, v4, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 263
    .local v1, "intent":Landroid/content/Intent;
    const/high16 v4, 0x10000000

    invoke-virtual {v1, v4}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 264
    const-string v4, "productList"

    new-instance v5, Ljava/util/ArrayList;

    iget-object v6, p0, Lcom/getjar/sdk/GetJarPage;->mProducts:Ljava/util/Collection;

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putParcelableArrayListExtra(Ljava/lang/String;Ljava/util/ArrayList;)Landroid/content/Intent;

    .line 265
    const-string v4, "getjarContextId"

    iget-object v5, p0, Lcom/getjar/sdk/GetJarPage;->mGjContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v5}, Lcom/getjar/sdk/GetJarContext;->getGetJarContextId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 266
    const-string v4, "lang"

    iget-object v5, p0, Lcom/getjar/sdk/GetJarPage;->_lang:Ljava/lang/String;

    const-string v6, "_"

    const-string v7, "-"

    invoke-virtual {v5, v6, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 267
    const-string v4, "com.getjar.sdk.rewards.GetJarWebViewSubActivity"

    invoke-virtual {v1, v4, v12}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 268
    iget-object v4, p0, Lcom/getjar/sdk/GetJarPage;->mGjContext:Lcom/getjar/sdk/GetJarContext;

    invoke-virtual {v4}, Lcom/getjar/sdk/GetJarContext;->getAndroidContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 269
    return-void
.end method
