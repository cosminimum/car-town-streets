.class public final enum Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;
.super Ljava/lang/Enum;
.source "EarnStateDatabase.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/earning/EarnStateDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EarnState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

.field public static final enum FAIL:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

.field public static final enum SUCCESS:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 35
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->SUCCESS:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    .line 37
    new-instance v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    const-string v1, "FAIL"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->FAIL:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    .line 33
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->SUCCESS:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->FAIL:Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->$VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

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
    .line 33
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 33
    const-class v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->$VALUES:[Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/earning/EarnStateDatabase$EarnState;

    return-object v0
.end method
