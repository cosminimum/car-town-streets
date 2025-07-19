.class public final enum Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
.super Ljava/lang/Enum;
.source "DBTransactions.java"

# interfaces
.implements Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/persistence/DBTransactions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PurchaseState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;",
        ">;",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

.field public static final enum CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

.field public static final enum CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

.field public static final enum CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

.field public static final enum DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

.field public static final enum RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 37
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    const-string v1, "CREATED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 38
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    const-string v1, "RESERVING"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 39
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    const-string v1, "CANCELING"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 40
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    const-string v1, "CONFIRMING"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 41
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    const-string v1, "DONE"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    .line 36
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    aput-object v1, v0, v6

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

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
    .line 36
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 36
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$PurchaseState;

    return-object v0
.end method
