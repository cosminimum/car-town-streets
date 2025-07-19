.class public final enum Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
.super Ljava/lang/Enum;
.source "DBTransactions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/persistence/DBTransactions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "TransactionType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

.field public static final enum EARN:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

.field public static final enum MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

.field public static final enum PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 30
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    const-string v1, "PURCHASE"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .line 31
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    const-string v1, "EARN"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->EARN:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .line 32
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    const-string v1, "MANAGED_OFFER"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    .line 29
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->PURCHASE:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->EARN:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->MANAGED_OFFER:Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

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
    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 29
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;
    .locals 1

    .prologue
    .line 29
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionType;

    return-object v0
.end method
