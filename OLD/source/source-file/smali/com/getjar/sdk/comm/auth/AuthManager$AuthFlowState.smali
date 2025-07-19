.class final enum Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
.super Ljava/lang/Enum;
.source "AuthManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AuthManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "AuthFlowState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum APP_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum DATA_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum EXPIRY_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum STARTED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum STARTING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum UNKNOWN:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum USER_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

.field public static final enum VALIDATING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 141
    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->UNKNOWN:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "STARTING"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->STARTING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "STARTED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->STARTED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "DATA_CHECKING"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->DATA_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "EXPIRY_CHECKING"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->EXPIRY_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "VALIDATING"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->VALIDATING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "APP_AUTHING"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->APP_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "USER_AUTHING"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->USER_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "AUTHED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    const-string v1, "FAILED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .line 140
    const/16 v0, 0xa

    new-array v0, v0, [Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->UNKNOWN:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->STARTING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->STARTED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->DATA_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->EXPIRY_CHECKING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->VALIDATING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->APP_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->USER_AUTHING:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->AUTHED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->FAILED:Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->$VALUES:[Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

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
    .line 140
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method static synthetic access$800(Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->isAuthed()Z

    move-result v0

    return v0
.end method

.method static synthetic access$900(Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;)Z
    .locals 1
    .param p0, "x0"    # Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->isAuthing()Z

    move-result v0

    return v0
.end method

.method private isAuthed()Z
    .locals 3

    .prologue
    .line 145
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->values()[Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->ordinal()I

    move-result v2

    aget-object v0, v1, v2

    .line 146
    .local v0, "currentValue":Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$1;->$SwitchMap$com$getjar$sdk$comm$auth$AuthManager$AuthFlowState:[I

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 150
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 148
    :pswitch_0
    const/4 v1, 0x1

    goto :goto_0

    .line 146
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method private isAuthing()Z
    .locals 3

    .prologue
    .line 156
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->values()[Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->ordinal()I

    move-result v2

    aget-object v0, v1, v2

    .line 157
    .local v0, "currentValue":Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthManager$1;->$SwitchMap$com$getjar$sdk$comm$auth$AuthManager$AuthFlowState:[I

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 167
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 165
    :pswitch_0
    const/4 v1, 0x1

    goto :goto_0

    .line 157
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 140
    const-class v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;
    .locals 1

    .prologue
    .line 140
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->$VALUES:[Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/auth/AuthManager$AuthFlowState;

    return-object v0
.end method
