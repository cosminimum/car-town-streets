.class public final enum Lcom/getjar/sdk/comm/CommManager$LaunchWork;
.super Ljava/lang/Enum;
.source "CommManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/CommManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LaunchWork"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/CommManager$LaunchWork;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/CommManager$LaunchWork;

.field public static final enum ALL:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

.field public static final enum DEALS:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

.field public static final enum NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 85
    new-instance v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .line 87
    new-instance v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    const-string v1, "DEALS"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->DEALS:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .line 89
    new-instance v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    const-string v1, "ALL"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/CommManager$LaunchWork;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->ALL:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    .line 83
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    sget-object v1, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->NONE:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->DEALS:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->ALL:Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->$VALUES:[Lcom/getjar/sdk/comm/CommManager$LaunchWork;

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
    .line 83
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/CommManager$LaunchWork;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 83
    const-class v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/CommManager$LaunchWork;
    .locals 1

    .prologue
    .line 83
    sget-object v0, Lcom/getjar/sdk/comm/CommManager$LaunchWork;->$VALUES:[Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/CommManager$LaunchWork;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/CommManager$LaunchWork;

    return-object v0
.end method
