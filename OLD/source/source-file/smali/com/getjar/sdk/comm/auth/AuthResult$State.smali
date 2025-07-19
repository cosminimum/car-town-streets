.class public final enum Lcom/getjar/sdk/comm/auth/AuthResult$State;
.super Ljava/lang/Enum;
.source "AuthResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AuthResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/comm/auth/AuthResult$State;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/comm/auth/AuthResult$State;

.field public static final enum BLACKLISTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

.field public static final enum SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

.field public static final enum UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

.field public static final enum UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;

    const-string v1, "SUCCEEDED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/comm/auth/AuthResult$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .line 19
    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;

    const-string v1, "UNKNOWN_FAILURE"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/comm/auth/AuthResult$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .line 21
    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;

    const-string v1, "BLACKLISTED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/comm/auth/AuthResult$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->BLACKLISTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .line 23
    new-instance v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;

    const-string v1, "UNSUPPORTED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/comm/auth/AuthResult$State;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    .line 14
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/getjar/sdk/comm/auth/AuthResult$State;

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$State;->SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNKNOWN_FAILURE:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$State;->BLACKLISTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$State;->UNSUPPORTED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->$VALUES:[Lcom/getjar/sdk/comm/auth/AuthResult$State;

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
    .line 14
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/comm/auth/AuthResult$State;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 14
    const-class v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/comm/auth/AuthResult$State;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$State;->$VALUES:[Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-virtual {v0}, [Lcom/getjar/sdk/comm/auth/AuthResult$State;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/comm/auth/AuthResult$State;

    return-object v0
.end method


# virtual methods
.method public succeeded()Z
    .locals 3

    .prologue
    .line 27
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->values()[Lcom/getjar/sdk/comm/auth/AuthResult$State;

    move-result-object v1

    invoke-virtual {p0}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->ordinal()I

    move-result v2

    aget-object v0, v1, v2

    .line 28
    .local v0, "currentValue":Lcom/getjar/sdk/comm/auth/AuthResult$State;
    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$1;->$SwitchMap$com$getjar$sdk$comm$auth$AuthResult$State:[I

    invoke-virtual {v0}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 32
    const/4 v1, 0x0

    :goto_0
    return v1

    .line 30
    :pswitch_0
    const/4 v1, 0x1

    goto :goto_0

    .line 28
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
