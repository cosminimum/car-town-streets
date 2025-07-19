.class public final enum Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
.super Ljava/lang/Enum;
.source "JavaScriptAPI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "JavaScriptRedeemIntentResult"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

.field public static final enum SUCCESS:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

.field public static final enum TARGET_DISABLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

.field public static final enum TARGET_NOT_INSTALLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

.field public static final enum UNKNOWN_FAILURE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 63
    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->SUCCESS:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    const-string v1, "TARGET_DISABLED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->TARGET_DISABLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    const-string v1, "TARGET_NOT_INSTALLED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->TARGET_NOT_INSTALLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    const-string v1, "UNKNOWN_FAILURE"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->UNKNOWN_FAILURE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->SUCCESS:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->TARGET_DISABLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->TARGET_NOT_INSTALLED:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->UNKNOWN_FAILURE:Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->$VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

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
    .line 63
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    const-class v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->$VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/JavaScriptAPI$JavaScriptRedeemIntentResult;

    return-object v0
.end method
