.class public final enum Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;
.super Ljava/lang/Enum;
.source "DBTransactions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/persistence/DBTransactions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NotificationState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

.field public static final enum FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

.field public static final enum NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

.field public static final enum NO_GOLD:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

.field public static final enum SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 72
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 77
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    const-string v1, "NO_GOLD"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NO_GOLD:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 79
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    const-string v1, "FAILED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 81
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    const-string v1, "SUCCEEDED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    .line 70
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->NO_GOLD:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->FAILED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->SUCCEEDED:Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

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
    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$NotificationState;

    return-object v0
.end method
