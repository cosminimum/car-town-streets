.class public final enum Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;
.super Ljava/lang/Enum;
.source "EarnStateDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/earning/EarnStateDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NotificationState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

.field public static final enum DONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

.field public static final enum INSTALL_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

.field public static final enum NONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

.field public static final enum OPEN_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 43
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->NONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    .line 45
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    const-string v1, "INSTALL_REMINDER"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->INSTALL_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    .line 47
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    const-string v1, "OPEN_REMINDER"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->OPEN_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    .line 49
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    const-string v1, "DONE"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->DONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    .line 41
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->NONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->INSTALL_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->OPEN_REMINDER:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->DONE:Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->$VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

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

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 41
    const-class v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;
    .locals 1

    .prologue
    .line 41
    sget-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->$VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$NotificationState;

    return-object v0
.end method
