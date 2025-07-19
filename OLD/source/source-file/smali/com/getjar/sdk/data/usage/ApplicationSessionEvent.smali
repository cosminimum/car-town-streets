.class public Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
.super Lcom/getjar/sdk/data/usage/SessionEvent;
.source "ApplicationSessionEvent.java"


# instance fields
.field private final _packageName:Ljava/lang/String;

.field private final _phoneSessionId:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLjava/lang/String;JLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 12
    .param p1, "id"    # J
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "timestamp"    # J
    .param p6, "type"    # Lcom/getjar/sdk/data/usage/SessionEvent$Type;
    .param p7, "reason"    # Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .param p8, "reasonDetails"    # Ljava/lang/String;
    .param p9, "sessionId"    # Ljava/lang/String;
    .param p10, "phoneSessionId"    # Ljava/lang/String;
    .param p11, "synced"    # Z
    .param p12, "disposable"    # Z

    .prologue
    .line 27
    move-object v1, p0

    move-wide v2, p1

    move-wide/from16 v4, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p7

    move-object/from16 v8, p8

    move-object/from16 v9, p9

    move/from16 v10, p11

    move/from16 v11, p12

    invoke-direct/range {v1 .. v11}, Lcom/getjar/sdk/data/usage/SessionEvent;-><init>(JJLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;ZZ)V

    .line 30
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 31
    :cond_0
    invoke-static/range {p10 .. p10}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'phoneSessionId\' cannot be NULL or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 32
    :cond_1
    invoke-static/range {p10 .. p10}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    .line 34
    iput-object p3, p0, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->_packageName:Ljava/lang/String;

    .line 35
    move-object/from16 v0, p10

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->_phoneSessionId:Ljava/lang/String;

    .line 36
    return-void
.end method

.method protected static loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;
    .locals 17
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 46
    if-nez p0, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'cursor\' cannot be NULL"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 49
    :cond_0
    new-instance v1, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;

    const/4 v2, 0x0

    move-object/from16 v0, p0

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    const/4 v4, 0x1

    move-object/from16 v0, p0

    invoke-interface {v0, v4}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x2

    move-object/from16 v0, p0

    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v5

    const/4 v7, 0x3

    move-object/from16 v0, p0

    invoke-interface {v0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v7

    const/4 v8, 0x4

    move-object/from16 v0, p0

    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    move-result-object v8

    const/4 v9, 0x5

    move-object/from16 v0, p0

    invoke-interface {v0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x6

    move-object/from16 v0, p0

    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v10

    const/4 v11, 0x7

    move-object/from16 v0, p0

    invoke-interface {v0, v11}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    const/16 v12, 0x8

    move-object/from16 v0, p0

    invoke-interface {v0, v12}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v12

    const-wide/16 v14, 0x1

    cmp-long v12, v12, v14

    if-nez v12, :cond_1

    const/4 v12, 0x1

    :goto_0
    const/16 v13, 0x9

    move-object/from16 v0, p0

    invoke-interface {v0, v13}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v13

    const-wide/16 v15, 0x1

    cmp-long v13, v13, v15

    if-nez v13, :cond_2

    const/4 v13, 0x1

    :goto_1
    invoke-direct/range {v1 .. v13}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;-><init>(JLjava/lang/String;JLcom/getjar/sdk/data/usage/SessionEvent$Type;Lcom/getjar/sdk/data/usage/SessionEvent$Reason;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZZ)V

    return-object v1

    :cond_1
    const/4 v12, 0x0

    goto :goto_0

    :cond_2
    const/4 v13, 0x0

    goto :goto_1
.end method


# virtual methods
.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->_packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getPhoneSessionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->_phoneSessionId:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 67
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "id:%1$d packageName:%2$s timestamp:%3$d type:%4$s reason:%5$s reasonDetails:%6$s sessionId:%7$s phoneSessionId:%8$s synced:%9$s disposable:%10$s"

    const/16 v2, 0xa

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPackageName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getTimestamp()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x3

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getType()Lcom/getjar/sdk/data/usage/SessionEvent$Type;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/data/usage/SessionEvent$Type;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x4

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getReason()Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    move-result-object v4

    invoke-virtual {v4}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->name()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x5

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getReasonDetails()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x6

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getSessionId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x7

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->getPhoneSessionId()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const/16 v3, 0x8

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->isSynced()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/16 v3, 0x9

    invoke-virtual {p0}, Lcom/getjar/sdk/data/usage/ApplicationSessionEvent;->isDisposable()Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
