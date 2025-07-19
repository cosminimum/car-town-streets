.class public final enum Lcom/getjar/sdk/utilities/Constants$AppState;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "AppState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/Constants$AppState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/Constants$AppState;

.field public static final enum INSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

.field public static final enum RUNNING:Lcom/getjar/sdk/utilities/Constants$AppState;

.field public static final enum UNINSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 257
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$AppState;

    const-string v1, "UNINSTALLED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$AppState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->UNINSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$AppState;

    const-string v1, "INSTALLED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/Constants$AppState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->INSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$AppState;

    const-string v1, "RUNNING"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/utilities/Constants$AppState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->RUNNING:Lcom/getjar/sdk/utilities/Constants$AppState;

    .line 256
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/utilities/Constants$AppState;

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$AppState;->UNINSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$AppState;->INSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$AppState;->RUNNING:Lcom/getjar/sdk/utilities/Constants$AppState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$AppState;

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
    .line 256
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/Constants$AppState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 256
    const-class v0, Lcom/getjar/sdk/utilities/Constants$AppState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/Constants$AppState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/Constants$AppState;
    .locals 1

    .prologue
    .line 256
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$AppState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$AppState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/Constants$AppState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/Constants$AppState;

    return-object v0
.end method
