.class public final enum Lcom/getjar/sdk/utilities/Constants$PurchaseState;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "PurchaseState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/Constants$PurchaseState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/Constants$PurchaseState;

.field public static final enum CANCELED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

.field public static final enum PURCHASED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

.field public static final enum REFUNDED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 129
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    const-string v1, "PURCHASED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->PURCHASED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    .line 130
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    const-string v1, "CANCELED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->CANCELED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    .line 131
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    const-string v1, "REFUNDED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->REFUNDED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    .line 127
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->PURCHASED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->CANCELED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->REFUNDED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$PurchaseState;

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
    .line 127
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(I)Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 135
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->values()[Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    move-result-object v0

    .line 136
    .local v0, "values":[Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    if-ltz p0, :cond_0

    array-length v1, v0

    if-lt p0, v1, :cond_1

    .line 137
    :cond_0
    sget-object v1, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->CANCELED:Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    .line 139
    :goto_0
    return-object v1

    :cond_1
    aget-object v1, v0, p0

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 127
    const-class v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/Constants$PurchaseState;
    .locals 1

    .prologue
    .line 127
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$PurchaseState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/Constants$PurchaseState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/Constants$PurchaseState;

    return-object v0
.end method
