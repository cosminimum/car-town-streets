.class public final enum Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;
.super Ljava/lang/Enum;
.source "GetJarWebViewSubActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401c
    name = "DialogType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

.field public static final enum UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

.field public static final enum WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 1003
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    const-string v1, "WAIT"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    .line 1004
    new-instance v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    const-string v1, "UNABLE_TO_DOWNLOAD"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    .line 1002
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->WAIT:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->UNABLE_TO_DOWNLOAD:Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->$VALUES:[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

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
    .line 1002
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 1002
    const-class v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;
    .locals 1

    .prologue
    .line 1002
    sget-object v0, Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->$VALUES:[Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/rewards/GetJarWebViewSubActivity$DialogType;

    return-object v0
.end method
