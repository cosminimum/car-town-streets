.class public final enum Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;
.super Ljava/lang/Enum;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ErrorType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

.field public static final enum AUTH:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

.field public static final enum NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

.field public static final enum SERVICE:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 106
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v1, "AUTH"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->AUTH:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    .line 107
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v1, "SERVICE"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->SERVICE:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    .line 108
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    const-string v1, "NETWORK"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    .line 105
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->AUTH:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->SERVICE:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->NETWORK:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->$VALUES:[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

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
    .line 105
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 105
    const-class v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->$VALUES:[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$ErrorType;

    return-object v0
.end method
