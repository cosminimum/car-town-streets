.class Lcom/apsalar/sdk/ApsalarSession;
.super Lcom/apsalar/sdk/ApsalarEvent;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;
.implements Lcom/apsalar/sdk/ApsalarJSON;


# instance fields
.field private returndata:Ljava/lang/String;

.field private triggerInfo:[Ljava/lang/String;

.field private triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;


# direct methods
.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 293
    invoke-direct {p0, p1}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 283
    iput-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    .line 284
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    .line 285
    iput-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->returndata:Ljava/lang/String;

    .line 294
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Lcom/apsalar/sdk/LoadTriggerTask;[Ljava/lang/String;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 299
    invoke-direct {p0, p1}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 283
    iput-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    .line 284
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    .line 285
    iput-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->returndata:Ljava/lang/String;

    .line 300
    iput-object p2, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    .line 301
    iput-object p3, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    .line 302
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Lorg/json/JSONObject;)V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 305
    invoke-direct {p0, p1, p2}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Lorg/json/JSONObject;)V

    .line 283
    iput-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    .line 284
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/String;

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    .line 285
    iput-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->returndata:Ljava/lang/String;

    .line 306
    return-void
.end method

.method private registerEntryPoints(Lorg/json/JSONObject;)V
    .locals 6

    .prologue
    .line 346
    iget-object v0, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    if-nez v0, :cond_1

    .line 409
    :cond_0
    :goto_0
    return-void

    .line 350
    :cond_1
    :try_start_0
    const-string v0, "result"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/json/JSONObject;

    .line 356
    const-string v1, "Callbacks"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    .line 357
    const/4 v1, 0x0

    move v2, v1

    :goto_1
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v1

    if-ge v2, v1, :cond_3

    .line 358
    sget-object v1, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apsalar/sdk/ApsalarItem;

    .line 359
    if-eqz v1, :cond_2

    .line 360
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v1, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    .line 357
    :goto_2
    add-int/lit8 v1, v2, 0x1

    move v2, v1

    goto :goto_1

    .line 363
    :cond_2
    new-instance v1, Lcom/apsalar/sdk/ApsalarItem;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-direct {v1, v4, v5}, Lcom/apsalar/sdk/ApsalarItem;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 364
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v1, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    .line 365
    sget-object v4, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 404
    :catch_0
    move-exception v0

    goto :goto_0

    .line 370
    :cond_3
    const-string v1, "Triggers"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 371
    invoke-virtual {v2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 374
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 375
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 376
    sget-object v1, Lcom/apsalar/sdk/Apsalar;->registered_triggers:Ljava/util/HashMap;

    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/apsalar/sdk/ApsalarItem;

    .line 378
    if-eqz v1, :cond_4

    .line 379
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v1, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    .line 380
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, v1, Lcom/apsalar/sdk/ApsalarItem;->connected:Ljava/lang/Boolean;

    goto :goto_3

    .line 385
    :cond_4
    new-instance v1, Lcom/apsalar/sdk/ApsalarItem;

    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    invoke-direct {v1, v0, v4}, Lcom/apsalar/sdk/ApsalarItem;-><init>(Ljava/lang/String;Ljava/lang/Object;)V

    .line 386
    const/4 v4, 0x1

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v1, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    .line 387
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->getBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    iput-object v4, v1, Lcom/apsalar/sdk/ApsalarItem;->connected:Ljava/lang/Boolean;

    .line 388
    sget-object v4, Lcom/apsalar/sdk/Apsalar;->registered_triggers:Ljava/util/HashMap;

    invoke-virtual {v4, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 394
    :cond_5
    sget-object v0, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 395
    :cond_6
    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 396
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 397
    sget-object v2, Lcom/apsalar/sdk/Apsalar;->registered_callbacks:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/apsalar/sdk/ApsalarItem;

    .line 398
    iget-object v2, v0, Lcom/apsalar/sdk/ApsalarItem;->registered:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_6

    .line 399
    new-instance v2, Lcom/apsalar/sdk/ApsalarRegister;

    const-string v3, "C"

    iget-object v0, v0, Lcom/apsalar/sdk/ApsalarItem;->name:Ljava/lang/String;

    iget-object v4, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    invoke-direct {v2, v3, v0, v4}, Lcom/apsalar/sdk/ApsalarRegister;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 400
    invoke-virtual {v2}, Lcom/apsalar/sdk/ApsalarRegister;->REST()I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_4
.end method


# virtual methods
.method public REST()I
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 412
    invoke-super {p0}, Lcom/apsalar/sdk/ApsalarEvent;->REST()I

    move-result v0

    .line 414
    if-eq v0, v4, :cond_1

    .line 415
    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    if-eqz v1, :cond_0

    .line 416
    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    invoke-virtual {v1, v4}, Lcom/apsalar/sdk/LoadTriggerTask;->cancel(Z)Z

    .line 441
    :cond_0
    :goto_0
    return v0

    .line 420
    :cond_1
    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->returnDataJSON:Lorg/json/JSONObject;

    invoke-direct {p0, v1}, Lcom/apsalar/sdk/ApsalarSession;->registerEntryPoints(Lorg/json/JSONObject;)V

    .line 435
    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    array-length v1, v1

    if-lez v1, :cond_0

    .line 438
    iget-object v1, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerTask:Lcom/apsalar/sdk/LoadTriggerTask;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/String;

    iget-object v3, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    aget-object v3, v3, v5

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/apsalar/sdk/ApsalarSession;->triggerInfo:[Ljava/lang/String;

    aget-object v3, v3, v4

    aput-object v3, v2, v4

    invoke-virtual {v1, v2}, Lcom/apsalar/sdk/LoadTriggerTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method protected init()V
    .locals 1

    .prologue
    .line 288
    const-string v0, "http://e.apsalar.com/api/v1/start"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSession;->urlbase:Ljava/lang/String;

    .line 289
    const/4 v0, 0x1

    iput v0, p0, Lcom/apsalar/sdk/ApsalarSession;->eventType:I

    .line 290
    return-void
.end method

.method protected makeURL()V
    .locals 4

    .prologue
    .line 309
    const-string v0, ""

    .line 312
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "?a="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->apiKey:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&ab="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->abi:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&av="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->appVersion:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&br="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->brand:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&c="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->connType:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&de="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->device:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&i="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->clsPackage:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&ma="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->manufacturer:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&mo="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->model:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&n="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->appName:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&p="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->platform:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&pr="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->product:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&rt="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->retType:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&s="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sessionId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&sdk="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->sdkVersion:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&u="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->deviceId:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "&v="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/apsalar/sdk/ApsalarSession;->info:Lcom/apsalar/sdk/ApsalarSessionInfo;

    iget-object v2, v2, Lcom/apsalar/sdk/ApsalarSessionInfo;->osVersion:Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-static {v2, v3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 337
    :goto_0
    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarSession;->url:Ljava/lang/String;

    .line 338
    return-void

    .line 332
    :catch_0
    move-exception v1

    goto :goto_0
.end method
