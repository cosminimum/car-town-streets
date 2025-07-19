.class Lcom/apsalar/sdk/ApsalarTrigger;
.super Lcom/apsalar/sdk/ApsalarEvent;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;


# instance fields
.field protected name:Ljava/lang/String;

.field protected queryParams:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 590
    invoke-direct {p0, p2}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 573
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->name:Ljava/lang/String;

    .line 574
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->queryParams:Ljava/lang/String;

    .line 591
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarTrigger;->name:Ljava/lang/String;

    .line 592
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 583
    invoke-direct {p0, p3}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 573
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->name:Ljava/lang/String;

    .line 574
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->queryParams:Ljava/lang/String;

    .line 584
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarTrigger;->name:Ljava/lang/String;

    .line 585
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->queryParams:Ljava/lang/String;

    .line 586
    return-void
.end method


# virtual methods
.method protected init()V
    .locals 1

    .prologue
    .line 577
    const-string v0, "http://e.apsalar.com/api/v1/trigger"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->urlbase:Ljava/lang/String;

    .line 578
    const/4 v0, 0x5

    iput v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->eventType:I

    .line 579
    return-void
.end method

.method protected makeURL()V
    .locals 4

    .prologue
    .line 595
    const-string v0, ""

    .line 603
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "?a="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&i="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&p="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&s="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&sdk="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&u="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 609
    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarTrigger;->queryParams:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 611
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&y="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "://apsalar/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/apsalar/sdk/ApsalarTrigger;->name:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/apsalar/sdk/ApsalarTrigger;->queryParams:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 622
    :goto_0
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarTrigger;->url:Ljava/lang/String;

    .line 623
    return-void

    .line 614
    :cond_0
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&y="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarTrigger;->name:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v0

    goto :goto_0

    .line 617
    :catch_0
    move-exception v1

    goto :goto_0
.end method
