.class public final enum Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;
.super Ljava/lang/Enum;
.source "DBTransactions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/persistence/DBTransactions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EarnState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

.field public static final enum CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

.field public static final enum DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

.field public static final enum EARNING:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 64
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    const-string v1, "CREATED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    .line 65
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    const-string v1, "EARNING"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->EARNING:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    .line 66
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    const-string v1, "DONE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    .line 63
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->EARNING:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

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
    .line 63
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 63
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;
    .locals 1

    .prologue
    .line 63
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$EarnState;

    return-object v0
.end method
