.class synthetic Lcom/getjar/sdk/comm/auth/AuthResult$1;
.super Ljava/lang/Object;
.source "AuthResult.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/comm/auth/AuthResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$getjar$sdk$comm$auth$AuthResult$State:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 28
    invoke-static {}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->values()[Lcom/getjar/sdk/comm/auth/AuthResult$State;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$1;->$SwitchMap$com$getjar$sdk$comm$auth$AuthResult$State:[I

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/comm/auth/AuthResult$1;->$SwitchMap$com$getjar$sdk$comm$auth$AuthResult$State:[I

    sget-object v1, Lcom/getjar/sdk/comm/auth/AuthResult$State;->SUCCEEDED:Lcom/getjar/sdk/comm/auth/AuthResult$State;

    invoke-virtual {v1}, Lcom/getjar/sdk/comm/auth/AuthResult$State;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method
