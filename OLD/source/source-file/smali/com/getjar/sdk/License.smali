.class public Lcom/getjar/sdk/License;
.super Ljava/lang/Object;
.source "License.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/License$LicenseScope;
    }
.end annotation


# instance fields
.field protected creationTime:Ljava/util/Date;

.field protected itemId:Ljava/lang/String;

.field private lastServerSyncTime:Ljava/util/Date;

.field protected licenseScope:Lcom/getjar/sdk/License$LicenseScope;

.field protected modificationTime:Ljava/util/Date;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V
    .locals 2
    .param p1, "itemId"    # Ljava/lang/String;
    .param p2, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p3, "creationTime"    # Ljava/util/Date;
    .param p4, "modificationTime"    # Ljava/util/Date;
    .param p5, "lastCheckedTime"    # Ljava/util/Date;

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "itemId cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseScope cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 37
    :cond_1
    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "creationTime cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_2
    if-nez p4, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "modificationTime cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_3
    if-nez p5, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "lastCheckedTime cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_4
    iput-object p2, p0, Lcom/getjar/sdk/License;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 42
    iput-object p1, p0, Lcom/getjar/sdk/License;->itemId:Ljava/lang/String;

    .line 43
    iput-object p3, p0, Lcom/getjar/sdk/License;->creationTime:Ljava/util/Date;

    .line 44
    iput-object p4, p0, Lcom/getjar/sdk/License;->modificationTime:Ljava/util/Date;

    .line 45
    iput-object p5, p0, Lcom/getjar/sdk/License;->lastServerSyncTime:Ljava/util/Date;

    .line 46
    return-void
.end method


# virtual methods
.method public getCreationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/getjar/sdk/License;->creationTime:Ljava/util/Date;

    return-object v0
.end method

.method public getItemId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/getjar/sdk/License;->itemId:Ljava/lang/String;

    return-object v0
.end method

.method public getLastCheckedTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/getjar/sdk/License;->lastServerSyncTime:Ljava/util/Date;

    return-object v0
.end method

.method public getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/getjar/sdk/License;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    return-object v0
.end method

.method public getModificationTime()Ljava/util/Date;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/getjar/sdk/License;->modificationTime:Ljava/util/Date;

    return-object v0
.end method

.method protected setLastServerSyncTime(Ljava/util/Date;)V
    .locals 2
    .param p1, "lastServerSyncTime"    # Ljava/util/Date;

    .prologue
    .line 107
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'lastChecked\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 109
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/License;->lastServerSyncTime:Ljava/util/Date;

    .line 110
    return-void
.end method
