.class public final enum Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;
.super Ljava/lang/Enum;
.source "InstallStateManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/install_state/InstallStateManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InstallState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

.field public static final enum FOUND_INSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

.field public static final enum FOUND_UNINSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 22
    new-instance v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    const-string v1, "FOUND_INSTALLED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_INSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    .line 23
    new-instance v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    const-string v1, "FOUND_UNINSTALLED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    .line 21
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    sget-object v1, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_INSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->$VALUES:[Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

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
    .line 21
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 21
    const-class v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;
    .locals 1

    .prologue
    .line 21
    sget-object v0, Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->$VALUES:[Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/install_state/InstallStateManager$InstallState;

    return-object v0
.end method
