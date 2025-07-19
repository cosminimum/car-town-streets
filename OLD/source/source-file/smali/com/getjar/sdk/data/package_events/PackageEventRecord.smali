.class public Lcom/getjar/sdk/data/package_events/PackageEventRecord;
.super Lcom/getjar/sdk/data/DatabaseRecordBase;
.source "PackageEventRecord.java"


# instance fields
.field private final _eventType:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

.field private final _id:J

.field private final _packageName:Ljava/lang/String;

.field private final _synced:Z

.field private final _timestamp:J


# direct methods
.method private constructor <init>(JLjava/lang/String;JLcom/getjar/sdk/data/package_events/PackageEventManager$EventType;Z)V
    .locals 3
    .param p1, "id"    # J
    .param p3, "packageName"    # Ljava/lang/String;
    .param p4, "timestamp"    # J
    .param p6, "eventType"    # Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;
    .param p7, "synced"    # Z

    .prologue
    const-wide/16 v1, 0x0

    .line 35
    invoke-direct {p0}, Lcom/getjar/sdk/data/DatabaseRecordBase;-><init>()V

    .line 38
    cmp-long v0, p1, v1

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'id\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 39
    :cond_0
    invoke-static {p3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 40
    :cond_1
    cmp-long v0, p4, v1

    if-gez v0, :cond_2

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'timestamp\' cannot be negative"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 41
    :cond_2
    if-nez p6, :cond_3

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'eventType\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_3
    iput-wide p1, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_id:J

    .line 45
    iput-object p3, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_packageName:Ljava/lang/String;

    .line 46
    iput-wide p4, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_timestamp:J

    .line 47
    iput-object p6, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_eventType:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    .line 48
    iput-boolean p7, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_synced:Z

    .line 49
    return-void
.end method

.method protected static loadFromDB(Landroid/database/Cursor;)Lcom/getjar/sdk/data/package_events/PackageEventRecord;
    .locals 13
    .param p0, "cursor"    # Landroid/database/Cursor;

    .prologue
    const/4 v7, 0x1

    const/4 v8, 0x0

    .line 24
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;

    invoke-interface {p0, v8}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v1

    invoke-interface {p0, v7}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x2

    invoke-interface {p0, v4}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v4

    const/4 v6, 0x3

    invoke-interface {p0, v6}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    move-result-object v6

    const/4 v9, 0x4

    invoke-interface {p0, v9}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v9

    const-wide/16 v11, 0x1

    cmp-long v9, v9, v11

    if-nez v9, :cond_0

    :goto_0
    invoke-direct/range {v0 .. v7}, Lcom/getjar/sdk/data/package_events/PackageEventRecord;-><init>(JLjava/lang/String;JLcom/getjar/sdk/data/package_events/PackageEventManager$EventType;Z)V

    return-object v0

    :cond_0
    move v7, v8

    goto :goto_0
.end method


# virtual methods
.method protected getEventType()Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_eventType:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    return-object v0
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 52
    iget-wide v0, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_id:J

    return-wide v0
.end method

.method protected getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 54
    iget-object v0, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_packageName:Ljava/lang/String;

    return-object v0
.end method

.method protected getTimestamp()J
    .locals 2

    .prologue
    .line 55
    iget-wide v0, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_timestamp:J

    return-wide v0
.end method

.method protected isSynced()Z
    .locals 1

    .prologue
    .line 57
    iget-boolean v0, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_synced:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PackageEventRecord ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_id:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 63
    const-string v1, " packageName:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    const-string v1, " timestamp:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_timestamp:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 65
    const-string v1, " eventType:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_eventType:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    invoke-virtual {v1}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->name()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    const-string v1, " synced:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lcom/getjar/sdk/data/package_events/PackageEventRecord;->_synced:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 67
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
