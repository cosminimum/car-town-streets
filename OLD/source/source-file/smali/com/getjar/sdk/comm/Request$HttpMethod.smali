.class public final enum Lcom/getjar/sdk/comm/Request$HttpMethod;
.super Ljava/lang/Enum;
.source "Request.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "HttpMethod"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/Request$HttpMethod;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/Request$HttpMethod;

.field public static final enum GET:Lcom/getjar/sdk/comm/Request$HttpMethod;

.field public static final enum POST:Lcom/getjar/sdk/comm/Request$HttpMethod;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 42
    new-instance v0, Lcom/getjar/sdk/comm/Request$HttpMethod;

    const-string v1, "GET"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/Request$HttpMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$HttpMethod;->GET:Lcom/getjar/sdk/comm/Request$HttpMethod;

    .line 43
    new-instance v0, Lcom/getjar/sdk/comm/Request$HttpMethod;

    const-string v1, "POST"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/Request$HttpMethod;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Request$HttpMethod;->POST:Lcom/getjar/sdk/comm/Request$HttpMethod;

    .line 41
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/comm/Request$HttpMethod;

    sget-object v1, Lcom/getjar/sdk/comm/Request$HttpMethod;->GET:Lcom/getjar/sdk/comm/Request$HttpMethod;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/Request$HttpMethod;->POST:Lcom/getjar/sdk/comm/Request$HttpMethod;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/comm/Request$HttpMethod;->$VALUES:[Lcom/getjar/sdk/comm/Request$HttpMethod;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/Request$HttpMethod;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 41
    const-class v0, Lcom/getjar/sdk/comm/Request$HttpMethod;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/Request$HttpMethod;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/Request$HttpMethod;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/getjar/sdk/comm/Request$HttpMethod;->$VALUES:[Lcom/getjar/sdk/comm/Request$HttpMethod;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/Request$HttpMethod;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/Request$HttpMethod;

    return-object v0
.end method
