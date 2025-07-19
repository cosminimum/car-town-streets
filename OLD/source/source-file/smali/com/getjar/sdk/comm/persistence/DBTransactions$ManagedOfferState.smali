.class public final enum Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
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
    name = "ManagedOfferState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;",
        ">;",
        "Lcom/getjar/sdk/comm/persistence/DBTransactions$TransactionState;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CANCELLED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CONFIRMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CONSUMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum PURCHASING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

.field public static final enum RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 48
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CREATED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 49
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "RESERVING"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 50
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "RESERVED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 51
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "PURCHASING"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 52
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "PURCHASED"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 53
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CONFIRMING"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 54
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CONFIRMED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 55
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CONSUMING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 56
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CONSUMED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 57
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CANCELING"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 58
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "CANCELLED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELLED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 59
    new-instance v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    const-string v1, "DONE"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    .line 47
    const/16 v0, 0xc

    new-array v0, v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CREATED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->RESERVED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->PURCHASED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONFIRMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CONSUMED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELING:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->CANCELLED:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->DONE:Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

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
    .line 47
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 47
    const-class v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;
    .locals 1

    .prologue
    .line 47
    sget-object v0, Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->$VALUES:[Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/persistence/DBTransactions$ManagedOfferState;

    return-object v0
.end method
