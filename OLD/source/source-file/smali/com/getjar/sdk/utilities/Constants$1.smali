.class synthetic Lcom/getjar/sdk/utilities/Constants$1;
.super Ljava/lang/Object;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallState:[I

.field static final synthetic $SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

.field static final synthetic $SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 331
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->values()[Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->NONE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_e

    :goto_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ALREADY_REDEEMED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_d

    :goto_1
    :try_start_2
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->INCOMPLETE_RECONCILE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_c

    :goto_2
    :try_start_3
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->RECONCILE_DATA_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_b

    :goto_3
    :try_start_4
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->UNKNOWN_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_a

    :goto_4
    :try_start_5
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_INSUFFICIENT_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_9

    :goto_5
    :try_start_6
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->FUNDS_OVERDRAWN_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_8

    :goto_6
    :try_start_7
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->CAP_REACHED_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_7

    :goto_7
    :try_start_8
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->CAP_EXCEEDED_WARNING:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_6

    :goto_8
    :try_start_9
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallSubState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->DEPENDENT_SERVICE_FAILURE:Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallSubState;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_5

    .line 297
    :goto_9
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->values()[Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallState:[I

    :try_start_a
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->INSTALL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_4

    :goto_a
    :try_start_b
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->SUCCESS:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_3

    :goto_b
    :try_start_c
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->FAIL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_2

    .line 267
    :goto_c
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->values()[Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallType:[I

    :try_start_d
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallType:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->EARN:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_1

    :goto_d
    :try_start_e
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallType:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->PURCHASE:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_0

    :goto_e
    return-void

    :catch_0
    move-exception v0

    goto :goto_e

    :catch_1
    move-exception v0

    goto :goto_d

    .line 297
    :catch_2
    move-exception v0

    goto :goto_c

    :catch_3
    move-exception v0

    goto :goto_b

    :catch_4
    move-exception v0

    goto :goto_a

    .line 331
    :catch_5
    move-exception v0

    goto :goto_9

    :catch_6
    move-exception v0

    goto :goto_8

    :catch_7
    move-exception v0

    goto :goto_7

    :catch_8
    move-exception v0

    goto :goto_6

    :catch_9
    move-exception v0

    goto/16 :goto_5

    :catch_a
    move-exception v0

    goto/16 :goto_4

    :catch_b
    move-exception v0

    goto/16 :goto_3

    :catch_c
    move-exception v0

    goto/16 :goto_2

    :catch_d
    move-exception v0

    goto/16 :goto_1

    :catch_e
    move-exception v0

    goto/16 :goto_0
.end method
