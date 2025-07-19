.class Lcom/apsalar/sdk/ApsalarHeartbeat;
.super Lcom/apsalar/sdk/ApsalarEvent;
.source "ApEvent.java"

# interfaces
.implements Lcom/apsalar/sdk/ApsalarAPI;


# direct methods
.method protected constructor <init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V
    .locals 0

    .prologue
    .line 453
    invoke-direct {p0, p1}, Lcom/apsalar/sdk/ApsalarEvent;-><init>(Lcom/apsalar/sdk/ApsalarSessionInfo;)V

    .line 454
    return-void
.end method


# virtual methods
.method protected init()V
    .locals 1

    .prologue
    .line 447
    const-string v0, "http://e.apsalar.com/api/v1/event"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarHeartbeat;->urlbase:Ljava/lang/String;

    .line 448
    const/4 v0, 0x2

    iput v0, p0, Lcom/apsalar/sdk/ApsalarHeartbeat;->eventType:I

    .line 449
    const-string v0, "heartbeat"

    iput-object v0, p0, Lcom/apsalar/sdk/ApsalarHeartbeat;->eventName:Ljava/lang/String;

    .line 450
    return-void
.end method
