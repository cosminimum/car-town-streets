.class public final enum Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
.super Ljava/lang/Enum;
.source "BlacklistedResponse.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/response/BlacklistedResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "BlacklistType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

.field public static final enum APP:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

.field public static final enum DEVICE:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

.field public static final enum USER:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 21
    new-instance v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    const-string v1, "DEVICE"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->DEVICE:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 23
    new-instance v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    const-string v1, "USER"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->USER:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 25
    new-instance v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    const-string v1, "APP"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->APP:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    .line 19
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    sget-object v1, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->DEVICE:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->USER:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->APP:Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->$VALUES:[Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

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
    .line 19
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 19
    const-class v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;
    .locals 1

    .prologue
    .line 19
    sget-object v0, Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->$VALUES:[Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/response/BlacklistedResponse$BlacklistType;

    return-object v0
.end method
