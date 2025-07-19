.class public Lcom/getjar/sdk/logging/LogMessage;
.super Ljava/lang/Object;
.source "LogMessage.java"


# instance fields
.field private final _areas:J

.field private final _level:I

.field private final _message:Ljava/lang/String;

.field private final _throwable:Ljava/lang/Throwable;

.field private final _timestamp:J


# direct methods
.method public constructor <init>(IJLjava/lang/String;)V
    .locals 6
    .param p1, "level"    # I
    .param p2, "areas"    # J
    .param p4, "message"    # Ljava/lang/String;

    .prologue
    .line 25
    const/4 v5, 0x0

    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/getjar/sdk/logging/LogMessage;-><init>(IJLjava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    return-void
.end method

.method public constructor <init>(IJLjava/lang/String;Ljava/lang/Throwable;)V
    .locals 6
    .param p1, "level"    # I
    .param p2, "areas"    # J
    .param p4, "message"    # Ljava/lang/String;
    .param p5, "throwable"    # Ljava/lang/Throwable;

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    const/4 v0, 0x7

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/4 v0, 0x6

    if-eq p1, v0, :cond_0

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x5

    if-eq p1, v0, :cond_0

    .line 39
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v2, "Unsupported log level: %1$d"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v1, v2, v3}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_0
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-gtz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'area\' cannot be less than or equal to 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_1
    if-nez p4, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'message\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_2
    iput p1, p0, Lcom/getjar/sdk/logging/LogMessage;->_level:I

    .line 45
    iput-wide p2, p0, Lcom/getjar/sdk/logging/LogMessage;->_areas:J

    .line 46
    iput-object p4, p0, Lcom/getjar/sdk/logging/LogMessage;->_message:Ljava/lang/String;

    .line 47
    iput-object p5, p0, Lcom/getjar/sdk/logging/LogMessage;->_throwable:Ljava/lang/Throwable;

    .line 48
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_timestamp:J

    .line 49
    return-void
.end method


# virtual methods
.method public getAreas()J
    .locals 2

    .prologue
    .line 58
    iget-wide v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_areas:J

    return-wide v0
.end method

.method public getLevel()I
    .locals 1

    .prologue
    .line 55
    iget v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_level:I

    return v0
.end method

.method public getMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 61
    iget-object v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_message:Ljava/lang/String;

    return-object v0
.end method

.method public getThrowable()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_throwable:Ljava/lang/Throwable;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 67
    iget-wide v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_timestamp:J

    return-wide v0
.end method

.method public toString()Ljava/lang/String;
    .locals 8

    .prologue
    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 72
    iget-object v0, p0, Lcom/getjar/sdk/logging/LogMessage;->_throwable:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    .line 73
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s:%2$s:%3$s"

    new-array v2, v7, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v3

    invoke-static {v3}, Lcom/getjar/sdk/logging/Logger;->levelToName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/getjar/sdk/logging/Area;->toString(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p0}, Lcom/getjar/sdk/logging/LogMessage;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 79
    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s:%2$s:%3$s:%4$s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/getjar/sdk/logging/LogMessage;->getLevel()I

    move-result v3

    invoke-static {v3}, Lcom/getjar/sdk/logging/Logger;->levelToName(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    invoke-virtual {p0}, Lcom/getjar/sdk/logging/LogMessage;->getAreas()J

    move-result-wide v3

    invoke-static {v3, v4}, Lcom/getjar/sdk/logging/Area;->toString(J)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-virtual {p0}, Lcom/getjar/sdk/logging/LogMessage;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v6

    iget-object v3, p0, Lcom/getjar/sdk/logging/LogMessage;->_throwable:Ljava/lang/Throwable;

    invoke-static {v3}, Lcom/getjar/sdk/logging/Logger;->getThrowableDump(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v7

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
