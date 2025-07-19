.class public Lcom/getjar/sdk/data/LicenseInternal;
.super Lcom/getjar/sdk/License;
.source "LicenseInternal.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;,
        Lcom/getjar/sdk/data/LicenseInternal$LicenseType;,
        Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x2957c8ca37dfd1daL


# instance fields
.field private internalLicenseState:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

.field private isLicenseStale:Z

.field private licenseId:Ljava/lang/String;

.field private licenseState:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

.field private licenseType:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

.field private platform:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/getjar/sdk/License;-><init>()V

    .line 20
    sget-object v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseType:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->isLicenseStale:Z

    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/lang/String;Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;Lcom/getjar/sdk/data/LicenseInternal$LicenseType;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V
    .locals 6
    .param p1, "licenseId"    # Ljava/lang/String;
    .param p2, "platform"    # Ljava/lang/String;
    .param p3, "licenseScope"    # Lcom/getjar/sdk/License$LicenseScope;
    .param p4, "itemId"    # Ljava/lang/String;
    .param p5, "licenseState"    # Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;
    .param p6, "licenseType"    # Lcom/getjar/sdk/data/LicenseInternal$LicenseType;
    .param p7, "creationTime"    # Ljava/util/Date;
    .param p8, "modificationTime"    # Ljava/util/Date;
    .param p9, "lastChecked"    # Ljava/util/Date;

    .prologue
    .line 45
    move-object v0, p0

    move-object v1, p4

    move-object v2, p3

    move-object v3, p7

    move-object v4, p8

    move-object v5, p9

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/License;-><init>(Ljava/lang/String;Lcom/getjar/sdk/License$LicenseScope;Ljava/util/Date;Ljava/util/Date;Ljava/util/Date;)V

    .line 20
    sget-object v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseType:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    .line 23
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->isLicenseStale:Z

    .line 47
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseId cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_0
    invoke-static {p2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "platform cannot be empty or null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_1
    if-nez p5, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseState cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_2
    if-nez p6, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "licenseType cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_3
    iput-object p1, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseId:Ljava/lang/String;

    .line 53
    iput-object p2, p0, Lcom/getjar/sdk/data/LicenseInternal;->platform:Ljava/lang/String;

    .line 54
    iput-object p5, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseState:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    .line 55
    iput-object p6, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseType:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    .line 56
    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .locals 3
    .param p1, "in"    # Ljava/io/ObjectInputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .prologue
    .line 160
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseId:Ljava/lang/String;

    .line 161
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->itemId:Ljava/lang/String;

    .line 162
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readUTF()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->platform:Ljava/lang/String;

    .line 163
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->creationTime:Ljava/util/Date;

    .line 164
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->modificationTime:Ljava/util/Date;

    .line 165
    new-instance v0, Ljava/util/Date;

    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readLong()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/data/LicenseInternal;->setLastServerSyncTime(Ljava/util/Date;)V

    .line 166
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseState:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    .line 167
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/License$LicenseScope;

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseScope:Lcom/getjar/sdk/License$LicenseScope;

    .line 168
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseType:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    .line 169
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    iput-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->internalLicenseState:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    .line 170
    invoke-direct {p0}, Lcom/getjar/sdk/data/LicenseInternal;->validateObjectState()V

    .line 171
    return-void
.end method

.method private validateObjectState()V
    .locals 2

    .prologue
    .line 178
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseId:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "licenseId cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 179
    :cond_0
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getItemId()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "itemId cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 180
    :cond_1
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->platform:Ljava/lang/String;

    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "platform cannot be null or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 181
    :cond_2
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getCreationTime()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_3

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "creationTime cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 182
    :cond_3
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getModificationTime()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_4

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "modificationTime cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 183
    :cond_4
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getLastCheckedTime()Ljava/util/Date;

    move-result-object v0

    if-nez v0, :cond_5

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "lastCheckedTime cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 184
    :cond_5
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseState:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    if-nez v0, :cond_6

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "licenseState cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 185
    :cond_6
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v0

    if-nez v0, :cond_7

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "licenseScope cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 186
    :cond_7
    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .locals 2
    .param p1, "out"    # Ljava/io/ObjectOutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 142
    invoke-direct {p0}, Lcom/getjar/sdk/data/LicenseInternal;->validateObjectState()V

    .line 144
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 145
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getItemId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 146
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->platform:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeUTF(Ljava/lang/String;)V

    .line 147
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getCreationTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 148
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getModificationTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 149
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getLastCheckedTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/io/ObjectOutputStream;->writeLong(J)V

    .line 150
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseState:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 151
    invoke-virtual {p0}, Lcom/getjar/sdk/data/LicenseInternal;->getLicenseScope()Lcom/getjar/sdk/License$LicenseScope;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 152
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseType:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 153
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->internalLicenseState:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 154
    return-void
.end method


# virtual methods
.method public getInternalLicenseState()Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->internalLicenseState:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    return-object v0
.end method

.method public getLicenseId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 104
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseId:Ljava/lang/String;

    return-object v0
.end method

.method public getLicenseState()Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->licenseState:Lcom/getjar/sdk/data/LicenseInternal$ExternalLicenseState;

    return-object v0
.end method

.method public isStale()Z
    .locals 1

    .prologue
    .line 88
    iget-boolean v0, p0, Lcom/getjar/sdk/data/LicenseInternal;->isLicenseStale:Z

    return v0
.end method

.method public setInternalLicenseState(Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;)V
    .locals 2
    .param p1, "internalLicenseState"    # Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    .prologue
    .line 125
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'internalLicenseState\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 127
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/data/LicenseInternal;->internalLicenseState:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    .line 128
    return-void
.end method

.method public setLastServerSyncTimeInternal()V
    .locals 1

    .prologue
    .line 137
    new-instance v0, Ljava/util/Date;

    invoke-direct {v0}, Ljava/util/Date;-><init>()V

    invoke-virtual {p0, v0}, Lcom/getjar/sdk/data/LicenseInternal;->setLastServerSyncTime(Ljava/util/Date;)V

    .line 138
    return-void
.end method

.method public setLicenseStale(Z)V
    .locals 0
    .param p1, "isLicenseState"    # Z

    .prologue
    .line 95
    iput-boolean p1, p0, Lcom/getjar/sdk/data/LicenseInternal;->isLicenseStale:Z

    .line 96
    return-void
.end method
