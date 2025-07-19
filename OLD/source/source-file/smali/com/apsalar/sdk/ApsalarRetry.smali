.class Lcom/apsalar/sdk/ApsalarRetry;
.super Lcom/apsalar/sdk/ApsalarEvent;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;


# direct methods
.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 486
    invoke-direct {p0}, Lcom/apsalar/sdk/ApsalarEvent;-><init>()V

    .line 487
    return-void
.end method


# virtual methods
.method public REST()I
    .locals 3

    .prologue
    .line 496
    :try_start_0
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRetry;->urlbase:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "?u=-1"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 497
    sget-object v1, Lcom/apsalar/sdk/ApsalarRetry;->client:Lorg/apache/http/client/HttpClient;

    new-instance v2, Lorg/apache/http/impl/client/BasicResponseHandler;

    invoke-direct {v2}, Lorg/apache/http/impl/client/BasicResponseHandler;-><init>()V

    invoke-interface {v1, v0, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/client/ResponseHandler;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRetry;->returnData:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 507
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 499
    :catch_0
    move-exception v0

    .line 502
    const/4 v0, -0x1

    goto :goto_0
.end method

.method protected init()V
    .locals 1

    .prologue
    .line 480
    const-string v0, "http://e.apsalar.com/api/v1/event"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRetry;->urlbase:Ljava/lang/String;

    .line 482
    const/4 v0, -0x1

    iput v0, p0, Lcom/apsalar/sdk/ApsalarRetry;->eventType:I

    .line 483
    return-void
.end method
