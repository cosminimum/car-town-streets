.class public Lcom/getjar/sdk/data/earning/EarnStateRecord;
.super Ljava/lang/Object;
.source "EarnStateRecord.java"


# instance fields
.field private final _applicationMetadata:Ljava/lang/String;

.field private final _clientTransactionId:Ljava/lang/String;

.field private final _earnAmount:Ljava/lang/Long;

.field private final _earnState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

.field private final _earnSubstate:Ljava/lang/String;

.field private final _friendlyName:Ljava/lang/String;

.field private final _id:J

.field private final _notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

.field private final _packageName:Ljava/lang/String;

.field private final _status:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

.field private final _timestampCreated:J

.field private final _timestampModified:J

.field private final _trackingMetadata:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/database/Cursor;)V
    .locals 4
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const/4 v2, 0x0

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_id:J

    .line 35
    const/4 v2, 0x1

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_clientTransactionId:Ljava/lang/String;

    .line 36
    const/4 v2, 0x2

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_packageName:Ljava/lang/String;

    .line 37
    const/4 v2, 0x3

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_timestampCreated:J

    .line 38
    const/4 v2, 0x4

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_timestampModified:J

    .line 39
    const/4 v2, 0x5

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_friendlyName:Ljava/lang/String;

    .line 40
    const/4 v2, 0x6

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_applicationMetadata:Ljava/lang/String;

    .line 41
    const/4 v2, 0x7

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_trackingMetadata:Ljava/lang/String;

    .line 42
    const/16 v2, 0x8

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_status:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    .line 43
    const/16 v2, 0x9

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 44
    .local v0, "earnStateStr":Ljava/lang/String;
    const/16 v2, 0xa

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnSubstate:Ljava/lang/String;

    .line 45
    const/16 v2, 0xb

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnAmount:Ljava/lang/Long;

    .line 46
    const/16 v2, 0xc

    invoke-interface {p1, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    .line 49
    .local v1, "notificationStateStr":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 50
    const/4 v2, 0x0

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    .line 55
    :goto_0
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 56
    sget-object v2, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->NONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    .line 60
    :goto_1
    return-void

    .line 52
    :cond_0
    invoke-static {v0}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    goto :goto_0

    .line 58
    :cond_1
    invoke-static {v1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    move-result-object v2

    iput-object v2, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    goto :goto_1
.end method


# virtual methods
.method public canShowInstallReminder()Z
    .locals 2

    .prologue
    .line 78
    sget-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->NONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public canShowOpenReminder()Z
    .locals 2

    .prologue
    .line 83
    sget-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->NONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->INSTALL_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual {v0, v1}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    :cond_0
    const/4 v0, 0x1

    .line 88
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getApplicationMetadata()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_applicationMetadata:Ljava/lang/String;

    return-object v0
.end method

.method public getClientTransactionId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_clientTransactionId:Ljava/lang/String;

    return-object v0
.end method

.method public getEarnAmount()Ljava/lang/Long;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnAmount:Ljava/lang/Long;

    return-object v0
.end method

.method public getEarnState()Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    return-object v0
.end method

.method public getEarnSubstate()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnSubstate:Ljava/lang/String;

    return-object v0
.end method

.method public getFriendlyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_friendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public getId()J
    .locals 2

    .prologue
    .line 62
    iget-wide v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_id:J

    return-wide v0
.end method

.method public getNotificationState()Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    return-object v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getStatus()Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;
    .locals 1

    .prologue
    .line 70
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_status:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    return-object v0
.end method

.method public getTimestampCreated()J
    .locals 2

    .prologue
    .line 65
    iget-wide v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_timestampCreated:J

    return-wide v0
.end method

.method public getTimestampModified()J
    .locals 2

    .prologue
    .line 66
    iget-wide v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_timestampModified:J

    return-wide v0
.end method

.method public getTrackingMetadata()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_trackingMetadata:Ljava/lang/String;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "EarnStateRecord ["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .local v0, "sb":Ljava/lang/StringBuilder;
    const-string v1, "id:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_id:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 95
    const-string v1, " clientTransactionId:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_clientTransactionId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, " packageName:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    const-string v1, " timestampCreated:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_timestampCreated:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 98
    const-string v1, " timestampModified:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_timestampModified:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 99
    const-string v1, " friendlyName:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_friendlyName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    const-string v1, " applicationMetadata:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_applicationMetadata:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    const-string v1, " trackingMetadata:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_trackingMetadata:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    const-string v1, " status:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_status:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    const-string v1, " earnState:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 104
    const-string v1, " earnSubstate:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnSubstate:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    const-string v1, " earnAmount:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_earnAmount:Ljava/lang/Long;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 106
    const-string v1, " notificationState:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/getjar/sdk/data/earning/EarnStateRecord;->_notificationState:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 107
    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
