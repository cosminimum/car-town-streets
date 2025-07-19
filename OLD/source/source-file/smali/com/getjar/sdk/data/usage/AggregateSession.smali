.class public Lcom/getjar/sdk/data/usage/AggregateSession;
.super Ljava/lang/Object;
.source "AggregateSession.java"


# instance fields
.field private final _id:J

.field private final _packageName:Ljava/lang/String;

.field private final _timestampLastStart:J

.field private final _timestampLastStop:J

.field private final _timestampStart:J

.field private final _timestampStop:J

.field private final _totalSessionsCount:I

.field private final _totalUseDuration:I

.field private final _windowId:J


# direct methods
.method protected constructor <init>(JJLjava/lang/String;JJIIJJ)V
    .locals 4
    .param p1, "id"    # J
    .param p3, "windowId"    # J
    .param p5, "packageName"    # Ljava/lang/String;
    .param p6, "timestampStart"    # J
    .param p8, "timestampStop"    # J
    .param p10, "totalUseDuration"    # I
    .param p11, "totalSessionsCount"    # I
    .param p12, "timestampLastStart"    # J
    .param p14, "timestampLastStop"    # J

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-wide/16 v2, 0x0

    cmp-long v2, p1, v2

    if-gez v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'id\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 35
    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v2, p3, v2

    if-gez v2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'windowId\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 36
    :cond_1
    invoke-static {p5}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 37
    :cond_2
    const-wide/16 v2, 0x0

    cmp-long v2, p6, v2

    if-gez v2, :cond_3

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'timestampStart\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 38
    :cond_3
    const-wide/16 v2, 0x0

    cmp-long v2, p8, v2

    if-gez v2, :cond_4

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'timestampStop\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 39
    :cond_4
    if-gez p10, :cond_5

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'totalUseDuration\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 40
    :cond_5
    if-gez p11, :cond_6

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'totalSessionsCount\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 41
    :cond_6
    const-wide/16 v2, 0x0

    cmp-long v2, p12, v2

    if-gez v2, :cond_7

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'timestampLastStart\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 42
    :cond_7
    const-wide/16 v2, 0x0

    cmp-long v2, p14, v2

    if-gez v2, :cond_8

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'timestampLastStop\' cannot be negative"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 45
    :cond_8
    iput-wide p1, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_id:J

    .line 46
    iput-wide p3, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_windowId:J

    .line 47
    iput-object p5, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_packageName:Ljava/lang/String;

    .line 48
    iput-wide p6, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampStart:J

    .line 49
    iput-wide p8, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampStop:J

    .line 50
    iput p10, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_totalUseDuration:I

    .line 51
    iput p11, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_totalSessionsCount:I

    .line 52
    move-wide/from16 v0, p12

    iput-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampLastStart:J

    .line 53
    move-wide/from16 v0, p14

    iput-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampLastStop:J

    .line 54
    return-void
.end method

.method protected constructor <init>(Landroid/database/Cursor;)V
    .locals 17
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 61
    const/4 v1, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const/4 v1, 0x1

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const/4 v1, 0x2

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v1, 0x3

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    const/4 v1, 0x4

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const/4 v1, 0x5

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v11

    const/4 v1, 0x6

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    const/4 v1, 0x7

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    const/16 v1, 0x8

    move-object/from16 v0, p1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v15

    move-object/from16 v1, p0

    invoke-direct/range {v1 .. v16}, Lcom/getjar/sdk/data/usage/AggregateSession;-><init>(JJLjava/lang/String;JJIIJJ)V

    .line 72
    return-void
.end method


# virtual methods
.method public getId()J
    .locals 2

    .prologue
    .line 77
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_id:J

    return-wide v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestampLastStart()J
    .locals 2

    .prologue
    .line 84
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampLastStart:J

    return-wide v0
.end method

.method public getTimestampLastStop()J
    .locals 2

    .prologue
    .line 85
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampLastStop:J

    return-wide v0
.end method

.method public getTimestampStart()J
    .locals 2

    .prologue
    .line 80
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampStart:J

    return-wide v0
.end method

.method public getTimestampStop()J
    .locals 2

    .prologue
    .line 81
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_timestampStop:J

    return-wide v0
.end method

.method public getTotalSessionsCount()I
    .locals 1

    .prologue
    .line 83
    iget v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_totalSessionsCount:I

    return v0
.end method

.method public getTotalUseDuration()I
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_totalUseDuration:I

    return v0
.end method

.method public getWindowId()J
    .locals 2

    .prologue
    .line 78
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateSession;->_windowId:J

    return-wide v0
.end method
