.class public final enum Lcom/getjar/sdk/comm/Operation$Status;
.super Ljava/lang/Enum;
.source "Operation.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/Operation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Status"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/Operation$Status;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/Operation$Status;

.field public static final enum CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

.field public static final enum COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

.field public static final enum CREATED:Lcom/getjar/sdk/comm/Operation$Status;

.field public static final enum RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

.field public static final enum RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

.field public static final enum WAITING:Lcom/getjar/sdk/comm/Operation$Status;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 45
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Status;

    const-string v1, "CREATED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/Operation$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->CREATED:Lcom/getjar/sdk/comm/Operation$Status;

    .line 47
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Status;

    const-string v1, "WAITING"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/Operation$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->WAITING:Lcom/getjar/sdk/comm/Operation$Status;

    .line 49
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Status;

    const-string v1, "RUNNING"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/Operation$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    .line 51
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Status;

    const-string v1, "RETRYING"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/comm/Operation$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    .line 53
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Status;

    const-string v1, "CANCELLED"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/comm/Operation$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    .line 55
    new-instance v0, Lcom/getjar/sdk/comm/Operation$Status;

    const-string v1, "COMPLETED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/Operation$Status;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    .line 43
    const/4 v0, 0x6

    new-array v0, v0, [Lcom/getjar/sdk/comm/Operation$Status;

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->CREATED:Lcom/getjar/sdk/comm/Operation$Status;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->WAITING:Lcom/getjar/sdk/comm/Operation$Status;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->RUNNING:Lcom/getjar/sdk/comm/Operation$Status;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->RETRYING:Lcom/getjar/sdk/comm/Operation$Status;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/comm/Operation$Status;->CANCELLED:Lcom/getjar/sdk/comm/Operation$Status;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/comm/Operation$Status;->COMPLETED:Lcom/getjar/sdk/comm/Operation$Status;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/comm/Operation$Status;->$VALUES:[Lcom/getjar/sdk/comm/Operation$Status;

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
    .line 43
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/Operation$Status;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 43
    const-class v0, Lcom/getjar/sdk/comm/Operation$Status;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/Operation$Status;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/Operation$Status;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lcom/getjar/sdk/comm/Operation$Status;->$VALUES:[Lcom/getjar/sdk/comm/Operation$Status;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/Operation$Status;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/Operation$Status;

    return-object v0
.end method
