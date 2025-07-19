.class public Lcom/getjar/sdk/data/usage/AggregateUsageReport;
.super Ljava/lang/Object;
.source "AggregateUsageReport.java"


# instance fields
.field private final _records:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation
.end field

.field private final _timestampStart:J

.field private final _timestampStop:J


# direct methods
.method protected constructor <init>(JJLjava/util/List;)V
    .locals 1
    .param p1, "timestampStart"    # J
    .param p3, "timestampStop"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(JJ",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p5, "records":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/usage/AggregateUsageRecord;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-wide p1, p0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->_timestampStart:J

    .line 18
    iput-wide p3, p0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->_timestampStop:J

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->_records:Ljava/util/List;

    .line 24
    return-void
.end method


# virtual methods
.method public getRecords()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/usage/AggregateUsageRecord;",
            ">;"
        }
    .end annotation

    .prologue
    .line 28
    iget-object v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->_records:Ljava/util/List;

    return-object v0
.end method

.method public getTimestampStart()J
    .locals 2

    .prologue
    .line 26
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->_timestampStart:J

    return-wide v0
.end method

.method public getTimestampStop()J
    .locals 2

    .prologue
    .line 27
    iget-wide v0, p0, Lcom/getjar/sdk/data/usage/AggregateUsageReport;->_timestampStop:J

    return-wide v0
.end method
