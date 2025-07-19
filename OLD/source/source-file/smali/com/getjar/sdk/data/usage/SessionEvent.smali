.class public abstract Lcom/getjar/sdk/data/usage/SessionEvent;
.super Lcom/getjar/sdk/data/DatabaseRecordBase;
.source "SessionEvent.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/usage/SessionEvent$Reason;,
        Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    }
.end annotation


# instance fields
.field private final _disposable:Z

.field private final _id:J

.field private final _reason:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

.field private final _reasonDetails:Ljava/lang/String;

.field private final _sessionId:Ljava/lang/String;

.field private final _synced:Z

.field private final _timestamp:J

.field private final _type:Lcom/getjar/sdk/data/usage/SessionEvent$Type;


# direct methods
.method public constructor <init>(JJLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 3
    .param p1, "id"    # J
    .param p3, "timestamp"    # J
    .param p5, "type"    # Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .param p6, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p7, "reasonDetails"    # Ljava/lang/String;
    .param p8, "sessionId"    # Ljava/lang/String;
    .param p9, "synced"    # Z
    .param p10, "disposable"    # Z

    .prologue
    const-wide/16 v1, 0x0

    .line 38
    invoke-direct {p0}, Lcom/getjar/sdk/data/DatabaseRecordBase;-><init>()V

    .line 41
    cmp-long v0, p1, v1

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'id\' cannot be less than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 42
    :cond_0
    cmp-long v0, p3, v1

    if-gez v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'timestamp\' cannot be less than zero"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 43
    :cond_1
    if-nez p5, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'type\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_2
    if-nez p6, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'reason\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_3
    invoke-static {p8}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'sessionId\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 46
    :cond_4
    invoke-static {p8}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 48
    iput-wide p1, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_id:J

    .line 49
    iput-wide p3, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_timestamp:J

    .line 50
    iput-object p5, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_type:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    .line 51
    iput-object p6, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_reason:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 52
    iput-object p7, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_reasonDetails:Ljava/lang/String;

    .line 53
    iput-object p8, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_sessionId:Ljava/lang/String;

    .line 54
    iput-boolean p9, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_synced:Z

    .line 55
    iput-boolean p10, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_disposable:Z

    .line 56
    return-void
.end method


# virtual methods
.method public getId()J
    .locals 2

    .prologue
    .line 59
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_id:J

    return-wide v0
.end method

.method public getReason()Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_reason:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    return-object v0
.end method

.method public getReasonDetails()Ljava/lang/String;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_reasonDetails:Ljava/lang/String;

    return-object v0
.end method

.method public getSessionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_sessionId:Ljava/lang/String;

    return-object v0
.end method

.method public getTimestamp()J
    .locals 2

    .prologue
    .line 61
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_timestamp:J

    return-wide v0
.end method

.method public getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_type:Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    return-object v0
.end method

.method public isDisposable()Z
    .locals 1

    .prologue
    .line 67
    iget-boolean v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_disposable:Z

    return v0
.end method

.method public isSynced()Z
    .locals 1

    .prologue
    .line 66
    iget-boolean v0, p0, Lcom/getjar/sdk/data/usage/SessionEvent;->_synced:Z

    return v0
.end method
