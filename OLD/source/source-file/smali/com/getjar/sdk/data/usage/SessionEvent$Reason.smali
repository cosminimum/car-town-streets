.class public final enum Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
.super Ljava/lang/Enum;
.source "SessionEvent.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/getjar/sdk/data/usage/SessionEvent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "Reason"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/getjar/sdk/data/usage/SessionEvent$Reason;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

.field public static final enum TESTING:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public static final enum THREAD_APP_DETECTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

.field public static final enum THREAD_EXCEPTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

.field public static final enum THREAD_EXIT:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

.field public static final enum THREAD_START:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    const/4 v6, 0x4

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 17
    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const-string v1, "THREAD_START"

    invoke-direct {v0, v1, v2}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_START:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 19
    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const-string v1, "THREAD_APP_DETECTION"

    invoke-direct {v0, v1, v3}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_APP_DETECTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 21
    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const-string v1, "THREAD_EXIT"

    invoke-direct {v0, v1, v4}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXIT:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 23
    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const-string v1, "THREAD_EXCEPTION"

    invoke-direct {v0, v1, v5}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXCEPTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 25
    new-instance v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    const-string v1, "TESTING"

    invoke-direct {v0, v1, v6}, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->TESTING:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    .line 15
    const/4 v0, 0x5

    new-array v0, v0, [Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_START:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    aput-object v1, v0, v2

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_APP_DETECTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    aput-object v1, v0, v3

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXIT:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    aput-object v1, v0, v4

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->THREAD_EXCEPTION:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    aput-object v1, v0, v5

    sget-object v1, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->TESTING:Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    aput-object v1, v0, v6

    sput-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->$VALUES:[Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

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
    .line 15
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 15
    const-class v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    return-object v0
.end method

.method public static values()[Lcom/getjar/sdk/data/usage/SessionEvent$Reason;
    .locals 1

    .prologue
    .line 15
    sget-object v0, Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->$VALUES:[Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    invoke-virtual {v0}, [Lcom/getjar/sdk/data/usage/SessionEvent$Reason;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/getjar/sdk/data/usage/SessionEvent$Reason;

    return-object v0
.end method
