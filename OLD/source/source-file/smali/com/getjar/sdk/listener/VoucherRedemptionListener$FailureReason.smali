.class public final enum Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
.super Ljava/lang/Enum;
.source "VoucherRedemptionListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/listener/VoucherRedemptionListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "FailureReason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

.field public static final enum ALREADY_LICENSED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

.field public static final enum ALREADY_REDEEMED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

.field public static final enum GENERAL:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

.field public static final enum INVALID_VOUCHER:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

.field public static final enum NETWORK:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    const-string v1, "NETWORK"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->NETWORK:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 19
    new-instance v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    const-string v1, "INVALID_VOUCHER"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->INVALID_VOUCHER:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 21
    new-instance v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    const-string v1, "ALREADY_REDEEMED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->ALREADY_REDEEMED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 23
    new-instance v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    const-string v1, "ALREADY_LICENSED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->ALREADY_LICENSED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 25
    new-instance v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    const-string v1, "GENERAL"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->GENERAL:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    .line 15
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    sget-object v1, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->NETWORK:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->INVALID_VOUCHER:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->ALREADY_REDEEMED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->ALREADY_LICENSED:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->GENERAL:Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    aput-object v1, v0, v6

    sput-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->$VALUES:[Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

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
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 15
    const-class v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->$VALUES:[Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    invoke-virtual {v0}, [Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/listener/VoucherRedemptionListener$FailureReason;

    return-object v0
.end method
