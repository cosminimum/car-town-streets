.class public Lcom/getjar/sdk/comm/GetJarConfig;
.super Ljava/lang/Object;
.source "GetJarConfig.java"


# static fields
.field private static final CONFIG_PREFS:Ljava/lang/String; = "GetJarConfig"

.field private static final CONFIG_PREFS_KEY:Ljava/lang/String; = "config"

.field private static final DEFAULT_CONFIG_FILE:Ljava/lang/String; = "config.ini"

.field private static final DEFAULT_LOOKUP_KEY:Ljava/lang/String; = "default"

.field public static final KEY_AUTH_SERVICE_ENDPOINT:Ljava/lang/String; = "service.auth_service.endpoint"

.field public static final KEY_DEFAULT_WEBVIEW_URL:Ljava/lang/String; = "webview.default_url"

.field public static final KEY_DOWNLOAD_MATCH_TTL:Ljava/lang/String; = "download.match.ttl"

.field public static final KEY_EARN_ON_OPEN_MONITORING_INTERVAL:Ljava/lang/String; = "earn.on.open.monitoring.interval"

.field public static final KEY_LICENSE_IGNORE_REQUEST_INTERVAL:Ljava/lang/String; = "license.ignore.request.interval"

.field public static final KEY_LICENSE_REFRESH_INTERVAL:Ljava/lang/String; = "license.refresh.interval"

.field public static final KEY_LICENSE_SERVICE_ENDPOINT:Ljava/lang/String; = "service.license_service.endpoint"

.field public static final KEY_LOCALIZATION_SERVICE_ENDPOINT:Ljava/lang/String; = "service.localization_service.endpoint"

.field public static final KEY_LOGGING_ENDPOINT:Ljava/lang/String; = "service.logging.endpoint"

.field public static final KEY_LOGGING_LOGCAT_AREAS:Ljava/lang/String; = "logging.logcat.areas"

.field public static final KEY_LOGGING_LOGCAT_ENABLED:Ljava/lang/String; = "logging.logcat.enabled"

.field public static final KEY_LOGGING_LOGCAT_LEVEL:Ljava/lang/String; = "logging.logcat.level"

.field public static final KEY_LOGGING_REMOTE_AREAS:Ljava/lang/String; = "logging.remote.areas"

.field public static final KEY_LOGGING_REMOTE_ENABLED:Ljava/lang/String; = "logging.remote.enabled"

.field public static final KEY_LOGGING_REMOTE_LEVEL:Ljava/lang/String; = "logging.remote.level"

.field public static final KEY_LOGGING_REMOTE_MAX_BATCH_COUNT:Ljava/lang/String; = "logging.remote.max_batch_count"

.field public static final KEY_LOGGING_REMOTE_MAX_WAIT_INTERVAL:Ljava/lang/String; = "logging.remote.max_wait_interval"

.field public static final KEY_MANAGED_CHECKOUT_URL:Ljava/lang/String; = "webview.managed_checkout_url"

.field public static final KEY_REPORT_USAGE_ENDPOINT:Ljava/lang/String; = "service.report_usage.endpoint"

.field public static final KEY_SERVICE_REQUEST_COMPRESS:Ljava/lang/String; = "service.request.compress"

.field public static final KEY_SERVICE_REQUEST_UNCOMPRESSED_LIMIT:Ljava/lang/String; = "service.request.uncompressed_limit"

.field public static final KEY_TRANSACTION_FAIL_ABANDON_TIME:Ljava/lang/String; = "transaction.fail.abandon.time"

.field public static final KEY_TRANSACTION_FAIL_RETRY_INTERVAL:Ljava/lang/String; = "transaction.fail.retry.time"

.field public static final KEY_TRANSACTION_SERVICE_ENDPOINT:Ljava/lang/String; = "service.transaction_service.endpoint"

.field public static final KEY_USAGE_BACKGROUND_SEND_BATCH_COUNT:Ljava/lang/String; = "usage.background.send.batch_count"

.field public static final KEY_USAGE_BACKGROUND_SEND_ENABLED:Ljava/lang/String; = "usage.background.send.enabled"

.field public static final KEY_USAGE_BACKGROUND_SEND_INTERVAL:Ljava/lang/String; = "usage.background.send.interval"

.field public static final KEY_USAGE_BACKGROUND_TYPE_FILTER:Ljava/lang/String; = "usage.background.type_filter"

.field public static final KEY_USAGE_MONITORING_ENABLED:Ljava/lang/String; = "usage.monitoring.enabled"

.field public static final KEY_USAGE_MONITORING_INTERVAL:Ljava/lang/String; = "usage.monitoring.interval"

.field public static final KEY_USAGE_MONITORING_TRACKING_INTERVAL:Ljava/lang/String; = "usage.monitoring.tracking_interval"

.field public static final KEY_USAGE_PACKAGE_FILTER_REGEX:Ljava/lang/String; = "usage.package_filter.regex"

.field public static final KEY_USAGE_PACKAGE_FILTER_SYSTEM:Ljava/lang/String; = "usage.package_filter.system"

.field public static final KEY_USAGE_REQUEST_SEND_ENABLED:Ljava/lang/String; = "usage.request.send.enabled"

.field public static final KEY_USAGE_REQUEST_SEND_MAX_COUNT:Ljava/lang/String; = "usage.request.send.max_count"

.field public static final KEY_USAGE_REQUEST_SEND_SORT:Ljava/lang/String; = "usage.request.send.sort"

.field public static final KEY_USAGE_REQUEST_TIME_WINDOW:Ljava/lang/String; = "usage.request.time_window"

.field public static final KEY_USAGE_REQUEST_TIME_WINDOW_COUNT:Ljava/lang/String; = "usage.request.time_window_count"

.field public static final KEY_VOUCHER_SERVICE_ENDPOINT:Ljava/lang/String; = "service.voucher_service.endpoint"

.field public static final KEY_WALLET_URL:Ljava/lang/String; = "webview.wallet_url"

.field public static final KEY_WEBVIEW_SAVED_URL_TTL:Ljava/lang/String; = "webview.saved_url.ttl"

.field public static final KEY_WEBVIEW_SLEEP_RELOAD_INTERVAL:Ljava/lang/String; = "webview.sleep_reload.interval"

.field private static sInstances:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/getjar/sdk/comm/GetJarConfig;",
            ">;"
        }
    .end annotation
.end field

.field private static final sRequiredKeys:[Ljava/lang/String;


# instance fields
.field private androidContext:Landroid/content/Context;

.field private mCommContext:Lcom/getjar/sdk/comm/CommContext;

.field private mDirectives:Lorg/json/JSONObject;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 46
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    .line 97
    const/16 v0, 0x25

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "service.voucher_service.endpoint"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    const-string v2, "service.transaction_service.endpoint"

    aput-object v2, v0, v1

    const/4 v1, 0x2

    const-string v2, "service.auth_service.endpoint"

    aput-object v2, v0, v1

    const/4 v1, 0x3

    const-string v2, "service.license_service.endpoint"

    aput-object v2, v0, v1

    const/4 v1, 0x4

    const-string v2, "webview.default_url"

    aput-object v2, v0, v1

    const/4 v1, 0x5

    const-string v2, "webview.managed_checkout_url"

    aput-object v2, v0, v1

    const/4 v1, 0x6

    const-string v2, "webview.wallet_url"

    aput-object v2, v0, v1

    const/4 v1, 0x7

    const-string v2, "transaction.fail.retry.time"

    aput-object v2, v0, v1

    const/16 v1, 0x8

    const-string v2, "license.refresh.interval"

    aput-object v2, v0, v1

    const/16 v1, 0x9

    const-string v2, "license.ignore.request.interval"

    aput-object v2, v0, v1

    const/16 v1, 0xa

    const-string v2, "transaction.fail.abandon.time"

    aput-object v2, v0, v1

    const/16 v1, 0xb

    const-string v2, "usage.background.send.interval"

    aput-object v2, v0, v1

    const/16 v1, 0xc

    const-string v2, "webview.saved_url.ttl"

    aput-object v2, v0, v1

    const/16 v1, 0xd

    const-string v2, "download.match.ttl"

    aput-object v2, v0, v1

    const/16 v1, 0xe

    const-string v2, "earn.on.open.monitoring.interval"

    aput-object v2, v0, v1

    const/16 v1, 0xf

    const-string v2, "usage.monitoring.interval"

    aput-object v2, v0, v1

    const/16 v1, 0x10

    const-string v2, "usage.monitoring.tracking_interval"

    aput-object v2, v0, v1

    const/16 v1, 0x11

    const-string v2, "usage.monitoring.enabled"

    aput-object v2, v0, v1

    const/16 v1, 0x12

    const-string v2, "service.request.compress"

    aput-object v2, v0, v1

    const/16 v1, 0x13

    const-string v2, "service.request.uncompressed_limit"

    aput-object v2, v0, v1

    const/16 v1, 0x14

    const-string v2, "service.logging.endpoint"

    aput-object v2, v0, v1

    const/16 v1, 0x15

    const-string v2, "usage.package_filter.system"

    aput-object v2, v0, v1

    const/16 v1, 0x16

    const-string v2, "usage.background.send.enabled"

    aput-object v2, v0, v1

    const/16 v1, 0x17

    const-string v2, "usage.background.send.batch_count"

    aput-object v2, v0, v1

    const/16 v1, 0x18

    const-string v2, "usage.request.send.enabled"

    aput-object v2, v0, v1

    const/16 v1, 0x19

    const-string v2, "usage.request.send.max_count"

    aput-object v2, v0, v1

    const/16 v1, 0x1a

    const-string v2, "usage.request.send.sort"

    aput-object v2, v0, v1

    const/16 v1, 0x1b

    const-string v2, "usage.request.time_window"

    aput-object v2, v0, v1

    const/16 v1, 0x1c

    const-string v2, "usage.request.time_window_count"

    aput-object v2, v0, v1

    const/16 v1, 0x1d

    const-string v2, "logging.logcat.enabled"

    aput-object v2, v0, v1

    const/16 v1, 0x1e

    const-string v2, "logging.logcat.level"

    aput-object v2, v0, v1

    const/16 v1, 0x1f

    const-string v2, "logging.logcat.areas"

    aput-object v2, v0, v1

    const/16 v1, 0x20

    const-string v2, "logging.remote.enabled"

    aput-object v2, v0, v1

    const/16 v1, 0x21

    const-string v2, "logging.remote.level"

    aput-object v2, v0, v1

    const/16 v1, 0x22

    const-string v2, "logging.remote.areas"

    aput-object v2, v0, v1

    const/16 v1, 0x23

    const-string v2, "logging.remote.max_batch_count"

    aput-object v2, v0, v1

    const/16 v1, 0x24

    const-string v2, "logging.remote.max_wait_interval"

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/comm/GetJarConfig;->sRequiredKeys:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 203
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 204
    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "\'androidContext\' cannot be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :cond_0
    invoke-direct {p0, p1}, Lcom/getjar/sdk/comm/GetJarConfig;->initialize(Landroid/content/Context;)V

    .line 206
    return-void
.end method

.method private constructor <init>(Lcom/getjar/sdk/comm/CommContext;Z)V
    .locals 0
    .param p1, "theCommContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "connectToServer"    # Z

    .prologue
    .line 194
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 195
    invoke-direct {p0, p1, p2}, Lcom/getjar/sdk/comm/GetJarConfig;->initialize(Lcom/getjar/sdk/comm/CommContext;Z)V

    .line 196
    return-void
.end method

.method private _getDefaultDirectives()Lorg/json/JSONObject;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v9, 0x2

    .line 344
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 345
    .local v2, "keyvals":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v0, 0x0

    .line 347
    .local v0, "br":Ljava/io/BufferedReader;
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    iget-object v6, p0, Lcom/getjar/sdk/comm/GetJarConfig;->androidContext:Landroid/content/Context;

    invoke-virtual {v6}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v6

    const-string v7, "config.ini"

    invoke-virtual {v6, v7}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 349
    .end local v0    # "br":Ljava/io/BufferedReader;
    .local v1, "br":Ljava/io/BufferedReader;
    :cond_0
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v4

    .local v4, "line":Ljava/lang/String;
    if-eqz v4, :cond_2

    .line 350
    const-string v5, "="

    const/4 v6, 0x2

    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 351
    .local v3, "kv":[Ljava/lang/String;
    array-length v5, v3

    if-ne v5, v9, :cond_0

    .line 352
    sget-object v5, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v5}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v5

    sget-object v7, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    or-long/2addr v5, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "_getDefaultDirectives() -- detected "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x0

    aget-object v8, v3, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "="

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const/4 v8, 0x1

    aget-object v8, v3, v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v6, v7}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 353
    const/4 v5, 0x0

    aget-object v5, v3, v5

    const/4 v6, 0x1

    aget-object v6, v3, v6

    invoke-interface {v2, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 357
    .end local v3    # "kv":[Ljava/lang/String;
    .end local v4    # "line":Ljava/lang/String;
    :catchall_0
    move-exception v5

    move-object v0, v1

    .end local v1    # "br":Ljava/io/BufferedReader;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :goto_1
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    :cond_1
    throw v5

    .end local v0    # "br":Ljava/io/BufferedReader;
    .restart local v1    # "br":Ljava/io/BufferedReader;
    .restart local v4    # "line":Ljava/lang/String;
    :cond_2
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 360
    :cond_3
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v2}, Lorg/json/JSONObject;-><init>(Ljava/util/Map;)V

    return-object v5

    .line 357
    .end local v1    # "br":Ljava/io/BufferedReader;
    .end local v4    # "line":Ljava/lang/String;
    .restart local v0    # "br":Ljava/io/BufferedReader;
    :catchall_1
    move-exception v5

    goto :goto_1
.end method

.method private declared-synchronized _persistIntoSharedPrefs(Lorg/json/JSONObject;)V
    .locals 5
    .param p1, "theJson"    # Lorg/json/JSONObject;

    .prologue
    .line 395
    monitor-enter p0

    if-nez p1, :cond_0

    .line 396
    :try_start_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "Must have a valid json object."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 395
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 398
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const-string v2, "GetJarConfig"

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 399
    .local v0, "prefs":Landroid/content/SharedPreferences;
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v2, "config"

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 400
    sget-object v1, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v1}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v1

    sget-object v3, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    or-long/2addr v1, v3

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "_persistIntoSharedPrefs() -- OK: stored key=config, val="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 401
    monitor-exit p0

    return-void
.end method

.method private _validateJsonDirectives(Lorg/json/JSONObject;)Z
    .locals 9
    .param p1, "theJson"    # Lorg/json/JSONObject;

    .prologue
    const/4 v5, 0x0

    .line 371
    if-nez p1, :cond_0

    .line 372
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v6, "Must have a valid json object."

    invoke-direct {v5, v6}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 376
    :cond_0
    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/GetJarConfig;->sRequiredKeys:[Ljava/lang/String;

    .local v0, "arr$":[Ljava/lang/String;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v4, :cond_3

    aget-object v3, v0, v2

    .line 377
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_2

    .line 386
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "len$":I
    :cond_1
    :goto_1
    return v5

    .line 376
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v3    # "key":Ljava/lang/String;
    .restart local v4    # "len$":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 381
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v2    # "i$":I
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "len$":I
    :catch_0
    move-exception v1

    .line 382
    .local v1, "e":Lorg/json/JSONException;
    sget-object v6, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v6}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v6

    const-string v8, "_validateJsonDirectives failed"

    invoke-static {v6, v7, v8, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 386
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "arr$":[Ljava/lang/String;
    .restart local v2    # "i$":I
    .restart local v4    # "len$":I
    :cond_3
    const/4 v5, 0x1

    goto :goto_1
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/GetJarConfig;
    .locals 6
    .param p0, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 173
    const-class v3, Lcom/getjar/sdk/comm/GetJarConfig;

    monitor-enter v3

    if-nez p0, :cond_0

    :try_start_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "\'androidContext\' cannot be null"

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 175
    :cond_0
    :try_start_1
    invoke-static {p0}, Lcom/getjar/sdk/utilities/OverridesUtility;->initialize(Landroid/content/Context;)V

    .line 176
    sget-object v2, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    const-string v4, "default"

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 177
    sget-object v2, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v2, "GetJarConfig()::getInstance() -- re-using existing GetJarConfig instance"

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 178
    sget-object v2, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    const-string v4, "default"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/comm/GetJarConfig;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 184
    :goto_0
    monitor-exit v3

    return-object v1

    .line 181
    :cond_1
    :try_start_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v2, "GetJarConfig()::getInstance() -- creating a new GetJarConfig instance"

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 182
    new-instance v0, Lcom/getjar/sdk/comm/GetJarConfig;

    invoke-direct {v0, p0}, Lcom/getjar/sdk/comm/GetJarConfig;-><init>(Landroid/content/Context;)V

    .line 183
    .local v0, "config":Lcom/getjar/sdk/comm/GetJarConfig;
    sget-object v2, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    const-string v4, "default"

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v1, v0

    .line 184
    goto :goto_0
.end method

.method public static declared-synchronized getInstance(Lcom/getjar/sdk/comm/CommContext;Z)Lcom/getjar/sdk/comm/GetJarConfig;
    .locals 6
    .param p0, "theCommContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p1, "connectToServer"    # Z

    .prologue
    .line 148
    const-class v3, Lcom/getjar/sdk/comm/GetJarConfig;

    monitor-enter v3

    if-nez p0, :cond_0

    .line 149
    :try_start_0
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v4, "Must supply a valid GetJarContext."

    invoke-direct {v2, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 148
    :catchall_0
    move-exception v2

    monitor-exit v3

    throw v2

    .line 152
    :cond_0
    :try_start_1
    invoke-virtual {p0}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v2}, Lcom/getjar/sdk/utilities/OverridesUtility;->initialize(Landroid/content/Context;)V

    .line 153
    sget-object v2, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    const-string v4, "default"

    invoke-interface {v2, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 154
    sget-object v2, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v2, "GetJarConfig()::getInstance() -- re-using existing GetJarConfig instance"

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 155
    sget-object v2, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    const-string v4, "default"

    invoke-interface {v2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/getjar/sdk/comm/GetJarConfig;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 161
    :goto_0
    monitor-exit v3

    return-object v1

    .line 158
    :cond_1
    :try_start_2
    sget-object v2, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v2, "GetJarConfig()::getInstance() -- creating a new GetJarConfig instance"

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 159
    new-instance v0, Lcom/getjar/sdk/comm/GetJarConfig;

    invoke-direct {v0, p0, p1}, Lcom/getjar/sdk/comm/GetJarConfig;-><init>(Lcom/getjar/sdk/comm/CommContext;Z)V

    .line 160
    .local v0, "config":Lcom/getjar/sdk/comm/GetJarConfig;
    sget-object v2, Lcom/getjar/sdk/comm/GetJarConfig;->sInstances:Ljava/util/Map;

    const-string v4, "default"

    invoke-interface {v2, v4, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-object v1, v0

    .line 161
    goto :goto_0
.end method

.method private declared-synchronized initialize(Landroid/content/Context;)V
    .locals 7
    .param p1, "androidContext"    # Landroid/content/Context;

    .prologue
    .line 311
    monitor-enter p0

    if-nez p1, :cond_0

    :try_start_0
    new-instance v4, Ljava/lang/IllegalArgumentException;

    const-string v5, "\'androidContext\' cannot be null"

    invoke-direct {v4, v5}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 313
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/getjar/sdk/comm/GetJarConfig;->androidContext:Landroid/content/Context;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 314
    const/4 v0, 0x0

    .line 315
    .local v0, "configJson":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 317
    .local v3, "isConfigReady":Z
    :try_start_2
    invoke-direct {p0}, Lcom/getjar/sdk/comm/GetJarConfig;->_getDefaultDirectives()Lorg/json/JSONObject;

    move-result-object v0

    .line 318
    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/GetJarConfig;->_validateJsonDirectives(Lorg/json/JSONObject;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 319
    iput-object v0, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mDirectives:Lorg/json/JSONObject;

    .line 320
    const/4 v3, 0x1

    .line 321
    sget-object v4, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "_initialize() -- OK: config is ready (using DEFAULTS).."

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 327
    :cond_1
    :goto_0
    if-nez v3, :cond_2

    .line 329
    :try_start_3
    const-string v2, "** FATAL ERROR: invalid configuration, unable to proceed.."

    .line 330
    .local v2, "errorMsg":Ljava/lang/String;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    invoke-static {v4, v5, v2}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 331
    new-instance v4, Lcom/getjar/sdk/exceptions/ConfigurationException;

    invoke-direct {v4, v2}, Lcom/getjar/sdk/exceptions/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 323
    .end local v2    # "errorMsg":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 324
    .local v1, "e":Ljava/io/IOException;
    sget-object v4, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    const-string v6, "_initialize() failed"

    invoke-static {v4, v5, v6, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_0

    .line 333
    .end local v1    # "e":Ljava/io/IOException;
    :cond_2
    monitor-exit p0

    return-void
.end method

.method private declared-synchronized initialize(Lcom/getjar/sdk/comm/CommContext;Z)V
    .locals 11
    .param p1, "theCommContext"    # Lcom/getjar/sdk/comm/CommContext;
    .param p2, "connectToServer"    # Z

    .prologue
    .line 210
    monitor-enter p0

    const/4 v7, 0x0

    :try_start_0
    iput-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mDirectives:Lorg/json/JSONObject;

    .line 211
    iput-object p1, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    .line 212
    const/4 v5, 0x0

    .line 213
    .local v5, "isConfigReady":Z
    const/4 v0, 0x0

    .line 215
    .local v0, "configJson":Lorg/json/JSONObject;
    iget-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    if-nez v7, :cond_0

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'theCommContext\' can not be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    .end local v0    # "configJson":Lorg/json/JSONObject;
    .end local v5    # "isConfigReady":Z
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 216
    .restart local v0    # "configJson":Lorg/json/JSONObject;
    .restart local v5    # "isConfigReady":Z
    :cond_0
    :try_start_1
    iget-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    if-nez v7, :cond_1

    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "\'theCommContext.getApplicationContext()\' can not be NULL"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 218
    :cond_1
    invoke-virtual {p1}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    iput-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->androidContext:Landroid/content/Context;

    .line 245
    if-nez v5, :cond_3

    .line 250
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "#2: _initialize() -- unable to fetch server config, trying to read from SharedPrefs file.."

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 251
    iget-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    const-string v8, "GetJarConfig"

    const/4 v9, 0x0

    invoke-virtual {v7, v8, v9}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v6

    .line 252
    .local v6, "prefs":Landroid/content/SharedPreferences;
    const-string v7, "config"

    const/4 v8, 0x0

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 253
    .local v2, "configStr":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v7

    if-nez v7, :cond_3

    .line 255
    :try_start_2
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 256
    .end local v0    # "configJson":Lorg/json/JSONObject;
    .local v1, "configJson":Lorg/json/JSONObject;
    :try_start_3
    invoke-direct {p0, v1}, Lcom/getjar/sdk/comm/GetJarConfig;->_validateJsonDirectives(Lorg/json/JSONObject;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 257
    iput-object v1, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mDirectives:Lorg/json/JSONObject;

    .line 258
    const/4 v5, 0x1

    .line 259
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "_initialize() -- OK: config is ready (from SharedPrefs).."

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :cond_2
    move-object v0, v1

    .line 267
    .end local v1    # "configJson":Lorg/json/JSONObject;
    .end local v2    # "configStr":Ljava/lang/String;
    .end local v6    # "prefs":Landroid/content/SharedPreferences;
    .restart local v0    # "configJson":Lorg/json/JSONObject;
    :cond_3
    :goto_0
    if-nez v5, :cond_4

    .line 272
    :try_start_4
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "#3: _initialize() -- unable to read form SharedPrefs file, using DEFAULTS.."

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 274
    :try_start_5
    invoke-direct {p0}, Lcom/getjar/sdk/comm/GetJarConfig;->_getDefaultDirectives()Lorg/json/JSONObject;

    move-result-object v0

    .line 275
    invoke-direct {p0, v0}, Lcom/getjar/sdk/comm/GetJarConfig;->_validateJsonDirectives(Lorg/json/JSONObject;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 276
    iput-object v0, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mDirectives:Lorg/json/JSONObject;

    .line 277
    iget-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mDirectives:Lorg/json/JSONObject;

    invoke-direct {p0, v7}, Lcom/getjar/sdk/comm/GetJarConfig;->_persistIntoSharedPrefs(Lorg/json/JSONObject;)V

    .line 278
    const/4 v5, 0x1

    .line 279
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "_initialize() -- OK: config is ready (using DEFAULTS).."

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 286
    :cond_4
    :goto_1
    if-nez v5, :cond_5

    .line 288
    :try_start_6
    const-string v4, "** FATAL ERROR: invalid configuration, unable to proceed.."

    .line 289
    .local v4, "errorMsg":Ljava/lang/String;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    invoke-static {v7, v8, v4}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;)V

    .line 290
    new-instance v7, Lcom/getjar/sdk/exceptions/ConfigurationException;

    invoke-direct {v7, v4}, Lcom/getjar/sdk/exceptions/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 261
    .end local v4    # "errorMsg":Ljava/lang/String;
    .restart local v2    # "configStr":Ljava/lang/String;
    .restart local v6    # "prefs":Landroid/content/SharedPreferences;
    :catch_0
    move-exception v3

    .line 262
    .local v3, "e":Lorg/json/JSONException;
    :goto_2
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "_initialize() failed"

    invoke-static {v7, v8, v9, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 281
    .end local v2    # "configStr":Ljava/lang/String;
    .end local v3    # "e":Lorg/json/JSONException;
    .end local v6    # "prefs":Landroid/content/SharedPreferences;
    :catch_1
    move-exception v3

    .line 282
    .local v3, "e":Ljava/io/IOException;
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->STORAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "_initialize() failed"

    invoke-static {v7, v8, v9, v3}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 293
    .end local v3    # "e":Ljava/io/IOException;
    :cond_5
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    const-string v9, "_initialize() -- OK: config directives READY"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 294
    iget-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-virtual {v7}, Lcom/getjar/sdk/comm/CommContext;->getApplicationContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Lcom/getjar/sdk/data/usage/UsageManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/data/usage/UsageManager;

    move-result-object v7

    invoke-virtual {v7}, Lcom/getjar/sdk/data/usage/UsageManager;->isBackgroundSendEnabled()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 296
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "Alarms: startBackgroundReporting()"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V

    .line 297
    iget-object v7, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mCommContext:Lcom/getjar/sdk/comm/CommContext;

    invoke-static {v7, p0}, Lcom/getjar/sdk/utilities/AlarmsUtility;->startBackgroundReporting(Lcom/getjar/sdk/comm/CommContext;Lcom/getjar/sdk/comm/GetJarConfig;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 303
    :goto_3
    monitor-exit p0

    return-void

    .line 300
    :cond_6
    :try_start_7
    sget-object v7, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v7}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v7

    sget-object v9, Lcom/getjar/sdk/logging/Area;->USAGE:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v9}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v9

    or-long/2addr v7, v9

    const-string v9, "Alarms: Background reporting is disabled, skipping alarm scheduling"

    invoke-static {v7, v8, v9}, Lcom/getjar/sdk/logging/Logger;->d(JLjava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    goto :goto_3

    .line 261
    .end local v0    # "configJson":Lorg/json/JSONObject;
    .restart local v1    # "configJson":Lorg/json/JSONObject;
    .restart local v2    # "configStr":Ljava/lang/String;
    .restart local v6    # "prefs":Landroid/content/SharedPreferences;
    :catch_2
    move-exception v3

    move-object v0, v1

    .end local v1    # "configJson":Lorg/json/JSONObject;
    .restart local v0    # "configJson":Lorg/json/JSONObject;
    goto :goto_2
.end method


# virtual methods
.method public getBooleanValue(Ljava/lang/String;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Boolean;

    .prologue
    const/4 v2, 0x0

    .line 494
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "\'key\' cannot be null or empty"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 496
    :cond_0
    if-nez p2, :cond_1

    move-object v1, v2

    :goto_0
    invoke-virtual {p0, p1, v1}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 497
    .local v0, "value":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    if-nez p2, :cond_2

    .line 500
    :goto_1
    return-object v2

    .line 496
    .end local v0    # "value":Ljava/lang/String;
    :cond_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 500
    .restart local v0    # "value":Ljava/lang/String;
    :cond_2
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    goto :goto_1
.end method

.method public getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 11
    .param p1, "theDirectiveKey"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 414
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() START [key=\'%1$s\']"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object p1, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 417
    :try_start_0
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 418
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "Must have a valid key."

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 452
    :catchall_0
    move-exception v3

    sget-object v4, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v4}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v4

    sget-object v6, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v7, "GetJarConfig getDirectiveValue() FINISHED [key=\'%1$s\']"

    new-array v8, v10, [Ljava/lang/Object;

    aput-object p1, v8, v9

    invoke-static {v6, v7, v8}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v5, v6}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    throw v3

    .line 422
    :cond_0
    const/4 v3, 0x0

    :try_start_1
    invoke-static {p1, v3}, Lcom/getjar/sdk/utilities/OverridesUtility;->getValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 423
    .local v2, "overrideValue":Ljava/lang/String;
    invoke-static {v2}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 424
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() Using OVERRIDE defined value: \'%1$s\' = \'%2$s\'"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object v2, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 425
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v0

    .line 452
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() FINISHED [key=\'%1$s\']"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object p1, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    :goto_0
    return-object v0

    .line 428
    :cond_1
    :try_start_2
    iget-object v3, p0, Lcom/getjar/sdk/comm/GetJarConfig;->androidContext:Landroid/content/Context;

    invoke-static {v3}, Lcom/getjar/sdk/comm/auth/SettingsManager;->getInstance(Landroid/content/Context;)Lcom/getjar/sdk/comm/auth/SettingsManager;

    move-result-object v3

    invoke-virtual {v3, p1}, Lcom/getjar/sdk/comm/auth/SettingsManager;->getValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 429
    .local v0, "directiveVal":Ljava/lang/String;
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 430
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() Using SERVER defined value: \'%1$s\' = \'%2$s\'"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object v0, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 431
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result-object v0

    .line 452
    .end local v0    # "directiveVal":Ljava/lang/String;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() FINISHED [key=\'%1$s\']"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object p1, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0

    .line 435
    .restart local v0    # "directiveVal":Ljava/lang/String;
    :cond_2
    :try_start_3
    iget-object v3, p0, Lcom/getjar/sdk/comm/GetJarConfig;->mDirectives:Lorg/json/JSONObject;

    invoke-virtual {v3, p1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 436
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 437
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() Using CONFIG value: \'%1$s\' = \'%2$s\'"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object p1, v7, v8

    const/4 v8, 0x1

    aput-object v0, v7, v8

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    .line 438
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-result-object v0

    .line 452
    .end local v0    # "directiveVal":Ljava/lang/String;
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() FINISHED [key=\'%1$s\']"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object p1, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_0

    .line 440
    .restart local v0    # "directiveVal":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 441
    .local v1, "e":Lorg/json/JSONException;
    :try_start_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    const-string v5, "getDirectiveValue failed"

    invoke-static {v3, v4, v5, v1}, Lcom/getjar/sdk/logging/Logger;->e(JLjava/lang/String;Ljava/lang/Throwable;)V

    .line 444
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_3
    invoke-static {v0}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 446
    new-instance v3, Lcom/getjar/sdk/exceptions/ConfigurationException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "ERROR: no value found for config directive="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/getjar/sdk/exceptions/ConfigurationException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 452
    :cond_4
    sget-object v3, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v3}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v3

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v6, "GetJarConfig getDirectiveValue() FINISHED [key=\'%1$s\']"

    new-array v7, v10, [Ljava/lang/Object;

    aput-object p1, v7, v9

    invoke-static {v5, v6, v7}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v4, v5}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto/16 :goto_0
.end method

.method public getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 8
    .param p1, "theDirectiveKey"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/String;

    .prologue
    .line 469
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "Must have a valid key."

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 471
    :cond_0
    move-object v1, p2

    .line 473
    .local v1, "value":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/getjar/sdk/exceptions/ConfigurationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 479
    :goto_0
    return-object v1

    .line 474
    :catch_0
    move-exception v0

    .line 475
    .local v0, "e":Lcom/getjar/sdk/exceptions/ConfigurationException;
    sget-object v2, Lcom/getjar/sdk/logging/Area;->CONFIG:Lcom/getjar/sdk/logging/Area;

    invoke-virtual {v2}, Lcom/getjar/sdk/logging/Area;->value()J

    move-result-wide v2

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    const-string v5, "GetJarConfig getDirectiveValue() Using DEFAULT value: \'%1$s\' = \'%2$s\'"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    aput-object p1, v6, v7

    const/4 v7, 0x1

    aput-object p2, v6, v7

    invoke-static {v4, v5, v6}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v2, v3, v4}, Lcom/getjar/sdk/logging/Logger;->v(JLjava/lang/String;)V

    goto :goto_0
.end method

.method public getIntegerValue(Ljava/lang/String;Ljava/lang/Integer;)Ljava/lang/Integer;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "defaultValue"    # Ljava/lang/Integer;

    .prologue
    const/4 v3, 0x0

    .line 516
    invoke-static {p1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "\'key\' cannot be null or empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 518
    :cond_0
    if-nez p2, :cond_1

    move-object v2, v3

    :goto_0
    invoke-virtual {p0, p1, v2}, Lcom/getjar/sdk/comm/GetJarConfig;->getDirectiveValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 519
    .local v1, "value":Ljava/lang/String;
    invoke-static {v1}, Lcom/getjar/sdk/utilities/StringUtility;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    if-nez p2, :cond_2

    .line 523
    :goto_1
    return-object v3

    .line 518
    .end local v1    # "value":Ljava/lang/String;
    :cond_1
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_0

    .line 523
    .restart local v1    # "value":Ljava/lang/String;
    :cond_2
    :try_start_0
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    goto :goto_1

    .line 524
    :catch_0
    move-exception v0

    .line 525
    .local v0, "e":Ljava/lang/NumberFormatException;
    new-instance v2, Lcom/getjar/sdk/exceptions/ConfigurationException;

    invoke-direct {v2, v0}, Lcom/getjar/sdk/exceptions/ConfigurationException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method
