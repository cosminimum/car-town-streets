.class public final enum Lcom/getjar/sdk/License$LicenseScope;
.super Ljava/lang/Enum;
.source "License.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/License;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LicenseScope"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/License$LicenseScope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/License$LicenseScope;

.field public static final enum DEVICE:Lcom/getjar/sdk/License$LicenseScope;

.field public static final enum PLATFORM:Lcom/getjar/sdk/License$LicenseScope;

.field public static final enum USER:Lcom/getjar/sdk/License$LicenseScope;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 54
    new-instance v0, Lcom/getjar/sdk/License$LicenseScope;

    const-string v1, "USER"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/License$LicenseScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/License$LicenseScope;->USER:Lcom/getjar/sdk/License$LicenseScope;

    .line 56
    new-instance v0, Lcom/getjar/sdk/License$LicenseScope;

    const-string v1, "PLATFORM"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/License$LicenseScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/License$LicenseScope;->PLATFORM:Lcom/getjar/sdk/License$LicenseScope;

    .line 58
    new-instance v0, Lcom/getjar/sdk/License$LicenseScope;

    const-string v1, "DEVICE"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/License$LicenseScope;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/License$LicenseScope;->DEVICE:Lcom/getjar/sdk/License$LicenseScope;

    .line 51
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/License$LicenseScope;

    sget-object v1, Lcom/getjar/sdk/License$LicenseScope;->USER:Lcom/getjar/sdk/License$LicenseScope;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/License$LicenseScope;->PLATFORM:Lcom/getjar/sdk/License$LicenseScope;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/License$LicenseScope;->DEVICE:Lcom/getjar/sdk/License$LicenseScope;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/License$LicenseScope;->$VALUES:[Lcom/getjar/sdk/License$LicenseScope;

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
    .line 51
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/License$LicenseScope;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 51
    const-class v0, Lcom/getjar/sdk/License$LicenseScope;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/License$LicenseScope;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/License$LicenseScope;
    .locals 1

    .prologue
    .line 51
    sget-object v0, Lcom/getjar/sdk/License$LicenseScope;->$VALUES:[Lcom/getjar/sdk/License$LicenseScope;

    invoke-virtual {v0}, [Lcom/getjar/sdk/License$LicenseScope;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/License$LicenseScope;

    return-object v0
.end method
