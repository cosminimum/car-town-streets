.class final enum Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;
.super Ljava/lang/Enum;
.source "UsageMonitor.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/usage/UsageMonitor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "MonitoringState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

.field public static final enum PAUSED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

.field public static final enum STARTED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

.field public static final enum STARTING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

.field public static final enum STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

.field public static final enum STOPPING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 73
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    const-string v1, "STARTING"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 74
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    const-string v1, "STARTED"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 75
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    const-string v1, "PAUSED"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->PAUSED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 76
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    const-string v1, "STOPPING"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 77
    new-instance v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    const-string v1, "STOPPED"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    .line 72
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STARTED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->PAUSED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPING:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->STOPPED:Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    aput-object v1, v0, v6

    sput-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->$VALUES:[Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

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
    .line 72
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 72
    const-class v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->$VALUES:[Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/usage/UsageMonitor$MonitoringState;

    return-object v0
.end method
