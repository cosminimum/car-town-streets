.class public Lcom/getjar/sdk/comm/ReportUsageProxy;
.super Lcom/getjar/sdk/comm/ServiceProxyBase;
.source "ReportUsageProxy.java"


# static fields
.field private static final _CONTRACT_VERSION:Ljava/lang/String; = "20121001"

.field private static volatile _Instance:Lcom/getjar/sdk/comm/ReportUsageProxy;

.field private static final _URL_TEMPLATE_APPLICATION_REPORT_USAGE:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 38
    const/4 v0, 0x0

    sput-object v0, Lcom/getjar/sdk/comm/ReportUsageProxy;->_Instance:Lcom/getjar/sdk/comm/ReportUsageProxy;

    .line 57
    sget-object v0, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v1, "%1$s%2$s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string v4, "%1$suser/devices/%2$s/apps/report_usage?version="

    aput-object v4, v2, v3

    const/4 v3, 0x1

    const-string v4, "20121001"

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/getjar/sdk/comm/ReportUsageProxy;->_URL_TEMPLATE_APPLICATION_REPORT_USAGE:Ljava/lang/String;

    .line 61
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 37
    invoke-direct {p0}, Lcom/getjar/sdk/comm/ServiceProxyBase;-><init>()V

    return-void
.end method

.method private appUsageDataToJson(Lcom/getjar/sdk/data/ReportUsageData;)Ljava/lang/String;
    .locals 11
    .param p1, "usageData"    # Lcom/getjar/sdk/data/ReportUsageData;

    .prologue
    .line 153
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 154
    .local v1, "appUsageJson":Lorg/json/JSONObject;
    const-string v8, "usage_type"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/ReportUsageData;->getUsageType()Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    move-result-object v9

    invoke-virtual {v9}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->name()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 155
    const-string v8, "event_timestamp"

    invoke-virtual {p1}, Lcom/getjar/sdk/data/ReportUsageData;->getEventTimestamp()J

    move-result-wide v9

    invoke-static {v9, v10}, Lcom/getjar/sdk/utilities/Utility;->epochToISO8601(J)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 158
    .local v0, "appMetadataJson":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/getjar/sdk/data/ReportUsageData;->getAppMetadata()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 159
    .local v5, "key":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 160
    .local v4, "jObj":Lorg/json/JSONObject;
    const-string v8, "key"

    invoke-virtual {v4, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 161
    invoke-virtual {p1}, Lcom/getjar/sdk/data/ReportUsageData;->getAppMetadata()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 162
    .local v7, "value":Ljava/lang/Object;
    if-eqz v7, :cond_0

    .line 163
    const-string v8, "value"

    invoke-virtual {v4, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 167
    :goto_1
    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 187
    .end local v0    # "appMetadataJson":Lorg/json/JSONArray;
    .end local v1    # "appUsageJson":Lorg/json/JSONObject;
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "jObj":Lorg/json/JSONObject;
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/Object;
    :catch_0
    move-exception v2

    .line 188
    .local v2, "e":Lorg/json/JSONException;
    new-instance v8, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v8, v2}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 165
    .end local v2    # "e":Lorg/json/JSONException;
    .restart local v0    # "appMetadataJson":Lorg/json/JSONArray;
    .restart local v1    # "appUsageJson":Lorg/json/JSONObject;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v4    # "jObj":Lorg/json/JSONObject;
    .restart local v5    # "key":Ljava/lang/String;
    .restart local v7    # "value":Ljava/lang/Object;
    :cond_0
    :try_start_1
    const-string v8, "value"

    sget-object v9, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 169
    .end local v4    # "jObj":Lorg/json/JSONObject;
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/Object;
    :cond_1
    const-string v8, "app_metadata"

    invoke-virtual {v1, v8, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 171
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 172
    .local v6, "trackingMetadataJson":Lorg/json/JSONArray;
    invoke-virtual {p1}, Lcom/getjar/sdk/data/ReportUsageData;->getTrackingMetadata()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v8

    invoke-interface {v8}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 173
    .restart local v5    # "key":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 174
    .restart local v4    # "jObj":Lorg/json/JSONObject;
    const-string v8, "key"

    invoke-virtual {v4, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 175
    invoke-virtual {p1}, Lcom/getjar/sdk/data/ReportUsageData;->getTrackingMetadata()Ljava/util/Map;

    move-result-object v8

    invoke-interface {v8, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    .line 176
    .restart local v7    # "value":Ljava/lang/Object;
    if-eqz v7, :cond_2

    .line 177
    const-string v8, "value"

    invoke-virtual {v4, v8, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 181
    :goto_3
    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_2

    .line 179
    :cond_2
    const-string v8, "value"

    sget-object v9, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_3

    .line 183
    .end local v4    # "jObj":Lorg/json/JSONObject;
    .end local v5    # "key":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/Object;
    :cond_3
    const-string v8, "tracking_metadata"

    invoke-virtual {v1, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 185
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v8

    return-object v8
.end method

.method private filterAppUsageDataList(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    .local p2, "appUsageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 140
    .local v1, "filteredAppUsageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/ReportUsageData;

    .line 141
    .local v0, "appData":Lcom/getjar/sdk/data/ReportUsageData;
    invoke-virtual {v0}, Lcom/getjar/sdk/data/ReportUsageData;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-static {p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v3

    invoke-virtual {v0}, Lcom/getjar/sdk/data/ReportUsageData;->getPackageName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/usage/UsageManager;->shouldFilterFromUsage(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    :cond_1
    invoke-static {p1}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v3

    invoke-virtual {v0}, Lcom/getjar/sdk/data/ReportUsageData;->getUsageType()Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/getjar/sdk/data/usage/UsageManager;->shouldFilterTypeFromUsage(Lcom/getjar/sdk/data/ReportUsageData$UsageType;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 143
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 146
    .end local v0    # "appData":Lcom/getjar/sdk/data/ReportUsageData;
    :cond_2
    return-object v1
.end method

.method public static getInstance()Lcom/getjar/sdk/comm/ReportUsageProxy;
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lcom/getjar/sdk/comm/ReportUsageProxy;->_Instance:Lcom/getjar/sdk/comm/ReportUsageProxy;

    if-nez v0, :cond_0

    invoke-static {}, Lcom/getjar/sdk/comm/ReportUsageProxy;->makeTheInstance()V

    .line 45
    :cond_0
    sget-object v0, Lcom/getjar/sdk/comm/ReportUsageProxy;->_Instance:Lcom/getjar/sdk/comm/ReportUsageProxy;

    return-object v0
.end method

.method private static declared-synchronized makeTheInstance()V
    .locals 2

    .prologue
    .line 40
    const-class v1, Lcom/getjar/sdk/comm/ReportUsageProxy;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/ReportUsageProxy;->_Instance:Lcom/getjar/sdk/comm/ReportUsageProxy;

    if-nez v0, :cond_0

    new-instance v0, Lcom/getjar/sdk/comm/ReportUsageProxy;

    invoke-direct {v0}, Lcom/getjar/sdk/comm/ReportUsageProxy;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/ReportUsageProxy;->_Instance:Lcom/getjar/sdk/comm/ReportUsageProxy;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    :cond_0
    monitor-exit v1

    return-void

    .line 40
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method protected getServiceName()Lcom/getjar/sdk/comm/Request$ServiceName;
    .locals 1

    .prologue
    .line 64
    sget-object v0, Lcom/getjar/sdk/comm/Request$ServiceName;->USER:Lcom/getjar/sdk/comm/Request$ServiceName;

    return-object v0
.end method

.method public reportApplicationUsage(Lcom/getjar/sdk/comm/CommContext;Ljava/util/List;)Lcom/getjar/sdk/comm/Operation;
    .locals 17
    .param p1, "commContext"    # Lcom/getjar/sdk/comm/CommContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/getjar/sdk/comm/CommContext;",
            "Ljava/util/List",
            "<",
            "Lcom/getjar/sdk/data/ReportUsageData;",
            ">;)",
            "Lcom/getjar/sdk/comm/Operation;"
        }
    .end annotation

    .prologue
    .line 81
    .local p2, "appUsageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    if-nez p1, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'commContext\' was not provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 82
    :cond_0
    if-nez p2, :cond_1

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'appUsageList\' was not provided"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 83
    :cond_1
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_2

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "The required parameter \'appUsageList\' contains no data"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 86
    :cond_2
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v0, v2, v1}, Lcom/getjar/sdk/comm/ReportUsageProxy;->filterAppUsageDataList(Landroid/content/Context;Ljava/util/List;)Ljava/util/List;

    move-result-object v15

    .line 87
    .local v15, "filteredAppUsageList":Ljava/util/List;, "Ljava/util/List<Lcom/getjar/sdk/data/ReportUsageData;>;"
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "Filtered usage records to report from %1$d to %2$d"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v4, v5, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 88
    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v2

    if-gtz v2, :cond_3

    .line 91
    const/4 v2, 0x0

    .line 128
    :goto_0
    return-object v2

    .line 96
    :cond_3
    new-instance v16, Ljava/lang/StringBuilder;

    const-string v2, ""

    move-object/from16 v0, v16

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 97
    .local v16, "postDataBuffer":Ljava/lang/StringBuilder;
    invoke-interface {v15}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v13

    .line 98
    .local v13, "appUsageItr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/getjar/sdk/data/ReportUsageData;>;"
    const-string v2, "["

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    :cond_4
    :goto_1
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 101
    :try_start_0
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/getjar/sdk/data/ReportUsageData;

    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/getjar/sdk/comm/ReportUsageProxy;->appUsageDataToJson(Lcom/getjar/sdk/data/ReportUsageData;)Ljava/lang/String;

    move-result-object v2

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v2, ","

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 103
    :catch_0
    move-exception v14

    .line 108
    .local v14, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Lcom/getjar/sdk/logging/Area;->COMM:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    or-long/2addr v2, v4

    const-string v4, "appUsageDataToJson() failed"

    invoke-static {v2, v3, v4, v14}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 111
    .end local v14    # "e":Ljava/lang/Exception;
    :cond_5
    const-string v2, "]"

    move-object/from16 v0, v16

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    new-instance v7, Ljava/util/HashMap;

    const/4 v2, 0x1

    invoke-direct {v7, v2}, Ljava/util/HashMap;-><init>(I)V

    .line 114
    .local v7, "postData":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "app_usage_data"

    invoke-virtual/range {v16 .. v16}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v7, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    invoke-virtual/range {p1 .. p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->initialize(Landroid/content/Context;)V

    .line 118
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/getjar/sdk/comm/auth/AuthManager;->waitOnAuth()V

    .line 121
    :try_start_1
    sget-object v2, Ljava/util/Locale;->US:Ljava/util/Locale;

    sget-object v3, Lcom/getjar/sdk/comm/ReportUsageProxy;->_URL_TEMPLATE_APPLICATION_REPORT_USAGE:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    const/4 v8, 0x1

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/getjar/sdk/comm/GetJarConfig;->getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;

    move-result-object v8

    const-string v9, "service.report_usage.endpoint"

    invoke-virtual {v8, v9}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    const/4 v5, 0x1

    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager;->getInstance()Lcom/getjar/sdk/comm/auth/AuthManager;

    move-result-object v8

    invoke-virtual {v8}, Lcom/getjar/sdk/comm/auth/AuthManager;->getUserDeviceId()Ljava/lang/String;

    move-result-object v8

    const-string v9, "UTF-8"

    invoke-static {v8, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v4, v5

    invoke-static {v2, v3, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    .line 128
    .local v6, "url":Ljava/lang/String;
    const-string v3, "reportApplicationUsage"

    sget-object v4, Lcom/getjar/sdk/comm/Operation$Priority;->LOW:Lcom/getjar/sdk/comm/Operation$Priority;

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x0

    move-object/from16 v2, p0

    move-object/from16 v5, p1

    invoke-virtual/range {v2 .. v12}, Lcom/getjar/sdk/comm/ReportUsageProxy;->makeAsyncPOSTRequestForJson(Ljava/lang/String;Lcom/getjar/sdk/comm/Operation$Priority;Lcom/getjar/sdk/comm/CommContext;Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lcom/getjar/sdk/comm/CallbackInterface;ZZZ)Lcom/getjar/sdk/comm/Operation;

    move-result-object v2

    goto/16 :goto_0

    .line 124
    .end local v6    # "url":Ljava/lang/String;
    :catch_1
    move-exception v14

    .line 125
    .local v14, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v2, Lcom/getjar/sdk/exceptions/CommunicationException;

    invoke-direct {v2, v14}, Lcom/getjar/sdk/exceptions/CommunicationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
