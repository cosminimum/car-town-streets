.class public final enum Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;
.super Ljava/lang/Enum;
.source "JavaScriptAPI.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/JavaScriptAPI;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AccountStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

.field public static final enum CURRENT:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

.field public static final enum PREVIOUS:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

.field public static final enum UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 66
    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    const-string v1, "CURRENT"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->CURRENT:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    const-string v1, "PREVIOUS"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->PREVIOUS:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    new-instance v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->CURRENT:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->PREVIOUS:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->UNKNOWN:Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->$VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

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
    .line 66
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 66
    const-class v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;
    .locals 1

    .prologue
    .line 66
    sget-object v0, Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->$VALUES:[Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/JavaScriptAPI$AccountStatus;

    return-object v0
.end method
