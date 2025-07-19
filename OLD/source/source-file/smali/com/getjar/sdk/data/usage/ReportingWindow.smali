.class public Lcom/getjar/sdk/data/usage/ReportingWindow;
.super Ljava/lang/Object;
.source "ReportingWindow.java"


# instance fields
.field private final _id:J

.field private final _timestampStart:J

.field private final _timestampStop:J


# direct methods
.method protected constructor <init>(Landroid/database/Cursor;)V
    .locals 2
    .param p1, "cursor"    # Landroid/database/Cursor;

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/usage/ReportingWindow;->_id:J

    .line 18
    const/4 v0, 0x1

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/usage/ReportingWindow;->_timestampStart:J

    .line 19
    const/4 v0, 0x2

    invoke-interface {p1, v0}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/usage/ReportingWindow;->_timestampStop:J

    .line 20
    return-void
.end method


# virtual methods
.method public getId()J
    .locals 2

    .prologue
    .line 22
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/ReportingWindow;->_id:J

    return-wide v0
.end method

.method public getTimestampStart()J
    .locals 2

    .prologue
    .line 23
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/ReportingWindow;->_timestampStart:J

    return-wide v0
.end method

.method public getTimestampStop()J
    .locals 2

    .prologue
    .line 24
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/ReportingWindow;->_timestampStop:J

    return-wide v0
.end method
