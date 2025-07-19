.class public final enum Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;
.super Ljava/lang/Enum;
.source "PackageEventManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/package_events/PackageEventManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "EventType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

.field public static final enum FIRST_OPEN:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

.field public static final enum INSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

.field public static final enum UNINSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 12
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    const-string v1, "INSTALLED"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->INSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    .line 14
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    const-string v1, "UNINSTALLED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->UNINSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    .line 16
    new-instance v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    const-string v1, "FIRST_OPEN"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->FIRST_OPEN:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    .line 10
    const/4 v0, 0x3

    new-array v0, v0, [Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    sget-object v1, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->INSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->UNINSTALLED:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->FIRST_OPEN:Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    aput-object v1, v0, v4

    sput-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->$VALUES:[Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

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
    .line 10
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 10
    const-class v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;
    .locals 1

    .prologue
    .line 10
    sget-object v0, Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->$VALUES:[Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/package_events/PackageEventManager$EventType;

    return-object v0
.end method
