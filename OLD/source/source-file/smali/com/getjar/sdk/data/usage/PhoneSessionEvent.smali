.class public Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
.super Lcom/getjar/sdk/data/usage/SessionEvent;
.source "PhoneSessionEvent.java"


# direct methods
.method public constructor <init>(JJLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 0
    .param p1, "id"    # J
    .param p3, "timestamp"    # J
    .param p5, "type"    # Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .param p6, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p7, "reasonDetails"    # Ljava/lang/String;
    .param p8, "sessionId"    # Ljava/lang/String;
    .param p9, "synced"    # Z
    .param p10, "disposable"    # Z

    .prologue
    .line 9
    invoke-direct/range {p0 .. p10}, Lcom/getjar/sdk/data/usage/SessionEvent;-><init>(JJLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 10
    return-void
.end method

.method protected static loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/PhoneSessionEvent;
    .locals 14
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 17
    if-nez p0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'cursor\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 20
    :cond_0
    new-instance v0, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;

    const/4 v1, 0x0

    invoke-interface {p0, v1}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    const/4 v3, 0x1

    invoke-interface {p0, v3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v3

    const/4 v5, 0x2

    invoke-interface {p0, v5}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v5

    const/4 v6, 0x3

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    move-result-object v6

    const/4 v7, 0x4

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x5

    invoke-interface {p0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x6

    invoke-interface {p0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const-wide/16 v11, 0x1

    cmp-long v9, v9, v11

    if-nez v9, :cond_1

    const/4 v9, 0x1

    :goto_0
    const/4 v10, 0x7

    invoke-interface {p0, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v10

    const-wide/16 v12, 0x1

    cmp-long v10, v10, v12

    if-nez v10, :cond_2

    const/4 v10, 0x1

    :goto_1
    invoke-direct/range {v0 .. v10}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;-><init>(JJLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-object v0

    :cond_1
    const/4 v9, 0x0

    goto :goto_0

    :cond_2
    const/4 v10, 0x0

    goto :goto_1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 36
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "id:%1$d timestamp:%2$d type:%3$s reason:%4$s reasonDetails:%5$s sessionId:%6$s synced:%7$s disposable:%8$s"

    const/16 v2, 0x8

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getTimestamp()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getReason()Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getReasonDetails()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x6

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->isSynced()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x7

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/PhoneSessionEvent;->isDisposable()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
