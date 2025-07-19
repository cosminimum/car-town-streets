.class public final enum Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
.super Ljava/lang/Enum;
.source "GooglePlayLaunchReason.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

.field public static final enum CHECKOUT:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

.field public static final enum REDEEM:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

.field private static final _SupportedReasons:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 7
    new-instance v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    const-string v3, "REDEEM"

    invoke-direct {v2, v3, v4}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->REDEEM:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    .line 10
    new-instance v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    const-string v3, "CHECKOUT"

    invoke-direct {v2, v3, v5}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;-><init>(Ljava/lang/String;I)V

    sput-object v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->CHECKOUT:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    .line 4
    const/4 v2, 0x2

    new-array v2, v2, [Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    sget-object v3, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->REDEEM:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    aput-object v3, v2, v4

    sget-object v3, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->CHECKOUT:Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    aput-object v3, v2, v5

    sput-object v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->$VALUES:[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    .line 19
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .local v1, "supportedReasons":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-static {}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->values()[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_1

    .line 21
    invoke-static {}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->values()[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->name()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    invoke-static {}, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->values()[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    move-result-object v2

    array-length v2, v2

    if-ge v0, v2, :cond_0

    .line 23
    const-string v2, ", "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->_SupportedReasons:Ljava/lang/String;

    .line 28
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

    return-void
.end method

.method public static getSupportedReasons()Ljava/lang/String;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->_SupportedReasons:Ljava/lang/String;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 4
    const-class v0, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;
    .locals 1

    .prologue
    .line 4
    sget-object v0, Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->$VALUES:[Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/GooglePlayLaunchReason;

    return-object v0
.end method
