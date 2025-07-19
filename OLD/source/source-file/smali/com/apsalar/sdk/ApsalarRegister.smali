.class Lcom/apsalar/sdk/ApsalarRegister;
.super Lcom/apsalar/sdk/ApsalarEvent;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;


# instance fields
.field protected registerName:Ljava/lang/String;

.field protected registerType:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 518
    invoke-direct {p0, p3}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 512
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerType:Ljava/lang/String;

    .line 513
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerName:Ljava/lang/String;

    .line 519
    iput-object p1, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerType:Ljava/lang/String;

    .line 520
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerName:Ljava/lang/String;

    .line 521
    return-void
.end method


# virtual methods
.method public REST()I
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 552
    invoke-super {p0}, Lcom/apsalar/sdk/ApsalarEvent;->REST()I

    move-result v1

    .line 554
    if-ne v1, v4, :cond_1

    .line 555
    const/4 v0, 0x0

    .line 556
    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerType:Ljava/lang/String;

    const-string v3, "C"

    if-ne v2, v3, :cond_2

    .line 557
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apsalar/sdk/ApsalarItem;

    .line 563
    :cond_0
    :goto_0
    if-eqz v0, :cond_1

    .line 564
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v0, Lcom/apsalar/sdk/ApsalarItem;->connected:Ljava/lang/Boolean;

    .line 565
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    iput-object v2, v0, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    .line 568
    :cond_1
    return v1

    .line 559
    :cond_2
    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerType:Ljava/lang/String;

    const-string v3, "T"

    if-ne v2, v3, :cond_0

    .line 560
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_triggers:Ljava/util/HashMap;

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerName:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apsalar/sdk/ApsalarItem;

    goto :goto_0
.end method

.method protected init()V
    .locals 1

    .prologue
    .line 524
    const-string v0, "http://e.apsalar.com/api/v1/register"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRegister;->urlbase:Ljava/lang/String;

    .line 525
    const/4 v0, 0x5

    iput v0, p0, Lcom/apsalar/sdk/ApsalarRegister;->eventType:I

    .line 526
    return-void
.end method

.method protected makeURL()V
    .locals 4

    .prologue
    .line 529
    const-string v0, ""

    .line 532
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "?a="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&av="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&i="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&p="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&rt="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&s="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&sdk="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&type="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerType:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&u="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&name="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarRegister;->registerName:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 548
    :goto_0
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarRegister;->url:Ljava/lang/String;

    .line 549
    return-void

    .line 543
    :catch_0
    move-exception v1

    goto :goto_0
.end method
