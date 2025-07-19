.class public final enum Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;
.super Ljava/lang/Enum;
.source "EarnStateDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/earning/EarnStateDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

.field public static final enum DOWNLOADED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

.field public static final enum INSTALLED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

.field public static final enum OPENED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 25
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    const-string v1, "DOWNLOADED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->DOWNLOADED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    .line 27
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    const-string v1, "INSTALLED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->INSTALLED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    .line 29
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    const-string v1, "OPENED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->OPENED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    .line 23
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->DOWNLOADED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->INSTALLED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->OPENED:Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->$VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

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
    .line 23
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    const-class v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->$VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$Status;

    return-object v0
.end method
