.class public final enum Lcom/getjar/sdk/comm/auth/AccountEventType;
.super Ljava/lang/Enum;
.source "AccountEventType.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/getjar/sdk/comm/auth/AccountEventType$1;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/auth/AccountEventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/auth/AccountEventType;

.field public static final enum AUTH:Lcom/getjar/sdk/comm/auth/AccountEventType;

.field public static final enum AUTH_FIRST_TIME:Lcom/getjar/sdk/comm/auth/AccountEventType;

.field public static final enum AUTH_VALIDATED:Lcom/getjar/sdk/comm/auth/AccountEventType;

.field public static final enum USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

.field public static final enum USER_SWITCHED_UI_COMPLETED:Lcom/getjar/sdk/comm/auth/AccountEventType;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7
    new-instance v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    const-string v1, "AUTH_FIRST_TIME"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AccountEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_FIRST_TIME:Lcom/getjar/sdk/comm/auth/AccountEventType;

    .line 9
    new-instance v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    const-string v1, "AUTH"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/auth/AccountEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH:Lcom/getjar/sdk/comm/auth/AccountEventType;

    .line 11
    new-instance v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    const-string v1, "AUTH_VALIDATED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/auth/AccountEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_VALIDATED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    .line 13
    new-instance v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    const-string v1, "USER_SWITCHED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/auth/AccountEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    .line 15
    new-instance v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    const-string v1, "USER_SWITCHED_UI_COMPLETED"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/comm/auth/AccountEventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED_UI_COMPLETED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    .line 4
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/getjar/sdk/comm/auth/AccountEventType;

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_FIRST_TIME:Lcom/getjar/sdk/comm/auth/AccountEventType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH:Lcom/getjar/sdk/comm/auth/AccountEventType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_VALIDATED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->USER_SWITCHED_UI_COMPLETED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    aput-object v1, v0, v6

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->$VALUES:[Lcom/getjar/sdk/comm/auth/AccountEventType;

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
    .line 4
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 26
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AccountEventType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 4
    const-class v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/auth/AccountEventType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/auth/AccountEventType;
    .locals 1

    .prologue
    .line 4
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType;->$VALUES:[Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/auth/AccountEventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/auth/AccountEventType;

    return-object v0
.end method


# virtual methods
.method public isAuthEvent()Z
    .locals 3

    .prologue
    .line 19
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountEventType;->values()[Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AccountEventType;->ordinal()I

    move-result v2

    aget-object v0, v1, v2

    .line 20
    .local v0, "currentValue":Lcom/getjar/sdk/comm/auth/AccountEventType;
    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType$1;->$SwitchMap$com$getjar$sdk$comm$auth$AccountEventType:[I

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AccountEventType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 26
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 24
    :pswitch_0
    const/4 v1, 0x1

    goto :goto_0

    .line 20
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method
