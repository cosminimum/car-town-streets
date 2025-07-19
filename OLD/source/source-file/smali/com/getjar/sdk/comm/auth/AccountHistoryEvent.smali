.class public Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;
.super Ljava/lang/Object;
.source "AccountHistoryEvent.java"


# instance fields
.field private final _eventType:Lcom/getjar/sdk/comm/auth/AccountEventType;

.field private final _id:I

.field private final _timestamp:I

.field private final _userAccessId:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "dbCursor"    # Landroid/database/Cursor;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'dbCursor\' can not be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 19
    :cond_0
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_id:I

    .line 20
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_userAccessId:Ljava/lang/String;

    .line 21
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/getjar/sdk/comm/auth/AccountEventType;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_eventType:Lcom/getjar/sdk/comm/auth/AccountEventType;

    .line 22
    const/4 v0, 0x3

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    iput v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_timestamp:I

    .line 23
    return-void
.end method


# virtual methods
.method public getEventType()Lcom/getjar/sdk/comm/auth/AccountEventType;
    .locals 1

    .prologue
    .line 27
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_eventType:Lcom/getjar/sdk/comm/auth/AccountEventType;

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 25
    iget v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_id:I

    return v0
.end method

.method public getTimestamp()I
    .locals 1

    .prologue
    .line 28
    iget v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_timestamp:I

    return v0
.end method

.method public getUserAccessId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/getjar/sdk/comm/auth/AccountHistoryEvent;->_userAccessId:Ljava/lang/String;

    return-object v0
.end method
