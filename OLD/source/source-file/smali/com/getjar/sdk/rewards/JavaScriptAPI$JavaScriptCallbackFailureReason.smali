.class public final enum Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
.super Ljava/lang/Enum;
.source "JavaScriptAPI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "JavaScriptCallbackFailureReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum ALREADY_LICENSED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum ALREADY_RESERVED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum NETWORK:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum NONE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum OFFER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

.field public static final enum USER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 60
    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NONE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "MARKETPLACE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "NETWORK"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NETWORK:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "ALREADY_RESERVED"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->ALREADY_RESERVED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "ALREADY_LICENSED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->ALREADY_LICENSED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "USER_PURCHASE_LIMIT"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->USER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const-string v1, "OFFER_PURCHASE_LIMIT"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->OFFER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    const/16 v0, 0x8

    new-array v0, v0, [Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NONE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->MARKETPLACE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->NETWORK:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->ALREADY_RESERVED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->ALREADY_LICENSED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->USER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->OFFER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->$VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

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
    .line 60
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 60
    const-class v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;
    .locals 1

    .prologue
    .line 60
    sget-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->$VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptCallbackFailureReason;

    return-object v0
.end method
