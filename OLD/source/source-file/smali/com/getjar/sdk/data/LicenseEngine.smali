.class public Lcom/getjar/sdk/data/LicenseEngine;
.super Ljava/lang/Object;
.source "LicenseEngine.java"


# static fields
.field public static final PREFS_LICENSE_CHECK_TIMESTAMP:Ljava/lang/String; = "licenseCheckTimestamp"

.field private static volatile retrieveLock:Ljava/lang/Object;


# instance fields
.field private _commContext:Lcom/getjar/sdk/comm/CommContext;

.field private _licenseCachingManager:Lcom/getjar/sdk/comm/LicenseCachingManager;

.field private claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 55
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/getjar/sdk/data/LicenseEngine;->retrieveLock:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/getjar/sdk/comm/CommContext;)V
    .locals 2
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;

    .prologue
    .line 64
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseEngine;->_licenseCachingManager:Lcom/getjar/sdk/comm/LicenseCachingManager;

    .line 65
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'commContext\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    .line 67
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v0

    iget-object v1, p0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/comm/auth/AuthManager;->getClaimsManager(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/ClaimsManager;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    .line 68
    return-void
.end method

.method private acquireUnsyncedLicenses(Ljava/util/List;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/LicenseInternal;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 584
    .local p1, "licenses":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/LicenseInternal;>;"
    const/4 v0, 0x0

    .line 586
    .local v0, "existsUnsyncedLicense":Z
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/LicenseInternal;

    .line 588
    .local v2, "license":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-virtual {v2}, Lcom/getjar/sdk/data/LicenseInternal;->getInternalLicenseState()Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    move-result-object v3

    sget-object v4, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 590
    invoke-virtual {v2}, Lcom/getjar/sdk/data/LicenseInternal;->getItemId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v4

    invoke-virtual {p0, v3, v4}, Lcom/getjar/sdk/data/LicenseEngine;->acquireUnmanagedProductLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    .line 591
    const/4 v0, 0x1

    goto :goto_0

    .line 595
    .end local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :cond_1
    return v0
.end method

.method private getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;
    .locals 2

    .prologue
    .line 71
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseEngine;->_licenseCachingManager:Lcom/getjar/sdk/comm/LicenseCachingManager;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Lcom/getjar/sdk/comm/LicenseCachingManager;

    iget-object v1, p0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-direct {v0, v1}, Lcom/getjar/sdk/comm/LicenseCachingManager;-><init>(Lcom/getjar/sdk/comm/CommContext;)V

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseEngine;->_licenseCachingManager:Lcom/getjar/sdk/comm/LicenseCachingManager;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseEngine;->_licenseCachingManager:Lcom/getjar/sdk/comm/LicenseCachingManager;

    return-object v0
.end method

.method private static getLicenseFromJson(Lorg/json/JSONObject;)Lcom/getjar/sdk/data/LicenseInternal;
    .locals 15
    .param p0, "licenseJson"    # Lorg/json/JSONObject;

    .prologue
    .line 627
    if-nez p0, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'licenseJson\' cannot be null"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 629
    :cond_0
    new-instance v11, Ljava/text/SimpleDateFormat;

    const-string v7, "yyyy-MM-dd\'T\'HH:mm:ss.SSS\'Z\'"

    sget-object v8, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-direct {v11, v7, v8}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 630
    .local v11, "dateFormatter":Ljava/text/SimpleDateFormat;
    const/4 v0, 0x0

    .line 633
    .local v0, "license":Lcom/getjar/sdk/data/LicenseInternal;
    const/4 v1, 0x0

    .line 634
    .local v1, "licenseId":Ljava/lang/String;
    :try_start_0
    const-string v7, "id"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 635
    const-string v7, "id"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 640
    :goto_0
    const-string v7, "platform"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 641
    .local v2, "platform":Ljava/lang/String;
    const-string v7, "scope"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/License$LicenseScope;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v3

    .line 642
    .local v3, "licenseScope":Lcom/getjar/sdk/License$LicenseScope;
    const-string v7, "state"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    move-result-object v5

    .line 643
    .local v5, "licenseState":Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;
    const-string v7, "item_id"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 644
    .local v4, "itemId":Ljava/lang/String;
    const-string v7, "creation_timestamp"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 645
    .local v10, "creationTime":Ljava/lang/String;
    const-string v7, "modification_timestamp"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    .line 646
    .local v14, "modificationTime":Ljava/lang/String;
    const-string v7, "type"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    move-result-object v6

    .line 648
    .local v6, "licenseType":Lcom/getjar/sdk/data/LicenseInternal$LicenseType;
    new-instance v0, Lcom/getjar/sdk/data/LicenseInternal;

    .end local v0    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-virtual {v11, v10}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/utilities/Utility;->adjustUTCDate(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v7

    invoke-virtual {v11, v14}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/utilities/Utility;->adjustUTCDate(Ljava/util/Date;)Ljava/util/Date;

    move-result-object v8

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    invoke-direct/range {v0 .. v9}, Lcom/getjar/sdk/data/LicenseInternal;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;Lcom/getjar/sdk/data/LicenseInternal$LicenseType;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V

    .line 664
    .restart local v0    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    return-object v0

    .line 637
    .end local v2    # "platform":Ljava/lang/String;
    .end local v3    # "licenseScope":Lcom/getjar/sdk/License$LicenseScope;
    .end local v4    # "itemId":Ljava/lang/String;
    .end local v5    # "licenseState":Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;
    .end local v6    # "licenseType":Lcom/getjar/sdk/data/LicenseInternal$LicenseType;
    .end local v10    # "creationTime":Ljava/lang/String;
    .end local v14    # "modificationTime":Ljava/lang/String;
    :cond_1
    const-string v7, "token"

    invoke-virtual {p0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    goto :goto_0

    .line 659
    .end local v0    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :catch_0
    move-exception v13

    .line 660
    .local v13, "ex":Lorg/json/JSONException;
    new-instance v7, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v7, v13}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 661
    .end local v13    # "ex":Lorg/json/JSONException;
    :catch_1
    move-exception v12

    .line 662
    .local v12, "e":Ljava/text/ParseException;
    new-instance v7, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v7, v12}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/Throwable;)V

    throw v7
.end method

.method private getUnmanagedProductLicensesFromJson(Lorg/json/JSONObject;)Ljava/util/ArrayList;
    .locals 6
    .param p1, "licenseJson"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/json/JSONObject;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/data/LicenseInternal;",
            ">;"
        }
    .end annotation

    .prologue
    .line 603
    if-nez p1, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "licenseJson cannot be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 605
    :cond_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 607
    .local v3, "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :try_start_0
    const-string v4, "return"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "licenses"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 609
    .local v2, "licenseArray":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 611
    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object p1

    .line 613
    invoke-static {p1}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseFromJson(Lorg/json/JSONObject;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 609
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 615
    .end local v1    # "i":I
    .end local v2    # "licenseArray":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 617
    .local v0, "e":Lorg/json/JSONException;
    new-instance v4, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v4, v0}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 619
    .end local v0    # "e":Lorg/json/JSONException;
    .restart local v1    # "i":I
    .restart local v2    # "licenseArray":Lorg/json/JSONArray;
    :cond_1
    return-object v3
.end method

.method private getUnmanagedProductLicensesInternal([Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 13
    .param p1, "itemIds"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/data/LicenseInternal;",
            ">;"
        }
    .end annotation

    .prologue
    .line 170
    if-eqz p1, :cond_0

    array-length v10, p1

    if-gtz v10, :cond_1

    :cond_0
    new-instance v10, Ljava/lang/IllegalArgumentException;

    const-string v11, "itemIds cannot be null or empty"

    invoke-direct {v10, v11}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v10

    .line 172
    :cond_1
    sget-object v10, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v10}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v10

    const-string v12, "LicenseEngine -- getUnmanagedProductLicensesInternal started"

    invoke-static {v10, v11, v12}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 174
    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 177
    .local v8, "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    move v3, v2

    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v5    # "len$":I
    .local v3, "i$":I
    :goto_0
    if-ge v3, v5, :cond_4

    aget-object v4, v0, v3

    .line 179
    .local v4, "itemId":Ljava/lang/String;
    invoke-static {}, Lcom/getjar/sdk/License$LicenseScope;->values()[Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v1

    .local v1, "arr$":[Lcom/getjar/sdk/License$LicenseScope;
    array-length v6, v1

    .local v6, "len$":I
    const/4 v2, 0x0

    .end local v3    # "i$":I
    .restart local v2    # "i$":I
    :goto_1
    if-ge v2, v6, :cond_3

    aget-object v9, v1, v2

    .line 181
    .local v9, "scope":Lcom/getjar/sdk/License$LicenseScope;
    invoke-direct {p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v10

    invoke-virtual {v10, v4, v9}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getValidCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v7

    .line 182
    .local v7, "license":Lcom/getjar/sdk/data/LicenseInternal;
    if-eqz v7, :cond_2

    .line 184
    invoke-virtual {v8, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 179
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 177
    .end local v7    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v9    # "scope":Lcom/getjar/sdk/License$LicenseScope;
    :cond_3
    add-int/lit8 v2, v3, 0x1

    move v3, v2

    .end local v2    # "i$":I
    .restart local v3    # "i$":I
    goto :goto_0

    .line 188
    .end local v1    # "arr$":[Lcom/getjar/sdk/License$LicenseScope;
    .end local v4    # "itemId":Ljava/lang/String;
    .end local v6    # "len$":I
    :cond_4
    return-object v8
.end method

.method private isUnmanagedProductLicensedInternal(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 12
    .param p1, "itemId"    # Ljava/lang/String;

    .prologue
    const/4 v11, 0x1

    const/4 v10, 0x0

    .line 359
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "itemId cannot be empty or null"

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 361
    :cond_0
    sget-object v5, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "LicenseEngine -- isUnmanagedProductLicensedInternal started for %s"

    new-array v9, v11, [Ljava/lang/Object;

    aput-object p1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 363
    invoke-static {}, Lcom/getjar/sdk/License$LicenseScope;->values()[Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v0

    .local v0, "arr$":[Lcom/getjar/sdk/License$LicenseScope;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v4, v0, v1

    .line 366
    .local v4, "licenseScope":Lcom/getjar/sdk/License$LicenseScope;
    invoke-direct {p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v5

    invoke-virtual {v5, p1, v4}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v3

    .line 367
    .local v3, "license":Lcom/getjar/sdk/data/LicenseInternal;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseState()Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    move-result-object v5

    sget-object v6, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->ACQUIRED:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 369
    invoke-static {v11}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    .line 372
    .end local v3    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v4    # "licenseScope":Lcom/getjar/sdk/License$LicenseScope;
    :goto_1
    return-object v5

    .line 363
    .restart local v3    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .restart local v4    # "licenseScope":Lcom/getjar/sdk/License$LicenseScope;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 372
    .end local v3    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v4    # "licenseScope":Lcom/getjar/sdk/License$LicenseScope;
    :cond_2
    invoke-static {v10}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v5

    goto :goto_1
.end method


# virtual methods
.method public acquireUnmanagedProductLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;
    .locals 11
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;

    .prologue
    const/4 v4, 0x0

    .line 83
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "itemId cannot be null or empty"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 84
    :cond_0
    if-nez p2, :cond_1

    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "licenseScope cannot be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 86
    :cond_1
    sget-object v5, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v8, "LicenseEngine -- acquireUnmanagedProductLicense started for %s"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    invoke-static {v7, v8, v9}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 88
    iget-object v5, p0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canModifyUnmanagedLicenses()Z

    move-result v5

    if-eqz v5, :cond_4

    .line 91
    invoke-direct {p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v5

    invoke-virtual {v5, p1, p2}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v1

    .line 93
    .local v1, "license":Lcom/getjar/sdk/data/LicenseInternal;
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseState()Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    move-result-object v5

    sget-object v6, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->ACQUIRED:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-virtual {v1}, Lcom/getjar/sdk/data/LicenseInternal;->isStale()Z

    move-result v5

    if-nez v5, :cond_2

    invoke-virtual {v1}, Lcom/getjar/sdk/data/LicenseInternal;->getInternalLicenseState()Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    move-result-object v5

    sget-object v6, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v5, v6}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 130
    .end local v1    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :goto_0
    return-object v1

    .line 100
    .restart local v1    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    :cond_2
    if-nez v1, :cond_3

    .line 102
    sget-object v5, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {p0, p1, p2, v5, v4}, Lcom/getjar/sdk/data/LicenseEngine;->updateLicenseState(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v1

    .line 105
    :cond_3
    invoke-static {}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->getInstance()Lcom/getjar/sdk/comm/LicenseServiceProxy;

    move-result-object v4

    iget-object v5, p0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    invoke-virtual {v4, v5, p1, p2, v6}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->acquireUnmanagedProductLicense(Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/HashMap;)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    .line 108
    .local v2, "operation":Lcom/getjar/sdk/comm/Operation;
    const/4 v3, 0x0

    .line 110
    .local v3, "result":Lcom/getjar/sdk/comm/Result;
    :try_start_0
    invoke-virtual {v2}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;

    move-result-object v3

    .line 111
    sget-object v4, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {p0, p1, p2, v4, v3}, Lcom/getjar/sdk/data/LicenseEngine;->updateLicenseState(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    goto :goto_0

    .line 113
    :catch_0
    move-exception v0

    .line 116
    .local v0, "e":Ljava/util/concurrent/ExecutionException;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "LicenseEngine acquireUnmanagedProductLicense -- Error"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 118
    .end local v0    # "e":Ljava/util/concurrent/ExecutionException;
    :catch_1
    move-exception v0

    .line 121
    .local v0, "e":Ljava/lang/InterruptedException;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "LicenseEngine acquireUnmanagedProductLicense -- Error"

    invoke-static {v4, v5, v6, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 129
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .end local v1    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v2    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v3    # "result":Lcom/getjar/sdk/comm/Result;
    :cond_4
    sget-object v5, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "LicenseEngine acquireUnmanagedProductLicense Not having required claims!!"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    move-object v1, v4

    .line 130
    goto :goto_0
.end method

.method public getUnmanagedProductLicenses([Ljava/lang/String;)Ljava/util/ArrayList;
    .locals 4
    .param p1, "itemIds"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/getjar/sdk/data/LicenseInternal;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 142
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "LicenseEngine -- getUnmanagedProductLicenses started"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 144
    iget-object v1, p0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canUseUnmanagedLicenses()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 147
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LicenseEngine;->getUnmanagedProductLicensesInternal([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 148
    .local v0, "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 150
    const/4 v1, 0x1

    invoke-virtual {p0, v1}, Lcom/getjar/sdk/data/LicenseEngine;->retrieveServerProductLicenses(Z)V

    .line 151
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LicenseEngine;->getUnmanagedProductLicensesInternal([Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    .line 159
    .end local v0    # "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :cond_0
    :goto_0
    return-object v0

    .line 158
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "LicenseEngine getUnmanagedProductLicenses Not having required claims!!"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 159
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isUnmanagedProductLicensed(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 8
    .param p1, "itemId"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 327
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "itemId cannot be empty or null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 329
    :cond_0
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v4, "LicenseEngine -- isUnmanagedProductLicensed started for %s"

    new-array v5, v7, [Ljava/lang/Object;

    aput-object p1, v5, v6

    invoke-static {v3, v4, v5}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 331
    iget-object v1, p0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canUseUnmanagedLicenses()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 333
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LicenseEngine;->isUnmanagedProductLicensedInternal(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 334
    .local v0, "isLicensed":Ljava/lang/Boolean;
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_1

    .line 336
    invoke-virtual {p0, v7}, Lcom/getjar/sdk/data/LicenseEngine;->retrieveServerProductLicenses(Z)V

    .line 344
    invoke-direct {p0, p1}, Lcom/getjar/sdk/data/LicenseEngine;->isUnmanagedProductLicensedInternal(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v0

    .line 349
    .end local v0    # "isLicensed":Ljava/lang/Boolean;
    :goto_0
    return-object v0

    .line 340
    .restart local v0    # "isLicensed":Ljava/lang/Boolean;
    :cond_1
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "License found for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto :goto_0

    .line 348
    .end local v0    # "isLicensed":Ljava/lang/Boolean;
    :cond_2
    sget-object v1, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    const-string v3, "LicenseEngine isUnmanagedProductLicensed Not having required claims!!"

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 349
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method public retrieveServerProductLicenses(Z)V
    .locals 37
    .param p1, "forced"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 388
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine -- retrieveServerProductLicenses started"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 390
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canUseUnmanagedLicenses()Z

    move-result v2

    if-eqz v2, :cond_11

    .line 392
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v2

    if-nez v2, :cond_0

    .line 394
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine: Unable to use licensing features as appEncryptionPublicKey not provided through GetJarContext"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 574
    :goto_0
    return-void

    .line 397
    :cond_0
    sget-object v36, Lcom/getjar/sdk/data/LicenseEngine;->retrieveLock:Ljava/lang/Object;

    monitor-enter v36

    .line 399
    :try_start_0
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    const-string v3, "GetJarClientPrefs"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v29

    .line 400
    .local v29, "prefs":Landroid/content/SharedPreferences;
    const-string v2, "licenseCheckTimestamp"

    const-wide/16 v3, 0x0

    move-object/from16 v0, v29

    invoke-interface {v0, v2, v3, v4}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v33

    .line 401
    .local v33, "timeStamp":J
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long v9, v2, v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 406
    .local v9, "currentTimeInSeconds":J
    :try_start_1
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v2

    const-string v3, "license.refresh.interval"

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-wide v23

    .line 416
    .local v23, "licenseRefreshInterval":J
    :goto_1
    :try_start_2
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v2

    const-string v3, "license.ignore.request.interval"

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-wide v20

    .line 424
    .local v20, "licenseIgnoreRefreshInterval":J
    :goto_2
    :try_start_3
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/LicenseCachingManager;->hasExpiredEntry()Z

    move-result v2

    if-nez v2, :cond_1

    sub-long v2, v9, v33

    cmp-long v2, v2, v23

    if-gtz v2, :cond_1

    if-eqz p1, :cond_10

    sub-long v2, v9, v33

    cmp-long v2, v2, v20

    if-lez v2, :cond_10

    .line 427
    :cond_1
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getAllLicenses()Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;

    move-result-object v25

    .line 428
    .local v25, "licenseWithETag":Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
    new-instance v26, Ljava/util/ArrayList;

    invoke-direct/range {v26 .. v26}, Ljava/util/ArrayList;-><init>()V

    .line 430
    .local v26, "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    const/4 v6, 0x0

    .line 431
    .local v6, "continuationToken":Ljava/lang/String;
    const/16 v35, 0x0

    .line 432
    .local v35, "ttl":Ljava/lang/Long;
    const/4 v14, 0x0

    .line 433
    .local v14, "eTag":Ljava/lang/String;
    const/16 v32, 0x0

    .line 435
    .local v32, "signature":Ljava/lang/String;
    move-object/from16 v0, v25

    iget-object v2, v0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->licenses:Ljava/util/List;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/getjar/sdk/data/LicenseEngine;->acquireUnsyncedLicenses(Ljava/util/List;)Z

    .line 438
    :cond_2
    invoke-static {}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->getInstance()Lcom/getjar/sdk/comm/LicenseServiceProxy;

    move-result-object v2

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/16 v7, 0x32

    move-object/from16 v0, v25

    iget-object v8, v0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->eTag:Ljava/lang/String;

    invoke-virtual/range {v2 .. v8}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->getUnmanagedProductLicenses(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;Ljava/lang/String;ILjava/lang/String;)Lcom/getjar/sdk/comm/Operation;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v28

    .line 440
    .local v28, "operation":Lcom/getjar/sdk/comm/Operation;
    const/4 v6, 0x0

    .line 442
    :try_start_4
    invoke-virtual/range {v28 .. v28}, Lcom/getjar/sdk/comm/Operation;->get()Lcom/getjar/sdk/comm/Result;
    :try_end_4
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_4 .. :try_end_4} :catch_3
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-result-object v31

    .line 447
    .local v31, "result":Lcom/getjar/sdk/comm/Result;
    if-nez v35, :cond_3

    .line 449
    :try_start_5
    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/Long;

    move-result-object v35

    .line 452
    :cond_3
    invoke-static {v14}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 454
    invoke-static/range {v28 .. v28}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromResult(Lcom/getjar/sdk/comm/Operation;)Ljava/lang/String;

    move-result-object v14

    .line 457
    :cond_4
    if-eqz v31, :cond_b

    .line 459
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/Result;->isSuccessfulResponse()Z

    move-result v2

    if-eqz v2, :cond_9

    .line 461
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v2

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/getjar/sdk/data/LicenseEngine;->getUnmanagedProductLicensesFromJson(Lorg/json/JSONObject;)Ljava/util/ArrayList;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    move-result-object v18

    .line 464
    .local v18, "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :try_start_6
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "return"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "ct"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result-object v6

    .line 475
    :goto_3
    if-nez v32, :cond_6

    .line 477
    :try_start_7
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "return"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "signature"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v32

    .line 479
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "return"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "nonce"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v27

    .line 481
    .local v27, "nonce":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    move-object/from16 v0, v27

    invoke-virtual {v2, v0}, Lcom/getjar/sdk/comm/CommContext;->removeSignature(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v30

    .line 483
    .local v30, "requestSignature":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 484
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v27

    move-object/from16 v1, v30

    invoke-static {v2, v0, v1}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignDataForGet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 489
    .local v11, "data":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v2, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v2

    move-object/from16 v0, v32

    invoke-static {v2, v11, v0}, Lcom/getjar/sdk/utilities/Security;->verifySignature(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    .line 491
    new-instance v2, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v3, "Failed to validate the signature. Licensing failed"

    invoke-direct {v2, v3}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 498
    .end local v11    # "data":Ljava/lang/String;
    .end local v27    # "nonce":Ljava/lang/String;
    .end local v30    # "requestSignature":Ljava/lang/String;
    :catch_0
    move-exception v12

    .line 500
    .local v12, "e":Lorg/json/JSONException;
    const/16 v32, 0x0

    .line 501
    :try_start_8
    new-instance v2, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v3, "signature not found in response. Licensing failed."

    invoke-direct {v2, v3}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 567
    .end local v6    # "continuationToken":Ljava/lang/String;
    .end local v9    # "currentTimeInSeconds":J
    .end local v12    # "e":Lorg/json/JSONException;
    .end local v14    # "eTag":Ljava/lang/String;
    .end local v18    # "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    .end local v20    # "licenseIgnoreRefreshInterval":J
    .end local v23    # "licenseRefreshInterval":J
    .end local v25    # "licenseWithETag":Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
    .end local v26    # "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    .end local v28    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v29    # "prefs":Landroid/content/SharedPreferences;
    .end local v31    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v32    # "signature":Ljava/lang/String;
    .end local v33    # "timeStamp":J
    .end local v35    # "ttl":Ljava/lang/Long;
    :catchall_0
    move-exception v2

    monitor-exit v36
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    throw v2

    .line 407
    .restart local v9    # "currentTimeInSeconds":J
    .restart local v29    # "prefs":Landroid/content/SharedPreferences;
    .restart local v33    # "timeStamp":J
    :catch_1
    move-exception v16

    .line 409
    .local v16, "ex":Ljava/lang/NumberFormatException;
    :try_start_9
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine retrieveServerProductLicenses licenseRefreshInterval"

    move-object/from16 v0, v16

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 410
    const-wide/32 v23, 0x15180

    .restart local v23    # "licenseRefreshInterval":J
    goto/16 :goto_1

    .line 417
    .end local v16    # "ex":Ljava/lang/NumberFormatException;
    :catch_2
    move-exception v16

    .line 419
    .restart local v16    # "ex":Ljava/lang/NumberFormatException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine retrieveServerProductLicenses licenseRefreshInterval"

    move-object/from16 v0, v16

    invoke-static {v2, v3, v4, v0}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 420
    const-wide/16 v20, 0x12c

    .restart local v20    # "licenseIgnoreRefreshInterval":J
    goto/16 :goto_2

    .line 443
    .end local v16    # "ex":Ljava/lang/NumberFormatException;
    .restart local v6    # "continuationToken":Ljava/lang/String;
    .restart local v14    # "eTag":Ljava/lang/String;
    .restart local v25    # "licenseWithETag":Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
    .restart local v26    # "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    .restart local v28    # "operation":Lcom/getjar/sdk/comm/Operation;
    .restart local v32    # "signature":Ljava/lang/String;
    .restart local v35    # "ttl":Ljava/lang/Long;
    :catch_3
    move-exception v13

    .line 444
    .local v13, "e1":Ljava/util/concurrent/ExecutionException;
    new-instance v2, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v2, v13}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 466
    .end local v13    # "e1":Ljava/util/concurrent/ExecutionException;
    .restart local v18    # "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    .restart local v31    # "result":Lcom/getjar/sdk/comm/Result;
    :catch_4
    move-exception v12

    .line 469
    .restart local v12    # "e":Lorg/json/JSONException;
    const/4 v6, 0x0

    .line 471
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine retrieveServerProductLicenses -- ct not found"

    invoke-static {v2, v3, v4, v12}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto/16 :goto_3

    .line 494
    .end local v12    # "e":Lorg/json/JSONException;
    .restart local v11    # "data":Ljava/lang/String;
    .restart local v27    # "nonce":Ljava/lang/String;
    .restart local v30    # "requestSignature":Ljava/lang/String;
    :cond_5
    :try_start_a
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine retrieve signature verified"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 504
    .end local v11    # "data":Ljava/lang/String;
    .end local v27    # "nonce":Ljava/lang/String;
    .end local v30    # "requestSignature":Ljava/lang/String;
    :cond_6
    :try_start_b
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_8

    .line 506
    move-object/from16 v26, v18

    .line 527
    .end local v18    # "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :goto_4
    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    const-string v2, "null"

    invoke-virtual {v6, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 532
    :cond_7
    if-eqz v26, :cond_e

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_e

    .line 534
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "LicenseEngine Adding Licenses to cache: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 536
    new-instance v22, Ljava/util/HashSet;

    invoke-direct/range {v22 .. v22}, Ljava/util/HashSet;-><init>()V

    .line 538
    .local v22, "licenseKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual/range {v26 .. v26}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    .local v17, "i$":Ljava/util/Iterator;
    :goto_5
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_c

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/getjar/sdk/data/LicenseInternal;

    .line 540
    .local v19, "license":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseId()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 541
    sget-object v2, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    move-object/from16 v0, v19

    invoke-virtual {v0, v2}, Lcom/getjar/sdk/data/LicenseInternal;->setInternalLicenseState(Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;)V

    .line 542
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v2

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    invoke-virtual {v2, v0, v1, v14}, Lcom/getjar/sdk/comm/LicenseCachingManager;->addLicenseToCache(Lcom/getjar/sdk/data/LicenseInternal;Ljava/lang/Long;Ljava/lang/String;)V

    goto :goto_5

    .line 510
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v22    # "licenseKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .restart local v18    # "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :cond_8
    move-object/from16 v0, v26

    move-object/from16 v1, v18

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    goto :goto_4

    .line 513
    .end local v18    # "internalLicenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    :cond_9
    invoke-virtual/range {v31 .. v31}, Lcom/getjar/sdk/comm/Result;->getResponseCode()I

    move-result v2

    const/16 v3, 0x130

    if-ne v2, v3, :cond_a

    .line 515
    move-object/from16 v0, v25

    iget-object v0, v0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->licenses:Ljava/util/List;

    move-object/from16 v26, v0

    .end local v26    # "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    check-cast v26, Ljava/util/ArrayList;

    .restart local v26    # "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    goto :goto_4

    .line 519
    :cond_a
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "Licensing Error. Please check your application token and encryption key are correct and are intended to work together."

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto/16 :goto_4

    .line 524
    :cond_b
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine -- retrieveServerProductLicenses NULL result received"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_4

    .line 546
    .restart local v17    # "i$":Ljava/util/Iterator;
    .restart local v22    # "licenseKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_c
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getAllLicenses()Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;

    move-result-object v25

    .line 548
    move-object/from16 v0, v25

    iget-object v2, v0, Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;->licenses:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_d
    :goto_6
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_f

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lcom/getjar/sdk/data/LicenseInternal;

    .line 551
    .restart local v19    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseId()Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v22

    invoke-virtual {v0, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_d

    invoke-virtual/range {v19 .. v19}, Lcom/getjar/sdk/data/LicenseInternal;->getInternalLicenseState()Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    move-result-object v2

    sget-object v3, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v2, v3}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_d

    .line 554
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v2

    move-object/from16 v0, v19

    invoke-virtual {v2, v0}, Lcom/getjar/sdk/comm/LicenseCachingManager;->removeCachedLicense(Lcom/getjar/sdk/data/LicenseInternal;)V

    goto :goto_6

    .line 560
    .end local v17    # "i$":Ljava/util/Iterator;
    .end local v19    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v22    # "licenseKeys":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    :cond_e
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine -- retrieveServerProductLicenses no licenses to cache"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 563
    :cond_f
    invoke-interface/range {v29 .. v29}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v15

    .line 564
    .local v15, "editor":Landroid/content/SharedPreferences$Editor;
    const-string v2, "licenseCheckTimestamp"

    invoke-interface {v15, v2, v9, v10}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    .line 565
    invoke-interface {v15}, Landroid/content/SharedPreferences$Editor;->commit()Z

    .line 567
    .end local v6    # "continuationToken":Ljava/lang/String;
    .end local v14    # "eTag":Ljava/lang/String;
    .end local v15    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v25    # "licenseWithETag":Lcom/getjar/sdk/comm/LicenseCachingManager$LicensesWithETag;
    .end local v26    # "licenses":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/getjar/sdk/data/LicenseInternal;>;"
    .end local v28    # "operation":Lcom/getjar/sdk/comm/Operation;
    .end local v31    # "result":Lcom/getjar/sdk/comm/Result;
    .end local v32    # "signature":Ljava/lang/String;
    .end local v35    # "ttl":Ljava/lang/Long;
    :cond_10
    monitor-exit v36
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 573
    .end local v9    # "currentTimeInSeconds":J
    .end local v20    # "licenseIgnoreRefreshInterval":J
    .end local v23    # "licenseRefreshInterval":J
    .end local v29    # "prefs":Landroid/content/SharedPreferences;
    .end local v33    # "timeStamp":J
    :goto_7
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine -- retrieveServerProductLicenses Done!"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 571
    :cond_11
    sget-object v2, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    const-string v4, "LicenseEngine retrieveServerProductLicenses Not having required claims!!"

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    goto :goto_7
.end method

.method public updateLicenseState(Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;
    .locals 8
    .param p1, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 200
    const/4 v2, 0x0

    .line 201
    .local v2, "license":Lcom/getjar/sdk/data/LicenseInternal;
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-virtual {v5}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canModifyUnmanagedLicenses()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 204
    invoke-static {p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v1

    .line 205
    .local v1, "eTag":Ljava/lang/String;
    invoke-static {p1}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;

    move-result-object v4

    .line 209
    .local v4, "ttl":Ljava/lang/Long;
    :try_start_0
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "return"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 210
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "return"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 211
    .local v3, "returnObj":Lorg/json/JSONObject;
    const-string v5, "license"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 212
    const-string v5, "license"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseFromJson(Lorg/json/JSONObject;)Lcom/getjar/sdk/data/LicenseInternal;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 223
    .end local v3    # "returnObj":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    if-eqz v2, :cond_1

    .line 224
    sget-object v5, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v2, v5}, Lcom/getjar/sdk/data/LicenseInternal;->setInternalLicenseState(Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;)V

    .line 225
    invoke-direct {p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v5

    invoke-virtual {v5, v2, v4, v1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->addLicenseToCache(Lcom/getjar/sdk/data/LicenseInternal;Ljava/lang/Long;Ljava/lang/String;)V

    .line 228
    .end local v1    # "eTag":Ljava/lang/String;
    .end local v4    # "ttl":Ljava/lang/Long;
    :cond_1
    return-object v2

    .line 213
    .restart local v1    # "eTag":Ljava/lang/String;
    .restart local v3    # "returnObj":Lorg/json/JSONObject;
    .restart local v4    # "ttl":Ljava/lang/Long;
    :cond_2
    :try_start_1
    const-string v5, "signed_data"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, "signed_data"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "license"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 214
    const-string v5, "signed_data"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v6, "license"

    invoke-virtual {v5, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseFromJson(Lorg/json/JSONObject;)Lcom/getjar/sdk/data/LicenseInternal;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v2

    goto :goto_0

    .line 217
    .end local v3    # "returnObj":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 219
    .local v0, "e":Lorg/json/JSONException;
    sget-object v5, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    const-string v7, "LicenseEngine: updateLicenseState() Result did not contain a license"

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0
.end method

.method public updateLicenseState(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;Lcom/getjar/sdk/comm/Result;)Lcom/getjar/sdk/data/LicenseInternal;
    .locals 18
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p3, "internalLicenseState"    # Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;
    .param p4, "result"    # Lcom/getjar/sdk/comm/Result;

    .prologue
    .line 236
    invoke-static/range {p1 .. p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "itemId cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 237
    :cond_0
    if-nez p2, :cond_1

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "transaction cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 238
    :cond_1
    if-nez p3, :cond_2

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "internalLicenseState cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 239
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    if-nez v3, :cond_3

    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "Unable to use licensing. encryptionKey not provided through GetJarContext"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 241
    :cond_3
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "LicenseEngine -- updateLicenseState -- started for %s"

    const/4 v7, 0x1

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->i(JLjava/lang/String;)V

    .line 243
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/LicenseEngine;->claimsManager:Lcom/getjar/sdk/comm/auth/ClaimsManager;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/ClaimsManager;->canModifyUnmanagedLicenses()Z

    move-result v3

    if-eqz v3, :cond_7

    .line 245
    const/4 v2, 0x0

    .line 247
    .local v2, "license":Lcom/getjar/sdk/data/LicenseInternal;
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/comm/ResultCachingManager;->getETagFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/String;

    move-result-object v14

    .line 248
    .local v14, "eTag":Ljava/lang/String;
    invoke-static/range {p4 .. p4}, Lcom/getjar/sdk/comm/ResultCachingManager;->getTtlFromResult(Lcom/getjar/sdk/comm/Result;)Ljava/lang/Long;

    move-result-object v17

    .line 250
    .local v17, "ttl":Ljava/lang/Long;
    sget-object v3, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    move-object/from16 v0, p3

    invoke-virtual {v0, v3}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 252
    new-instance v2, Lcom/getjar/sdk/data/LicenseInternal;

    .end local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    const-string v3, "reserved_license_id"

    const-string v4, "android"

    sget-object v7, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;->ACQUIRED:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    sget-object v8, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    new-instance v9, Ljava/util/Date;

    invoke-direct {v9}, Ljava/util/Date;-><init>()V

    new-instance v10, Ljava/util/Date;

    invoke-direct {v10}, Ljava/util/Date;-><init>()V

    new-instance v11, Ljava/util/Date;

    invoke-direct {v11}, Ljava/util/Date;-><init>()V

    move-object/from16 v5, p2

    move-object/from16 v6, p1

    invoke-direct/range {v2 .. v11}, Lcom/getjar/sdk/data/LicenseInternal;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;Lcom/getjar/sdk/data/LicenseInternal$LicenseType;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V

    .line 263
    .restart local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/getjar/sdk/data/LicenseInternal;->setInternalLicenseState(Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;)V

    .line 307
    :goto_0
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v3

    move-object/from16 v0, v17

    invoke-virtual {v3, v2, v0, v14}, Lcom/getjar/sdk/comm/LicenseCachingManager;->addLicenseToCache(Lcom/getjar/sdk/data/LicenseInternal;Ljava/lang/Long;Ljava/lang/String;)V

    .line 314
    .end local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v14    # "eTag":Ljava/lang/String;
    .end local v17    # "ttl":Ljava/lang/Long;
    :goto_1
    return-object v2

    .line 268
    .restart local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .restart local v14    # "eTag":Ljava/lang/String;
    .restart local v17    # "ttl":Ljava/lang/Long;
    :cond_4
    if-nez p4, :cond_5

    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "result cannot be null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 270
    :cond_5
    invoke-direct/range {p0 .. p0}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseCachingManager()Lcom/getjar/sdk/comm/LicenseCachingManager;

    move-result-object v3

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v3, v0, v1}, Lcom/getjar/sdk/comm/LicenseCachingManager;->getCachedLicense(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;)Lcom/getjar/sdk/data/LicenseInternal;

    move-result-object v2

    .line 272
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p1

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual/range {p2 .. p2}, Lcom/getjar/sdk/License$LicenseScope;->name()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 276
    .local v15, "hashKey":Ljava/lang/String;
    :try_start_0
    invoke-virtual/range {p4 .. p4}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "signature"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 278
    .local v16, "signature":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 279
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v4, v15}, Lcom/getjar/sdk/comm/CommContext;->removeNonce(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v5, v15}, Lcom/getjar/sdk/comm/CommContext;->removeSignature(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-static {v3, v0, v1, v4, v5}, Lcom/getjar/sdk/comm/LicenseServiceProxy;->generateSignDataForAcquire(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    .line 286
    .local v12, "data":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/getjar/sdk/data/LicenseEngine;->_commContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v3}, Lcom/getjar/sdk/comm/CommContext;->getAppEncryptionPublicKey()Ljava/security/PublicKey;

    move-result-object v3

    move-object/from16 v0, v16

    invoke-static {v3, v12, v0}, Lcom/getjar/sdk/utilities/Security;->verifySignature(Ljava/security/PublicKey;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 288
    new-instance v3, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v4, "Failed to validate the signature. Licensing failed"

    invoke-direct {v3, v4}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    .end local v12    # "data":Ljava/lang/String;
    .end local v16    # "signature":Ljava/lang/String;
    :catch_0
    move-exception v13

    .line 293
    .local v13, "e":Lorg/json/JSONException;
    const/16 v16, 0x0

    .line 294
    .restart local v16    # "signature":Ljava/lang/String;
    :try_start_1
    new-instance v3, Lcom/getjar/sdk/exceptions/SigningException;

    const-string v4, "Invalid server response. Licensing failed."

    invoke-direct {v3, v4}, Lcom/getjar/sdk/exceptions/SigningException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 298
    .end local v13    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v13

    .line 299
    .restart local v13    # "e":Lorg/json/JSONException;
    new-instance v3, Lcom/getjar/sdk/GetJarException;

    invoke-direct {v3, v13}, Lcom/getjar/sdk/GetJarException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 297
    .end local v13    # "e":Lorg/json/JSONException;
    .restart local v12    # "data":Ljava/lang/String;
    :cond_6
    :try_start_2
    invoke-virtual/range {p4 .. p4}, Lcom/getjar/sdk/comm/Result;->getResponseJson()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "return"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "license"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/data/LicenseEngine;->getLicenseFromJson(Lorg/json/JSONObject;)Lcom/getjar/sdk/data/LicenseInternal;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    move-result-object v2

    .line 302
    move-object/from16 v0, p3

    invoke-virtual {v2, v0}, Lcom/getjar/sdk/data/LicenseInternal;->setInternalLicenseState(Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;)V

    .line 303
    invoke-virtual {v2}, Lcom/getjar/sdk/data/LicenseInternal;->setLastServerSyncTimeInternal()V

    goto/16 :goto_0

    .line 313
    .end local v2    # "license":Lcom/getjar/sdk/data/LicenseInternal;
    .end local v12    # "data":Ljava/lang/String;
    .end local v14    # "eTag":Ljava/lang/String;
    .end local v15    # "hashKey":Ljava/lang/String;
    .end local v16    # "signature":Ljava/lang/String;
    .end local v17    # "ttl":Ljava/lang/Long;
    :cond_7
    sget-object v3, Lcom/getjar/sdk/logging/Area;->LICENSING:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "LicenseEngine updateLicenseState Not having required claims!!"

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 314
    const/4 v2, 0x0

    goto/16 :goto_1
.end method
