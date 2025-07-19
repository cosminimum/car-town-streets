.class synthetic Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$5;
.super Ljava/lang/Object;
.source "GetJarJavaScriptInterface.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1008
    name = null
.end annotation


# static fields
.field static final synthetic $SwitchMap$com$getjar$sdk$utilities$Constants$AppState:[I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 344
    invoke-static {}, Lcom/getjar/sdk/utilities/Constants$AppState;->values()[Lcom/getjar/sdk/utilities/Constants$AppState;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$5;->$SwitchMap$com$getjar$sdk$utilities$Constants$AppState:[I

    :try_start_0
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$5;->$SwitchMap$com$getjar$sdk$utilities$Constants$AppState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$AppState;->INSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$AppState;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_1

    :goto_0
    :try_start_1
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarJavaScriptInterface$5;->$SwitchMap$com$getjar$sdk$utilities$Constants$AppState:[I

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$AppState;->UNINSTALLED:Lcom/getjar/sdk/utilities/Constants$AppState;

    invoke-virtual {v1}, Lcom/getjar/sdk/utilities/Constants$AppState;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    goto :goto_0
.end method
