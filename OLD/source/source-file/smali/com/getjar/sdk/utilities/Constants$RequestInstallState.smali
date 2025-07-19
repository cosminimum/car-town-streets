.class public final enum Lcom/getjar/sdk/utilities/Constants$RequestInstallState;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RequestInstallState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/Constants$RequestInstallState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

.field public static final enum FAIL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

.field public static final enum INSTALL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

.field public static final enum SUCCESS:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

.field public static final enum UNKNOWN:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 292
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->UNKNOWN:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    const-string v1, "INSTALL"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->INSTALL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    const-string v1, "SUCCESS"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->SUCCESS:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    const-string v1, "FAIL"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->FAIL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    .line 290
    const/4 v0, 0x4

    new-array v0, v0, [Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->UNKNOWN:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->INSTALL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->SUCCESS:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->FAIL:Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    aput-object v1, v0, v5

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

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
    .line 290
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/Constants$RequestInstallState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 290
    const-class v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/Constants$RequestInstallState;
    .locals 1

    .prologue
    .line 290
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/Constants$RequestInstallState;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 296
    const/4 v0, 0x0

    .line 297
    .local v0, "str":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallState:[I

    invoke-virtual {p0}, Lcom/getjar/sdk/utilities/Constants$RequestInstallState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 308
    const-string v0, "UNKNOWN"

    .line 311
    :goto_0
    return-object v0

    .line 299
    :pswitch_0
    const-string v0, "INSTALL"

    .line 300
    goto :goto_0

    .line 302
    :pswitch_1
    const-string v0, "SUCCESS"

    .line 303
    goto :goto_0

    .line 305
    :pswitch_2
    const-string v0, "FAIL"

    .line 306
    goto :goto_0

    .line 297
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
