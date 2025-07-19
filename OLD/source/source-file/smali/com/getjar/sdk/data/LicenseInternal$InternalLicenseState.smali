.class public final enum Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;
.super Ljava/lang/Enum;
.source "LicenseInternal.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/LicenseInternal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "InternalLicenseState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

.field public static final enum SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

.field public static final enum UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 80
    new-instance v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    const-string v1, "SYNCED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    .line 81
    new-instance v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    const-string v1, "UNSYNCED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    .line 78
    const/4 v0, 0x2

    new-array v0, v0, [Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    sget-object v1, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->SYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->UNSYNCED:Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    aput-object v1, v0, v3

    sput-object v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->$VALUES:[Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

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
    .line 78
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 78
    const-class v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;
    .locals 1

    .prologue
    .line 78
    sget-object v0, Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->$VALUES:[Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/LicenseInternal$InternalLicenseState;

    return-object v0
.end method
