.class Lcom/apsalar/sdk/ApsalarEvent;
.super Ljava/lang/Object;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;
.implements Lcom/apsalar/sdk/ApsalarJSON;


# static fields
.field protected static client:Lorg/apache/http/client/HttpClient;


# instance fields
.field protected eventData:Ljava/lang/String;

.field protected eventName:Ljava/lang/String;

.field protected eventTime:J

.field protected eventType:I

.field protected info:Lcom/apsalar/sdk/ApsalarSessionInfo;

.field protected returnData:Ljava/lang/String;

.field protected returnDataJSON:Lorg/json/JSONObject;

.field protected url:Ljava/lang/String;

.field protected urlbase:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/16 v3, 0xbb8

    .line 63
    new-instance v0, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v0}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 64
    sget-object v1, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 66
    const-string v1, "ISO-8859-1"

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 68
    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpProtocolParams;->setUseExpectContinue(Lorg/apache/http/params/HttpParams;Z)V

    .line 69
    const-string v1, "SDK/4.0.0"

    invoke-static {v0, v1}, Lorg/apache/http/params/HttpProtocolParams;->setUserAgent(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 70
    const-string v1, "http.connection.timeout"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 72
    const-string v1, "http.socket.timeout"

    new-instance v2, Ljava/lang/Integer;

    invoke-direct {v2, v3}, Ljava/lang/Integer;-><init>(I)V

    invoke-interface {v0, v1, v2}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 75
    new-instance v1, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v1}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 77
    new-instance v2, Lorg/apache/http/conn/scheme/Scheme;

    const-string v3, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v4

    const/16 v5, 0x50

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v1, v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 80
    new-instance v2, Lorg/apache/http/conn/scheme/Scheme;

    const-string v3, "https"

    invoke-static {}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->getSocketFactory()Lorg/apache/http/conn/ssl/SSLSocketFactory;

    move-result-object v4

    const/16 v5, 0x1bb

    invoke-direct {v2, v3, v4, v5}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v1, v2}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 85
    new-instance v2, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v2, v0, v1}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 88
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1, v2, v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V

    sput-object v1, Lcom/apsalar/sdk/ApsalarEvent;->client:Lorg/apache/http/client/HttpClient;

    .line 89
    return-void
.end method

.method protected constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "http://e.apsalar.com/api/v1"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    .line 94
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 100
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;

    .line 101
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    .line 109
    invoke-virtual {p0}, Lcom/apsalar/sdk/ApsalarEvent;->init()V

    .line 110
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "http://e.apsalar.com/api/v1"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    .line 94
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 100
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;

    .line 101
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    .line 113
    invoke-virtual {p0}, Lcom/apsalar/sdk/ApsalarEvent;->init()V

    .line 114
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 115
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "http://e.apsalar.com/api/v1"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    .line 94
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 100
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;

    .line 101
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    .line 118
    invoke-virtual {p0}, Lcom/apsalar/sdk/ApsalarEvent;->init()V

    .line 119
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 120
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 121
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 123
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "http://e.apsalar.com/api/v1"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    .line 94
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 100
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;

    .line 101
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    .line 124
    invoke-virtual {p0}, Lcom/apsalar/sdk/ApsalarEvent;->init()V

    .line 125
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 126
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 127
    iput-object p3, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    .line 128
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Lorg/json/JSONObject;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 130
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const-string v0, "http://e.apsalar.com/api/v1"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    .line 94
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 95
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    .line 96
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    .line 97
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 98
    const-string v0, ""

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    .line 99
    const/4 v0, 0x0

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 100
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;

    .line 101
    iput-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    .line 131
    invoke-virtual {p0}, Lcom/apsalar/sdk/ApsalarEvent;->init()V

    .line 132
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    .line 134
    :try_start_0
    const-string v0, "eventType"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 135
    const-string v0, "eventTime"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    .line 136
    const-string v0, "eventName"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    .line 137
    const-string v0, "eventData"

    invoke-virtual {p2, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 143
    :goto_0
    return-void

    .line 139
    :catch_0
    move-exception v0

    goto :goto_0
.end method


# virtual methods
.method public REST()I
    .locals 1

    .prologue
    .line 173
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/apsalar/sdk/ApsalarEvent;->REST(Ljava/lang/Boolean;)I

    move-result v0

    return v0
.end method

.method public REST(Ljava/lang/Boolean;)I
    .locals 6

    .prologue
    const/4 v0, -0x1

    const/4 v1, 0x0

    .line 180
    invoke-virtual {p0}, Lcom/apsalar/sdk/ApsalarEvent;->makeURL()V

    .line 182
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    sub-long/2addr v2, v4

    long-to-double v2, v2

    const-wide v4, 0x3f50624dd2f1a9fcL    # 0.001

    mul-double/2addr v2, v4

    .line 184
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "&lag="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2, v3}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 185
    const-string v3, ""

    .line 190
    :try_start_0
    const-string v3, "SHA-1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 191
    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->secret:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 192
    const-string v4, "UTF-8"

    invoke-virtual {v2, v4}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->update([B)V

    .line 193
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B

    move-result-object v3

    invoke-static {v3}, Lcom/apsalar/sdk/Apsalar;->hexDigest([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_4

    move-result-object v0

    .line 211
    :try_start_1
    new-instance v3, Lorg/apache/http/client/methods/HttpGet;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "&h="

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 220
    :try_start_2
    sget-object v0, Lcom/apsalar/sdk/ApsalarEvent;->client:Lorg/apache/http/client/HttpClient;

    new-instance v2, Lorg/apache/http/impl/client/BasicResponseHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/client/BasicResponseHandler;-><init>()V

    invoke-interface {v0, v3, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;
    :try_end_2
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 234
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 236
    :try_start_3
    new-instance v0, Lorg/json/JSONObject;

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnData:Ljava/lang/String;

    invoke-direct {v0, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    .line 237
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    const-string v2, "status"

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v2, "ok"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Throwable; {:try_start_3 .. :try_end_3} :catch_3

    move-result v0

    if-nez v0, :cond_0

    move v0, v1

    .line 253
    :goto_0
    return v0

    .line 213
    :catch_0
    move-exception v0

    move v0, v1

    .line 216
    goto :goto_0

    .line 222
    :catch_1
    move-exception v0

    move v0, v1

    .line 225
    goto :goto_0

    .line 227
    :catch_2
    move-exception v0

    move v0, v1

    .line 231
    goto :goto_0

    .line 244
    :catch_3
    move-exception v0

    move v0, v1

    .line 247
    goto :goto_0

    .line 253
    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    .line 200
    :catch_4
    move-exception v1

    goto :goto_0

    .line 195
    :catch_5
    move-exception v1

    goto :goto_0
.end method

.method public getInfo()Lcom/apsalar/sdk/ApsalarSessionInfo;
    .locals 1

    .prologue
    .line 261
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    return-object v0
.end method

.method public getRestResult()Lorg/json/JSONObject;
    .locals 1

    .prologue
    .line 257
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->returnDataJSON:Lorg/json/JSONObject;

    return-object v0
.end method

.method protected init()V
    .locals 1

    .prologue
    .line 104
    const-string v0, "http://e.apsalar.com/api/v1/event"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->urlbase:Ljava/lang/String;

    .line 105
    const/4 v0, 0x3

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    .line 106
    return-void
.end method

.method protected makeURL()V
    .locals 6

    .prologue
    .line 146
    iget-wide v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-wide v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionStart:J

    sub-long/2addr v0, v2

    long-to-double v0, v0

    const-wide v2, 0x3f50624dd2f1a9fcL    # 0.001

    mul-double v1, v0, v2

    .line 148
    const-string v0, ""

    .line 150
    :try_start_0
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "?a="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&av="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&e="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&i="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&n="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&p="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&rt="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&s="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&sdk="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v4, v4, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    const-string v5, "UTF-8"

    invoke-static {v4, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "&t="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&u="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 169
    :goto_0
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEvent;->url:Ljava/lang/String;

    .line 170
    return-void

    .line 164
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public toJSON()Lorg/json/JSONObject;
    .locals 4

    .prologue
    .line 265
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 268
    :try_start_0
    const-string v1, "eventType"

    iget v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventType:I

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 269
    const-string v1, "eventTime"

    iget-wide v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventTime:J

    invoke-virtual {v0, v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 270
    const-string v1, "eventName"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventName:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 271
    const-string v1, "eventData"

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarEvent;->eventData:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 278
    :goto_0
    return-object v0

    .line 273
    :catch_0
    move-exception v1

    goto :goto_0
.end method
