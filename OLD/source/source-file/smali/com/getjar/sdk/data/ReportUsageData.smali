.class public Lcom/getjar/sdk/data/ReportUsageData;
.super Ljava/lang/Object;
.source "ReportUsageData.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    }
.end annotation


# instance fields
.field private final _appFlags:I

.field private final _appMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _eventTimestamp:J

.field private final _packageName:Ljava/lang/String;

.field private final _trackingMetadata:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final _usageType:Lcom/getjar/sdk/data/ReportUsageData$UsageType;


# direct methods
.method public constructor <init>(Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V
    .locals 2
    .param p1, "type"    # Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .param p4, "appFlags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/data/ReportUsageData$UsageType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 50
    .local p2, "trackingMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "appMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/getjar/sdk/data/ReportUsageData;->validateConstructorParameters(Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_packageName:Ljava/lang/String;

    .line 55
    iput-object p1, p0, Lcom/getjar/sdk/data/ReportUsageData;->_usageType:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 56
    iput-object p2, p0, Lcom/getjar/sdk/data/ReportUsageData;->_trackingMetadata:Ljava/util/Map;

    .line 57
    iput-object p3, p0, Lcom/getjar/sdk/data/ReportUsageData;->_appMetadata:Ljava/util/Map;

    .line 58
    iput p4, p0, Lcom/getjar/sdk/data/ReportUsageData;->_appFlags:I

    .line 59
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_eventTimestamp:J

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V
    .locals 2
    .param p1, "packageName"    # Ljava/lang/String;
    .param p2, "type"    # Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .param p5, "appFlags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/data/ReportUsageData$UsageType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 63
    .local p3, "trackingMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p4, "appMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 65
    invoke-direct {p0, p2, p3, p4, p5}, Lcom/getjar/sdk/data/ReportUsageData;->validateConstructorParameters(Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V

    .line 66
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'packageName\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_0
    iput-object p1, p0, Lcom/getjar/sdk/data/ReportUsageData;->_packageName:Ljava/lang/String;

    .line 69
    iput-object p2, p0, Lcom/getjar/sdk/data/ReportUsageData;->_usageType:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 70
    iput-object p3, p0, Lcom/getjar/sdk/data/ReportUsageData;->_trackingMetadata:Ljava/util/Map;

    .line 71
    iput-object p4, p0, Lcom/getjar/sdk/data/ReportUsageData;->_appMetadata:Ljava/util/Map;

    .line 72
    iput p5, p0, Lcom/getjar/sdk/data/ReportUsageData;->_appFlags:I

    .line 73
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_eventTimestamp:J

    .line 74
    return-void
.end method

.method private validateConstructorParameters(Lcom/getjar/sdk/data/ReportUsageData$UsageType;Ljava/util/Map;Ljava/util/Map;I)V
    .locals 2
    .param p1, "type"    # Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .param p4, "appFlags"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/data/ReportUsageData$UsageType;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .prologue
    .line 77
    .local p2, "trackingMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "appMetadata":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'type\' cannot be NULL"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    if-eqz p2, :cond_1

    invoke-interface {p2}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_2

    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'trackingMetadata\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_2
    if-eqz p3, :cond_3

    invoke-interface {p3}, Ljava/util/Map;->size()I

    move-result v0

    if-gtz v0, :cond_4

    :cond_3
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'appMetadata\' cannot be NULL or empty"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_4
    return-void
.end method


# virtual methods
.method public getAppFlags()I
    .locals 1

    .prologue
    .line 47
    iget v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_appFlags:I

    return v0
.end method

.method public getAppMetadata()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 41
    iget-object v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_appMetadata:Ljava/util/Map;

    return-object v0
.end method

.method public getEventTimestamp()J
    .locals 2

    .prologue
    .line 35
    iget-wide v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_eventTimestamp:J

    return-wide v0
.end method

.method public getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_packageName:Ljava/lang/String;

    return-object v0
.end method

.method public getTrackingMetadata()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_trackingMetadata:Ljava/util/Map;

    return-object v0
.end method

.method public getUsageType()Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/getjar/sdk/data/ReportUsageData;->_usageType:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    return-object v0
.end method
