.class public final enum Lcom/getjar/sdk/utilities/Constants$ResponseCode;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ResponseCode"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/Constants$ResponseCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_BILLING_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_DEVELOPER_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_ITEM_ALREADY_OWNED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_ITEM_NOT_OWNED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_ITEM_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_SERVICE_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

.field public static final enum RESULT_USER_CANCELED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 106
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_OK"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 107
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_USER_CANCELED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_USER_CANCELED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 108
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_SERVICE_UNAVAILABLE"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_SERVICE_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 109
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_BILLING_UNAVAILABLE"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_BILLING_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 110
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_ITEM_UNAVAILABLE"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 111
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_DEVELOPER_ERROR"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_DEVELOPER_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 112
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_ERROR"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 113
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_ITEM_ALREADY_OWNED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_ALREADY_OWNED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 114
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    const-string v1, "RESULT_ITEM_NOT_OWNED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_NOT_OWNED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 105
    const/16 v0, 0x9

    new-array v0, v0, [Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_OK:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_USER_CANCELED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_SERVICE_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_BILLING_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_UNAVAILABLE:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_DEVELOPER_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_ALREADY_OWNED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ITEM_NOT_OWNED:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$ResponseCode;

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
    .line 105
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(I)Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    .locals 2
    .param p0, "index"    # I

    .prologue
    .line 118
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->values()[Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    move-result-object v0

    .line 119
    .local v0, "values":[Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    if-ltz p0, :cond_0

    array-length v1, v0

    if-lt p0, v1, :cond_1

    .line 120
    :cond_0
    sget-object v1, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->RESULT_ERROR:Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    .line 122
    :goto_0
    return-object v1

    :cond_1
    aget-object v1, v0, p0

    goto :goto_0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 105
    const-class v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/Constants$ResponseCode;
    .locals 1

    .prologue
    .line 105
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$ResponseCode;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/Constants$ResponseCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/Constants$ResponseCode;

    return-object v0
.end method
