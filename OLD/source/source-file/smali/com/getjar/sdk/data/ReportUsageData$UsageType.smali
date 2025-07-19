.class public final enum Lcom/getjar/sdk/data/ReportUsageData$UsageType;
.super Ljava/lang/Enum;
.source "ReportUsageData.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/ReportUsageData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "UsageType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/ReportUsageData$UsageType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum APP_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum APP_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum DOWNLOADED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum FIRST_OPENED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum FOUND_INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum FOUND_UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum PHONE_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum PHONE_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum UNKNOWN:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

.field public static final enum USED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 10
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "UNKNOWN"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->UNKNOWN:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 11
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "DOWNLOADED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->DOWNLOADED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 12
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "INSTALLED"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 13
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "UNINSTALLED"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 14
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "USED"

    invoke-direct {v0, v1, v7}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->USED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 15
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "FOUND_INSTALLED"

    const/4 v2, 0x5

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FOUND_INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 16
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "FOUND_UNINSTALLED"

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 17
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "PHONE_SESSION_STARTED"

    const/4 v2, 0x7

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->PHONE_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 18
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "PHONE_SESSION_ENDED"

    const/16 v2, 0x8

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->PHONE_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 19
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "APP_SESSION_STARTED"

    const/16 v2, 0x9

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->APP_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 20
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "APP_SESSION_ENDED"

    const/16 v2, 0xa

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->APP_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 21
    new-instance v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    const-string v1, "FIRST_OPENED"

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/ReportUsageData$UsageType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FIRST_OPENED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    .line 9
    const/16 v0, 0xc

    new-array v0, v0, [Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    sget-object v1, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->UNKNOWN:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->DOWNLOADED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v1, v0, v6

    sget-object v1, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->USED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v1, v0, v7

    const/4 v1, 0x5

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FOUND_INSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    const/4 v1, 0x6

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FOUND_UNINSTALLED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    const/4 v1, 0x7

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->PHONE_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    const/16 v1, 0x8

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->PHONE_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    const/16 v1, 0x9

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->APP_SESSION_STARTED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    const/16 v1, 0xa

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->APP_SESSION_ENDED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    const/16 v1, 0xb

    sget-object v2, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->FIRST_OPENED:Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    aput-object v2, v0, v1

    sput-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->$VALUES:[Lcom/getjar/sdk/data/ReportUsageData$UsageType;

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
    .line 9
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 9
    const-class v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/ReportUsageData$UsageType;
    .locals 1

    .prologue
    .line 9
    sget-object v0, Lcom/getjar/sdk/data/ReportUsageData$UsageType;->$VALUES:[Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/ReportUsageData$UsageType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/ReportUsageData$UsageType;

    return-object v0
.end method
