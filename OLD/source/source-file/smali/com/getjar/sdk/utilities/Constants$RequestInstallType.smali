.class public final enum Lcom/getjar/sdk/utilities/Constants$RequestInstallType;
.super Ljava/lang/Enum;
.source "Constants.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/utilities/Constants;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "RequestInstallType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/utilities/Constants$RequestInstallType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

.field public static final enum EARN:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

.field public static final enum PURCHASE:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

.field public static final SUFFIX_AMOUNT:Ljava/lang/String; = "_amount"

.field public static final SUFFIX_APP_ID:Ljava/lang/String; = "_app_id"

.field public static final SUFFIX_DEFAULT:Ljava/lang/String; = "_install_type"

.field public static final SUFFIX_NOTIFICATION:Ljava/lang/String; = "_install_notification"

.field public static final SUFFIX_NOTIFICATION_OPEN:Ljava/lang/String; = "_install_notification_open"

.field public static final SUFFIX_STATE:Ljava/lang/String; = "_install_state"

.field public static final SUFFIX_SUBSTATE:Ljava/lang/String; = "_install_substate"

.field public static final enum UNDEFINED:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 262
    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    const-string v1, "UNDEFINED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->UNDEFINED:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    const-string v1, "EARN"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->EARN:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    new-instance v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    const-string v1, "PURCHASE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->PURCHASE:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    .line 260
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->UNDEFINED:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->EARN:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->PURCHASE:Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

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
    .line 260
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/utilities/Constants$RequestInstallType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 260
    const-class v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/utilities/Constants$RequestInstallType;
    .locals 1

    .prologue
    .line 260
    sget-object v0, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->$VALUES:[Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/utilities/Constants$RequestInstallType;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 266
    const/4 v0, 0x0

    .line 267
    .local v0, "str":Ljava/lang/String;
    sget-object v1, Lcom/getjar/sdk/utilities/Constants$1;->$SwitchMap$com$getjar$sdk$utilities$Constants$RequestInstallType:[I

    invoke-virtual {p0}, Lcom/getjar/sdk/utilities/Constants$RequestInstallType;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 275
    const-string v0, "UNKNOWN"

    .line 278
    :goto_0
    return-object v0

    .line 269
    :pswitch_0
    const-string v0, "EARN"

    .line 270
    goto :goto_0

    .line 272
    :pswitch_1
    const-string v0, "PURCHASE"

    .line 273
    goto :goto_0

    .line 267
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method
