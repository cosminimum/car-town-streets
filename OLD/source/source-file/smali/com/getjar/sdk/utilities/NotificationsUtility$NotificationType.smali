.class public final enum Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;
.super Ljava/lang/Enum;
.source "NotificationsUtility.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/NotificationsUtility;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "NotificationType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

.field public static final enum INSTALL_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

.field public static final enum OPEN_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    const-string v1, "INSTALL_REMINDER"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->INSTALL_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    new-instance v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    const-string v1, "OPEN_REMINDER"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->OPEN_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    sget-object v1, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->INSTALL_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->OPEN_REMINDER:Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->$VALUES:[Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

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
    .line 25
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 25
    const-class v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;
    .locals 1

    .prologue
    .line 25
    sget-object v0, Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->$VALUES:[Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/NotificationsUtility$NotificationType;

    return-object v0
.end method
