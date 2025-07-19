.class public Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;
.super Ljava/lang/Object;
.source "AccountHistoryInfo.java"


# instance fields
.field private final _accountName:Ljava/lang/String;

.field private final _id:I

.field private final _providerFilter:Ljava/lang/String;

.field private final _timestampCreated:I

.field private final _timestampLastAuth:I

.field private final _userAccessId:Ljava/lang/String;

.field private final _userDeviceId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "dbCursor"    # Landroid/database/Cursor;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'dbCursor\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 22
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_id:I

    .line 23
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_userAccessId:Ljava/lang/String;

    .line 24
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_userDeviceId:Ljava/lang/String;

    .line 25
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_providerFilter:Ljava/lang/String;

    .line 26
    const/4 v0, 0x4

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_accountName:Ljava/lang/String;

    .line 27
    const/4 v0, 0x5

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_timestampLastAuth:I

    .line 28
    const/4 v0, 0x6

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_timestampCreated:I

    .line 29
    return-void
.end method


# virtual methods
.method public getAccountName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 35
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_accountName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 31
    iget v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_id:I

    return v0
.end method

.method public getProviderFilter()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_providerFilter:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestampCreated()I
    .locals 1

    .prologue
    .line 37
    iget v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_timestampCreated:I

    return v0
.end method

.method public getTimestampLastAuth()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_timestampLastAuth:I

    return v0
.end method

.method public getUserAccessId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_userAccessId:Ljava/lang/String;

    return-object v0
.end method

.method public getUserDeviceId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 33
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryInfo;->_userDeviceId:Ljava/lang/String;

    return-object v0
.end method
