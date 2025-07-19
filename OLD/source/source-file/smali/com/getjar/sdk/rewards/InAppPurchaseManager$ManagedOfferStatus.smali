.class public final enum Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
.super Ljava/lang/Enum;
.source "InAppPurchaseManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/InAppPurchaseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ManagedOfferStatus"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum ALREADY_LICENSED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum ALREADY_RESERVED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum GOOGLE_FAILURE_AFTER_PURCHASE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum GOOGLE_RELATED_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum INVALID_DATA:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum NOT_AUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum OFFER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum RESERVATION_TIMED_OUT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum SDK_INTERNAL_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum SERVER_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum SERVER_ERROR_RECOVERABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum SUCCESS:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

.field public static final enum USER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 446
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SUCCESS:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 447
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "SDK_INTERNAL_ERROR"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SDK_INTERNAL_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 448
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "RESERVATION_TIMED_OUT"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->RESERVATION_TIMED_OUT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 449
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "SERVER_ERROR"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 450
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "SERVER_ERROR_RECOVERABLE"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR_RECOVERABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 451
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "NOT_AUTHORIZED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->NOT_AUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 452
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "INVALID_DATA"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->INVALID_DATA:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 453
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "GOOGLE_RELATED_FAILURE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_RELATED_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 454
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "GOOGLE_FAILURE_AFTER_PURCHASE"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_FAILURE_AFTER_PURCHASE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 455
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "ALREADY_RESERVED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->ALREADY_RESERVED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 456
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "ALREADY_LICENSED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->ALREADY_LICENSED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 457
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "USER_PURCHASE_LIMIT"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->USER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 458
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    const-string v1, "OFFER_PURCHASE_LIMIT"

    const/16 v2, 0xc

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->OFFER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    .line 445
    const/16 v0, 0xd

    new-array v0, v0, [Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SUCCESS:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SDK_INTERNAL_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->RESERVATION_TIMED_OUT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->SERVER_ERROR_RECOVERABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->NOT_AUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->INVALID_DATA:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_RELATED_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->GOOGLE_FAILURE_AFTER_PURCHASE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->ALREADY_RESERVED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->ALREADY_LICENSED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->USER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    const/16 v1, 0xc

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->OFFER_PURCHASE_LIMIT:Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->$VALUES:[Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

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
    .line 445
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 445
    const-class v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;
    .locals 1

    .prologue
    .line 445
    sget-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->$VALUES:[Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/InAppPurchaseManager$ManagedOfferStatus;

    return-object v0
.end method
