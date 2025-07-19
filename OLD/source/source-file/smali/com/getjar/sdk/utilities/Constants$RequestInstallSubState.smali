.class public final enum Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RequestInstallSubState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum ALREADY_REDEEMED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum CAP_EXCEEDED_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum CAP_REACHED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum DEPENDENT_SERVICE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum FUNDS_INSUFFICIENT_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum FUNDS_OVERDRAWN_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum INCOMPLETE_RECONCILE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum RECONCILE_DATA_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

.field public static final enum UNKNOWN_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 317
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "NONE"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 318
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "ALREADY_REDEEMED_FAILURE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ALREADY_REDEEMED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 319
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "INCOMPLETE_RECONCILE_FAILURE"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->INCOMPLETE_RECONCILE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 320
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "RECONCILE_DATA_FAILURE"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->RECONCILE_DATA_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 321
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "UNKNOWN_FAILURE"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->UNKNOWN_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 322
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "FUNDS_INSUFFICIENT_FAILURE"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_INSUFFICIENT_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 323
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "FUNDS_OVERDRAWN_WARNING"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_OVERDRAWN_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 324
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "CAP_REACHED_FAILURE"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->CAP_REACHED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 325
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "CAP_EXCEEDED_WARNING"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->CAP_EXCEEDED_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 326
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    const-string v1, "DEPENDENT_SERVICE_FAILURE"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->DEPENDENT_SERVICE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    .line 315
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ALREADY_REDEEMED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->INCOMPLETE_RECONCILE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->RECONCILE_DATA_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->UNKNOWN_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_INSUFFICIENT_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_OVERDRAWN_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->CAP_REACHED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->CAP_EXCEEDED_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->DEPENDENT_SERVICE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

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
    .line 315
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static KEY()Ljava/lang/String;
    .locals 1

    .prologue
    .line 371
    const-string v0, "request_install_substate"

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 315
    const-class v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;
    .locals 1

    .prologue
    .line 315
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 330
    const/4 v0, 0x0

    .line 331
    .local v0, "str":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    invoke-virtual {p0}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 363
    const-string v0, "NONE"

    .line 366
    :goto_0
    return-object v0

    .line 333
    :pswitch_0
    const-string v0, "NONE"

    .line 334
    goto :goto_0

    .line 336
    :pswitch_1
    const-string v0, "ALREADY_REDEEMED_FAILURE"

    .line 337
    goto :goto_0

    .line 339
    :pswitch_2
    const-string v0, "INCOMPLETE_RECONCILE_FAILURE"

    .line 340
    goto :goto_0

    .line 342
    :pswitch_3
    const-string v0, "RECONCILE_DATA_FAILURE"

    .line 343
    goto :goto_0

    .line 345
    :pswitch_4
    const-string v0, "UNKNOWN_FAILURE"

    .line 346
    goto :goto_0

    .line 348
    :pswitch_5
    const-string v0, "FUNDS_INSUFFICIENT_FAILURE"

    .line 349
    goto :goto_0

    .line 351
    :pswitch_6
    const-string v0, "FUNDS_OVERDRAWN_WARNING"

    .line 352
    goto :goto_0

    .line 354
    :pswitch_7
    const-string v0, "CAP_REACHED_FAILURE"

    .line 355
    goto :goto_0

    .line 357
    :pswitch_8
    const-string v0, "CAP_EXCEEDED_WARNING"

    .line 358
    goto :goto_0

    .line 360
    :pswitch_9
    const-string v0, "DEPENDENT_SERVICE_FAILURE"

    .line 361
    goto :goto_0

    .line 331
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method
