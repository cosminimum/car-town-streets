.class public Lcom/getjar/sdk/data/usage/AggregateUsageRecord;
.super Ljava/lang/Object;
.source "AggregateUsageRecord.java"


# instance fields
.field private final _packageName:Ljava/lang/String;

.field private _timestampStart:J

.field private _timestampStop:J

.field private _totalSessionsCount:I

.field private _totalUseDuration:I


# direct methods
.method protected constructor <init>(Ljava/lang/String;JJII)V
    .locals 0
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "timestampStart"    # J
    .param p4, "timestampStop"    # J
    .param p6, "totalUseDuration"    # I
    .param p7, "totalSessionsCount"    # I

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_packageName:Ljava/lang/String;

    .line 16
    iput-wide p2, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStart:J

    .line 17
    iput-wide p4, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStop:J

    .line 18
    iput p6, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalUseDuration:I

    .line 19
    iput p7, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalSessionsCount:I

    .line 20
    return-void
.end method


# virtual methods
.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestampStart()J
    .locals 2

    .prologue
    .line 23
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStart:J

    return-wide v0
.end method

.method public getTimestampStop()J
    .locals 2

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStop:J

    return-wide v0
.end method

.method public getTotalSessionsCount()I
    .locals 1

    .prologue
    .line 38
    iget v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalSessionsCount:I

    return v0
.end method

.method public getTotalUseDuration()I
    .locals 1

    .prologue
    .line 33
    iget v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalUseDuration:I

    return v0
.end method

.method protected setTimestampStart(J)V
    .locals 2
    .param p1, "timestampStart"    # J

    .prologue
    .line 25
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'timestampStart\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 26
    :cond_0
    iput-wide p1, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStart:J

    .line 27
    return-void
.end method

.method protected setTimestampStop(J)V
    .locals 2
    .param p1, "timestampStop"    # J

    .prologue
    .line 30
    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'timestampStop\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 31
    :cond_0
    iput-wide p1, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStop:J

    .line 32
    return-void
.end method

.method protected setTotalSessionsCount(I)V
    .locals 2
    .param p1, "totalSessionsCount"    # I

    .prologue
    .line 40
    if-gez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'totalSessionsCount\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    iput p1, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalSessionsCount:I

    .line 42
    return-void
.end method

.method protected setTotalUseDuration(I)V
    .locals 2
    .param p1, "totalUseDuration"    # I

    .prologue
    .line 35
    if-gez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'totalUseDuration\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 36
    :cond_0
    iput p1, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalUseDuration:I

    .line 37
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 46
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "[packageName:%1$s sessions:%2$d duration:%3$d start:%4$d stop:%5$d]"

    const/4 v2, 0x5

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    iget-object v4, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_packageName:Ljava/lang/String;

    aput-object v4, v2, v3

    const/4 v3, 0x1

    iget v4, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalSessionsCount:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    iget v4, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_totalUseDuration:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    iget-wide v4, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStart:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    iget-wide v4, p0, Lcom/getjar/sdk/data/usage/AggregateUsageRecord;->_timestampStop:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
