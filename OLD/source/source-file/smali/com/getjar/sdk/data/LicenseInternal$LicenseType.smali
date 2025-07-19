.class public final enum Lcom/getjar/sdk/data/LicenseInternal$LicenseType;
.super Ljava/lang/Enum;
.source "LicenseInternal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/LicenseInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "LicenseType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/LicenseInternal$LicenseType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

.field public static final enum UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 72
    new-instance v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    const-string v1, "UNMANAGED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    .line 70
    const/4 v0, 0x1

    new-array v0, v0, [Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    sget-object v1, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->UNMANAGED:Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    aput-object v1, v0, v2

    sput-object v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->$VALUES:[Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

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
    .line 70
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/LicenseInternal$LicenseType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 70
    const-class v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/LicenseInternal$LicenseType;
    .locals 1

    .prologue
    .line 70
    sget-object v0, Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->$VALUES:[Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/LicenseInternal$LicenseType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/LicenseInternal$LicenseType;

    return-object v0
.end method
