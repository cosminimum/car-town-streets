.class synthetic Lcom/getjar/sdk/comm/auth/AccountEventType$1;
.super Ljava/lang/Object;
.source "AccountEventType.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AccountEventType;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$getjar$sdk$comm$auth$AccountEventType:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 20
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AccountEventType;->values()[Lcom/getjar/sdk/comm/auth/AccountEventType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType$1;->$SwitchMap$com$getjar$sdk$comm$auth$AccountEventType:[I

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType$1;->$SwitchMap$com$getjar$sdk$comm$auth$AccountEventType:[I

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_FIRST_TIME:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType$1;->$SwitchMap$com$getjar$sdk$comm$auth$AccountEventType:[I

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v0, Lcom/getjar/sdk/comm/auth/AccountEventType$1;->$SwitchMap$com$getjar$sdk$comm$auth$AccountEventType:[I

    sget-object v1, Lcom/getjar/sdk/comm/auth/AccountEventType;->AUTH_VALIDATED:Lcom/getjar/sdk/comm/auth/AccountEventType;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AccountEventType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    return-void

    :catch_0
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    goto :goto_1

    :catch_2
    move-exception v0

    goto :goto_0
.end method
