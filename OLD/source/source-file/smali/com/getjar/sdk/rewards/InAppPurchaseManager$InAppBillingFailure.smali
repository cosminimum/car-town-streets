.class public final enum Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;
.super Ljava/lang/Enum;
.source "InAppPurchaseManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/InAppPurchaseManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InAppBillingFailure"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum BILLING_NOT_SUPPORTED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum CANCELLED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum GOOGLE_PLAY_BIND_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum ITEM_NOT_AVAILABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum NETWORK_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

.field public static final enum UNAUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 357
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "CANCELLED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->CANCELLED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 360
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "ITEM_NOT_AVAILABLE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->ITEM_NOT_AVAILABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 363
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "GOOGLE_PLAY_BIND_FAILURE"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GOOGLE_PLAY_BIND_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 366
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "GETJAR_SERVICE_FAILURE"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 369
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "UNAUTHORIZED"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->UNAUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 372
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "BILLING_NOT_SUPPORTED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->BILLING_NOT_SUPPORTED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 375
    new-instance v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    const-string v1, "NETWORK_ERROR"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->NETWORK_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    .line 355
    const/4 v0, 0x7

    new-array v0, v0, [Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->CANCELLED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->ITEM_NOT_AVAILABLE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GOOGLE_PLAY_BIND_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->GETJAR_SERVICE_FAILURE:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->UNAUTHORIZED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->BILLING_NOT_SUPPORTED:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->NETWORK_ERROR:Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->$VALUES:[Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

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
    .line 355
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 355
    const-class v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;
    .locals 1

    .prologue
    .line 355
    sget-object v0, Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->$VALUES:[Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/InAppPurchaseManager$InAppBillingFailure;

    return-object v0
.end method
