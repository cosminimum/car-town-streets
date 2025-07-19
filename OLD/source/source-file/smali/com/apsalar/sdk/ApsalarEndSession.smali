.class Lcom/apsalar/sdk/ApsalarEndSession;
.super Lcom/apsalar/sdk/ApsalarEvent;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;
.implements Lcom/apsalar/sdk/ApsalarJSON;


# direct methods
.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 0

    .prologue
    .line 466
    invoke-direct {p0, p1}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 467
    return-void
.end method

.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Lorg/json/JSONObject;)V
    .locals 0

    .prologue
    .line 470
    invoke-direct {p0, p1, p2}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;Lorg/json/JSONObject;)V

    .line 471
    return-void
.end method


# virtual methods
.method protected init()V
    .locals 1

    .prologue
    .line 459
    const-string v0, "http://e.apsalar.com/api/v1/event"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEndSession;->urlbase:Ljava/lang/String;

    .line 460
    const/4 v0, 0x4

    iput v0, p0, Lcom/apsalar/sdk/ApsalarEndSession;->eventType:I

    .line 461
    const-string v0, "end_session"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEndSession;->eventName:Ljava/lang/String;

    .line 462
    const-string v0, "{}"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarEndSession;->eventData:Ljava/lang/String;

    .line 463
    return-void
.end method
